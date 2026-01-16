//reference nameSpace 
namespace Day4DemoLab
{
    internal class Program
    {

        //public / static {void|DataType } <MethodName> (Args, ...)
        //{
        //}
        //Create STATIC  Method Void Without Parameters
        //Static Method
        public static void PrintHello()
        {
            Console.WriteLine("Hello World !!!");
        }
        //Non-Static Create object 
        public void PrintWelcome()
        {
            Console.WriteLine("Welcome World !!!");
        }
        //Static Void With Parameters (Arguments) 
        static void PrintHelloWithParam(string name, string Title)
        {
            Console.WriteLine($"Hello {Title}:{name} ...!");
        }
        //static Return Method With Parameters
        static double Sum(double number1, double number2)
        {
            return number1 + number2;
            //number1;
        }

        //Entry Point 
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");
            #region Tasks1 
            //1) Get All Primary Number Form 1 To 100 :-
            //for (int i = 2; i < 100; i++)
            //{
            //    bool p = true;
            //    for (int k = 2; k < i; k++)
            //    {
            //        if (i % k == 0)
            //        {
            //            p = false;
            //            break;
            //        }
            //    }
            //    if (p == true)
            //    {
            //        Console.WriteLine(i);
            //    }
            //}
            #endregion

            #region Tasks2
            //2) Task To Print this Shape on Console window
            //int line = 12;
            //for (int i = 1; i < line; i++)
            //{
            //    for (int j = 1; j <= line - i; j++)
            //    {
            //        Console.Write(" ");
            //    }
            //    for (int k = 1; k <= i; k++)
            //    {
            //        Console.Write(" *");
            //    }
            //    Console.WriteLine(" ");
            //}
            #endregion

            #region Session 4 Part 1
            //Array  Fix Length  , Can Not Remove
            //
            //string[] names = new string[4] { "Ali", "Ahmed", "Tammer", "Ali" };
            //names[2] = "Sayed";

            ////Console.WriteLine(names.Length);
            ////Collection Array List Base Object / Good By Features

            //ArrayList arrList = new ArrayList();

            //arrList.Add(123);          //0
            //arrList.Add("Mohamed");    //1
            //arrList.Add(12.25);        //2

            //arrList.Add(names);         //3
            //arrList.AddRange(names);    //4
            //                            //5
            //                            //6
            //for (int i = 0; i < arrList.Count; i++)
            //{
            //    Console.WriteLine(arrList[i]);
            //}
            //Console.WriteLine(" ---------------- Foreach ----------------");
            //foreach (var item in arrList)
            //{
            //    Console.WriteLine(item);
            //}
            //Console.WriteLine(arrList.Count);
            //arrList.Remove(names);
            ////arrList.RemoveAt(1);
            ////arrList.RemoveRange(1, 2);
            //arrList.Remove("Tammer");

            //Console.WriteLine(" ---------------- Foreach ----------------");
            //foreach (var item in arrList)
            //{
            //    Console.WriteLine(item);
            //}

            //int index = arrList.IndexOf("Ali"); //4
            //arrList.RemoveAt(4);

            //arrList.RemoveAt(arrList.IndexOf("Ali"));

            ////arrList.Sort();

            //int total = (int)arrList[0] + 200;
            ////---------------------------------------------------
            ////List<T> Generic <--Type 
            //List<string> listNames = new List<string>();

            //listNames.Add("ahmed");   //0
            //listNames.Add("Kariem");  //1
            //listNames.Add("Aya");     //2
            //listNames.AddRange(names); //3


            //Console.WriteLine(listNames.Count);

            //// listNames.Sort();
            //Console.WriteLine("--------------- For--------");
            //for (int i = 0; i < listNames.Count; i++)
            //{
            //    Console.WriteLine(listNames[i]);
            //}
            //listNames.Insert(2, "Tamer");
            //Console.WriteLine("--------------- ForEach--------");
            //foreach (var item in listNames)
            //{
            //    Console.WriteLine(item);
            //}
            //// Type Can Be DataType 
            //List<int> Number = new List<int>() { 1, 2, 3, 4, 5, 6, 78, 88 };
            //List<double> Salary = new List<double>();

            ////Task  Array & List ?



            #endregion

            #region Session 4 Part 2
            //1 :Creating and Invoking Methods
            //2 :Creating Overloaded Methods and Using Optional and Output Parameters
            //3 :Handling Exceptions
            //4 :Monitoring Applications



            // Call Method Static
            //PrintHello();
            //PrintHello();
            //PrintHello();

            //Call nonStatic Method 
            //Create Object 
            //Program Sayed = new Program();
            //Sayed.PrintWelcome();
            //Program Ahmed = new Program();
            //Ahmed.PrintWelcome();
            //Program.PrintHello();



            //PrintHelloWithParam("Sayed Hawas", "Developer");

            //Console.WriteLine(Sum(100, 500));

            /*
                1-What Is a Method?                         Done
                2-Types Of Methods  Void | Return DataType  Done
                3-Creating a Method                         Done
                4-Calling a Method                          Done
                5-Method With Parameters                    Done
                6-Pass Parameters  With Value & Ref & Out   Done
                7-Using Parameter Arrays                    Done
                8-Key Words Params                          Done  
                9-Overloaded Methods                        Done
             */

