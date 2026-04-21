namespace ASP.NetWebAPIDay3Demo.Services.Interfaces
{
    public interface ICategoryService
    {
        IEnumerable<Category> GetCategory();
        Category GetCategoryByID(int id);
        void AddCategory(CategoryCreateDto entity);
        void UpdateCategory(int id, CategoryCreateDto entity);
        void DeleteCategory(int id);
        int GetCategoryCounter();
    }
}
