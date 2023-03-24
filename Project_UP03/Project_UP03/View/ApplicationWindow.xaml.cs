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
using Project_UP03.EntityDB;
using Project_UP03.ViewModel;
using Project_UP03.View;

namespace Project_UP03.View
{
    /// <summary>
    /// Логика взаимодействия для ApplicationWindow.xaml
    /// </summary>
    public partial class ApplicationWindow : Window
    {
        public ApplicationWindow(User user)
        {
            InitializeComponent();

            DataContext = new AppMainWindow(user);
        }

        public void RefreshData()
        {
            (DataContext as AppMainWindow).LoadData();
        }

        private void btnAddNewUser_Click(object sender, RoutedEventArgs e)
        {
            var addNUWindow = new AddNewUserInfoWindow(null);
            addNUWindow.Show();
        }

        private void btnDeleteUser_Click(object sender, RoutedEventArgs e)
        {
            (DataContext as AppMainWindow).DeleteSelectItem();
        }

        private void btnEditUser_Click(object sender, RoutedEventArgs e)
        {
            var editUWindow = new AddNewUserInfoWindow((DataContext as AppMainWindow).SelectedUser);

            editUWindow.Show();
        }
    }
}
