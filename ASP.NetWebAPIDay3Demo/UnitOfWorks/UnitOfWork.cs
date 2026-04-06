using ASP.NetWebAPIDay3Demo.Repositories.Impelements;
using ASP.NetWebAPIDay3Demo.Repositories.Interfaces;

namespace ASP.NetWebAPIDay3Demo.UnitOfWorks
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly AppDbContext _context;
        public IRepository<Category> RepositoryCategories { get; }
        public IRepository<Product> RepositoryProducts { get; }

        public UnitOfWork(AppDbContext context)//, IRepository<Category> repositoryCategories, IRepository<Product> repositoryProducts)
        {
            _context = context;
            //RepositoryCategories = repositoryCategories;
            //RepositoryProducts = repositoryProducts;
            RepositoryCategories = new Repository<Category>(_context);
            RepositoryProducts = new Repository<Product>(_context);
        }
        public Task<int> Complete()
        {
            var Rows = _context.SaveChangesAsync();
            _context.ChangeTracker.Clear();  //.state = Entitystate.Detached;
            return Rows;
        }
        public void Dispose()
        {
            _context.Dispose();
        }
    }
}
