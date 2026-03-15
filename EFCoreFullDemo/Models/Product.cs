using System.ComponentModel.DataAnnotations;

namespace EFCoreFullDemo.Models
{
    // This is a simple Product class that can be used as an entity in Entity Framework Core.
    public class Product
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [MaxLength(100)]
        public string Name { get; set; }
        [Required]
        public double Price { get; set; }
    }
}
