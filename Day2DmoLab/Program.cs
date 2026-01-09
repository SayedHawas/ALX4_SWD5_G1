namespace Day2DmoLab
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");
            //C# Day 2 DEMOS
            #region session 1
            ////          Declaring and Assigning Variables
            ////          What are Data Types?
            ////          Expressions and Operators in Visual C#
            ////          Accessing Type Members
            ////          Casting Between Data Types
            ////          Manipulating Strings

            //string name;
            //name = "Ahmed Ali";  //=

            ////What are Data Types?
            //string myName = "Sayed Hawas";
            ///*
            // * byte , sbyte , short , int , long    Done
            // * float , double , decimal             Done
            // * string                               Done 
            // * char                                 Done
            // * bool                                 Done
            // * Date time                            Done 

            // * object 
            // * var 
            // * Dynamic
            // */

            //byte bt = 255;
            //short sh = 32000;
            //int i = 2100000000;
            //long l = 923565006565;

            //float fl = 12.25f;
            //double du = 12.25d;
            //decimal de = 12.25M;


            //float flt = 1F / 3;
            //double dbl = 1D / 3;
            //decimal dcm = 1M / 3;

            //Console.WriteLine("float: {0}\n double: {1}\n decimal: {2}", flt, dbl, dcm);

            //string applicationName = "Smart APP";
            //Console.WriteLine("My App is " + applicationName);

            //int numberOne = 100;
            //int numberTwo = 200;

            //Console.WriteLine("Sum  :" + numberOne + "+" + numberTwo + "=" + (numberOne + numberTwo));
            //Console.WriteLine("sum {0} + {1} = {2}", numberOne, numberTwo, numberOne + numberTwo);
            //Console.WriteLine($"Sum {numberOne} + {numberTwo} = {numberOne + numberTwo} ");

            //int result = numberOne * numberTwo;
            //Console.WriteLine(result);
            //result = numberOne / numberTwo;
            //Console.WriteLine(result);
            //result = numberOne - numberTwo;
            //Console.WriteLine(result);
            //result = numberOne % numberTwo;
            //Console.WriteLine(result);

            //char c = 'a';
            //Console.WriteLine(c);
            //c = (char)65;
            //Console.WriteLine(c);


            //bool bo = true;
            //Console.WriteLine(bo);

            ////> , < , > = , <= , != ,==   
            ////   |   ||   , & , &&  ! 
            //bo = 5 > 20;
            //Console.WriteLine(bo);

            //bo = numberOne == 101;
            //Console.WriteLine(bo);

            //bo = 2 < 1 & 2 < 5 & 2 < 1 & 2 < 5 & 2 < 1 & 2 < 5;
            //Console.WriteLine(bo);

            //bo = 2 < 1 && 2 < 5 && 2 < 1 && 2 < 5 && 2 < 1 && 2 < 5;

            //bo = 2 < 1 && 2 < 5 && 5 == 5;
            //Console.WriteLine(bo);
            ////--------------------------------
            //bo = 2 < 1 | 2 < 5 | 2 < 1 | 2 < 5 | 2 < 1 | 2 < 5;


            //bo = (2 > 1 | 2 < 5) | 2 == 1 | 2 == 5 | 2 == 1 | 2 == 5; ;   //OR
            //Console.WriteLine(bo);

            //bo = 2 > 1 || 2 < 5 || 5 == 5;
            //Console.WriteLine(bo);


            //DateTime dt = DateTime.Now;
            //Console.WriteLine(dt);
            //Console.ReadLine();
            #endregion

            #region session 2

            ////All Value Data type int , double , ... Not Allow Null
            ////All Refer Type Allow Null;

            ////int x = null;

            //string name = null;

            ///*
            // * object
            // * var
            // * Dynamic
            // */

            ////Object Boxing  
            //double number = 12.25;
            //object ob = "Ahmed";
            //ob = 100;
            //ob = number;

            //double result = 100.5 + (double)ob;
            //Console.WriteLine(result);
            //ob = DateTime.Now;
            //ob = null;
            //ob = 100;
            //int total = 200 + (int)ob;  //Cast 
            //Console.WriteLine(total);

            ////Select Max Salary From Employees  
            ////

            ////Int32 x = new Int32();
            ////x = 100;
            ////int y = 100;
            ////string str = "Ahmed";
            ////SQL Aggre  Max , Min  --->Object


            ////implicit DataType var  LINQ 
            //// Not Allow Null
            //var v = 100;
            ////v = "Ahmed";
            //var va = (string)null; //"null"
            //var str = ""; //string.Empty; // string.empty


            ////Error Syntax


            ////Error Runtime 

            //dynamic dy = "Ahmed";
            //Console.WriteLine("Welcome " + dy);
            //dy = 100;
            //int total2 = 200 * dy;
            //Console.WriteLine(total2);
            //dy = 100.25;
            //double result2 = dy + 1.25;
            //Console.WriteLine(result2);

            //Console.WriteLine(int.MinValue + " " + int.MaxValue);
            //int i = 100;
            //string str2 = "Ahmed";

            //Console.WriteLine(str2.Length);
            ////Console.WriteLine(i.Length);

            //dynamic integer = 100;              //LINQ
            //integer = "100";
            //Console.WriteLine(integer.Length);


            //Console.ReadLine();



            #endregion

            #region Session 3
            ////*)const:-
            //const string appName = "Smart App";
            //// appName = "Toto";
            //int x = 100;
            //Console.WriteLine(int.MinValue);
            ////int.MaxValue = 30000000;
            //int y = 10;
            //y = y + 5;
            //y += 5;
            //y -= 2;
            //y *= 3;

            //y += 1;
            //y++; //Postfix
            //y--;

            //++y;//prefix
            //y++;


            //int v = 10;
            //Console.WriteLine(v++);
            //Console.WriteLine(++v);
            //Console.WriteLine(v);
            //Console.WriteLine(Math.Round(10.258, 2));

            Console.Write("Enter number 1 :");  // "int 100"
            int number1;
            int.TryParse(Console.ReadLine(), out number1);


            Console.Write("Enter number 2 :");
            int number2;
            int.TryParse(Console.ReadLine(), out number2);

            int result = number1 + number2;

            Console.WriteLine($"the Result For {number1} + {number2} = {result}");
            Console.ReadLine();

            Console.WriteLine("Sayed Hawas");
            Console.WriteLine("Sayed\t Hawas");
            Console.WriteLine("----------------");
            Console.WriteLine("Sayed\n Hawas");

            Console.WriteLine("Sayed \"Said\" Hawas");
            Console.WriteLine("C:\\NewFolder\\MyWork");
            Console.WriteLine("c\\folder\\ahmed.doc");
            Console.WriteLine(@"c:\folder\ahmed.doc ");
            Console.WriteLine("\a"); // beep 
            Console.WriteLine("\0"); // Null Password ***** <>

            #endregion
        }
    }
}
