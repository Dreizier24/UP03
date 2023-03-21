using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using Project_UP03.EntityDB;
using Project_UP03.View;

namespace Project_UP03.ViewModel
{
    public class Auth : BaseViewModel
    {
        private string _signInButton = "SignIn";

        private User _user;

        private string _login;
        private string _password;

        public string Login
        {
            get => _login;
            set
            {
                _login = value;
                OnPropertyChanged(nameof(Login));
            }
        }

        public string Password
        {
            get => _password;
            set
            {
                _password = value;
                OnPropertyChanged(nameof(Password));
            }
        }

        public string SignInButton
        {
            get => _signInButton;
            set
            {
                _signInButton = value;
                OnPropertyChanged(nameof(SignInButton));
            }
        }

        public bool Authorization(string login, string password)
        {

            {
                using (var db = new AuthDB_Storage())
                {
                    var result = db.User.FirstOrDefault(user => user.Login == login && user.Password == password);

                    if (result != null)
                    {
                        return true;
                    }
                }
                return false;

            }
        }

        public void AuthInApp()
        {
          
            bool res = Authorization(Login, Password);
            if (res)
            {
                MessageBox.Show("Успешно","Авторизация",
                        MessageBoxButton.OK, MessageBoxImage.Asterisk);
            }
            else {
                MessageBox.Show("Неверный логин или пароль", "Авторизация",
                        MessageBoxButton.OK, MessageBoxImage.Error);

                SignInButton = "SigIn";
            }
        }
    }
}
