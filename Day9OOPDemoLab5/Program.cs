using Day9OOPDemoLab4;
namespace Day9OOPDemoLab5
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");
        }
    }

    public class Test : Security
    {
        public Test()
        {
            Security s = new Security();
            s.Equals(" Public By Object ");
            //s.Hasking(" internal By Object");
            //s.Sign("Welcome");
            //s.Decrypt("protected by Inheritance Test");
            //s.Verify("Private protected Welcome");

            Encrypt(" Public by Inheritance Test");
            //Hasking("internal by Inheritance Test");
            Decrypt("protected by Inheritance Test");
            Sign("internal | protected Welcome");
            //Verify("Private protected Welcome");
        }
    }
}
