using ASP.NetWebAPIDay3Demo.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace ASP.NetWebAPIDay3Demo.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryServicesController : ControllerBase
    {
        private readonly ICategoryService _service;
        public CategoryServicesController(ICategoryService service)
        {
            _service = service;
        }
        //GetALL
        [HttpGet]
        public IActionResult Get()
        {
            var result = _service.GetCategory();
            if (result == null)
                return NotFound();
            return Ok(result);
        }
        //GetByID
        [HttpGet("{id:int}")]
        public IActionResult GetById(int id)
        {
            var result = _service.GetCategoryByID(id);
            if (result == null)
                return NotFound();
            return Ok(result);
        }
        // Add
        [HttpPost]
        public IActionResult Create(CategoryCreateDto newCategory)  //request body  Model Binding 
        {
            //validation 
            if (ModelState.IsValid)
            {
                _service.AddCategory(newCategory);
                return Created();//201
                //return CreatedAtAction(nameof(GetById), new { id = newCategory.Id }, newCategory); //location header
            }
            return BadRequest(ModelState);
        }
        // Edit 
        [HttpPut("{id:int}")]
        public IActionResult Edit(int id, CategoryCreateDto newCategory)  //id value Route  , category  request body  Model Binding 
        {
            if (id != newCategory.Id)
            {
                return BadRequest("ID in URL and ID in body must match.");
            }
            if (ExistsCategory(id) == false)
            {
                return NotFound($"Category with ID {id} not found.");
            }
            //validation 
            if (ModelState.IsValid)
            {
                _service.UpdateCategory(id, newCategory);
                return NoContent(); //204
            }
            return BadRequest(ModelState);
        }

        // Delete 
        [HttpDelete("{id:int}")]
        public IActionResult Delete(int id)  //request body  Model Binding 
        {
            var result = _service.GetCategoryByID(id);
            if (result == null)
                return NotFound();
            _service.DeleteCategory(id);
            return NoContent(); //204
        }
        private bool ExistsCategory(int id)
        {
            var select = _service.GetCategoryByID(id);
            if (select == null)
                return false;
            return true;
        }
    }
}