namespace ASP.NetWebAPIDay3Demo.Services.Interfaces
{
    public interface ICategoryService
    {
        IEnumerable<Category> GetCategory();
        Category GetCategoryByID(int id);
        void AddCategory(Category entity);
        void UpdateCategory(int id, Category entity);
        void DeleteCategory(int id);
        int GetCategoryCounter();
    }
}
