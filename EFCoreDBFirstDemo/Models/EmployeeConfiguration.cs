using System.ComponentModel.DataAnnotations.Schema;

namespace EFCoreDBFirstDemo.Models
{
    public partial class Employee
    {
        //Add From User
        [NotMapped]
        public string PhotoPaths { get; set; }

        public override string ToString()
        {
            return base.ToString();
        }
    }
}
