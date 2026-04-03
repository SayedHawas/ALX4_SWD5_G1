using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace ASP.NetWebAPIDay3Demo.DTOs.CategoryDtos
{
    public class CategoryCreateDto
    {
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)]
        public int Id { get; set; }
        [Required]
        [MaxLength(100)]
        //[StringLength(100,MinimumLength =8)]// Max 100 Min 8  Create 100 Range 
        public string Name { get; set; }
        [MaxLength(500)]
        public string? Description { get; set; }
    }
}
