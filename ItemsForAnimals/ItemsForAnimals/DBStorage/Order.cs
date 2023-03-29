//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ItemsForAnimals.DBStorage
{
    using System;
    using System.Collections.Generic;
    
    public partial class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            this.OrderContent = new HashSet<OrderContent>();
        }
    
        public int Id { get; set; }
        public int Status_id { get; set; }
        public Nullable<System.DateTime> DeliveryDate { get; set; }
        public int PickupPoint_id { get; set; }
        public int GetCode { get; set; }
        public Nullable<int> Client_id { get; set; }
        public System.DateTime OrderDate { get; set; }
    
        public virtual Client Client { get; set; }
        public virtual PickupPoint PickupPoint { get; set; }
        public virtual OrderStatus OrderStatus { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderContent> OrderContent { get; set; }
    }
}