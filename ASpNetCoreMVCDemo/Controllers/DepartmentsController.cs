using ASpNetCoreMVCDemo.Data;
using ASpNetCoreMVCDemo.Models;
using Microsoft.AspNetCore.Mvc;

namespace ASpNetCoreMVCDemo.Controllers
{
    public class DepartmentsController : Controller
    {
        private readonly AppDbContext _db;
        public DepartmentsController(AppDbContext db)
        {
            _db = db;
        }

        //List of Departments
        public IActionResult Index()
        {
            var departments = _db.Departments.ToList();
            return View(departments);
        }
        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(Department newDepartment)
        {
            if (ModelState.IsValid)
            {
                _db.Departments.Add(newDepartment);
                _db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(newDepartment);
        }
    }
}
