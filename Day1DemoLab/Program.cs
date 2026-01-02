//namespace Block Of Code 
namespace Day1DemoLab
{
    //Class
    internal class Program
    {
        //Entry Point Method 
        static void Main(string[] args)
        {

            /*
               What are Data Types?
               Expressions and Operators in Visual C#
               Declaring and Assigning Variables
               Accessing Type Members
               Casting Between Data Types
               Manipulating Strings
            */
            //Declaring and Assigning Variables
            string applicationName;
            applicationName = "Smart Application";

            int Age = 40;
            Age = 42;

            Console.WriteLine("My age is " + Age);

            //input And Output
            Console.WriteLine("Welcome in C Sharp !!!");
            //< DataType > name;
            Console.Write("Enter Your Name : ");
            string name = Console.ReadLine();    //"Sayed Hawas";
            Console.WriteLine("Welcome " + name);
            Console.ReadLine();


            //What are Data Types?
            /*
             * byte , sbyte , short , int , long    Done
             * float , double , decimal             Done
             * string                               Done 
             * char                                 Done
             * bool                                 Done
             * Date time                            Done 
             * object 
             * var 
             * Dynamic
             */


        }
    }
}
