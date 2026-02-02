namespace Day9OOPDemoLabes
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");
            #region Day9 OOP session Part1
            //Car c = new Car();   //Can Not  Create Object from abstract
            BMW bmw = new BMW();

            bmw.Make = "BMW";
            bmw.Model = "X5";
            bmw.Year = 2022;

            bmw.StartEngine();
            bmw.MaxSpeed();


            SuperClient Sc = new SuperClient();
            Sc.SendSMS();
            Sc.SendEmail();

            SEStduent s = new SEStduent();


            #endregion
            Console.ReadLine();
        }
    }

    //OOP
    //Class
    public abstract class Car
    {
        //Properties
        public string Make { get; set; }
        public string Model { get; set; }
        public int Year { get; set; }
        //Constructor
        protected Car()
        {

        }
        //Method
        public void StartEngine()
        {
            Console.WriteLine("The engine is starting.");
        }
        //Abstract Method
        public abstract void MaxSpeed();
    }
    public interface IFormrulaOne
    {
        string TeamName { get; set; }
        void TrackName();
    }
    public class BMW : Car
    {
        public override void MaxSpeed()
        {
            Console.WriteLine("BMW Max Speed is 250 km/h");
        }
    }
    public class BMWF1 : BMW, IFormrulaOne
    {
        private string teamName;
        public string TeamName
        {
            get { return teamName; }
            set { teamName = value; }
        }

        public override void MaxSpeed()
        {
            Console.WriteLine("BMW Max Speed is 450 km/h");
        }

        public void TrackName()
        {
            throw new NotImplementedException();
        }
    }
    public interface ISendEmail
    {
        void SendEmail();
    }
    public interface ISendSMS
    {
        void SendSMS();
    }
    public class Client : ISendEmail // ISendSMS
    {
        public void SendEmail()
        {
            throw new NotImplementedException();
        }
    }
    public class SuperClient : Client, ISendSMS
    {
        public void SendSMS()
        {
            throw new NotImplementedException();
        }
    }


    public interface ICRUDOperations
    {
        void Create();//Head 
        void Read();
        void Update();
        void Delete();
    }
    public class Student : ICRUDOperations
    {
        public void Create()
        {
            throw new NotImplementedException();
        }

        public void Delete()
        {
            throw new NotImplementedException();
        }

        public void Read()
        {
            throw new NotImplementedException();
        }

        public void Update()
        {
            throw new NotImplementedException();
        }
    }
    public class Person
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }
    public class SEStduent : Person, ICRUDOperations
    {
        public void Create()
        {
            throw new NotImplementedException();
        }

        public void Delete()
        {
            throw new NotImplementedException();
        }

        public void Read()
        {
            throw new NotImplementedException();
        }

        public void Update()
        {
            throw new NotImplementedException();
        }
    }


    //Abstraction 0 - >100%
    public abstract class Human
    {
        private string _name;
        public string Name
        {
            get
            {
                return _name;
            }
            set { _name = value; }
        }

        public abstract void Speak();
        public void Sayhello()
        {
            Console.WriteLine("Hello");
        }
    }

    public interface IEmployee
    {
        //public int age;
        void CalculateSalary();
        void Work();

    }

    public interface IManager
    {
        void ManagerWork();
    }

    public class Employee : Human, IEmployee
    {
        public string Jobtitle { get; set; }
        public string Department { get; set; }
        public void CalculateSalary()
        {
            throw new NotImplementedException();
        }

        public override void Speak()
        {
            Console.WriteLine("I Am Employee And Love My Work ...");
        }

        public void Work()
        {
            throw new NotImplementedException();
        }
    }

    public class Manager : Employee, IManager
    {

        public void CalculateSalary()
        {
            throw new NotImplementedException();
        }
        public void ManagerWork()
        {
            throw new NotImplementedException();
        }
        public override void Speak()
        {
            Console.WriteLine("I Am Manager And Love My Work ...");
        }
        public void Work()
        {
            throw new NotImplementedException();
        }
    }


}