            //6 - Pass Parameters With Value & Ref & Out
            //int y = 10;
            //Console.WriteLine(" Pass Parameters With Value");
            //Console.WriteLine(y);
            //Console.WriteLine(AddFive(y));
            //Console.WriteLine(y);
            //Console.WriteLine("-------------------------------");
            //Console.WriteLine("Pass Parameters With Ref");
            //Console.WriteLine(y);
            //Console.WriteLine(AddFiveRefer(ref y));
            //Console.WriteLine(y);
            //Console.WriteLine("-------------------------------");
            //Console.WriteLine("Pass Parameters With out");
            //double tax;
            ////Calling by Naming Params 
            //Console.WriteLine(NetSalary(Salary: 15000, overtime: 5000, Pertax: 0.1, taxValue: out tax));
            //Console.WriteLine($"Tax Value For Salary is {tax}");


            //Sum2(100, 200, 100);
            //Sum2(100, 200);
            //Sum2(x: 100, y: 200);

            //Sum2(500);

            ////  7-Using Parameter Arrays
            //double[] numbers = new double[] { 22, 55, 66, 54, 78, 2, 11, 22 };
            //Console.WriteLine(SumArray(100, numbers));
            //Console.WriteLine(SumArray(x: 100, 1.2, 23.5, 55.6, 99.5, 5574.2));

            //double t;
            //Console.WriteLine(TestMethod(result: out t, x: 60000, y: 6000, 1.2, 1.6, 1.9));


            //if (args.Length > 0)
            //{
            //    for (int i = 0; i < args.Length; i++)
            //    {
            //        Console.WriteLine(args[i]);
            //    }
            //}


            //SumNumbers(100, 200);
            //SumNumbers(100, 200, 300);
            //SumNumbers(100.5, 200.10);
            //SumNumbers("Ahmed", "ALI");
            #endregion

            #region Session 4 Part 3 
            // Lession 3 :Handling Exceptions
            // Exception Handling
            //1 - Try... Catch                   Done 
            //2 - Try... Catch... Finally        Done
            //3 - Raising(Throwing) Exceptions   Done

            try
            {
                //object ob = null;
                //int number1 = (int)ob;
                ////--------------------------------------
                Console.Write("Enter Number 1 : ");
                int number1 = int.Parse(Console.ReadLine());

                Console.WriteLine($"the Enter number  is {number1} ");
            }

            catch (FormatException ex)
            {
                Console.WriteLine("Must Enter Number Only ....");
            }
            catch (OverflowException ex)
            {
                Console.WriteLine($"Must Enter Number Between {int.MinValue} And {int.MaxValue} ....");
            }
            catch (NullReferenceException ex)
            {
                Console.WriteLine("Must Enter Value Not Null");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Please Call Support ..." + ex.Message);
            }
            finally
            {
                Console.WriteLine("End Of Program .....");
            }
            SumNumbers(100, 500);
            Console.WriteLine(div(100, 2));

            try
            {
                Console.WriteLine(div(100, 0));
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            #endregion
            Console.ReadLine();
        }

        //Create Method Pass Params By Value 
        static int AddFive(int x)
        {
            x += 5;
            return x;
        }
        //Create Method Pass Params By Refer 
        static int AddFiveRefer(ref int x)
        {
            x += 5;
            return x;
        }
        //Create Method Pass Params By OUT
        //static string NetSalary(double Salary, double Pertax, out double taxValue, double overtime)
        //{
        //    taxValue = Salary * Pertax;
        //    return ($"Your Salary is : {Salary + overtime - taxValue}");
        //}
        static string NetSalary(out double taxValue, double Salary = 15000, double Pertax = .1, double overtime = 5000)
        {
            taxValue = Salary * Pertax;
            return ($"Your Salary is : {Salary + overtime - taxValue}");
        }
        //Create Method  Params By Optional
        static double Sum2(double x, double y = 100, double z = 50)
        {
            return x + y + z;
        }
        static double SumArray(int x, params double[] listNumber)
        {
            double result = 0;
            for (int i = 0; i < listNumber.Length; i++)
            {
                result += listNumber[i];
            }
            return result;
        }
        static double TestMethod(out double result, double x = 20000, double y = 5000, params double[] taxs)
        {
            result = 100;
            return x + y + taxs[0];

        }

        //OverLoad 
        //
        /*
         
         */
        /// <summary>
        ///  This Method To Sum Two number 
        /// </summary>
        /// <param name="x"> number Int</param>
        /// <param name="y">number Int</param>
        /// <returns> Int Sum Numbers </returns>
        /// <exception cref="OverflowException">
        /// </exception>
        static int SumNumbers(int x, int y)
        {
            return x + y;
        }
        static int SumNumbers(int x, int y, int z)
        {
            return x + y + z;
        }
        static double SumNumbers(double x, double y)
        {
            return x + y;
        }
        static string SumNumbers(string x, string y)
        {
            return x + " " + y;
        }
        static string SumNumbers(string x, string y, string H)
        {
            return H + " " + x + " " + y;
        }

        /// <summary>
        /// Div Two Numbers 
        /// </summary>
        /// <param name="x">double x </param>
        /// <param name="y">double y</param>
        /// <returns> double Result </returns>
        /// <exception cref="DivideByZeroException"></exception>
        static double div(double x, double y)
        {
            if (y == 0)
                throw new Exception("Can not Div By Zero .... ");
            return x / y;
        }
    }
}
