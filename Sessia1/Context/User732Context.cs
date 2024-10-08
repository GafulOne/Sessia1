﻿using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Sessia1.Models;

namespace Sessia1.Context;

public partial class User732Context : DbContext
{
    public User732Context()
    {
    }

    public User732Context(DbContextOptions<User732Context> options)
        : base(options)
    {
    }

    public virtual DbSet<Client> Clients { get; set; }

    public virtual DbSet<Document> Documents { get; set; }

    public virtual DbSet<Gender> Genders { get; set; }

    public virtual DbSet<Tag> Tags { get; set; }

    public virtual DbSet<Visit> Visits { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseNpgsql("Host=192.168.2.159;Database=user732;Username=user732;password=70068");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Client>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("pk_client");

            entity.ToTable("client");

            entity.Property(e => e.Id)
                .UseIdentityAlwaysColumn()
                .HasColumnName("id");
            entity.Property(e => e.Birthday).HasColumnName("birthday");
            entity.Property(e => e.Documents)
                .HasColumnType("character varying")
                .HasColumnName("documents");
            entity.Property(e => e.Email)
                .HasMaxLength(255)
                .HasColumnName("email");
            entity.Property(e => e.Firstname)
                .HasMaxLength(50)
                .HasColumnName("firstname");
            entity.Property(e => e.Gendercode)
                .HasMaxLength(1)
                .HasColumnName("gendercode");
            entity.Property(e => e.Lastname)
                .HasMaxLength(50)
                .HasColumnName("lastname");
            entity.Property(e => e.Patronymic)
                .HasMaxLength(50)
                .HasColumnName("patronymic");
            entity.Property(e => e.Phone)
                .HasMaxLength(20)
                .HasColumnName("phone");
            entity.Property(e => e.Photopath)
                .HasMaxLength(1000)
                .HasColumnName("photopath");
            entity.Property(e => e.Registrationdate)
                .HasColumnType("timestamp(3) without time zone")
                .HasColumnName("registrationdate");

            entity.HasOne(d => d.GendercodeNavigation).WithMany(p => p.Clients)
                .HasForeignKey(d => d.Gendercode)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_client_gender");

            entity.HasMany(d => d.Iddocs).WithMany(p => p.Idclients)
                .UsingEntity<Dictionary<string, object>>(
                    "Docofclient",
                    r => r.HasOne<Document>().WithMany()
                        .HasForeignKey("Iddoc")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("docofclient_document_fk"),
                    l => l.HasOne<Client>().WithMany()
                        .HasForeignKey("Idclient")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("docofclient_client_fk"),
                    j =>
                    {
                        j.HasKey("Idclient", "Iddoc").HasName("docofclient_pk");
                        j.ToTable("docofclient");
                        j.IndexerProperty<int>("Idclient").HasColumnName("idclient");
                        j.IndexerProperty<int>("Iddoc").HasColumnName("iddoc");
                    });

            entity.HasMany(d => d.Idvisits).WithMany(p => p.Idclients)
                .UsingEntity<Dictionary<string, object>>(
                    "Visitofclient",
                    r => r.HasOne<Visit>().WithMany()
                        .HasForeignKey("Idvisit")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("visitofclient_visit_fk"),
                    l => l.HasOne<Client>().WithMany()
                        .HasForeignKey("Idclient")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("visitofclient_client_fk"),
                    j =>
                    {
                        j.HasKey("Idclient", "Idvisit").HasName("visitofclient_pk");
                        j.ToTable("visitofclient");
                        j.IndexerProperty<int>("Idclient")
                            .ValueGeneratedOnAdd()
                            .UseIdentityAlwaysColumn()
                            .HasColumnName("idclient");
                        j.IndexerProperty<int>("Idvisit")
                            .ValueGeneratedOnAdd()
                            .UseIdentityAlwaysColumn()
                            .HasColumnName("idvisit");
                    });

            entity.HasMany(d => d.Tags).WithMany(p => p.Clients)
                .UsingEntity<Dictionary<string, object>>(
                    "Tagofclient",
                    r => r.HasOne<Tag>().WithMany()
                        .HasForeignKey("Tagid")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("fk_tagofclient_tag"),
                    l => l.HasOne<Client>().WithMany()
                        .HasForeignKey("Clientid")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("fk_tagofclient_client"),
                    j =>
                    {
                        j.HasKey("Clientid", "Tagid").HasName("pk_tagofclient");
                        j.ToTable("tagofclient");
                        j.IndexerProperty<int>("Clientid").HasColumnName("clientid");
                        j.IndexerProperty<int>("Tagid").HasColumnName("tagid");
                    });
        });

        modelBuilder.Entity<Document>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("document_pk");

            entity.ToTable("document");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("id");
            entity.Property(e => e.Idclient).HasColumnName("idclient");
            entity.Property(e => e.Path).HasColumnName("path");
        });

        modelBuilder.Entity<Gender>(entity =>
        {
            entity.HasKey(e => e.Code).HasName("pk_gender");

            entity.ToTable("gender");

            entity.Property(e => e.Code)
                .HasMaxLength(1)
                .ValueGeneratedNever()
                .HasColumnName("code");
            entity.Property(e => e.Name)
                .HasMaxLength(10)
                .HasColumnName("name");
        });

        modelBuilder.Entity<Tag>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("pk_tag");

            entity.ToTable("tag");

            entity.Property(e => e.Id)
                .UseIdentityAlwaysColumn()
                .HasColumnName("id");
            entity.Property(e => e.Color)
                .HasMaxLength(6)
                .IsFixedLength()
                .HasColumnName("color");
            entity.Property(e => e.Title)
                .HasMaxLength(30)
                .HasColumnName("title");
        });

        modelBuilder.Entity<Visit>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("visit_pk");

            entity.ToTable("visit");

            entity.Property(e => e.Id)
                .UseIdentityAlwaysColumn()
                .HasColumnName("id");
            entity.Property(e => e.Data).HasColumnName("data");
            entity.Property(e => e.Idclient)
                .HasColumnType("character varying")
                .HasColumnName("idclient");
            entity.Property(e => e.Time).HasColumnName("time");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
