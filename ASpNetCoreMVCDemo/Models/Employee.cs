using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ASpNetCoreMVCDemo.Models
{
    public class Employee : BaseEntity
    {
        [Key]
        public int EmployeeId { get; set; }
        [Required(ErrorMessage = "Name is required")]
        [StringLength(50, ErrorMessage = "Name cannot be Less than 5 And longer than 50 characters", MinimumLength = 5)]
        public string Name { get; set; }
        [Required(ErrorMessage = "Email is required")]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Job is required")]
        [StringLength(50, ErrorMessage = "Job cannot be Less than 5 And longer than 50 characters", MinimumLength = 5)]
        public string Job { get; set; }
        [MaxLength(255, ErrorMessage = "PhotoPath cannot be longer than 255 characters")]
        public string? PhotoPath { get; set; }
        [Required(ErrorMessage = "Salary is required")]
        [Column(TypeName = "decimal(9,2)")]
        [Range(0.09, 9999999.99, ErrorMessage = "Salary must be a number between 0.09 and 9999999.99")]
        public double Salary { get; set; }


        [ForeignKey("Department")]
        public int DepartmentId { get; set; }
        public virtual Department Department { get; set; }

    }
}
