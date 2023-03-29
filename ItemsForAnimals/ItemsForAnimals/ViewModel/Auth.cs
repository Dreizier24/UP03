using ItemsForAnimals.DBStorage;
using ItemsForAnimals.View;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.RightsManagement;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace ItemsForAnimals.ViewModel
{
    public class Auth : BaseViewModel
    {
        //private string _signInButton = "Войти";

        private User _user;

        private string _login;
        private string _password;

        public string Login
        {
            get => _login;
            set
            {
                _login = value;
            }
        }

        public string Password
        {
            get => _password;
            set
            {
                _password = value;
            }
        }

        public bool Authorization(string login, string password)
        {
            using (var db = new Trade_Entities())
            {
                var result = db.User.FirstOrDefault(user => user.Login == login && user.Password == password);
                _user = result;

                if (result != null) 
                { 
                    return true;
                }

                return false;
            }
        }
        public void AuthInApp()
        {
            bool res = Authorization(Login, Password);
            if (res)
            {
                var appWindow = new AppWindow(_user);
                appWindow.Show();
                foreach (Window w in App.Current.Windows)
                {
                    if (w.Title == "Авторизация")
                        w.Close();
                }
            }
            else
            {
                MessageBox.Show("Неверный логин или пароль."+"\nЛибо такого пользователя не существует","Авторизация",MessageBoxButton.OK,MessageBoxImage.Error);
            }
        }
    }
}
