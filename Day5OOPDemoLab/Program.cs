namespace Day5OOPDemoLab
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");
            #region Session Part1 OOP
            //Class (User Type)  & Object  
            //Type Can Be DataType
            //Access Modifier (Public - Private)
            /*
                Classes & Objects      Done
                Inheritance
                Encapsulation
                Polymorphism
                Abstraction 
             */

            //How to Create Class 
            //Create Members Class

            //Create Object From Class
            Employee Ahmed = new Employee();

            //1) Normal Pass Value To public Fields 
            //Ahmed.Name = "Ahmed Ali";
            //Ahmed.Age = 25;
            //Ahmed.JobTitle = "Developer";
            //Ahmed.Salary = 20000;

            //2) Create 2 Methods To get & set value into Private Field
            //Ahmed.SetName("Ahmed Ali");
            //Console.WriteLine(Ahmed.GetName());

            //3)Create Property to Set & Get Value 
            //Ahmed.Name = "Ahmed Ali";
            //Ahmed.Age = 25;
            //Ahmed.JobTitle = "Developer";
            //Ahmed.Salary = 20000;


            ////Console.WriteLine($"Name {Ahmed.Name} Job : {Ahmed.JobTitle} Salary {Ahmed.Salary}");
            //Ahmed.GetInfo();

            //Ahmed.NetSalary(2000, 5000, 0);

            //Console.WriteLine("-----------------------------------");

            //Employee Kairm = new Employee();
            //Kairm.Name = "Kairm";
            //Kairm.Age = 32;
            //Kairm.JobTitle = "Full stack Developer";
            //Kairm.Salary = 25000;
            //Kairm.Department = "Software";


            ////Console.WriteLine($"Name {Ahmed.Name} Job : {Ahmed.JobTitle} Salary {Ahmed.Salary}");
            //Kairm.GetInfo();
            //Kairm.NetSalary(2000, 10000, 0);

            //Manager Sayed = new Manager();
            //Sayed.ManagmentDepartemnt = "Software";


            #endregion

            #region Session Part 2 OOP

            /*
                Classes & Objects      Done
                Inheritance            Done
                Encapsulation
                Polymorphism
                Abstraction 
             */

            //Person p = new Person();
            //p.Id = 1;
            //p.Name = "Retaj ";
            //p.Gender = "Female";

            //p.GetInfo();


            //Student Retaj = new Student();
            //Retaj.Id = 1;
            //Retaj.Name = "Retaj ";
            //Retaj.Gender = "Female";
            //Retaj.ClassName = "A Class";
            //Retaj.Status = "Attend";

            //Retaj.GetInfo();
            //Console.WriteLine(Retaj.SchoolName);
            ////Console.WriteLine(Retaj.Status);
            #endregion

            #region Session Part3 OOP
            //Constructor Of Method 

            Techer T = new Techer();
            T.Name = "Yasser";
            T.Gender = "Male";
            T.Id = 1;

            Techer T2 = new Techer(5, "Tamer", "Male");


            //Inheritance
            #endregion

            Console.ReadLine();
        }
    }
    #region Old Code 
    //How to Create Class 
    public class Employee
    {
        //Add Member 
        //1)Field | Variable  Access Modifier (Private)
        private string _name;
        private int _age;
        private string _jobTitle;
        private double _salary;
        private string _department;

        ////Set Value 
        //public void SetName(string name)
        //{
        //    _name = name;
        //}
        ////Get Value 
        //public string GetName()
        //{
        //    return _name;
        //}

        //3)Property 
        //Encapsulation
        public string Name
        {
            get
            {
                return _name;
            }
            set
            {
                _name = value;
            }
        }
        public int Age
        {
            get { return _age; }
            set { _age = value; }
        }
        public string JobTitle
        {
            get { return _jobTitle; }
            set { _jobTitle = value; }
        }
        public double Salary
        {
            get { return _salary; }
            set { _salary = value; }
        }
        public string Department
        {
            get { return _department; }
            set { _department = value; }
        }

        //2)Method
        public void NetSalary(double tax, double overTime, double discount)
        {
            double result = _salary + overTime - (tax + discount);
            Console.WriteLine($"Your Salary is {result:C}");
        }
        public void GetInfo()
        {
            Console.WriteLine($"Name {_name} Job : {_jobTitle} Salary {_salary}");
        }
    }
    //Inheritance
    public class Manager : Employee
    {
        public string ManagmentDepartemnt;


    }
    //-----------------------------------------
    //How to Create Class Student School
    // Employee , Manager , Techer  ,Student

    //
    public class Person
    {
        //Read Only 
        //Set Only 
        private int _id;
        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }
        private string _name;
        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }
        private string _gender;
        public string Gender
        {
            get { return _gender; }
            set { _gender = value; }
        }

        public virtual void GetInfo()
        {
            Console.WriteLine($" {_id} {_name} {_gender}");
        }

    }

    public class Student : Person
    {
        //Fields
        private string _schoolName = "Smart School";
        private string _status;
        private string _className;



        //Properties
        public string ClassName
        {
            get { return _className; }
            set { _className = value; }
        }
        //Read Only Getter
        public string SchoolName
        {
            get { return _schoolName; }
        }
        //Setter set Only
        public string Status
        {
            set { _status = value; }
        }

        //Polymorphism override
        //Method
        public override void GetInfo()
        {
            //Console.WriteLine($" {Id} ");
            // base.GetInfo();
            Console.WriteLine($" {Id} {Name} {Gender} {SchoolName} {ClassName} ");
        }
    }

    #endregion

    public class Techer
    {
        //Field
        private int _id;
        private string _name;
        private string _gender;
        //Property
        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        public string Name { get => _name; set => _name = value; }
        public string Gender { get => _gender; set => _gender = value; }


        // Default Constructor 

        //1) Public 
        //2) same Name Class 
        //3) Not Void Or DataType 
        //4) Without Parameters  as Default
        public Techer()
        {
            Console.WriteLine("Create Instance Of Teacher Class ...");
        }
        // Non-Default Constructor 
        public Techer(int id, string name, string gender)
        {
            _id = id;
            Name = name;
            Gender = gender;
        }

        //Method OverLoad Polymorphism

    }
}
