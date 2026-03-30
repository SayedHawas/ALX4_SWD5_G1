namespace ASP.NetWebAPIDay3Demo.DTOs.ProductDtos
{
    public class ProductGetDto
    {
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string? Description { get; set; }
        public string? PhotoPath { get; set; }
        public string CategoryName { get; set; }
    }
}
