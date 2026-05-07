using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ASpNetCoreMVCDemo.Models
{
    public class Product
    {
        [Key]
        public int ProductId { get; set; }
        [Required(ErrorMessage = "Name is required")]
        [StringLength(100, ErrorMessage = "Name cannot be longer than 100 characters and less than 5 characters", MinimumLength = 5)]
        public string Name { get; set; }
        [Required(ErrorMessage = "Price is required")]
        [Column(TypeName = "decimal(9,2)")]
        [Range(0.01, 999999.99, ErrorMessage = "Price must be between 0.01 and 999999.99")]
        public decimal Price { get; set; }
        [MaxLength(200, ErrorMessage = "Description cannot be longer than 200 characters")]
        public string? Description { get; set; }
        [Required(ErrorMessage = "Stock is required")]
        [Range(0, 10000, ErrorMessage = "Stock must be number between 0 and  10000")]
        public int Stock { get; set; } = 0;
        //public byte[] Image { get; set; }
        [MaxLength(255, ErrorMessage = "Image URL cannot be longer than 255 characters")]
        public string? ImagePath { get; set; }

        [ForeignKey("Category")]
        public int CategoryId { get; set; }
        public virtual Category Category { get; set; }
    }
}
