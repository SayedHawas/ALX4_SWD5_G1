using ASP.NetWebAPIDay3Demo.Services.Interfaces;
using ASP.NetWebAPIDay3Demo.UnitOfWorks;

namespace ASP.NetWebAPIDay3Demo.Services.Implements
{
    public class CategoryService : ICategoryService
    {
        private readonly IUnitOfWork _unitOfWork;
        public CategoryService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        public void AddCategory(Category entity)
        {
            _unitOfWork.RepositoryCategories.AddAsync(entity);
            _unitOfWork.Complete();
        }

        public void DeleteCategory(int id)
        {
            _unitOfWork.RepositoryCategories.DeleteAsync(id);
            _unitOfWork.Complete();
        }

        public IEnumerable<Category> GetCategory()
        {
            return _unitOfWork.RepositoryCategories.GetAllAsync().Result;
        }

        public Category GetCategoryByID(int id)
        {
            return _unitOfWork.RepositoryCategories.GetByIdAsync(id).Result;
        }

        public int GetCategoryCounter()
        {
            return _unitOfWork.RepositoryCategories.RowCountAsync().Result;
        }

        public void UpdateCategory(int id, Category entity)
        {
            if (id != entity.Id)
            {
                throw new Exception("Id is not correct");
            }
            _unitOfWork.RepositoryCategories.UpdateAsync(entity);
            _unitOfWork.Complete();
        }
    }
}
