using System.Linq.Expressions;

namespace ASP.NetWebAPIDay3Demo.Repositories.Interfaces
{
    public interface IRepository<T> where T : class
    {
        Task<IEnumerable<T>> GetAllAsync();
        Task<T> GetByIdAsync(int id);
        Task AddAsync(T entity);
        Task UpdateAsync(T entity);
        Task DeleteAsync(int id);
        Task<int> RowCountAsync();
        Task<IEnumerable<T>> SearchAsync(Expression<Func<T, bool>> predicate);
        Task<IEnumerable<T>> GetWithIncludingAsync(params string[] includeProperties);


    }
}
