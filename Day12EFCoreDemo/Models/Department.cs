using System.ComponentModel.DataAnnotations;

namespace Day12EFCoreDemo.Models
{
    public class Department
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [MaxLength(150)]
        public string Name { get; set; } //Nvarchar(max)
        [StringLength(500, MinimumLength = 10)]
        public string? Description { get; set; }

        //Nagvation Property 
        public ICollection<Employee> Employees { get; set; }
    }
}
