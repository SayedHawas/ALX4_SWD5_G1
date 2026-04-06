
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ASP.NetWebAPIDay3Demo.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AsyncCategoriesController : ControllerBase
    {
        private readonly AppDbContext _context;

        public AsyncCategoriesController(AppDbContext context)
        {
            _context = context;

        }
        //CRUD
        // GET: api/AsyncCategories
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CategoryGetDto>>> GetCategories()
        {
            var result = await _context.Categories.Include("Products").AsNoTracking().ToListAsync();
            if (result == null)
            {
                return NotFound();
            }
            //Mapping Fill DTOs Form Database
            List<CategoryGetDto> listCategories = new List<CategoryGetDto>();
            foreach (var category in result)
            {
                CategoryGetDto categoryDto = new CategoryGetDto
                {
                    //Mapping
                    Id = category.Id,
                    Name = category.Name,
                    Description = category.Description,
                    ProductNames = category.Products.Select(p => p.Name).ToList()
                };
                listCategories.Add(categoryDto);
            }
            return Ok(listCategories);
        }
        // GET: api/AsyncCategories/5
        [HttpGet("{id}")]
        public async Task<ActionResult<CategoryGetDto>> GetCategory(int id)
        {
            //var category = await _context.Categories.FindAsync(id);
            var category = await _context.Categories.Include("Products").AsNoTracking().FirstOrDefaultAsync(c => c.Id == id);
            if (category == null)
            {
                return NotFound();
            }
            CategoryGetDto categoryOne = new CategoryGetDto()
            {
                Id = category.Id,
                Name = category.Name,
                Description = category.Description,
                ProductNames = category.Products.Select(p => p.Name).ToList()
            };
            return Ok(categoryOne);
        }
        // PUT: api/AsyncCategories/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCategory(int id, CategoryCreateDto newCategory)
        {
            if (id != newCategory.Id)
            {
                return BadRequest();
            }
            if (!CategoryExists(id))
            {
                return NotFound();
            }
            try
            {
                if (ModelState.IsValid)
                {
                    //_context.Entry(newCategory).State = EntityState.Modified;
                    var category = await _context.Categories.FirstOrDefaultAsync(e => e.Id == id);
                    category.Name = newCategory.Name;
                    category.Description = newCategory.Description;
                    await _context.SaveChangesAsync();
                    return Ok(newCategory);
                }
                else
                {
                    return BadRequest(ModelState);
                }
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CategoryExists(id))
                {
                    return NotFound();
                }
                else
                {
                    return BadRequest();
                }
            }
        }
        // POST: api/AsyncCategories
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<CategoryCreateDto>> PostCategory(CategoryCreateDto newCategory)
        {
            if (ModelState.IsValid)
            {
                Category category = new Category()
                {
                    Name = newCategory.Name,
                    Description = newCategory.Description
                };
                _context.Categories.Add(category);
                await _context.SaveChangesAsync();
                return CreatedAtAction("GetCategory", new { id = category.Id }, category);
            }
            else
            {
                return BadRequest(ModelState);
            }
        }
        // DELETE: api/AsyncCategories/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCategory(int id)
        {
            var category = await _context.Categories.FindAsync(id);
            if (category == null)
            {
                return NotFound();
            }

            _context.Categories.Remove(category);
            await _context.SaveChangesAsync();
            return NoContent();
        }
        private bool CategoryExists(int id)
        {
            return _context.Categories.Any(e => e.Id == id);
        }
    }
}
