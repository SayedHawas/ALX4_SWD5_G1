using Day12ClassLibrary;

namespace Day12DelegteInBusiness
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");
            List<Employee> ListEmployees = new List<Employee>();
            ListEmployees.Add(new Employee { ID = 1, Name = "Retaj", Job = "Developer", Salary = 5000, Attend = true });
            ListEmployees.Add(new Employee { ID = 2, Name = "Mariam", Job = "Dr", Salary = 6000, Attend = true });
            ListEmployees.Add(new Employee { ID = 3, Name = "sayed", Job = "Developer", Salary = 3000, Attend = false });
            ListEmployees.Add(new Employee { ID = 4, Name = "osama", Job = "eng", Salary = 7000, Attend = true });

            //IsConditional isCond = new IsConditional(Check);

            //Employee.Report(ListEmployees, new IsConditional(Check));

            //Employee.Report(ListEmployees, delegate (Employee emp) { return emp.Salary > 5000; });
            //Console.WriteLine("----------------------------------------------------------------");
            //Employee.Report(ListEmployees, delegate (Employee emp) { return emp.Salary > 6000; });

            Console.WriteLine("----------------------------------------------------------------");
            Employee.Report(ListEmployees, x => x.Name.Contains("s"));
            Console.WriteLine("----------------------------------------------------------------");
            Employee.Report(ListEmployees, q => q.Attend == false);
            Console.WriteLine("----------------------------------------------------------------");
            Employee.Report(ListEmployees, q => q.Salary > 6000);
            Console.ReadLine();

        }

        //public static bool Check(Employee emp)
        //{
        //    return emp.Attend == false;
        //}
    }
}
