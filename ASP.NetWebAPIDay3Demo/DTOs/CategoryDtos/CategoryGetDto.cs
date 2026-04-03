namespace ASP.NetWebAPIDay3Demo.DTOs.CategoryDtos
{
    public class CategoryGetDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string? Description { get; set; }
        public List<string>? ProductNames { get; set; } = new List<string>();
    }
}
