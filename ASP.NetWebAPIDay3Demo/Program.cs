
using ASP.NetWebAPIDay3Demo.Services.Implements;
using ASP.NetWebAPIDay3Demo.Services.Interfaces;
using ASP.NetWebAPIDay3Demo.UnitOfWorks;
using Microsoft.EntityFrameworkCore;

namespace ASP.NetWebAPIDay3Demo
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.

            builder.Services.AddControllers();
            //builder.Services.AddControllers().AddJsonOptions(options =>
            //{
            //    options.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles;
            //});
            builder.Services.AddDbContext<Data.AppDbContext>(
              option => option.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")
             ));
            builder.Services.AddScoped<IUnitOfWork, UnitOfWork>();
            builder.Services.AddScoped<ICategoryService, CategoryService>();


            // Learn more about configuring OpenAPI at https://aka.ms/aspnet/openapi
            builder.Services.AddOpenApi();
            //Add Services EndPoint + Gen into Swagger
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();
            //Add DbContext


            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.MapOpenApi();
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseHttpsRedirection();

            app.UseAuthorization();


            app.MapControllers();

            app.Run();
        }
    }
}
