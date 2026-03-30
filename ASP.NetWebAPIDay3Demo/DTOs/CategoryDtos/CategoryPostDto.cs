using System.ComponentModel.DataAnnotations;

namespace ASP.NetWebAPIDay3Demo.DTOs.CategoryDtos
{
    public class CategoryPostDto
    {
        [Required]
        [MaxLength(100)]
        //[StringLength(100,MinimumLength =10)]
        public string Name { get; set; }
        [MaxLength(500)]
        public string? Description { get; set; }
    }
}
