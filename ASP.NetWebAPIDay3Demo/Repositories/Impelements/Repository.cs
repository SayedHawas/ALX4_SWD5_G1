using ASP.NetWebAPIDay3Demo.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;
namespace ASP.NetWebAPIDay3Demo.Repositories.Impelements
{
    public class Repository<T> : IRepository<T> where T : class
    {
        //DI
        private readonly AppDbContext _context;
        private readonly DbSet<T> _dbSet;
        public Repository(AppDbContext context)
        {
            _context = context;
            _dbSet = _context.Set<T>();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="entity"> </param>
        /// <returns></returns>
        public void Add(T entity)
        {
            _dbSet.AddAsync(entity);
            // await _context.SaveChangesAsync();
        }
        public void Delete(int id)
        {
            var entity = _dbSet.Find(id);
            if (entity != null)
            {
                _dbSet.Remove(entity);
                //await _context.SaveChangesAsync();
            }
        }
        public IEnumerable<T> GetAll()
        {
            return _dbSet.AsNoTracking().ToList();
        }

        public T? GetById(int id)
        {
            //CategoryId ,ProductId
            //return await _dbSet.FindAsync(id);

            var KeyName = _context.Model.FindEntityType(typeof(T)).FindPrimaryKey().Properties.Select(x => x.Name).Single();
            return _dbSet.AsNoTracking().FirstOrDefault(e => EF.Property<int>(e, KeyName) == id);
        }
        public IEnumerable<T> GetWithIncluding(params string[] includeProperties) //"Category","Products"
        {
            IQueryable<T> query = _dbSet.AsNoTracking(); //.Include("Category").Include("Products");
            foreach (var include in includeProperties)
            {
                query = query.Include(include);
            }
            return query.ToList();
        }
        public int RowCount()
        {
            return _dbSet.Count();
        }
        //Product => p => p.Price > 100
        //SearchAsync(p => p.Price > 100 && p.Name.StartWith('a'))
        public IEnumerable<T> Search(Expression<Func<T, bool>> predicate)
        {
            return _dbSet.Where(predicate).AsNoTracking().ToList();
        }
        public void Update(T entity)
        {
            _context.Entry(entity).State = EntityState.Modified;
            //_context.SaveChangesAsync();
        }
    }
}
