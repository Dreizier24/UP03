using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using Project_UP03.EntityDB;
using Project_UP03.View;

namespace Project_UP03.ViewModel
{
    public class AppMainWindow : BaseViewModel
    {
        private User _selectedUser;

        private string _firstName;
        private string _midlleName;
        private string _lastName;
        private string _email;
        private string _phoneNumber;
        private int _postId;
        private string _login;
        private string _password;

        private int _userId;

        private int _workerId;
        private string _taskText;
        private int _statusId;

        public User SelectedUser
        {
            get => _selectedUser;
            set
            {
                _selectedUser = value;
                OnPropertyChanged(nameof(SelectedUser));
            }
        }

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

        public string Email
        {
            get => _email;
            set
            {
                _email = value;
                OnPropertyChanged(nameof(Email));
            }
        }

        public string PhoneNumber
        {
            get => _phoneNumber;
            set
            {
                _phoneNumber = value;
                OnPropertyChanged(nameof(PhoneNumber));
            }
        }

        public int postId
        {
            get => _postId;
            set
            {
                _postId = value;
                OnPropertyChanged(nameof(postId));
            }
        }

        public int UserId
        {
            get => _userId;
            set
            {
                _userId = value;
                OnPropertyChanged(nameof(UserId));
            }
        }

        public int WorkerId
        {
            get => _workerId;
            set
            {
                _workerId = value;
                OnPropertyChanged(nameof(WorkerId));
            }
        }

        public string TaskText
        {
            get => _taskText;
            set
            {
                _taskText = value;
                OnPropertyChanged(nameof(TaskText));
            }
        }

        public int StatusId
        {
            get => _statusId;
            set
            {
                _statusId = value;
                OnPropertyChanged(nameof(StatusId));
            }
        }

        private ObservableCollection<User> _user;

        private ObservableCollection<TaskProblem> _task;

        public ObservableCollection<User> User
        {
            get => _user;
            set
            {
                _user = value;
                OnPropertyChanged(nameof(User));
            }
        }

        public ObservableCollection<TaskProblem> TaskProblem
        {
            get => _task;
            set
            {
                _task = value;
                OnPropertyChanged(nameof(TaskProblem));
            }
        }

        public AppMainWindow(User user)
        {
            User = new ObservableCollection<User>();
            TaskProblem = new ObservableCollection<TaskProblem>();
            LoadData();
        }

        public void LoadData()
        {
            if (User.Count > 0)
            {
                User.Clear();
            }
            if (TaskProblem.Count > 0)
            {
                TaskProblem.Clear();
            }

            var userResult = DbStorage.DB_s.User.ToList();
            var taskResult = DbStorage.DB_s.TaskProblem.ToList();

            userResult.ForEach(elem => User?.Add(elem));
            taskResult.ForEach(elem => TaskProblem?.Add(elem));
        }

        public void DeleteSelectedItem()
        {
            if (!(SelectedUser is null))
            {
                using (var db = new HelpDeskDBEntities())
                {
                    var res = MessageBox.Show("Вы уверены, что хотите удалить данный элемент?\nЭто действие невозможно отменить", "Удаление", 
                        MessageBoxButton.YesNo, MessageBoxImage.Hand);
                    if (res == MessageBoxResult.Yes)
                    {
                        try
                        {
                            var itemForDelete = db.User.Where(elem => elem.ID == SelectedUser.ID).FirstOrDefault();
                            db.User.Remove(itemForDelete);
                            db.SaveChanges();
                            LoadData();
                            MessageBox.Show("Данные удалены", "Удаление", MessageBoxButton.OK, MessageBoxImage.Asterisk);
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show(ex.Message.ToString(), "Удаление", MessageBoxButton.OK, MessageBoxImage.Error);
                        }
                    }

                }
            }
        }
    }
}
