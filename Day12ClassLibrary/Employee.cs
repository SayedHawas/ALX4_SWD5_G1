namespace Day12ClassLibrary
{
    //Type Can Be Datatype 
    public delegate bool IsConditional(Employee emp);
    public class Employee
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Job { get; set; }
        public double Salary { get; set; }
        public bool Attend { get; set; }
        public static void Report(List<Employee> employeeList, IsConditional isConditional)
        {
            foreach (Employee emp in employeeList)
            {
                //Hard code
                //if (emp.Salary > 4000)
                if (isConditional(emp))
                {
                    Console.WriteLine($"the Id {emp.ID} name {emp.Name} salary {emp.Salary} job {emp.Job}");
                }
            }
        }
    }
}
