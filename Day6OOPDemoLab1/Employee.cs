namespace Day6OOPDemoLab1
{
    // Access Modifier { Class --> Internal  ,public } Access Right
    // Class
    public class Employee
    {
        //Fields = Const  Access By Class
        public const string ApplicationName = "Smart Application";  //Static Member
        //Fields = Variables 
        //_id Field
        private double _salary;


        //Property Auto Encapsulation
        //Just Pass Data 
        //Default Value
        public int Id { get; set; }  //= 1;
        public string Name { get; set; } //= "NoName";
        public string JobTitle { get; set; }
        //Access by Object
        public string CompanyName { get; private set; } = "Smart Software"; //Read Only 
        public string Status { private get; set; }  //Set Only
        //Property (Property Full) Encapsulation
        //More Logic
        //No Have Default Value
        public double Salary
        {
            get
            {
                //return _salary + (_salary * 0.1);
                return _salary;
            }  //Return   Getter
            set
            {
                if (value < 5000)
                {
                    throw new ArgumentException("Must Be Gt 5000");
                }
                _salary = value;
            } //Void     Setter
        }  //= 50000;
        //Method 
        public void Create()
        {

        }
        //Calc NetSalary 

        //3-Polymorphism in Same Class OverLoad
        //Create More than One Method {Name} With Diff Signature
        // Signature Head Of Method  {Head & body}
        public double NetSalary()
        {
            return _salary;
        }
        public double NetSalary(double taxValue)
        {
            return _salary - taxValue;
        }
        public double NetSalary(double taxValue, double Overtime)
        {
            return _salary - taxValue + Overtime;
        }
        public double NetSalary(double taxValue, double Overtime, double discount)
        {
            return _salary - taxValue + Overtime - discount;
        }
        public string NetSalary(double taxValue, double Overtime, double discount, string name)
        {
            return $"{name} Your Net Salary is :{_salary - taxValue + Overtime - discount}";
        }
    }
}
