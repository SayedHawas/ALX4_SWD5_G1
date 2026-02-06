using System.Collections;

namespace Day10OOPDemoLab1
{
    internal class Program
    {
        //Create Delegate 
        public delegate void MyDelegate(string name);
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World! Linq to Object  Collection ");
            #region Day 10 OOP Demo Lab 1
            //int x = 5;  //00000101
            //Console.WriteLine($"number : {x}");
            //Console.WriteLine($"Binary : {Convert.ToString(x, 2).PadLeft(8, '0')}");
            //int result = x << 1;  //>>   >>??
            //Console.WriteLine($"Result : {result}");
            //Console.WriteLine($"Binary result : {Convert.ToString(result, 2).PadLeft(8, '0')}");
            #endregion

            /*
            * using Block                  Done
           LINQ Principles:-
           ------------------
           1)Implicit type(Var)            Done 
           2)Object Initializer.           Done
           3)Collection Initializer.       Done
           4)Dynamic Name.                 Done
           5)Anonymous Object              Done
           6)Anonymous Types.              Done
           7)Generic type.                 Done     Generic Collection List<T> , Generic Method , Generic Class , Generic Interface
           8)Generic Interface             Done
           9)Extension Methods.            Done
           10)Delegate.                    Done
           11)Linq To Object(Linq Query).  Done
           12)Build-in Delegate.           Done     Func , Action , Predicate
           13)Anonymous Delegate.          Done 
           14)Anonymous Method.            Done
           15)Linq Lambda Expression.      Done
           16) IEnumerable vs IQueryable.
           */

            #region Day 10 OOP Demo Lab 2 LINQ
            ////Linq to Object  Collection
            //int[] Numbers = new int[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };



            //Console.WriteLine("------- Query LINQ --------------");
            ////Query Syntax 
            //var query = from num in Numbers
            //            where num % 2 == 0
            //            select num;

            //foreach (var item in query)
            //{
            //    Console.WriteLine(item);
            //}
            //Console.WriteLine("------- Query LINQ Lambda Expression --------------");
            ////Query  Syntax Lambda Expression
            //var query2 = Numbers.Where(x => x % 2 == 0);
            //foreach (var item in query2)
            //{
            //    Console.WriteLine(item);
            //}
            //try
            //{

            //}
            //finally
            //{

            //}


            //Create Collection Of students
            //List<Student> students = new List<Student>();

            ////Object Initializer

            //Student s = new Student() { Id = 1, Name = "Ahmed", Age = 25 };
            ////s.Id = 1;
            ////s.Name = "Ahmed";
            ////s.Age = 25;

            //students.Add(new Student() { Id = 2, Name = "Ali", Age = 30 }); //0
            //Console.WriteLine(students[0].ToString());

            ////Anonymous Object
            ////new Student() { Id = 2, Name = "Ali", Age = 30 };


            ////Static
            //File.Create("TextReader.txt");

            ////Instance Class 
            //using (FileInfo fileInfo = new FileInfo("TextReader2.txt"))
            //{
            //    fileInfo.Create();
            //    Console.WriteLine(fileInfo.CreationTime);
            //}
            //fileInfo.




            //using (Student stu = new Student())
            //{
            //    stu.Id = 5;


            //}
            ////GC --> Memory
            //////stu

            ////Collection Initializer.
            //List<Student> students = new List<Student>() {
            //new Student() { Id = 1, Name = "Ahmed", Age = 25 },
            //new Student() { Id = 2, Name = "Ali", Age = 30 },
            //new Student { Id = 3, Name = "Omr", Age = 28 },
            //};

            ////Query Syntax LINQ
            //var query3 = from student in students
            //                 //where student.Name.StartsWith('A') //Like
            //             where student.Age > 25             //>
            //             // where student.Id ==2
            //             select student;

            //foreach (var item in query3)
            //{
            //    Console.WriteLine(item.ToString());
            //}

            ////4)Dynamic Name.
            ////int x = 20;
            ////Console.WriteLine(x.Length);

            ////dynamic y = 20;
            ////Console.WriteLine(y.Length); //Runtime Error

