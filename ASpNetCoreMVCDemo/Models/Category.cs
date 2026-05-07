using System.ComponentModel.DataAnnotations;

namespace ASpNetCoreMVCDemo.Models
{
    public class Category
    {
        [Key]
        public int CategoryId { get; set; }
        [Required(ErrorMessage = "Name is required")]
        [StringLength(50, ErrorMessage = "Name cannot be longer than 50 characters and less than 5 characters", MinimumLength = 5)]
        public string Name { get; set; }
        [MaxLength(200, ErrorMessage = "Description cannot be longer than 200 characters")]
        public string? Description { get; set; }

        public virtual ICollection<Product>? Products { get; set; }
    }
}
