using System;
using System.Collections.Generic;

namespace Sessia1.Models;

public partial class Client
{
    public int Id { get; set; }

    public string Firstname { get; set; } = null!;

    public string Lastname { get; set; } = null!;

    public string? Patronymic { get; set; }

    public DateOnly? Birthday { get; set; }

    public DateTime Registrationdate { get; set; }

    public string? Email { get; set; }

    public string Phone { get; set; } = null!;

    public char Gendercode { get; set; }

    public string? Photopath { get; set; }

    public string? Documents { get; set; }

    public virtual Gender GendercodeNavigation { get; set; } = null!;

    public virtual ICollection<Document> Iddocs { get; set; } = new List<Document>();

    public virtual ICollection<Visit> Idvisits { get; set; } = new List<Visit>();

    public virtual ICollection<Tag> Tags { get; set; } = new List<Tag>();
}
