namespace Day9OOPDemoLab4
{
    public static class Helpers
    {
        //public static void Clean(Control frm, string Excpt = "")
        //{
        //    foreach (Control item in frm.Controls)
        //    {
        //        if (item.Name == Excpt)
        //        {
        //            continue;
        //        }
        //        if (item is TextBox || item is ComboBox)
        //            item.Text = string.Empty;
        //        if (item is GroupBox)
        //        {
        //            Clean(item);
        //        }
        //    }
        //}

        public static double CalculateSalary(double salary, double tax)
        {
            return salary - (salary * tax / 100);
        }
    }


    public class Security
    {
        private string Key = "Security Key ....";
        public void Encrypt(string str)
        {
            Console.WriteLine("Encrypt ....");
        }
        protected void Decrypt(string str)
        {
            Console.WriteLine("Decrypt ....");
        }
        internal void Hasking(string str)
        {
            Console.WriteLine("Hasking ....");
        }
        internal protected void Sign(string str)
        {
            Console.WriteLine("Sign ....");
        }
        private protected void Verify(string str)
        {
            Console.WriteLine("Verify ....");
        }
    }

    public class test : Security
    {
        public test()
        {
            Security s = new Security();
            s.Equals(" Public By Object ");
            s.Hasking(" internal By Object");
            s.Sign("Welcome");



            Encrypt(" Public by Inheritance Test");
            Hasking(" internal by Inheritance Test");
            Decrypt(" protected by Inheritance Test");
            Sign(" internal protected Welcome");
            Verify(" protected Welcome");
        }
    }
}

namespace Testing
{
    public class TestSecurity : Day9OOPDemoLab4.Security
    {
        public TestSecurity()
        {
            //Security s = new Security();
            //s.Equals(" Public By Object ");
            //s.Hasking(" internal By Object");
            //s.Sign("Welcome");

            Encrypt(" Public by Inheritance Test");
            Hasking(" internal by Inheritance Test");
            Decrypt(" protected by Inheritance Test");
            Sign(" internal protected Welcome");
            Verify(" protected Welcome");

        }
    }
}
