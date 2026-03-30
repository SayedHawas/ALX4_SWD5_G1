using Microsoft.EntityFrameworkCore;

namespace ASP.NetWebAPIDay3Demo.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext()
        {

        }
        public AppDbContext(DbContextOptions options) : base(options)
        {

        }

        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Product> Products { get; set; }

        //protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        //{
        //    //base.OnConfiguring(optionsBuilder);
        //    optionsBuilder.UseSqlServer(@"Data Source=SAYEDHAWAS\ALEXSWD5G1;Initial Catalog=Day3WebAPICodeFirstDB;Integrated Security=True;Trust Server Certificate=True");
        //}

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //Fluent Api(Using code C#)
            //base.OnModelCreating(modelBuilder);
            //modelBuilder.Entity<Category>().HasKey(c => c.Id);
            //modelBuilder.Entity<Category>().Property(c => c.Name).IsRequired().HasMaxLength(100);
            //seed data
            modelBuilder.Entity<Category>().HasData(
                    new Category { Id = 1, Name = "Electronics" },
                    new Category { Id = 2, Name = "Books" },
                    new Category { Id = 3, Name = "Clothing" }
            );


            // base.OnModelCreating(modelBuilder);
            //Add Primary Key 
            //modelBuilder.Entity<Product>(s => {
            //    s.HasKey(x => x.Id);
            //    s.Property(x => x.Name).IsRequired().HasMaxLength(100);
            //});

            //modelBuilder.Entity<Product>(s =>
            //{
            //    s.HasKey(x => x.Id);  //Primary Key
            //    s.Property(x => x.Id).ValueGeneratedNever(); // Not Identity 
            //});
        }
    }
}
