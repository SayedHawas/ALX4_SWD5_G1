using Microsoft.EntityFrameworkCore;

namespace Day12EFCoreDemo.Models
{
    public class CompanyDbContext : DbContext
    {

        public DbSet<Department> Departments { get; set; }
        public DbSet<Employee> Employees { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            //base.OnConfiguring(optionsBuilder);
            optionsBuilder.UseSqlServer("Data Source=SAYEDHAWAS\\ALEXSWD5G1;Initial Catalog=CodeFirstDay2DB;Integrated Security=True;Trust Server Certificate=True");
        }
    }
}
