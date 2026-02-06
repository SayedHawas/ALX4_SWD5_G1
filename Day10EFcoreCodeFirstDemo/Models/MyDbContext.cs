using Microsoft.EntityFrameworkCore;

namespace Day10EFcoreCodeFirstDemo.Models
{
    public class MyDbContext : DbContext
    {

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            //Data Source=SAYEDHAWAS\ALEXSWD5G1;Initial Catalog=MyDatabase;Integrated Security=True;Trust Server Certificate=True
            // base.OnConfiguring(optionsBuilder);
            optionsBuilder.UseSqlServer("server=SAYEDHAWAS\\ALEXSWD5G1;database=CodeFirstDB;Integrated security = true; Trust server Certificate = True");
        }
    }
}
