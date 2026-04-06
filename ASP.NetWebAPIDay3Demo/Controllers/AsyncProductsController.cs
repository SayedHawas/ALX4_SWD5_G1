using ASP.NetWebAPIDay3Demo.DTOs.ProductDtos;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ASP.NetWebAPIDay3Demo.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AsyncProductsController : ControllerBase
    {
        private readonly AppDbContext _context;

        public AsyncProductsController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/AsyncProducts
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ProductGetDto>>> GetProducts()
        {
            //var result = await _context.Products.Include("Category")
            var result = await _context.Products.Include(p => p.Category)
                .Select(p => new ProductGetDto
                {
                    Name = p.Name,
                    Price = p.Price,
                    Description = p.Description,
                    PhotoPath = p.PhotoPath,
                    CategoryName = p.Category.Name
                }).ToListAsync();
            if (result == null || result.Count == 0)
            {
                return NotFound();
            }
            return Ok(result);
        }
        // GET: api/AsyncProducts/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ProductGetDto>> GetProduct(int id)
        {
            var result = await _context.Products.Include(p => p.Category).AsNoTracking().FirstOrDefaultAsync(p => p.Id == id);
            if (result == null)
            {
                return NotFound();
            }
            var oneProduct = new ProductGetDto
            {
                Name = result.Name,
                Price = result.Price,
                Description = result.Description,
                PhotoPath = result.PhotoPath,
                CategoryName = result.Category.Name
            };
            return Ok(oneProduct);
        }
        // PUT: api/AsyncProducts/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutProduct(int id, ProductCreateDto newProduct)
        {
            if (id != newProduct.Id)
            {
                return BadRequest();
            }
            if (!ProductExists(id))
            {
                return NotFound();
            }
            if (ModelState.IsValid)
            {
                var product = await _context.Products.FindAsync(id);
                product.Name = newProduct.Name;
                product.Price = newProduct.Price;
                product.Description = newProduct.Description;
                product.PhotoPath = newProduct.PhotoPath;
                product.CategoryId = newProduct.CategoryId;
                await _context.SaveChangesAsync();
                return NoContent();
            }
            return BadRequest(ModelState);
        }
        // POST: api/AsyncProducts
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Product>> PostProduct(ProductCreateDto newProduct)
        {
            if (ModelState.IsValid)
            {
                var product = new Product
                {
                    Name = newProduct.Name,
                    Price = newProduct.Price,
                    Description = newProduct.Description,
                    PhotoPath = newProduct.PhotoPath,
                    CategoryId = newProduct.CategoryId
                };
                _context.Products.Add(product);
                await _context.SaveChangesAsync();
                return CreatedAtAction("GetProduct", new { id = product.Id }, product);
            }
            return BadRequest(ModelState);
        }
        // DELETE: api/AsyncProducts/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteProduct(int id)
        {
            var product = await _context.Products.FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }

            _context.Products.Remove(product);
            await _context.SaveChangesAsync();
            return NoContent();
        }
        private bool ProductExists(int id)
        {
            return _context.Products.Any(e => e.Id == id);
        }
    }
}
