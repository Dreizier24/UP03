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

namespace Project_UP03.View
{
    /// <summary>
    /// Логика взаимодействия для WorkerWindow.xaml
    /// </summary>
    public partial class WorkerWindow : Window
    {

        private User _id;
        private TaskProblem _task;

        public WorkerWindow(User user)
        {
            InitializeComponent();

            DataContext = new AppMainWindow(user);
        }

        private void btnSend_Click(object sender, RoutedEventArgs e)
        {
            using (var db = new HelpDeskDBEntities())
            {
                try
                {
                    var validateResult = ValidateEntity();

                    if (validateResult != null)
                    {
                        MessageBox.Show(validateResult.ToString(), "Информация", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }

                    db.TaskProblem.Add(_task);

                    db.SaveChanges();

                    MessageBox.Show("Данные успешно сохранены", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);

                    //(Owner as MainWindow)?.RefreshData();

                    //Owner.Focus();

                    this.Close();
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

            if (_task != null)
            {
                if (string.IsNullOrEmpty(_task.TaskText))
                {
                    errors.AppendLine("Опишите проблему!");
                }

                if (_task.WorkerId <= 0)
                {
                    errors.AppendLine("Некорректный Id!");
                }
            }
            return errors;
        }
        public void RefreshData()
        {
            //(DataContext as AdminWindow).LoadData();
        }
    }
}
