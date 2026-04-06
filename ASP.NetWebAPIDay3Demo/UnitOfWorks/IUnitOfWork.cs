using ASP.NetWebAPIDay3Demo.Repositories.Interfaces;

namespace ASP.NetWebAPIDay3Demo.UnitOfWorks
{
    public interface IUnitOfWork : IDisposable
    {
        IRepository<Category> RepositoryCategories { get; }
        IRepository<Product> RepositoryProducts { get; }
        Task<int> Complete();
    }
}
