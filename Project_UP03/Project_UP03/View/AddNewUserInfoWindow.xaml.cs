using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
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

namespace Project_UP03.View
{
    /// <summary>
    /// Логика взаимодействия для AddNewUserInfoWindow.xaml
    /// </summary>
    public partial class AddNewUserInfoWindow : Window
    {

        private User _user;

        public AddNewUserInfoWindow(User user)
        {
            InitializeComponent();

            foreach (var item in App.Current.Windows)
            {
                if (item is ApplicationWindow)
                {
                    this.Owner = item as Window;
                }
            }

            if (user is null)
            {
                _user = user = new User();
            }
            else
            {
                _user = user;
            }

            this.DataContext = _user;
        }

        private void btnCreate_Click(object sender, RoutedEventArgs e)
        {
            using (var db = new HelpDeskDBEntities())
            {
                try
                {
                    var validateRes = ValidateEntity();
                    if (validateRes.Length>0)
                    {
                        MessageBox.Show(validateRes.ToString(), "Информация", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                    db.User.AddOrUpdate(_user);
                    db.SaveChanges();
                    MessageBox.Show("Данные успешно сохранены", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                    (Owner as ApplicationWindow)?.RefreshData();
                    Owner.Focus();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "Информация", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private StringBuilder ValidateEntity()
        {
            var errors = new StringBuilder();

            if (_user != null)
            {
                if (string.IsNullOrEmpty(_user.FirstName))
                {
                    errors.AppendLine("Поле Имя не может быть пустым!");
                }
                if (string.IsNullOrEmpty(_user.LastName))
                {
                    errors.AppendLine("Поле Фамилия не может быть пустым!");
                }

                if (string.IsNullOrEmpty(_user.Login))
                {
                    errors.AppendLine("Поле Login не может быть пустым!");
                }
                if (string.IsNullOrEmpty(_user.Password))
                {
                    errors.AppendLine("Поле Password не может быть пустым!");
                }

                if (string.IsNullOrEmpty(_user.Email))
                {
                    errors.AppendLine("Поле Email не может быть пустым!");
                }
                if (string.IsNullOrEmpty(_user.PhoneNumber))
                {
                    errors.AppendLine("Поле Номер телефона не может быть пустым!");
                }

                if (_user.PostId <= 0 || _user.PostId > 2)
                {
                    errors.AppendLine("Некорректный Id должности!");
                }
            }
            return errors;
        }
    }
}
