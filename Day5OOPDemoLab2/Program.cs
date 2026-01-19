namespace Day5OOPDemoLab2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");

            Employee Ahmed = new Employee();
            Ahmed.Id = 1;
            Ahmed.Name = "Ahmed";
            Ahmed.Email = "Ahmed@gamil.com";
            Ahmed.Salary = 30000;
            Ahmed.JobTitle = "Software Eng ";
            Ahmed.GetInfo();

            Console.WriteLine("-------------------------------");

            Employee sayed = new Employee(id: 2, "Sayed Hawas", "sayed@gmai.com", "Developer", 25000);
            sayed.GetInfo();

        }
    }
    // Create Class 
    // Access Modifier public | Private  
    // Class Access Modifier (Internal , Public)

    public class Employee
    {
        //Members 
        //Fields  -- > Access Modifier Private 
        private int _id;
        private string _name;
        private string _email;
        private string _jobTitle;
        private double _salary;



        //Encapsulation --( Hide Data , Property ) Access Modifier public 
        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }
        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }
        public string Email
        {
            get { return _email; }
            set
            {
                _email = value;
            }
        }
        public string JobTitle
        {
            get { return _jobTitle; }
            set
            {
                _jobTitle = value;
            }
        }
        public double Salary
        {
            get { return _salary; }
            set
            {
                _salary = value;
            }
        }

        //default - Constructor
        public Employee()
        {

        }
        //non-default - Constructor
        //Overload Constructor
        public Employee(int id, string name, string email, string jobTitle, double salary)
        {
            _id = id;
            _name = name;
            _email = email;
            _jobTitle = jobTitle;
            _salary = salary;
        }

        //Method 
        public void GetInfo()
        {
            Console.WriteLine($"ID {Id} \nName{Name}  \nEmail {Email} \nJob {JobTitle} \nSalary {Salary:C}");
        }
    }
}