// See https://aka.ms/new-console-template for more information
using Microsoft.EntityFrameworkCore;
using project1.Data.Models;

Console.WriteLine("Hello, World!");

namespace project1
{
    public class Program
    {
        private static async void Main(string[] args)
        {
            var context = new ConstructionMaterialsDbContext();

            var products = await context.Products.ToListAsync<Product>();
            foreach (var item in products)
            {
                Console.WriteLine($"{ item.Name}, { item.Price}");
            }
        }
    }

}
