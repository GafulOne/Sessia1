using Avalonia;
using Avalonia.Controls;
using Avalonia.Media.Imaging;
using Avalonia.Platform;
using Microsoft.EntityFrameworkCore;
using Sessia1.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Sessia1
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            LoadServices();
        }

        private void LoadServices()
        {
            var Client = Helper.Database.Clients.Include(x => x.GendercodeNavigation);
            ClientsListBox.ItemsSource = Client.Select(x => new
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
            });
        }
    }
}