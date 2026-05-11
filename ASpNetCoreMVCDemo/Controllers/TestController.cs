using Microsoft.AspNetCore.Mvc;

namespace ASpNetCoreMVCDemo.Controllers
{
    public class TestController : Controller
    {
        //Pass Data Method As Parameters
        //https://localhost:7018/test/index  Without Params
        //https://localhost:7018/test/index/100   Value Route
        //test  ---> Controller 
        //index --->  Action 
        //100    --> Value Route 
        //https://localhost:7018/test/index?code=200  QueryString 
        //https://localhost:7018/test/index/100?code=5000&name=ahmedali
        //public ActionResult<string> Index(int id, int code, string name)
        //{
        //    return $"Welcome in MVC Id {id} code : {code}  name = {name}";
        //}

        //How to Pass Data From Controller to View
        // ViewData["key"] = value;  --> Dictionary Object   MVC 1, MVC2
        // ViewBag.key = value;      --> Dynamic Object
        public ActionResult Index(int id, int code, string name)
        {
            //List<int>  Numbers = new List<int>() { 1, 2, 3, 4, 5 };
            //Dictionary<int, string> Names = new Dictionary<int, string>()
            //{
            //    { 1, "Ahmed" },
            //    { 2, "Ali" },
            //    { 3, "Omar" },
            //    { 2, "Ahmed" },
            //    { 5, "Mona" }
            //};
            //
            ViewData["id"] = id;
            ViewData["code"] = code;
            //ViewData["name"] = name;    // index Name 
            ViewData.Add("name", name);  //Object  Boxing 

            //Dynamic
            //dynamic x = 100;
            //int len1 = x.length;

            //string str = "Hello";
            //int len = str.Length;


            ViewBag.id2 = id;
            ViewBag.code2 = code;
            ViewBag.name2 = name;

            return View();
        }

        public ActionResult ShowStudent()
        {
            List<Student> students = new List<Student>()
            {
                new Student(){ Id = 1, Name = "Ahmed", Age = 20 },
                new Student(){ Id = 2, Name = "Ali", Age = 22 },
                new Student(){ Id = 3, Name = "Omar", Age = 21 },
                new Student(){ Id = 4, Name = "Mona", Age = 23 },
                new Student(){ Id = 5, Name = "Sara", Age = 19 }
            };
            return View(students);
        }
    }
}
