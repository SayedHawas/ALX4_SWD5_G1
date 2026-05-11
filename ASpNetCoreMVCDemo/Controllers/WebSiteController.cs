using Microsoft.AspNetCore.Mvc;

namespace ASpNetCoreMVCDemo.Controllers
{
    public class WebSiteController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
