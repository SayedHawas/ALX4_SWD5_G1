using System.ComponentModel.DataAnnotations;

namespace EFCoreDBFirstDemo.Models
{
    public class User
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [StringLength(100)]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }
        [Required]
        [MaxLength(50)]
        public string Password { get; set; }

        public string? Role { get; set; }
    }
}
