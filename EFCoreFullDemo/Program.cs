using EFCoreFullDemo.Models;
using Microsoft.EntityFrameworkCore;

namespace EFCoreFullDemo
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");
            //CRUD Operations    Create Read-ALL , ReadById , Update Delete
            //Query 
            //data from the database using LINQ   LINQ-ToEntity 
            using (AppDbContext db = new AppDbContext())
            {
                //Read All Linq -ToEntity Go Database And Select Data
                var products = db.Products.AsNoTracking().ToList();
                foreach (var item in products)
                {
                    Console.WriteLine($"Id: {item.Id} Name: {item.Name} Price: {item.Price}");
                }

                //Create Object And Add To Database
                Product p = new Product() { Name = "Iphone 14 Pro Max", Price = 150000 };
                //Add To DbSet in Memory
                db.Products.Add(p);
                Console.WriteLine(db.Entry<Product>(p).State);
                //Save Changes To Database
                // db.SaveChanges();
                //Console.WriteLine("Saving Product");

                //Update 
                var updateProduct = db.Products.Find(2);
                updateProduct.Name = "Labtop hp , Dell";
                updateProduct.Price = 50000;
                Console.WriteLine(db.Entry<Product>(updateProduct).State);
                //db.SaveChanges();
                //Console.WriteLine("Update Product");

                //Delete
                var DeleteProduct = db.Products.Find(5); //4
                db.Products.Remove(DeleteProduct);
                Console.WriteLine(db.Entry<Product>(DeleteProduct).State);
                //db.SaveChanges();
                //Console.WriteLine("Delete Product");


                //Console.WriteLine(db.ChangeTracker.ToDebugString());

                db.SaveChanges();
            }


            Console.ReadLine();
        }
    }
}
