using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Day12EFCoreDemo.Models
{
    public class Employee
    {
        [Key]
        public int Id { get; set; }

        [Required]       // Not null
        [MaxLength(150)] // Max length of 50 characters
        public string Name { get; set; }

        [Required]
        [DataType(DataType.Date)] // Data type as Date
        public DateTime HireDate { get; set; }

        [Required]
        [DataType(DataType.Date)]
        public DateTime BirthDay { get; set; }

        [Required]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        [NotMapped] // This property will not be mapped to the database
        public int Age { get; set; }

        [ForeignKey("Department")]
        public int DepartmentId { get; set; }
        // Relationship with Class entity
        public virtual Department Department { get; set; }
    }
}
