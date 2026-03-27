using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;


namespace ASP.NetWebAPIDay3Demo.Controllers
{
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
        [HttpGet]
        public IActionResult Get()
        {
            var categories = _context.Categories.ToList();
            return Ok(categories);
        }
        [HttpGet("{id:int}")]
        public IActionResult GetById(int id) // Model Binder (Primitive Route[Parameter Or Query string ] | Complex --> request body  )
        {
            //var category = _context.Categories.Find(id);
            var category = _context.Categories.FirstOrDefault(e => e.Id == id);
            if (category == null)
            {
                return NotFound();
            }
            return Ok(category);
        }

        [HttpGet("{name:alpha}")]
        public IActionResult GetByName(string name)
        {
            var category = _context.Categories.FirstOrDefault(e => e.Name.Equals(name));
            if (category == null)
            {
                return NotFound();
            }
            return Ok(category);
        }
        [HttpPost]
        public IActionResult Post(Category newCategory)
        {
            if (ModelState.IsValid)
            {
                _context.Categories.Add(newCategory);
                _context.SaveChanges();
                //return Created();
                //Location
                return CreatedAtAction("GetById", new { id = newCategory.Id }, newCategory);
            }
            return BadRequest(ModelState);
        }
        [HttpPut("{id}")]
        public IActionResult Put([FromRoute] int id, [FromBody] Category newCategory)
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
                _context.Entry(newCategory).State = EntityState.Modified;
                _context.SaveChanges();
                return Ok(newCategory);
            }
            catch (DbUpdateConcurrencyException ex)
            {
                return BadRequest(ex);
            }
        }
        [HttpDelete("{id}")]
        public IActionResult DeleteEmployee([FromRoute] int id)
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
