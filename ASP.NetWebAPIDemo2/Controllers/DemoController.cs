using Microsoft.AspNetCore.Mvc;

namespace ASP.NetWebAPIDemo2.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DemoController : ControllerBase
    {
        //https://localhost:7067/api/demo
        [HttpGet]
        public string Get()
        {
            return "Welcome in Web API .... ";
        }

        //https://localhost:7067/api/demo/100
        [HttpGet("{id:int}")]
        public string Get(int id)
        {
            return $"Id is {id} ";
        }
        //https://localhost:7067/api/demo/ahmed
        [HttpGet("{name:alpha}")]
        public string GetName(string name)
        {
            return $"My Name is {name}";
        }
    }
}
