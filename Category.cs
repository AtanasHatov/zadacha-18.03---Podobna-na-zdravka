using System;
using System.Collections.Generic;

namespace project1.Data.Models;

public partial class Category
{
    public int CategorieId { get; set; }

    public string? Name { get; set; }

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
