using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ASP.NetWebAPIDay3Demo.DTOs.ProductDtos
{
    public class ProductCreateDto
    {
        public int Id { get; set; }
        [Required]
        [StringLength(50)]
        public string Name { get; set; }
        [Required]
        [Column(TypeName = "decimal")]
        [Range(typeof(decimal), "100", "10000")]
        public decimal Price { get; set; }
        [StringLength(500)]
        public string? Description { get; set; }

        [StringLength(255)]
        public string? PhotoPath { get; set; }

        [Required]
        public int CategoryId { get; set; }

    }
}
