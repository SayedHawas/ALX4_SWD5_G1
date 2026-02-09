using Microsoft.EntityFrameworkCore;

namespace Day11EFCoreDemo.Models
{
    public class ApplicationDbContext : DbContext
    {

        //Class Deal with as table  DbSet<>

        public DbSet<Employee> Employees { get; set; }

        public DbSet<Product> Products { get; set; }

        public DbSet<Person> People { get; set; }
        //Connection Database 
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            //base.OnConfiguring(optionsBuilder);
            optionsBuilder.UseSqlServer("Data Source=SAYEDHAWAS\\ALEXSWD5G1;Initial Catalog=EFCoreCodeFirstDB;Integrated Security=True;Trust Server Certificate=True");
            //Connection String
            //1) Data Source | Server ;            SAYEDHAWAS\ALEXSWD5G1
            //2) Initial Catalog | Database   ;    EFCoreCodeFirstDB
            //3) Integrated Security = True ;
            //4) Trust Server Certification = true;

        }
    }
}
