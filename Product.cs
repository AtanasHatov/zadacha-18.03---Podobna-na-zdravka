using System;
using System.Collections.Generic;

namespace project1.Data.Models;

public partial class Product
{
    public int ProductId { get; set; }

    public string? Name { get; set; }

    public decimal? Price { get; set; }

    public int? CategorieId { get; set; }

    public virtual Category? Categorie { get; set; }

    public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();

    public virtual ICollection<SupplierProduct> SupplierProducts { get; set; } = new List<SupplierProduct>();
}
