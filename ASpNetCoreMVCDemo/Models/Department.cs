using System.ComponentModel.DataAnnotations;

namespace ASpNetCoreMVCDemo.Models
{
    public class Department : BaseEntity
    {
        [Key]
        public int DepartmentId { get; set; }
        [Required(ErrorMessage = "Name is required")]
        [StringLength(50, ErrorMessage = "Name cannot be Less than 5 And longer than 50 characters", MinimumLength = 5)]
        public string Name { get; set; }
        [MaxLength(200, ErrorMessage = "Description cannot be longer than 200 characters")]
        public string? Description { get; set; }
        // Navigation property
        public virtual ICollection<Employee>? Employees { get; set; }
    }
}
