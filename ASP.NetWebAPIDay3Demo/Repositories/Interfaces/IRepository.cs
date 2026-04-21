using System.Linq.Expressions;

namespace ASP.NetWebAPIDay3Demo.Repositories.Interfaces
{
    public interface IRepository<T> where T : class
    {
        IEnumerable<T> GetAll();
        T GetById(int id);
        void Add(T entity);
        void Update(T entity);
        void Delete(int id);
        int RowCount();
        IEnumerable<T> Search(Expression<Func<T, bool>> predicate);
        IEnumerable<T> GetWithIncluding(params string[] includeProperties);


    }
}
