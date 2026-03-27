using System.ComponentModel.DataAnnotations;

namespace ASP.NetWebAPIDay3Demo.Models
{
    public class Category
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [MaxLength(100)]
        public string Name { get; set; }
        [MaxLength(500)]
        public string? Description { get; set; }
    }
}
