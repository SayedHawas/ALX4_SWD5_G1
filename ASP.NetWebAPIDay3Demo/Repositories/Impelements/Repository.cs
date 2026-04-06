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
        public async Task AddAsync(T entity)
        {
            await _dbSet.AddAsync(entity);
            // await _context.SaveChangesAsync();
        }
        public async Task DeleteAsync(int id)
        {
            var entity = await _dbSet.FindAsync(id);
            if (entity != null)
            {
                _dbSet.Remove(entity);
                //await _context.SaveChangesAsync();
            }
        }
        public async Task<IEnumerable<T>> GetAllAsync()
        {
            return await _dbSet.AsNoTracking().ToListAsync();
        }

        public async Task<T?> GetByIdAsync(int id)
        {
            //CategoryId ,ProductId
            //return await _dbSet.FindAsync(id);

            var KeyName = _context.Model.FindEntityType(typeof(T)).FindPrimaryKey().Properties.Select(x => x.Name).Single();
            return await _dbSet.AsNoTracking().FirstOrDefaultAsync(e => EF.Property<int>(e, KeyName) == id);
        }
        public async Task<IEnumerable<T>> GetWithIncludingAsync(params string[] includeProperties) //"Category","Products"
        {
            IQueryable<T> query = _dbSet.AsNoTracking(); //.Include("Category").Include("Products");
            foreach (var include in includeProperties)
            {
                query = query.Include(include);
            }
            return await query.ToListAsync();
        }
        public async Task<int> RowCountAsync()
        {
            return await _dbSet.CountAsync();
        }
        //Product => p => p.Price > 100
        //SearchAsync(p => p.Price > 100 && p.Name.StartWith('a'))
        public async Task<IEnumerable<T>> SearchAsync(Expression<Func<T, bool>> predicate)
        {
            return await _dbSet.Where(predicate).AsNoTracking().ToListAsync();
        }
        public async Task UpdateAsync(T entity)
        {
            _context.Entry(entity).State = EntityState.Modified;
            //_context.SaveChangesAsync();
        }
    }
}
