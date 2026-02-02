using System.Collections;

namespace Day9OOPDemoLabs2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");
            #region Day9 OOP session Part2


            Repository<MyEmployee> empRepo = new Repository<MyEmployee>();
            //Repository<MyStudent> studRepo = new Repository<MyStudent>();
            Repository<string> repository = new Repository<string>();
            //Repository<int> intRepo = new Repository<int>();

            List<int> Nums = new List<int>();
            Nums.Add(100);

            GenericMyList<int> Numbers = new GenericMyList<int>(5);
            Numbers.Add(100);    //0
            Numbers.Add(200);    //1
            Numbers.Add(300);    //2
            Numbers.Add(400);    //3
            Numbers.Add(500);    //4

            Console.WriteLine(Numbers[3]);
            Console.WriteLine("----------- Read By For ----------");
            for (int i = 0; i < Numbers.ListLength; i++)
            {
                Console.WriteLine(Numbers.GetValue(i));
            }
            Console.WriteLine("----------- Read By For Each ----------");
            foreach (var item in Numbers)
            {
                Console.WriteLine(item);
            }

            Console.WriteLine(Numbers[1]); // Indexer usage example (if implemented)

            int x = 100;
            x.add(200); //Extension Method usage
            x.add(300);


            SampleCollection<int> sc = new SampleCollection<int>();


            sc[0] = 100;
            Console.WriteLine(sc[0]);



            #endregion
            Console.ReadLine();
        }


    }

    public static class test
    {
        public static int add(this int x, int y)
        {
            return x + y;
        }
    }
    public class GenericMyList<T> : IEnumerable<T>
    {
        private readonly T[] _mylist;   //array 
        private int CurrentIndex = 0;
        //Non-Default
        public GenericMyList(int index)
        {
            _mylist = new T[index];
        }
        //Indexer
        public T this[int index]
        {
            get
            {
                return _mylist[index];
            }
            set
            {
                _mylist[index] = value;
            }
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

        public IEnumerator<T> GetEnumerator()
        {
            for (int i = 0; i < CurrentIndex; i++)
            {
                yield return _mylist[i];
            }
        }
        IEnumerator IEnumerable.GetEnumerator()
        {
            return GetEnumerator();
        }
    }

    //Generic Interface
    //Generic Constraints

    //Class Employee
    //Class Student
    //Class Customer
    //Class Teacher
    //Class Subject

    public interface ICRUD<T>
    {
        void Create(T entry);
        List<T> Read();
        void Update(T entry);
        void Delete(int id);
        T ReadById(int id);
    }
    public class Employee : ICRUD<Employee>
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public void Create(Employee entry)
        {
            throw new NotImplementedException();
        }

        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        public List<Employee> Read()
        {
            throw new NotImplementedException();
        }

        public Employee ReadById(int id)
        {
            throw new NotImplementedException();
        }

        public void Update(Employee entry)
        {
            throw new NotImplementedException();
        }
    }
    public class Student : ICRUD<Student>
    {
        public void Create(Student entry)
        {
            throw new NotImplementedException();
        }

        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        public List<Student> Read()
        {
            throw new NotImplementedException();
        }

        public Student ReadById(int id)
        {
            throw new NotImplementedException();
        }

        public void Update(Student entry)
        {
            throw new NotImplementedException();
        }
    }
    //-------------------------------------------------------------
    public interface IPrintable<T>
    {
        void Print(T value);
    }
    public abstract class Document
    {
        public int Id { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Type { get; set; }
        public abstract void Index();
    }
    public class Email : Document, IPrintable<Email>
    {
        public string Subject { get; set; }
        public string To { get; set; }
        public string From { get; set; }
        public string Body { get; set; }

        public override void Index()
        {
            throw new NotImplementedException();
        }

        public void Print(Email value)
        {
            throw new NotImplementedException();
        }
    }
    public class Report : Document, IPrintable<Report>
    {
        public string Content { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public string Summary { get; set; }
        public override void Index()
        {
            throw new NotImplementedException();
        }
        public void Print(Report value)
        {
            throw new NotImplementedException();
        }
    }
    //-------------------------------------------------------------
    public interface IRepository<T>
    {
        void Add(T item);
        T Get(int id);
        void Update(T item);
        void Delete(int id);
    }
    public class Repository<T> : IRepository<T> where T : class
    {
        public void Add(T item)
        {
            throw new NotImplementedException();
        }

        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        public T Get(int id)
        {
            throw new NotImplementedException();
        }

        public void Update(T item)
        {
            throw new NotImplementedException();
        }
    }
    public class MyEmployee
    {

    }
    public struct MyStudent
    {

    }
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public double Price { get; set; }

        public override string ToString()
        {
            //return base.ToString();
            return $"Id : {Id} Name : {Name} Price : {Price}";
        }
    }
    public class SampleCollection<T>
    {
        //this Point Object into class 
        //this With Parameter in Extension Method Static Class
        //this With Indexer


        // Declare an array to store the collection elements
        private List<T> data = new List<T>();

        // Define an indexer to allow array-like access
        public T this[int index]
        {
            get
            {
                // The get accessor returns the value at the specified index
                return data[index];
            }
            set
            {
                // The set accessor assigns a value to the element at the specified index
                if (index < data.Count)
                {
                    data[index] = value;
                }
                else
                {
                    data.Add(value);
                }
            }
        }

        public int Count
        {
            get
            {
                return data.Count;
            }
        }
    }

}
