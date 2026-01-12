namespace Day3DemoLab
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");
            /*
                -Implementing Conditional Logic
                -Implementing Iteration Logic
                -Creating and Using Arrays
                -Referencing Namespaces
                -Using Breakpoints in Visual Studio 2022
             */
            #region Session1-Implementing Conditional Logic
            //Ternary Operator   ? :
            //(Logical) ? true : false
            //int x = 15;
            //string result = (x > 10) && (x < 20) ? "Gt 10" : "Lt 10";
            //Console.WriteLine(result);
            ////------------------------------------------
            ////Group 10
            //int G = 10;
            //string attendStatus = G == 10 ? "All Attends" : "Not all Attend";

            //object ob = null;
            //int? number = (int?)ob;
            //Console.WriteLine(number ?? 0);

            ////--------------------------------------------------------
            //int? total = number is null ? 0 : number; // ? 0 : number
            //number = (int?)ob;
            //int total2 = number ?? 0;
            //--------------------------------------------------------

            ///?  Datatype Value Allow Null     -> int? x= null;
            ///?  :   Ternary
            ///??  If Null Equal --?     number is Null ?  0 : number

            //if ()
            //{ 

            //}
            //int myNumber; //= 5;
            //Console.Write("Enter Your Number :");
            //bool parseResult1 = int.TryParse(Console.ReadLine(), out myNumber);

            //if (!parseResult1)
            //    Console.WriteLine("Please Enter Integer Number Only");

            //int myNumber2; //= 5;
            //Console.Write("Enter Your Number2 :");
            //int.TryParse(Console.ReadLine(), out myNumber2);
            //if (myNumber > 10)
            //{
            //    Console.WriteLine($"myNumber {myNumber} > 10");
            //}
            //else
            //{
            //    Console.WriteLine($"myNumber {myNumber} < 10");
            //}


            //if (myNumber > myNumber2)
            //{
            //    Console.WriteLine($"myNumber {myNumber} > {myNumber2}");
            //}
            //else if (myNumber < myNumber2)
            //{

            //    Console.WriteLine($"myNumber {myNumber} < {myNumber2}");
            //}
            //else
            //{
            //    Console.WriteLine($"myNumber {myNumber} = {myNumber2}");
            //}

            //switch ()
            //{ 

            //}
            //----------------------------------------------------------
            //Console.WriteLine("plz enter 1 for c# ,2 .NetCore, 3 for JavaScript, 4 for VB.net");
            //char num = char.Parse(Console.ReadLine());


            //switch (num)
            //{
            //    case '1':
            //    case '2':
            //        Console.WriteLine("Welcome in C#");
            //        break;

            //    case '3':
            //        Console.WriteLine("Welcome JS");
            //        break;
            //    case '4':
            //        Console.WriteLine("Welcome in VB.Net");
            //        break;
            //    default:
            //        Console.WriteLine("Invalid Number");
            //        break;
            //}

            //Console.WriteLine("End of program");


            //--------------------------------------------------------
            //Label GoTo
            //Start:
            //    Console.Clear();
            //    Console.Write("plz enter num1 :");
            //    int num1 = int.Parse(Console.ReadLine());
            //    Console.WriteLine("plz enter num2");
            //    int num2 = int.Parse(Console.ReadLine());
            //    Console.Write("plz enter operator  + , - , * , / ");
            //    char op = char.Parse(Console.ReadLine());
            //    switch (op)
            //    {
            //        case '+':
            //            Console.WriteLine($"{num1} + {num2} = {num1 + num2}");
            //            break;
            //        case '-':
            //            Console.WriteLine($"{num1} - {num2} = {num1 - num2}");
            //            break;
            //        case '*':
            //            Console.WriteLine($"{num1} X {num2} = {num1 * num2}");

            //            break;
            //        case '/':
            //            //if (num2 == 0)
            //            //{
            //            //    Console.WriteLine("Can Not Div By Zero ...");
            //            //}
            //            //else
            //            //{
            //            //    Console.WriteLine(num1 / num2);
            //            //}
            //            string result3 = num2 == 0 ? "Can Not Div By Zero ..." : $"{num1} / {num2} = {num1 / num2}";
            //            Console.WriteLine(result3);
            //            break;
            //        default:
            //            Console.WriteLine("invalid operator");
            //            break;
            //    }
            //    Console.WriteLine("Press Key to agin Calc ...");
            //    Console.ReadLine();
            //    goto Start;

            #endregion

            #region Session2-Implementing Iteration Logic Loop
            //-Implementing Iteration Logic
            //For While Do

            //for (int i = 0; i < 10; i++)
            //{
            //    Console.WriteLine(i);
            //}
            //Console.WriteLine("---------------------");
            //for (int i = 0; i < 10; i++)
            //{
            //    if (i > 5)
            //    {
            //        break;
            //    }
            //    Console.WriteLine(i);
            //}
            //Console.WriteLine("---------------------");
            //for (int i = 0; i < 10; i++)
            //{
            //    if (i < 5)
            //    {
            //        continue;
            //    }
            //    Console.WriteLine(i);
            //}

            //Console.WriteLine("End Loop...");
            //Console.WriteLine("------------- While -----------");
            //int x = 0;
            //while (x < 10)
            //{
            //    //x++;
            //    Console.WriteLine(++x);
            //    //++x;
            //}
            ////For While 


            //Console.WriteLine("------------- Do While -----------");
            //int y = 0;
            //do
            //{
            //    Console.WriteLine(y++);
            //} while (y < 10);


            //char ans;
            //do
            //{
            //    Console.Clear();
            //    Console.Write("plz enter num1 :");
            //    int num1 = int.Parse(Console.ReadLine());
            //    Console.WriteLine("plz enter num2");
            //    int num2 = int.Parse(Console.ReadLine());
            //    Console.Write("plz enter operator  + , - , * , / ");
            //    char op = char.Parse(Console.ReadLine());
            //    switch (op)
            //    {
            //        case '+':
            //            Console.WriteLine($"{num1} + {num2} = {num1 + num2}");
            //            break;
            //        case '-':
            //            Console.WriteLine($"{num1} - {num2} = {num1 - num2}");
            //            break;
            //        case '*':
            //            Console.WriteLine($"{num1} X {num2} = {num1 * num2}");

            //            break;
            //        case '/':
            //            //if (num2 == 0)
            //            //{
            //            //    Console.WriteLine("Can Not Div By Zero ...");
            //            //}
            //            //else
            //            //{
            //            //    Console.WriteLine(num1 / num2);
            //            //}
            //            string result3 = num2 == 0 ? "Can Not Div By Zero ..." : $"{num1} / {num2} = {num1 / num2}";
            //            Console.WriteLine(result3);
            //            break;
            //        default:
            //            Console.WriteLine("invalid operator");
            //            break;
            //    }
            //    Console.WriteLine("Press Key 'Y' | 'y' to agin Calc ...");
            //    ans = char.Parse(Console.ReadLine());
            //} while (ans == 'Y' | ans == 'y');
            //Console.WriteLine("End Program ...");


            //Nested Loop
            //for (int i = 1; i <= 12; i++)
            //{
            //    Console.WriteLine($"------- {i} -------");
            //    for (int j = i; j <= 12; j++)
            //    {
            //        Console.WriteLine($" {i} X {j} = {i * j} ");
            //    }
            //}

            #endregion

            #region Session3 Creating and Using Arrays
            //How to Create Array 
            //array Fix Type  & Fix Length
            //Collection 
            //int[] number = new int[3];
            //number[0] = 100;
            //number[1] = 75;
            //number[2] = 32;

            //Console.WriteLine(number[2]);
            //number[3] = 50; //Error IndexOutOfRangeException

            //string[] names = new string[] { "Retaj", "Ahmed", "Tamer", "Ali", "Aya", "Mariem", "sayed" };
            //Console.WriteLine(names.Length);
            //Console.WriteLine("-------------- For ------------");
            //for (int i = 0; i < names.Length; i++)
            //{
            //    Console.WriteLine(names[i]);
            //}
            //Console.WriteLine("-------------- For  Each------------");
            ////ForEach (Collection)
            //foreach (string item in names)
            //{
            //    Console.WriteLine(item);
            //}
            Console.WriteLine("-------------- For  Each With Sort ------------");
            //Array Method 
            //System.Array
            //Array.Sort(names);
            //foreach (var item in names)
            //{
            //    Console.WriteLine(item);
            //}
            //------------------------------------------
            //Console.Write("Enter Number Of Books :");
            //int numberBooks;
            //int.TryParse(Console.ReadLine(), out numberBooks);
            //string[] Books = new string[numberBooks];
            /////Books[index]
            //for (int i = 0; i < Books.Length; i++)
            //{
            //    Console.Write($"Enter The Title For Book Number {i + 1} :");
            //    Books[i] = Console.ReadLine();
            //}
            //Console.WriteLine(" --------- Press any Key to Print Your Library .. -----");
            //Array.Sort(Books);
            //foreach (var item in Books)
            //{
            //    Console.WriteLine(item);
            //}

            //Console.Write("Enter the Title To Change ");
            //string searchTitle = Console.ReadLine();
            //int index = Array.IndexOf(Books, searchTitle);
            //if (index == -1)
            //{
            //    Console.WriteLine("Book Not found ....");
            //}
            //else
            //{
            //    Console.Write("Enter Now Title : ");
            //    Books[index] = Console.ReadLine();
            //}

            //Console.WriteLine(" --------- Press any Key to Print Your Library .. -----");
            //Array.Sort(Books);
            //foreach (var item in Books)
            //{
            //    Console.WriteLine(item);
            //}
            //Console.WriteLine("End Program ....");

            //int[,] x = new int[2, 3] { { 1, 20, 200 }, { 2, 300, 400 } };
            //for (int i = 0; i < x.GetLength(0); i++)
            //{
            //    for (int l = 0; l < x.GetLength(1); l++)
            //    {
            //        Console.Write(x[i, l] + "\t");
            //    }
            //    Console.WriteLine();
            //}

            //int[,] x = new int[2, 3] { { 1, 20, 200 }, { 2, 300, 400 } };
            ////x[0, 0] = 1;

            //for (int i = 0; i < x.GetLength(0); i++)
            //{
            //    for (int j = 0; j < x.GetLength(1); j++)
            //    {
            //        Console.Write(x[i, j] + "\t");
            //    }
            //    Console.WriteLine();
            //}
            //Console.WriteLine(x[0, 1]);
            //Console.WriteLine(x[1, 2]);


            #endregion


            Console.ReadLine();
        }

    }
}

