using Microsoft.AspNetCore.Mvc;

namespace ASpNetCoreMVCDemo.Controllers
{
    //https://localhost:7018/employee
    public class EmployeeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
