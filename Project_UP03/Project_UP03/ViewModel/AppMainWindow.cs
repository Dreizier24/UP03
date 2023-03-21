using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Project_UP03.EntityDB;
using Project_UP03.View;

namespace Project_UP03.ViewModel
{
    public class AppMainWindow : BaseViewModel
    {
        //private User _user;

        private string _firstName;
        private string _midlleName;
        private string _lastName;

        public string FirstName
        {
            get => _firstName;
            set
            {
                _firstName = value;
                OnPropertyChanged(nameof(FirstName));
            }
        }

        public string MiddleName
        {
            get => _midlleName;
            set
            {
                _midlleName = value;
                OnPropertyChanged(nameof(MiddleName));
            }
        }

        public string LastName
        {
            get => _lastName;
            set
            {
                _lastName = value;
                OnPropertyChanged(nameof(LastName));
            }
        }

        //public AppMainWindow(User user)
        //{
        //    FirstName = user.FirstName;
        //    MiddleName = user.MiddleName;
        //    LastName = user.LastName;
        //}

        //private void LoadData()
        //{
        //    using (var db = new HelpDeskDBEntities())
        //    {
        //        var result = db.User;
        //    }
        //}

        private ObservableCollection<User> _user;

        public ObservableCollection<User> User
        {
            get => _user;
            set
            {
                _user = value;
                OnPropertyChanged(nameof(User));
            }
        }

        public AppMainWindow(User user)
        {
            User = new ObservableCollection<User>();

            LoadData();
        }

        public void LoadData()
        {
            var result = DbStorage.DB_s.User.ToList();

            result.ForEach(elem => User?.Add(elem));
        }
    }
}
