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

        private string _productName;
        private decimal _price;
        private string _description;
        private int _storageAmount;
        private int _currentDiscount;
        private int _maxDiscount;
        private int _supplierId;
        private int _manufacturerId;
        private byte[] _image;
        private int _unitId;
        //private int _goodsId;
        private int _categoryId;
        private string _articul;


        public string ProductName
        {
            get => _productName;
            set
            {
                _productName = value;
                OnPropertyChanged(nameof(ProductName));
            }
        }

        public string Description
        {
            get => _description; 
            set
            {
                _description = value;
                OnPropertyChanged(nameof(Description));
            }
        }

        public decimal Price
        {
            get => _price;
            set
            {
                _price = value;
                OnPropertyChanged(nameof(Price));
            }
        }
       
        public int StorageAmount
        {
            get => _storageAmount; 
            set
            {
                _storageAmount = value;
                OnPropertyChanged(nameof(StorageAmount));
            }
        }
        public int CurrentDiscount
        {
            get => _currentDiscount; 
            set
            {
                _currentDiscount = value;
                OnPropertyChanged(nameof(CurrentDiscount));
            }

        }
        public string Articul
        {
            get => _articul;
            set
            {
                _articul = value;
                OnPropertyChanged(nameof(Articul));
            }
        }
        //public int GoodsId
        //{
        //    get => _goodsId;
        //    set
        //    {
        //        _goodsId = value;
        //        //OnPropertyChanged(nameof(GoodsId));
        //    }
        //}
        public int ManufacturerId
        {
            get => _manufacturerId;
            set
            {
                _manufacturerId = value;
                OnPropertyChanged(nameof(ManufacturerId));
            }
        }
        public int SupplierId
        {
            get => _supplierId;
            set
            {
                _supplierId = value;
                OnPropertyChanged(nameof(SupplierId));
            }
        }
        public int CategoryId
        {
            get => _categoryId;
            set
            {
                _categoryId = value;
                OnPropertyChanged(nameof(CategoryId));
            }
        }
        public int UnitId
        {
            get => _unitId;
            set
            {
                _unitId = value;
                OnPropertyChanged(nameof(UnitId));
            }
        }
        public int MaxDiscount
        {
            get => _maxDiscount;
            set
            {
                _maxDiscount = value;
                OnPropertyChanged(nameof(MaxDiscount));
            }
        }
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
            Goods= new ObservableCollection<Goods>();

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

        public void AddGoods()
        {
            Goods _good = new Goods();
            try
            {
                if (_selectedGoods == null)
                {
                  
                    _good.Articul = _articul;
                    _good.ProductName = _productName;
                    _good.Manufacturer_id = _manufacturerId;
                    _good.Price = _price;
                    _good.Supplier_id = _supplierId;
                    _good.Category_id = _categoryId;
                    _good.CurrentDiscount = _currentDiscount;
                    _good.StorageAmount = _storageAmount;
                    _good.Description = _description;
                    _good.MaxDiscount = _maxDiscount;
                    _good.Unit_id = _unitId;
                }
                else
                {
                    _good = _selectedGoods;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка добавления товара", MessageBoxButton.OK, MessageBoxImage.Error);
            }

            using (var db = new Trade_Entities())
            {
                try
                {
                    db.Goods.AddOrUpdate(_good);
                    db.SaveChanges();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "Ошибка добавления данных", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
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
