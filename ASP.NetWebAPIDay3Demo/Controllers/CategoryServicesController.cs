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
        [HttpGet]
        public IActionResult Get()
        {
            var result = _service.GetCategory();
            if (result == null)
                return NotFound();
            return Ok(result);
        }
        [HttpGet("{id:int}")]
        public IActionResult GetById(int id)
        {
            var result = _service.GetCategoryByID(id);
            if (result == null)
                return NotFound();
            return Ok(result);
        }

    }
}