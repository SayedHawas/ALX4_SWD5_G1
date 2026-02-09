using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Day11EFCoreDemo.Models
{
    //Lkp   Lookup table --> lkpCities
    //Tbl   Transaction Table tblProducts
    [Table("TblEmployees")]
    public class Employee   //Employees   TblEmployees
    {
        [Key]
        public int EmployeeId { get; set; }  //Primary & Identity
        [Required]
        [StringLength(200)]
        public string Name { get; set; }
        public string Job { get; set; }
        public double Salary { get; set; }
        public string? Email { get; set; }
        public string? Address { get; set; }

        public override string ToString()
        {
            return $"Id {EmployeeId} Name {Name} Job {Job} Salary {Salary} Email {Email} Address {Address}";  //base.ToString();
        }
    }
}
