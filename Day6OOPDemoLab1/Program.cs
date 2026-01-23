namespace Day6OOPDemoLab1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");
            /*
                1-Object Class
                2-Inheritance
                3-Polymorphism 
                4-Encapsulation    PropFull , PropAuto
                5-Abstraction
             */
            #region Session OOP Part2  Part 1
            //1-Object Class

            //Create Object From Employee Class 
            //Type Can Be Data Type 
            //Class Can be DataType 

            Employee ahmed = new Employee();
            ahmed.Id = 1;
            ahmed.JobTitle = "Developer";
            ahmed.Name = "Ahmed Osama";
            ahmed.Salary = 25000;
            ahmed.Status = "Active";
            //ahmed.CompanyName = "Company ..."; Error

            //Call Property Read Only(Object)
            Console.WriteLine(ahmed.CompanyName);
            //Console.WriteLine(ahmed.Status); Error

            //Call Const Class
            //Employee.ApplicationName = "Any string ";
            Console.WriteLine(Employee.ApplicationName);
            //Call Method 
            Console.WriteLine(ahmed.NetSalary());
            Console.WriteLine(ahmed.NetSalary(1000));
            Console.WriteLine(ahmed.NetSalary(1000, 5000));
            Console.WriteLine(ahmed.NetSalary(1000, 5000, 500));
            Console.WriteLine(ahmed.NetSalary(1000, 5000, 500, ahmed.Name));










            //string strName = "ahmed";
            //string name = new string(new char[] { 'a', 'h', 'm', 'e', 'd' });


            //Type{Class , struct , Enum , ...} Can Be Data Type 
            //Create Collection Of Employee
            List<Employee> listEmployee = new List<Employee>();
            Employee[] Employees = new Employee[5];

            #endregion
            Console.ReadLine();
        }


    }
}
