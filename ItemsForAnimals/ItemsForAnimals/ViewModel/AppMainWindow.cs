using ItemsForAnimals.DBStorage;
using ItemsForAnimals.View;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace ItemsForAnimals.ViewModel
{
    public class AppMainWindow : BaseViewModel
    {

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
        
        private ObservableCollection<Goods> _goods;

        public ObservableCollection<Goods> Goods
        {
            get => _goods;
            set
            {
                _goods = value;
                OnPropertyChanged(nameof(Goods));
            }
        }

        private Goods _selectedGoods;
        public Goods SelectedGoods
        {
            get => _selectedGoods;
            set
            {
                _selectedGoods = value;
                OnPropertyChanged(nameof(SelectedGoods));
            }
        }

        private int _goodsId;
        public int GoodsId
        {
            get => _goodsId;
            set
            {
                _goodsId = value;
                OnPropertyChanged(nameof(GoodsId));
            }
        }
        private string _articul;
        public string Articul
        {
            get => _articul;
            set
            {
                _articul = value;
                OnPropertyChanged(nameof(Articul));
            }
        }
        private string _productName;
        public string ProductName 
        { 
            get => _productName; 
            set 
            {
                _productName = value;
                OnPropertyChanged(nameof(ProductName));
            } 
        }
        private int _unit_id;
        public int Unit_id
        {
            get => _unit_id; 
            set
            {
                _unit_id = value;
                OnPropertyChanged(nameof(Unit_id));
            }
        }
        private decimal _price;

        public decimal Price
        {
            get => _price; 
            set
            {
                _price = value;
                OnPropertyChanged(nameof(Price));
            }
        }
        private int _maxDiscount;
        public int MaxDiscount 
        { 
            get => _maxDiscount; 
            set
            {
                _maxDiscount = value;
                OnPropertyChanged(nameof(MaxDiscount));
            }
        }
        private int _manufacturer_id;
        public int Manufacturer_id 
        { 
            get => _manufacturer_id;
            set
            {
                _manufacturer_id = value;
                OnPropertyChanged(nameof(Manufacturer_id));
            }
        }
        private int _supplier_id;

        public int Supplier_id 
        { 
            get => _supplier_id; 
            set 
            {
                _supplier_id = value;
                OnPropertyChanged(nameof(Supplier_id));
            } 
        }
        private int _category_id;
        public int Category_id 
        { 
            get => _category_id; 
            set
            {
                _category_id = value;
                OnPropertyChanged(nameof(Category_id));
            }
        }
        private int _currentDiscount;
        public int CurrentDiscount 
        { 
            get => _currentDiscount; 
            set
            {
                _currentDiscount = value;
                OnPropertyChanged(nameof(CurrentDiscount));
            }
        }
        private int _storageAmount;
        public int StorageAmount 
        { 
            get => _storageAmount; 
            set
            {
                _storageAmount = value;
                OnPropertyChanged(nameof(StorageAmount));
            }
        }
        private string _description;
        public string Description
        {
            get => _description;
            set
            {
                _description = value;
                OnPropertyChanged(nameof(Description));
            }
        }
        private byte[] _image;
        public byte[] Image 
        {
            get => _image;
            set
            {
                _image = value;
                OnPropertyChanged(nameof(Image));
            }
        }

        public AppMainWindow(User user)
        {
            User = new ObservableCollection<User>();
            Goods = new ObservableCollection<Goods>();
            
            LoadData();
        }

        public void LoadData()
        {
            if (Goods.Count > 0) 
            {
                Goods.Clear();
            }
            var goodsRes = DBStorage.DBStorage.DB_s.Goods.ToList();
            goodsRes.ForEach(elem => Goods?.Add(elem));
        }

        public void DeleteSelData()
        {
            if(!(SelectedGoods is null))
            {
                using (var db = new Trade_Entities())
                {
                    var res = MessageBox.Show("Вы уверены, что хотите удалить данный элемент?\nЭто действие невозможно отменить","Удаление",
                        MessageBoxButton.YesNo,MessageBoxImage.Stop);
                    if (res == MessageBoxResult.Yes)
                    { 
                        try
                        {
                            var goodForDelete = db.Goods.Where(elem => elem.Id == SelectedGoods.Id).FirstOrDefault();
                            db.Goods.Remove(goodForDelete);
                            db.SaveChanges();
                            MessageBox.Show("Данные удалены", "Удаление", MessageBoxButton.OK, MessageBoxImage.Information);
                            LoadData();
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
