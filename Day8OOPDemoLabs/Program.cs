namespace Day8OOPDemoLabs
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!  Day 8 OOP ");
            #region Session 8 Part 1
            /*
            Types Of Class  (Reference Type)                
               ***************             InheritanceFrom     InheritanceTo                  Object
               Normal Class                     Done                 Done                      Done    
               Sealed Class                     Done                  X                        Done                          
               Static Class Not Using this       X                    X                         X
               Partial Class                    Done                 Done                      Done                                          
               Abstract Class 0-100             Done                 Done (Must Implemented)    X               
               [Inner]Internal Class            Done                 Done                     Done (With Full Path OuterClass.InnerClass)
               Generic Class <T>                Done 
                    - Generic Field             Done
                    - Generic Method            Done
                    - Generic Parameters        Done
                    - Generic Property          Done
             */
            //Generic Collection   List<int>  ,List<string>
            //Create Form Type DataType 
            List<Employee> Employees = new List<Employee>();

            //IntLMyList mylist = new IntLMyList(5);  //0,1,2,3,4
            //Console.WriteLine(mylist.ListLength);
            //mylist.Add(100);    //0
            //mylist.Add(200);    //1
            //mylist.Add(300);    //2
            //mylist.Add(400);    //3
            //mylist.Add(500);    //4

            ////mylist.Add(600);    //5  Error
            //Console.WriteLine("----------- Read By For ----------");
            //for (int i = 0; i < mylist.ListLength; i++)
            //{
            //    //mylist[i]
            //    Console.WriteLine(mylist.GetValue(i));
            //}
            ////Console.WriteLine("----------- Read By For Each ----------");
            ////foreach (var item in mylist)
            ////{
            ////}
            //// Create Object From Generic Class
            //GenericMyList<int> Numbers = new GenericMyList<int>(5);
            //Numbers.Add(100);    //0
            //Numbers.Add(200);    //1
            //Numbers.Add(300);    //2
            //Numbers.Add(400);    //3
            //Numbers.Add(500);    //4
            //Console.WriteLine("----------- Read By For ----------");
            //for (int i = 0; i < mylist.ListLength; i++)
            //{
            //    Console.WriteLine(Numbers.GetValue(i));
            //}

            //GenericMyList<string> Names = new GenericMyList<string>(5);
            //Names.Add("Ahmed");

            //GenericMyList<double> Salary = new GenericMyList<double>(5);
            //Salary.Add(20000.5);

            //GenericMyList<Employee> ListOfEmployees = new GenericMyList<Employee>(2);

            ////Type
            //DatabaseOperators<Employee> CRUDEmployee = new DatabaseOperators<Employee>();
            //CRUDEmployee.GetAll();

            //DatabaseOperators<Department> CRUDDepartment = new DatabaseOperators<Department>();
            //CRUDDepartment.GetAll();


            //Employee ahmed = new Employee();

            //List<Employee> x = new List<Employee>();

            //DatabaseOperators<Employee> xx;

            #endregion
            #region Session 8 Part 2
            /*
             //Structures VS Class 
            ***********************
            //Create Struct out the Main 
            // can Include the Struct the Method but Can't Include method the Struct 
             */
            //Object Struct
            Car c = new Car();
            c.Id = 1;
            c.MaxSpeed = 250;
            Console.WriteLine(c.GetMaxSpeed());

            //Car c2 = null;            //Struct not Allow Null Value Type 
            Employee emp1 = null;     //Class Allow Null Refer Type


            //------------------------------------------
            Console.WriteLine(" ---------- Class ------------");
            Employee Emp = new Employee();
            Emp.Id = 1;

            Employee Emp2 = Emp;
            Emp2.Id = 10;

            Console.WriteLine(Emp.Id);
            Console.WriteLine(Emp2.Id);
            //------------------------------------------
            Console.WriteLine(" ---------- Struct ------------");
            Car C1 = new Car();
            C1.Id = 1;

            Car C2 = C1;
            C2.Id = 10;
            Console.WriteLine(C1.Id);
            Console.WriteLine(C2.Id);

            int x = 100;
            int y = x;


            Int32 N = new Int32();
            N = 100;

            int M = 100;


            char[] myname = new[] { 'S', 'A', 'Y', 'E', 'D' };
            String name2 = new String(myname);

            string name = "Sayed";
            Console.WriteLine(name[0]);

            foreach (char item in name)
            {
                Console.WriteLine(item);
            }


            //int xx, yy, z;
            //xx = 100;

            Point first, second, third;

            first = new Point();
            first.X = 10;
            first.y = 10;

            second = new Point();
            second.X = 20;
            second.y = 20;

            third = new Point();
            third.X = first.X + second.X;
            third.y = first.y + second.y;

            first.X = 20;
            first.y = 20;

            Console.WriteLine("first:" + first.X + "," + first.y);
            Console.WriteLine("second:" + second.X + "," + second.y);
            Console.WriteLine("third:" + third.X + "," + third.y);


            //List Name;   List Of Data
            //List Type;   List Of Code 

            //Enumerations ()List In Code Base Int   

            //----------------------------------------------------

            //int day = (int)DayOfWeek.Friday;

            //Collection Of Type Student
            List<Student> Students = new List<Student>();

            //Create Object from Type (Class Employee) ahmed
            Student ahmed = new Student();
            ahmed.Id = 1;
            ahmed.Name = "ahmed";
            ahmed.ClassName = "OOP";
            ahmed.studentType = Student.StudentType.FullTime;

            //Create Object from Type (Class Employee) sayed
            Student sayed = new Student();
            sayed.Id = 2;
            sayed.Name = "sayed";
            sayed.ClassName = "OOP";
            sayed.studentType = Student.StudentType.PartTime;


            //Add Ahmed & sayed into Collection 
            Students.Add(ahmed);
            Students.Add(sayed);

            foreach (Student s in Students)
            {
                Console.WriteLine(s.ToString());
                Console.WriteLine("-----------------------------------");
            }

            #endregion

            Console.ReadLine();

        }
        public void Save(Employee employee)
        {
            //Database Insert employee
        }
    }
    //Types in .Net ( Class , ....)
    //Type Can be DataType -->Class 
    //User Create Type
    public class Employee
    {
        public enum EmployeeType
        {
            fullTime,
            partTime,
            FreeLance,
            ByProject
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public EmployeeType Type { get; set; }


        //public double Salary(EmployeeType employeeType)
        //{
        //    switch (employeeType)
        //    {
        //        case EmployeeType.fullTime:
        //            break;
        //        case EmployeeType.partTime:
        //            break;
        //        case EmployeeType.FreeLance:
        //            break;
        //        case EmployeeType.ByProject:
        //            break;
        //        default:
        //            break;
        //    }
        //}

    }
    public class Department //:int
    {
        public struct Point
        {
            public double X { get; set; }
            public double y { get; set; }
        }

    }
    //TRY
    public class IntLMyList
    {
        // int[] x = new int[10];
        //Field
        private readonly int[] _mylist;   //array 
        private int CurrentIndex = 0;
        //Non-Default
        public IntLMyList(int index)
        {
            _mylist = new int[index];
        }
        //Property
        public int ListLength { get { return _mylist.Length; } }
        //Method Set 
        public void Add(int value)
        {
            if (CurrentIndex >= _mylist.Length)
            {
                throw new OverflowException(" My List is Over flow Length ...");
            }
            _mylist[CurrentIndex] = value;
            CurrentIndex++;
            //Logic check Over flow ???
        }
        public int GetValue(int index)
        {
            if (index >= _mylist.Length)
            {
                throw new OverflowException("Element Over flow Index ...");
            }
            return _mylist[index];
        }
    }
    public class DoubleLMyList
    {
        // int[] x = new int[10];
        //Field
        private readonly double[] _mylist;   //array 
        private int CurrentIndex = 0;
        //Non-Default
        public DoubleLMyList(int index)
        {
            _mylist = new double[index];
        }
        //Property
        public int ListLength { get { return _mylist.Length; } }
        //Method Set 
        public void Add(double value)
        {
            if (CurrentIndex >= _mylist.Length)
            {
                throw new OverflowException(" My List is Over flow Length ...");
            }
            _mylist[CurrentIndex] = value;
            CurrentIndex++;
            //Logic check Over flow ???
        }
        public double GetValue(int index)
        {
            if (index >= _mylist.Length)
            {
                throw new OverflowException("Element Over flow Index ...");
            }
            return _mylist[index];
        }
    }
    public class StringLMyList
    {
        // int[] x = new int[10];
        //Field
        private readonly string[] _mylist;   //array 
        private int CurrentIndex = 0;
        //Non-Default
        public StringLMyList(int index)
        {
            _mylist = new string[index];
        }
        //Property
        public int ListLength { get { return _mylist.Length; } }
        //Method Set 
        public void Add(string value)
        {
            if (CurrentIndex >= _mylist.Length)
            {
                throw new OverflowException(" My List is Over flow Length ...");
            }
            _mylist[CurrentIndex] = value;
            CurrentIndex++;
            //Logic check Over flow ???
        }
        public string GetValue(int index)
        {
            if (index >= _mylist.Length)
            {
                throw new OverflowException("Element Over flow Index ...");
            }
            return _mylist[index];
        }
    }
    public class GenericMyList<T>
    {
        //Field Generic
        private readonly T[] _mylist;   //array 
        private int CurrentIndex = 0;
        //Non-Default
        public GenericMyList(int index)
        {
            _mylist = new T[index];
        }
        //Property
        public int ListLength { get { return _mylist.Length; } }
        //Method Set
        //Generic Parameters
        public void Add(T value)
        {
            if (CurrentIndex >= _mylist.Length)
            {
                throw new OverflowException(" My List is Over flow Length ...");
            }
            _mylist[CurrentIndex] = value;
            CurrentIndex++;
            //Logic check Over flow ???
        }
        //Generic Method
        public T GetValue(int index)
        {
            if (index >= _mylist.Length)
            {
                throw new OverflowException("Element Over flow Index ...");
            }
            return _mylist[index];
        }
    }
    //Non Generic 
    public class DatabaseOperatorsEmployee
    {
        //CRUD
        public void Create(Employee entity)
        {
            //Code Insert In Database 
        }
        public void Update(int id, Employee entity)
        {
            //Code Update In Database 
        }
        public void Delete(int employeeId)
        {
            //Code Delete In Database 
        }
        public Employee GetById(int id)
        {
            //Code Select by ID In Database 
            return null;
        }
        public List<Employee> GetAll()
        {
            //Code Select All In Database 
            return null;
        }
    }
    //Generic Class 
    public class DatabaseOperators<T>
    {
        public T Entity { get; set; }
        //CRUD
        public void Create(T entity)
        {
            //Code Insert In Database 
        }
        public void Update(int id, T entity)
        {
            //Code Update In Database 
        }
        public void Delete(int entityId)
        {
            //Code Delete In Database 
        }
        public T GetById(int id)
        {
            //Code Select by ID In Database 
            return default(T);
        }
        public List<T> GetAll()
        {
            //Code Select All In Database 
            return null;
        }

    }
    public struct Car
    {
        private int _maxspeed;
        public int Id { get; set; }
        public string Model { get; set; }
        public int MaxSpeed { set { _maxspeed = value; } }
        public Car()
        {

        }
        public Car(string color)
        {

        }
        public int GetMaxSpeed()
        {
            return _maxspeed;
        }
    }
    public struct Point  //:Car
    {
        public double X { get; set; }
        public double y { get; set; }
    }


    //Student Type {Full Time , PartTime ,ByCourse   }

    public class Student
    {
        //Type --> DataType 
        public enum StudentType
        {
            FullTime,
            PartTime,
            ByCourse
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string ClassName { get; set; }
        public StudentType studentType { get; set; }

        public override string ToString()
        {
            return $"Id {Id} \nName {Name} \nClassName {ClassName}";
        }

        public void Attend(StudentType studentType)
        {
            switch (studentType)
            {
                case StudentType.FullTime:
                    Console.WriteLine("");
                    break;
                case StudentType.PartTime:
                    Console.WriteLine("");
                    break;
                case StudentType.ByCourse:
                    Console.WriteLine("");
                    break;

            }

        }
    }

}
