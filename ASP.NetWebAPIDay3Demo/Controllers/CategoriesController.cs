using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;


namespace ASP.NetWebAPIDay3Demo.Controllers
{
    //https://localhost:7031/api/Categories
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriesController : ControllerBase
    {
        //DI
        private readonly AppDbContext _context;
        public CategoriesController(AppDbContext context)
        {
            _context = context;
        }
        //CRUD
        //Read All Rows
        //https://localhost:7031/api/Categories
        [HttpGet]
        public IActionResult Get()
        {
            //var categories = _context.Categories.ToList();
            //return Ok(categories);
            //return From Database
            var categories = _context.Categories.Include("Products").AsNoTracking().ToList();
            if (categories == null || categories.Count == 0)
            {
                return NotFound();
            }
            //Mapping Fill DTOs Form Database
            List<CategoryGetDto> listCategories = new List<CategoryGetDto>();
            foreach (var category in categories)
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
        //Read One Row
        //https://localhost:7031/api/Categories/7
        [HttpGet("{id:int}")]
        public IActionResult GetById(int id) // Model Binder (Primitive Route[Parameter Or Query string ] | Complex --> request body  )
        {
            //var category = _context.Categories.Find(id);
            var category = _context.Categories.Include("Products").AsNoTracking().FirstOrDefault(e => e.Id == id);
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
        //Read One Row By Name 
        //https://localhost:7031/api/Categories/books
        [HttpGet("{name:alpha}")]
        public IActionResult GetByName(string name)
        {
            var category = _context.Categories.Include("Products").AsNoTracking().FirstOrDefault(e => e.Name.Equals(name));
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
        //https://localhost:7031/api/Categories    POST   JSON  Request Body {Name , description}
        [HttpPost]
        public IActionResult Post(CategoryCreateDto newCategory)
        {
            //Validation  ModelState  Key , Value     True | False
            if (ModelState.IsValid)
            {
                Category category = new Category()
                {
                    Name = newCategory.Name,
                    Description = newCategory.Description
                };
                _context.Categories.Add(category);
                _context.SaveChanges();
                // return Created();   //201
                //Location
                return CreatedAtAction("GetById", new { id = category.Id }, category);
            }
            return BadRequest(ModelState);
        }
        //https://localhost:7031/api/Categories/7  [FromRoute]  Put   JSON Request Body {id ,Name , description}[FromBody]
        [HttpPut("{id}")]
        public IActionResult Put([FromRoute] int id, [FromBody] CategoryCreateDto newCategory)
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
                //_context.Entry(newCategory).State = EntityState.Modified;
                var category = _context.Categories.FirstOrDefault(e => e.Id == id);
                category.Name = newCategory.Name;
                category.Description = newCategory.Description;
                _context.SaveChanges();
                return Ok(newCategory);
            }
            catch (DbUpdateConcurrencyException ex)
            {
                return BadRequest(ex);
            }
        }
        [HttpDelete("{id}")]
        public IActionResult Delete([FromRoute] int id)
        {
            var employee = _context.Categories.FirstOrDefault(e => e.Id == id);
            if (employee == null)
            {
                return NotFound();
            }
            _context.Categories.Remove(employee);
            _context.SaveChanges();
            return NoContent();
        }
        private bool CategoryExists(int id)
        {
            return _context.Categories.Any(e => e.Id == id);
        }
    }
}
