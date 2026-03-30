using System.ComponentModel.DataAnnotations;

namespace ASP.NetWebAPIDay3Demo.DTOs.CategoryDtos
{
    public class CategoryPutDto
    {
        public int Id { get; set; }
        [Required]
        [MaxLength(100)]
        public string Name { get; set; }
        [MaxLength(500)]
        public string? Description { get; set; }
    }
}
