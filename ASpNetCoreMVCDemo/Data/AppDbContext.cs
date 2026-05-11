
﻿using ASpNetCoreMVCDemo.Models;
using Microsoft.EntityFrameworkCore;


namespace ASpNetCoreMVCDemo.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext()
        {

        }
        public AppDbContext(DbContextOptions options) : base(options)
        {

        }

        //
        public DbSet<Department> Departments { get; set; }
        public DbSet<Employee> Employees { get; set; }

    }
}
