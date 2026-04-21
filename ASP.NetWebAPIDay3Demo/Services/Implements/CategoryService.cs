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
        //public void AddCategory(Category entity)
        //{
        //    _unitOfWork.RepositoryCategories.AddAsync(entity);
        //    _unitOfWork.Complete();
        //}
        public void AddCategory(CategoryCreateDto entity)
        {
            //Mapping Model To DTO Services Layer
            Category category = new Category()
            {
                Id = entity.Id,
                Name = entity.Name,
                Description = entity.Description
            };
            //Using Respository To Add Category
            _unitOfWork.RepositoryCategories.Add(category);
            //Complete Unit Of Work
            _unitOfWork.Complete();
        }

        public void DeleteCategory(int id)
        {
            _unitOfWork.RepositoryCategories.Delete(id);
            _unitOfWork.Complete();
        }

        public IEnumerable<Category> GetCategory()
        {
            return _unitOfWork.RepositoryCategories.GetAll();
        }

        public Category GetCategoryByID(int id)
        {
            return _unitOfWork.RepositoryCategories.GetById(id);
        }

        public int GetCategoryCounter()
        {
            return _unitOfWork.RepositoryCategories.RowCount();
        }

        public void UpdateCategory(int id, CategoryCreateDto entity)
        {
            if (id != entity.Id)
            {
                throw new Exception("Id is not correct");
            }
            //Mapping Model To DTO Services Layer
            Category category = new Category()
            {
                Id = entity.Id,
                Name = entity.Name,
                Description = entity.Description
            };
            _unitOfWork.RepositoryCategories.Update(category);
            _unitOfWork.Complete();
        }
    }
}
