using Abp.Domain.Entities;
using Abp.EntityFramework;
using Abp.EntityFramework.Repositories;
using System.Data;
using System.Data.Common;

namespace ESN.EntityFramework.Repositories
{
    public abstract class ESNRepositoryBase<TEntity, TPrimaryKey> : EfRepositoryBase<ESNDbContext, TEntity, TPrimaryKey>
        where TEntity : class, IEntity<TPrimaryKey>
    {
        protected ESNRepositoryBase(IDbContextProvider<ESNDbContext> dbContextProvider)
            : base(dbContextProvider)
        {

        }

        //add common methods for all repositories
        public DbCommand CreateCommand(string commandText, CommandType commandType = CommandType.StoredProcedure)
        {
            var command = Connection.CreateCommand();

            command.CommandTimeout = 600;
            command.CommandText = commandText;
            command.CommandType = commandType;

            return command;
        }
    }

    public abstract class ESNRepositoryBase<TEntity> : ESNRepositoryBase<TEntity, int>
        where TEntity : class, IEntity<int>
    {
        protected ESNRepositoryBase(IDbContextProvider<ESNDbContext> dbContextProvider)
            : base(dbContextProvider)
        {

        }

        //do not add any method here, add to the class above (since this inherits it)
    }

    /// <summary>
    /// Chỉ gọi store
    /// </summary>
    public abstract class ESNRepositoryBase : ESNRepositoryBase<Entity, int>
    {
        protected ESNRepositoryBase(IDbContextProvider<ESNDbContext> dbContextProvider)
            : base(dbContextProvider)
        {

        }

        //do not add any method here, add to the class above (since this inherits it)!!!
    }

}
