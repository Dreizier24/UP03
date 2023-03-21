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
using System.Windows.Navigation;
using System.Windows.Shapes;
using Project_UP03.ViewModel;
using Project_UP03.View;

namespace Project_UP03
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            this.DataContext = new ViewModel.Auth();
        }


        private void SignIn_Click(object sender, RoutedEventArgs e)
        {
            (DataContext as Auth).AuthInApp();
        }

        private void SignUpBtn_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
