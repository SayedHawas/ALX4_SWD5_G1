using Microsoft.AspNetCore.Mvc;

namespace Asp.NetWebAPIDemo.Controllers
{
    //URI  Https:Localhost:7064/api/Demo
    [Route("api/[controller]")]
    [ApiController]
    public class DemoController : ControllerBase
    {
        //CRUD Operations                                         //0       1        2        3
        static List<string> EmployeeNames = new List<string>() { "Ahmed", "Ali", "Mariem ", "Aya" };

        //Https:Localhost:7064/api/Demo
        //Get All Employees
        [HttpGet]
        public List<string> Get()
        {
            return EmployeeNames;
        }
        //Https:Localhost:7064/api/Demo/1
        //Get By ID
        [HttpGet("{id:int}")]
        public string GetByID(int id)
        {
            if (id > EmployeeNames.Count || id < 1)
                return "Not Found";
            else
                return EmployeeNames[id - 1];
        }
        //[HttpGet("{name:alpha}")]
        //public string GetByName(string name)
        //{
        //    var result = EmployeeNames.FirstOrDefault(e => e.Equals(name));
        //    if (result == null)
        //        return "Not Found";
        //    else
        //        return result;
        //}
        [HttpPost]
        public string Post(string newName)
        {
            EmployeeNames.Add(newName);
            return "Add New Name";
        }

        [HttpPut]
        public string Put()
        {
            return "";
        }

        [HttpDelete]
        public string Delete()
        {
            return "";
        }



    }
}
