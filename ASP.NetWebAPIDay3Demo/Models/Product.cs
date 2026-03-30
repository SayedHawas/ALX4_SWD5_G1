using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ASP.NetWebAPIDay3Demo.Models
{
    [Table("LkpProducts")]
    public class Product
    {
        [Key]
        public int Id { get; set; }
        //2-Required
        //3-string Length
        [Required]
        [StringLength(50)]
        public string Name { get; set; }
        [Required]
        [Column(TypeName = "decimal")]
        [Range(typeof(decimal), "100", "1000")]
        public decimal Price { get; set; }
        [StringLength(500)]
        public string? Description { get; set; }
        [NotMapped]
        public byte[]? PhotoFile { get; set; }
        [StringLength(255)]
        public string? PhotoPath { get; set; }

        // Relationship with Category entity
        [ForeignKey("Category")]
        public int CategoryId { get; set; }
        // Navigation Property
        public virtual Category Category { get; set; }
    }
}