            ////6)Anonymous Types.
            //var c = new { Id = 5, Name = "Mariem", Age = 24, job = "Developer" };
            ////c.Id=10; //Error ReadOnly


            //var query4 = from student in students
            //             select student;
            //foreach (var item in query4)
            //{
            //    Console.WriteLine(item.ToString());
            //}

            //var query5 = from student in students
            //             select new { student.Name, student.Age };

            //foreach (var item in query5)
            //{
            //    Console.WriteLine(item.ToString());
            //}

            ////Extension Methods
            //int number = 5;
            //Console.WriteLine(number.Check());
            //number = 10;
            //Console.WriteLine(number.Check());



            #endregion

            #region Day 10 OOP Demo Lab 3 
            //10)Delegate.

            //Call Delegate 

            //event
            //MyDelegate del = new MyDelegate(SayHello);
            //del.Invoke("Ahmed");

            //12)Build-in Delegate.
            /*
             *) Delegate Type Like :(Func, Action ,Predicate )
                *) Delegate is the Pointer to Method

                Delegate Type Like:-
                ---------------------
                -Func   return     : deleget Which return One Value.              16 Input parameters  With Return (Function) 17 Output
                                    - Func<int,int> increment = i => i+1;

                -Action Void    : delegate which not return Value.             16 Input parameters Without Return (Void)  
                                 - Action<int> d=x=>Console.WriteLine(x);

                -Predicate :      delegate which return bool only.
                                  - predicate<int> cc=c=>true;                 1 Input parameters With Return (True Or False)
                ----------------------------------------------------------------------------------------------------------------------------
             */


            Func<int, int, int> add = delegate (int x, int y) { return x + y; }; //Anonymous Method.
            Console.WriteLine(add(10, 20));
            Func<int, int, int> add2 = (x, y) => x + y;  //Anonymous Delegate & Lambda Expression.

            Action<int, int> sum1 = delegate (int x, int y) { Console.WriteLine(x + y); };
            Action<int, int> sum = (x, y) => Console.WriteLine(x + y);

            Predicate<int> isEven1 = delegate (int x) { return x % 2 == 0; };
            Predicate<int> isEven = x => x % 2 == 0;

            List<Student> students = new List<Student>() {
            new Student() { Id = 1, Name = "Ahmed", Age = 25 },
            new Student() { Id = 2, Name = "Ali", Age = 30 },
            new Student { Id = 3, Name = "Omr", Age = 28 },
            };

            var query6 = students.Where(w => w.Age > 25);
            foreach (var item in query6)
            {
                Console.WriteLine(item.ToString());
            }

            var query7 = students.First(q => q.Id == 3); //Excption if not found

            var query8 = students.FirstOrDefault(q => q.Id == 5); //Default Value if not found (Null For Reference Type , 0 For Value Type)

            var query9 = students.Last(q => q.Id == 3); //Excption if not found

            var query10 = students.LastOrDefault(q => q.Id == 5);
            #endregion
            Console.ReadLine();
        }

        public static void SayHello(string name)
        {
            Console.WriteLine($"Hello {name}");
        }

    }
    //Type Can be Data Type or Class or Struct or Enum or Interface
    public class Student : IDisposable
    {
        public Student()
        {

        }
        public Student(int id)
        {

        }
        public int Id { get; set; }
        public string Name { get; set; }
        public int Age { get; set; }
        public override string ToString()
        {
            return $"Id : {Id} , Name : {Name} , Age : {Age}";
        }
        public void Dispose()
        {
            //Dispose(true);
            GC.SuppressFinalize(this);
        }
        //Constructor --> Object Creation
        //disConstructor --> Dispose Creation
        ~Student()
        {
            Console.WriteLine("Destructor Called");
        }
    }


    public class MyCollction<T> : IEnumerable<T>
    {
        public IEnumerator<T> GetEnumerator()
        {
            throw new NotImplementedException();
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return GetEnumerator();
        }
    }


    public static class ExtensionMethods
    {
        public static bool Check(this int x)
        {
            bool result = x % 2 == 0;
            return result;
        }
    }



}
