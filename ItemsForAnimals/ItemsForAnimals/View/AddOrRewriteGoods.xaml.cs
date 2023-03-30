using ItemsForAnimals.DBStorage;
using ItemsForAnimals.ViewModel;
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

namespace ItemsForAnimals.View
{
    /// <summary>
    /// Логика взаимодействия для AddOrRewriteGoods.xaml
    /// </summary>
    public partial class AddOrRewriteGoods : Window
    {

        Goods _goods;

        public AddOrRewriteGoods(Goods goods)
        {
            InitializeComponent();

            foreach (var item in App.Current.Windows)
            {
                if (item is AppWindow)
                {
                    this.Owner = item as Window;
                }
            }

            if (goods is null)
            {
                _goods = goods = new Goods();
            }
            else
            {
                _goods = goods;
            }

            this.DataContext = _goods;
        }

        private void btnCreateOrRewrite_Click(object sender, RoutedEventArgs e)
        {
            using (var db = new Trade_Entities())
            {
                try
                {
                    db.Goods.AddOrUpdate(_goods);
                    db.SaveChanges();
                    MessageBox.Show("Данные успешно сохранены", "", MessageBoxButton.OK, MessageBoxImage.Information);
                    (Owner as AppWindow)?.RefreshData();
                    Owner.Focus();
                    this.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}
