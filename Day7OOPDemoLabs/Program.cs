namespace Day7OOPDemoLabs
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");
            #region Session 7 Part1
            ////Q 
            //Test t = new Test();

            //// Employee._versionNumber = "B 1.2.0";
            //Console.WriteLine("-------------- Static Member -----------------");
            //Employee.buildNumber = "10";
            //Console.WriteLine(Employee.buildNumber);

            //Console.WriteLine("-------------------------------");
            //Employee e = new Employee();
            ////e._appName = "Testing";
            //e.Id = 1;
            //e.Name = "Osama Ahmed";
            //e.Salary = 20000;
            //e.Jobtitle = "Developer";

            //Console.WriteLine(e.ToString());
            //Console.WriteLine(e._appName);

            //Employee.buildNumber = "20";
            //Console.WriteLine("-------------------------------");
            //Employee e1 = new Employee(2, "Tamer", "Eng", 25000);
            //Console.WriteLine(e1.ToString());
            //Console.WriteLine(e1._appName);
            ////----------------------------------------------
            //Console.WriteLine("---------- Normal Method ----------");
            //Console.WriteLine(Factorial(5));
            //Console.WriteLine("---------- Recursion Method ----------");
            //Console.WriteLine(FactorialRecursion(5));

            #endregion

            #region Session 7 Part2
            //int x;            //single
            //int[] Numbers;    //Collection

            //Control   --> Textbox
            //Controls  --> Form.Controls   {Collection Of Control}

            Employee employee;
            Employee[] employees = new Employee[2];


            /*
             Types Of Class  (Reference Type)                
                ***************             InheritanceFrom     InheritanceTo                  Object
                Normal Class                     Done                 Done                      Done    
                Sealed Class                     Done                  X                        Done                          
                Static Class Not Using this       X                    X                         X
                Partial Class                    Done                 Done                      Done                                          
                Abstract Class 0-100             Done                 Done (Must Implemented)    X               
                [Inner]Internal Class            Done                 Done                     Done (With Full Path OuterClass.InnerClass)
            }  
             */


            NormalClass Nc = new NormalClass();
            SealedClass Sc = new SealedClass();
            //StaticClass Stc = new StaticClass(); //Error
            StaticClass.id = 10;
            Helper.SendEmail("Email");
            Helper.SendSMS("01235132522");


            int x = 15;
            x.Add(10);
            x.Add(200);

            string y = "Ahmed Ali";
            Console.WriteLine(y.MySubstring(5));
            Console.WriteLine(y.MySubstring(10));

            PartialClass Pc = new PartialClass();
            Pc.Id = 10;
            Pc.Age = 40;


            //Operators op = new Operators();
            //op.Insert();


            OuterClass Oc = new OuterClass();

            //Full Path
            OuterClass.innerClass ic = new OuterClass.innerClass();
            ic.Save();

            #endregion
            Console.ReadLine();
        }

        //5 * 4 *3 *2 *1
        public static int Factorial(int x) //5
        {
            int result = 1;
            for (int i = x; i >= 1; i--)
            {
                result *= i;
            }
            return result;
        }
        public static int FactorialRecursion(int x) //5
        {
            if (x == 0)
            {
                return 1;
            }
            return x * FactorialRecursion(x - 1);
        }
    }
    public class Test //: base 
    {
        //Default  Log Action (File)
        // User Ahmed Insert [1-26-2026 07:26] Error 
        // Send Email
        public Test() : this(10)  //Log
        {
            Console.WriteLine("No Value");
        }
        //Non-Default (OverLoad)
        public Test(int x)  //Send Email
        {
            //if( Con (Error))
            //else
            Console.WriteLine($"value {x} ");
        }
    }
    public class Employee
    {
        public readonly string _appName;
        public const string _versionNumber = "B 1.1.0";

        public static string buildNumber;
        public int Id { get; set; }
        public string Name { get; set; }
        public double Salary { get; set; }
        public string Jobtitle { get; set; }
        public Employee()
        {
            _appName = "Smart Application";
        }
        public Employee(int id, string name, string jobTitle, double salary) : this()
        {
            //_appName = "Smart Application";
            this.Id = id;
            Name = name;
            Jobtitle = jobTitle;
            Salary = salary;
        }

        //Method Override 
        public override string ToString()
        {
            //return base.ToString();
            return $"Id : {Id} \nName : {Name} \nJobTitle : {Jobtitle} \nSalary : {Salary:C} \nBuild Number : {buildNumber}";
        }

    }
    public class TestInheritanceFrom
    {
        public int Id { get; set; }
    }
    public class TestInheritanceTo : Operators //OuterClass.innerClass     //PartialClass  //: StaticClass // : SealedClass //NormalClass
    {
        public override void Delete()
        {
            throw new NotImplementedException();
        }

        public override void Insert()
        {
            throw new NotImplementedException();
        }

        public override void ReadAll()
        {
            throw new NotImplementedException();
        }

        public override void Update()
        {
            throw new NotImplementedException();
        }
    }
    // Inheritance (From - To )   Create Object 
    public class NormalClass : TestInheritanceFrom
    {
        //Const
        public const string ConstName = "Const";
        //Static Member
        public static string staticString = "Static Membre";
        //Fields        Done
        private string appName;
        //Property      Done
        public string AppName
        {
            get { return appName; }
            set { appName = value; }
        }
        //Ctor -Default
        public NormalClass()
        {

        }
        //Non CTor
        public NormalClass(int x)
        {

        }
        //Methods
        public void SayInfo()
        {

        }
        //Delegates
        //Event
        //Inner Members 

        //deCtor
        ~NormalClass()
        {
            Console.WriteLine("Finialization ....");
        }
    }
    public sealed class SealedClass : TestInheritanceFrom
    {

    }
    public sealed class SecurityClass
    {

    }
    public static class StaticClass  //: TestInheritanceFrom
    {
        public static string name;
        static StaticClass()
        {

        }
        //Can Not Create OverLoad CTOR
        //public StaticClass(int x )
        //{

        //}
        public static int id { get; set; }
    }
    public static class Helper
    {
        private static int _number;
        static Helper()
        {
            _number = 5;// ---> Object
        }
        public static void SendEmail(string Email)
        {

        }
        public static void SendSMS(string Number)
        {

        }
    }
    public static class ExtensionClass  //:Int32
    {
        //ExtensionMethod 
        public static int Add(this int N1, int N2)
        {
            return N1 + N2;
        }

        public static string MySubstring(this string str, int n)
        {
            if (str.Length > n)
            {
                return str.Substring(0, n);
            }
            return str;
        }
    }
    public partial class PartialClass : TestInheritanceFrom
    {
        public int Id { get; set; }
        public string Name { get; set; }

        //insert 
        //update
    }
    public partial class PartialClass
    {
        public string Address { get; set; }
        //Delete 
        //public int Id { get; set; } Error
    }
    public abstract class AbstractClass  // 0 % :100 %
    {

    }
    public abstract class TestAbstract   //  0%   50%     100%
    {
        public abstract void Search();

        public abstract void SendEmail();

    }
    public class Test3Class : TestAbstract
    {
        public override void Search()
        {
            throw new NotImplementedException();
        }

        public override void SendEmail()
        {
            throw new NotImplementedException();
        }
    }
    // Add
    //Insert 
    //Create 
    public abstract class Operators : TestInheritanceFrom
    {
        //CRUD
        public abstract void Insert();
        public abstract void Update();
        public abstract void Delete();
        public abstract void ReadAll();

    }
    public class Student : Operators
    {
        public Student()
        {
            this.Id = 100;
        }
        public override void Delete()
        {
            throw new NotImplementedException();
        }

        public override void Insert()
        {
            throw new NotImplementedException();
        }

        public override void ReadAll()
        {
            throw new NotImplementedException();
        }

        public override void Update()
        {
            throw new NotImplementedException();
        }
    }
    public abstract class Human
    {
        public abstract int Age { get; set; }
        public abstract void Speak();
    }
    public abstract class Person : Human
    {
        public abstract void Work();
    }
    public class Client : Person
    {
        public override int Age { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }

        public override void Speak()
        {
            throw new NotImplementedException();
        }

        public override void Work()
        {
            throw new NotImplementedException();
        }
    }


    public class OuterClass
    {
        public int x;
        public OuterClass()
        {
            x = 100;
        }
        public int Id { get; set; }

        public class innerClass : TestInheritanceFrom
        {
            public innerClass()
            {

            }

            public void Save()
            {
                OuterClass oc = new OuterClass();
                oc.Id = 100;
            }
        }
    }
}
