using ASP.NetWebAPIDay3Demo.DTOs.ProductDtos;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ASP.NetWebAPIDay3Demo.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        //Add DI for AppDbContext
        private readonly AppDbContext _db;
        public ProductsController(AppDbContext db)
        {
            _db = db;
        }

        //CURD Operations
        //Read All
        [HttpGet]
        public IActionResult Get()
        {
            //var products = _db.Products.Include("Category").ToList();
            //return Ok(products);
            var products = _db.Products.Include("Category").ToList();
            if (products == null || products.Count == 0)
            {
                return NotFound();
            }
            List<ProductGetDto> listProducts = new List<ProductGetDto>();
            foreach (var product in products)
            {
                ProductGetDto productDto = new ProductGetDto
                {
                    Name = product.Name,
                    Price = product.Price,
                    Description = product.Description,
                    PhotoPath = product.PhotoPath,
                    CategoryName = product.Category.Name

                };
                listProducts.Add(productDto);
            }
            return Ok(listProducts);
        }
        // [Route("{id}")]
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var products = _db.Products.ToList();
            return Ok(products);
        }

        //[HttpPost]
        //public IActionResult Post(Product newProduct)
        //{

        //}

    }
}
