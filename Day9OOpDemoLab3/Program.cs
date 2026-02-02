using Day9OOPDemoLab4;
namespace Day9OOpDemoLab3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World! Day 9 ...");
            #region OOP Day 9 Demo Lab 3
            Console.WriteLine(Helpers.CalculateSalary(20000, 10));


            /*
             ********************
             Access Modfiers 
              ********************
                 https://learn.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/access-modifiers

            (public ,private ,protected,internal,protected internal, private protected ,file)
	
            public: Code in any assembly can access this type or member. The accessibility level of the containing type controls the accessibility level of public members of the type.
            private: Only code declared in the same class or struct can access this member.
            protected: Only code in the same class or in a derived class can access this type or member.
            internal: Only code in the same assembly can access this type or member.
            protected internal: Only code in the same assembly or in a derived class in another assembly can access this type or member.
            private protected: Only code in the same assembly and in the same class or a derived class can access the type or member.
            file: Only code in the same file can access the type or member.

             */

            //Object     Inherit       SameAssembly      Another Assembly


            MyClass Class = new MyClass();
            Class.PublicValue = 10;                 //  Yes            Yes            Yes                Yes
            //Class.PrivateValue = 20;              //  No             No             No                  No
            Class.InternalValue = 30;               //  Yes            Yes            Yes                 No
            // Class.ProtectedValue = 50;           //  No             Yes            Yes Inherit         Yes Inherit  
            Class.InternalProtectedValue = 60;      //  Yes I          Yes I/P        Yes I/P             Yes P Inherit
            //Class.PrivateProtectedValue = 100;      //  No             Yes            Yes P Inherit       No
            #endregion
            Console.ReadLine();
        }

        public class MyClass
        {
            private int PrivateValue { get; set; }
            public int PublicValue { get; set; }
            internal int InternalValue { get; set; }
            protected int ProtectedValue { get; set; }
            internal protected int InternalProtectedValue { get; set; }
            private protected int PrivateProtectedValue { get; set; }
        }

        public class MyDerivedClass : MyClass
        {
            public void TestAccess()
            {
                PublicValue = 10;                     // Yes
                //PrivateValue = 20;                  // No
                InternalValue = 30;                   // Yes
                ProtectedValue = 50;                  // Yes
                InternalProtectedValue = 60;          // Yes
                PrivateProtectedValue = 100;          // Yes
            }
        }



    }
}
