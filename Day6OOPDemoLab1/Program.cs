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
            Console.WriteLine("--------------- Object Ahmed ------------ ");
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
            Console.WriteLine("--------------- Object Tamer ------------ ");
            Employee tamer = new Employee(2, "tamer ahmed", "Software eng", 30000, "Active");
            Console.WriteLine(tamer.NetSalary());
            Console.WriteLine(tamer.NetSalary(1000));
            Console.WriteLine(tamer.NetSalary(1000, 5000));
            Console.WriteLine(tamer.NetSalary(1000, 5000, 500));
            Console.WriteLine(tamer.NetSalary(1000, 5000, 500, ahmed.Name));

            //2 - Inheritance
            //Any Class Create in .Net  Inheritance Object (toString(),Equals() ...)

            Test t = new Test();
            t.ToString();
            t.Add();

            ClassTest ct = new ClassTest();
            ct.Add();

            Person p = new Person();
            p.Add();


            Test t1 = new Test("Connection Test"); ;

            ClassTest ct1 = new ClassTest("Connection Class Test");

            Person p1 = new Person("Connection Person");

            //SQLServerAccessDatabase db2 = new SQLServerAccessDatabase();

            SQLServerAccessDatabase db = new SQLServerAccessDatabase("Server=Local;Database= Northwind");
            db.Insert();
            Console.WriteLine(db.ConnString);


            Console.WriteLine(" -------------- Override ------------------");
            AccessDatabase Ad = new AccessDatabase();
            //Ad.Select();
            Ad.SendEmail();


            Console.WriteLine("-----------------------------------------");
            SQLServerAccessDatabase Sql = new SQLServerAccessDatabase();
            //Sql.Select();
            Sql.SendEmail();








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
    class Test : Object //Root
    {
        public void Add()
        {

        }
        public Test()
        {

        }
        public Test(string connectionString)
        {

        }
    }
    class ClassTest : Test // :Object
    {
        public ClassTest()
        {

        }
        public ClassTest(string connectionString) : base(connectionString)
        {

        }
    }
    class Person : ClassTest //base
    {
        public Person()
        {

        }
        public Person(string connectionString) : base(connectionString)
        {

        }
    }


    public class AccessDatabase
    {
        //Field ReadOnly
        private readonly string _connection;
        private readonly string _ipAddress;

        public string ConnString
        {
            get { return _connection; }
        }

        //public string ConnStringTwo
        //{
        //    set { _connection = value; }
        //}

        public AccessDatabase()
        {

        }
        public AccessDatabase(string connection)
        {
            this._connection = connection;
        }
        public AccessDatabase(string connectionString, string ipAddress)
        {
            this._connection = connectionString;
            this._ipAddress = ipAddress;
        }
        public void Insert()
        {
            // _connection = null;
            //Open _connection
            Console.WriteLine(_connection);
            //Insert

        }
        public void update()
        {

        }
        public virtual void Select()
        {
            Console.WriteLine("Select List Of Employees From Access Database Class ...");
        }
        public void Delete()
        {

        }

        public virtual void SendEmail()
        {
            Console.WriteLine("Send Email To Fatma ...");
        }
    }

    public class SQLServerAccessDatabase : AccessDatabase
    {
        //Ctor OverLoad
        public SQLServerAccessDatabase()
        {

        }
        public SQLServerAccessDatabase(string connectionString) : base(connectionString)
        {

        }
        public SQLServerAccessDatabase(string connectionString, string IPAddress) : base(connectionString, IPAddress)
        {

        }
        //3-Polymorphism Override Inheritance
        public override void Select()
        {
            base.Select();
            Console.WriteLine("Select List Of Employees From SQL Server Class ...");
        }
        public override void SendEmail()
        {
            //base.SendEmail();
            Console.WriteLine("Send Email To Eng Fatma From Override ...");
        }
    }

    public class SenderEmail : SQLServerAccessDatabase
    {
        public SenderEmail()
        {

        }

        public new void Select()
        {
            Console.WriteLine("New Instance ");
        }

    }

    public class SendSMS : SenderEmail
    {
        public new void Select()
        {

        }
    }
}

