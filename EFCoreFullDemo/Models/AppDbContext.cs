using Microsoft.EntityFrameworkCore;

namespace EFCoreFullDemo.Models
{
    public class AppDbContext : DbContext
    {

        //SQL Server 
        //ConnectionString: "Server=(localdb)\\mssqllocaldb;Database=EFCoreFullDemoDb;Trusted_Connection=True;MultipleActiveResultSets=true"

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            //base.OnConfiguring(optionsBuilder);
            optionsBuilder.UseSqlServer("Data Source=SAYEDHAWAS\\ALEXSWD5G1;Initial Catalog=CodeFirst44DB;Integrated Security=True;Trust Server Certificate=True");
        }

        public DbSet<Product> Products { get; set; }
    }
}
