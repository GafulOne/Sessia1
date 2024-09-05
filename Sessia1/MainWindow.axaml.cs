using Avalonia.Controls;
using Microsoft.EntityFrameworkCore;
using Sessia1.Models;
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

            ClientsListBox.ItemsSource = Client;
        }
    }
}