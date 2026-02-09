using Day11EFCoreDemo.Models;

namespace Day11EFCoreDemo
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World! Day 11 in EF Core ");
            #region Entity framework Core Code First Part1 
            //1- Create Project 
            //2_ Add NuGet Packages 
            //Microsoft.EntityFrameworkCore;
            //Microsoft.EntityFrameworkCore.SqlServer;
            //Microsoft.EntityFrameworkCore.Tools

            //3- Create Models Folder 
            //4- Create Class ApplicationDbContext : DbContext   Open Session With Database
            //5- Override OnConfiguration Method  (Provider MS SQl server + Connection String)
            //6- Create Class Employee Entry One Row in Employees Table 
            //7- in ApplicationDbContext Class DbSet<Employee> Employees  Entity = Table 
            //8- Create Migration 
            //  1) Open Tools --> NuGet Package --> Package Manage Console PMC
            //  2) Add-Migration <Migration Name>
            //  3) Update-database 

            //9- CRUD Create, Update, Delete, Read All, Read By ID 

            //10 Create Object ApplicationDbContext  Open Session With Database 
            //Full CRUD Operators Code First 

            using (ApplicationDbContext db = new ApplicationDbContext())
            {
                //Create Employee
                //Employee emp = new Employee() { Name="sayed hawas" , Email="sayed@gamil.com" , Address ="Alex" , Job = "Developer" , Salary = 20000 };
                //emp.Name = "Sayed Hawas";
                //emp.Email = "sayed@gamil.com";

                //Memory
                db.Employees.Add(new Employee() { Name = "Ahmed ali", Email = "Ahmed@gamil.com", Address = "Alex", Job = "Developer", Salary = 20000 });
                if (db.SaveChanges() > 0)
                {
                    Console.WriteLine("Add New Row ...");
                }
                Console.WriteLine("----------All --------------------");
                //Read All
                var Emps = db.Employees.ToList();
                //var Products = db.Products.ToList();
                foreach (Employee e in Emps)
                {
                    Console.WriteLine(e.ToString());
                }
                Console.WriteLine("---------- By ID --------------------");
                //Read By ID 
                //var emp = db.Employees.First(e => e.EmployeeId == 10);
                //var emp = db.Employees.Last(e => e.EmployeeId == 10);
                //var emp = db.Employees.LastOrDefault(e => e.EmployeeId == 10);
                //var emp = db.Employees.Single(e => e.EmployeeId == 10);
                //var emp = db.Employees.SingleOrDefault(e => e.EmployeeId == 10);
                var emp = db.Employees.FirstOrDefault(e => e.EmployeeId == 5);
                if (emp != null)
                    Console.WriteLine(emp.ToString());
                else
                    Console.WriteLine("Employee Not Found ....");
                //Update    In Memeory 
                emp.Name = "Mariem";
                emp.Salary = 25000;
                if (db.SaveChanges() > 0)
                {
                    Console.WriteLine("Update  Row ...");
                }
                Console.WriteLine("----------All --------------------");
                //Read All
                var newEmps = db.Employees.ToList();
                //var Products = db.Products.ToList();
                foreach (Employee e in newEmps)
                {
                    Console.WriteLine(e.ToString());
                }

                //Delete 
                var empDelete = db.Employees.Find(6);
                if (empDelete != null)
                {
                    db.Employees.Remove(empDelete);
                    db.SaveChanges();
                    Console.WriteLine("Delete Done ....");
                }
                else
                    Console.WriteLine("Employee Not Found ..");

                Console.WriteLine("----------All --------------------");
                //Read All
                var newEmps2 = db.Employees.ToList();
                //var Products = db.Products.ToList();
                foreach (Employee e in newEmps2)
                {
                    Console.WriteLine(e.ToString());
                }
            }







            #endregion
            Console.ReadLine();
        }
    }
}
