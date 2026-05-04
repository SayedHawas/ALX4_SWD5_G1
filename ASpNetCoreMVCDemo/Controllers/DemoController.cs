using Microsoft.AspNetCore.Mvc;

namespace ASpNetCoreMVCDemo.Controllers
{
    //https://localhost:7018/demo/
    public class DemoController : Controller
    {
        public ActionResult Index()
        {
            return View();

        }


        //https://localhost:7018/demo/sayhello
        public ActionResult<string> sayhello()
        {
            return "Hello from DemoController";
        }

        public ActionResult ShowContent()
        {
            ContentResult result = new ContentResult();
            result.Content = "<h1> Welcome in MVC </h1>";
            return result;

        }
        public ActionResult ShowJson()
        {
            JsonResult result = new JsonResult(new { Name = "John", Age = 30 });
            return result;
        }

        public ActionResult ShowFile()
        {
            return File("TextFile.txt", contentType: "plain/text");
        }

        public ActionResult ShowView()
        {
            return View("~/Views/MyView.cshtml");
        }

        public ActionResult Show2View()
        {
            return View();
        }
    }
}
