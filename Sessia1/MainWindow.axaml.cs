using Avalonia;
using Avalonia.Controls;
using Avalonia.Media.Imaging;
using Avalonia.Platform;
using Microsoft.EntityFrameworkCore;
using Sessia1.Models;
using Sessia1.Context;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Sessia1
{
    public partial class MainWindow : Window
    {
        private List<Client> _clients;
        public MainWindow()
        {
            InitializeComponent();
            SearchTextBox.TextChanged += OnSearchTextChanged;
            LoadServices();
        }

        private void LoadServices(string searchTerm = "", string sortBy = "Firstname")
        {
            var query = Helper.Database.Clients.Include(x => x.GendercodeNavigation).AsQueryable();

            if (!string.IsNullOrWhiteSpace(searchTerm))
            {
                query = query.Where(x => x.Firstname.Contains(searchTerm) ||
                                         x.Lastname.Contains(searchTerm) ||
                                         x.Patronymic.Contains(searchTerm) ||
                                         x.Email.Contains(searchTerm) ||
                                         x.Phone.Contains(searchTerm));
            }

            query = sortBy switch
            {
                "Firstname" => query.OrderBy(x => x.Firstname),
                "Lastname" => query.OrderBy(x => x.Lastname),
                "Registrationdate " => query.OrderBy(x => x.Registrationdate),
                _ => query.OrderBy(x => x.Firstname),
            };

            ClientsListBox.ItemsSource = query.Select(x => new
            {
                x.Id,
                x.Firstname,
                x.Lastname,
                x.Patronymic,
                x.Birthday,
                x.Registrationdate,
                x.Email,
                x.Phone,
                Gendercode = x.GendercodeNavigation.Name,
                x.Photo,
            }).ToList();
        }
        private void OnSearchTextChanged(object sender, TextChangedEventArgs e)
        {
            var searchTerm = SearchTextBox.Text;
            LoadServices(searchTerm);
        }
    }
}