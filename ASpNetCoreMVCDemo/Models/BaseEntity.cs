namespace ASpNetCoreMVCDemo.Models
{
    public class BaseEntity : IBaseEntity
    {
        public bool IsDeleted { get; set; } = false;
    }
}
