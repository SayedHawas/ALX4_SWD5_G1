using TranckingLINQ_IEu_VS_IQU_DEMo.Models;

namespace TranckingLINQ_IEu_VS_IQU_DEMo
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");
            using (LINQDBContext db = new LINQDBContext())
            {

                var result = db.Students.Where(a => a.Subject == "C#" && a.Mark > 80).Select(s => new { Name = s.Name, Mark = s.Mark }).ToList();

                IEnumerable<Student> Stu = db.Students.Where(q => q.Subject == "C#").ToList().Take(3);

                Console.WriteLine("------------ IEnumerable -------------");
                foreach (Student s in Stu)
                {
                    Console.WriteLine($" the Name {s.Name} {s.Mark}");
                }
                Console.WriteLine("------------ IQueryable -------------");
                //Error
                //IQueryable<Student> Stu2 = db.Students.Where(q => q.Subject == "C#").ToList().Take(3);
                IQueryable<Student> Stu2 = db.Students.Where(q => q.Subject == "C#").Take(3);
                foreach (Student s in Stu2)
                {
                    Console.WriteLine($" the Name {s.Name} {s.Mark}");
                }


                var InS = from q in db.Students
                          where q.Name.StartsWith("a")
                          select q;
                foreach (var item in InS)
                {
                    Console.WriteLine($"ID: {item.ID}, Name:{item.Name} , Salary:{item.Mark}");
                }

                //Select 
                var result2 = db.Students.Where(a => a.Name.StartsWith("a"));
                //Aggregation 
                var max = db.Students.Max(a => a.Mark);


            }
            Console.ReadLine();
        }
    }
}