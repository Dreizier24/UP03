using ItemsForAnimals.DBStorage;
using ItemsForAnimals.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace ItemsForAnimals.View
{
    /// <summary>
    /// Логика взаимодействия для AppWindow.xaml
    /// </summary>
    public partial class AppWindow : Window
    {
        public AppWindow(User user)
        {
            InitializeComponent();

            this.DataContext = user;
            this.DataContext = new AppMainWindow(user);
        }

        public void RefreshData()
        {
            (DataContext as AppMainWindow).LoadData();
        }

        private void btnEditUser_Click(object sender, RoutedEventArgs e)
        {
            var editGoodsWindow = new AddOrRewriteGoods((DataContext as AppMainWindow).SelectedGoods);
            editGoodsWindow.Show();
        }

        private void btnDeleteUser_Click(object sender, RoutedEventArgs e)
        {
            (DataContext as AppMainWindow).DeleteSelData();
        }

        private void btnAddNewUser_Click(object sender, RoutedEventArgs e)
        {
            var addGoodsWindow = new AddOrRewriteGoods(null);
            addGoodsWindow.Show();
        }
    }
}
