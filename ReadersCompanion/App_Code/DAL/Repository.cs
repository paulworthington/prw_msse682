using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.Entity;
using System.Linq.Expressions;

namespace DAL
{
    // Define two interfaces, with implementations below
    
    public interface IGenericRepository<T> where T : class
    {
        void Insert(T entity);
        //void Delete(T entity);
        IQueryable<T> GetAll();
        void Update(T entity);
        IQueryable<T> GetByKey(string KeyName, string KeyValue);
        IQueryable<T> GetByKey(string KeyName, int? KeyValue);
    }

    public interface IGenericRepository
    {
        void Insert(object entity);
        //void Delete(object entity);
        IQueryable GetAll();
        void Update(object entity);
        IQueryable GetByKey(string KeyName, string KeyValue);
        IQueryable GetByKey(string KeyName, int? KeyValue);
    }

    // the repository class
    public class GenericRepository<T> : IGenericRepository<T>, IGenericRepository where T : class
    {

        // Data Context object from prwModel682
        private DbContext dataContext;

        // Constructor
        public GenericRepository()
        {
            // read the database connection string from App.Config
            dataContext = new DbContext(ConfigurationManager.ConnectionStrings["readerDB01Entities"].ConnectionString);
        }

        // interfaces
        void IGenericRepository.Insert(object entity)
        {
            Insert((T)entity);
        }

        /*
        void IGenericRepository.Delete(object entity)
        {
            Delete((T)entity);
        }
         */

        IQueryable IGenericRepository.GetAll()
        {
            return GetAll();
        }

        void IGenericRepository.Update(object entity)
        {
            Update((T)entity);
        }

        IQueryable IGenericRepository.GetByKey(string KeyName, int? KeyValue)
        {
            return GetByKey(KeyName, KeyValue);
        }

        IQueryable IGenericRepository.GetByKey(string KeyName, string KeyValue)
        {
            return GetByKey(KeyName, KeyValue);
        }

        // Define methods

        public virtual void Insert(T entity)
        {
            dataContext.Set<T>().Add(entity);
            dataContext.SaveChanges();
        }

        /*
        public virtual void Delete(T entity)
        {
            // This doesn't help.
            //dataContext.Set<T>().Attach(entity);
            

            dataContext.Set<T>().Remove(entity);
            dataContext.SaveChanges();

            // This still doesn't work. Nothing works.
            //var entry = dataContext.Entry(entity);
            //if (entry != null)
            //{
            //    entry.State = System.Data.EntityState.Deleted;
            //}
            //else
            //{
            //    dataContext.Set<T>().Attach(entity);
            //}
            //dataContext.Entry(entity).State = System.Data.EntityState.Deleted;
            //dataContext.SaveChanges();
        }
         */

        public virtual IQueryable<T> GetAll()
        {
            return dataContext.Set<T>().AsQueryable();
        }

        public virtual void Update(T entity)
        {
            dataContext.Set<T>().Attach(entity);
            dataContext.Entry(entity).State = System.Data.EntityState.Modified;
            dataContext.SaveChanges();
        }

        // overload GetByKey() to accommodate nullable int and string
        public virtual IQueryable<T> GetByKey(string KeyName, int? KeyValue)
        {
            var itemParameter = Expression.Parameter(typeof(T), "item");
            var whereExpression = Expression.Lambda<Func<T, bool>>
                (Expression.Equal(Expression.Property(itemParameter, KeyName), Expression.Constant(KeyValue, typeof(int?))), new[] { itemParameter });
            try
            {
                return GetAll().Where(whereExpression).AsQueryable();
            }
            catch
            {
                return null;
            }
        }

        public virtual IQueryable<T> GetByKey(string KeyName, string KeyValue)
        {
            var itemParameter = Expression.Parameter(typeof(T), "item");
            var whereExpression = Expression.Lambda<Func<T, bool>>
                (Expression.Equal(Expression.Property(itemParameter, KeyName), Expression.Constant(KeyValue)), new[] { itemParameter });
            try
            {
                return GetAll().Where(whereExpression).AsQueryable();
            }
            catch
            {
                return null;
            }
        }

    }

}
