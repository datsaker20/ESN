using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using Abp.EntityFramework;
using ESN.Dtos.Admin;

namespace ESN.EntityFramework.Repositories
{
    public class CategoryRepository : ESNRepositoryBase, ICategoryRepository
    {
        public CategoryRepository(IDbContextProvider<ESNDbContext> dbContextProvider) : base(dbContextProvider)
        {
        }

        public async Task<DataSet> GetListCategory(CategoryFilterDto input)
        {
            using (var command = CreateCommand("prc_category_getList"))
            {
                command.Parameters.Add(new SqlParameter("@term", (input.term ?? string.Empty).Trim().ToLower()));
                command.Parameters.Add(new SqlParameter("@page", input.page ?? 1));
                command.Parameters.Add(new SqlParameter("@pageSize", input.pageSize ?? 10));


                using (var dataReader = await command.ExecuteReaderAsync())
                {
                    string[] array = { "Data" };
                    var ds = new DataSet();
                    ds.Load(dataReader, LoadOption.OverwriteChanges, array);
                    return ds;
                }
            }
        }

        public async Task<bool> CreateOrUpdate(CategoryInputDto input, long userId)
        {
            try
            {
                using (var command = CreateCommand("prc_category_createOrUpdate"))
                {
                    command.Parameters.Add(new SqlParameter("@id", input.id ?? 0));
                    command.Parameters.Add(new SqlParameter("@name", input.name));
                    command.Parameters.Add(new SqlParameter("@order", input.order ?? 0));
                    command.Parameters.Add(new SqlParameter("@is_display", input.is_display));
                    command.Parameters.Add(new SqlParameter("@is_deleted", input.is_deleted));
                    command.Parameters.Add(new SqlParameter("@parent_id", input.parent_id ?? 0));

                    using (var dataReader = await command.ExecuteReaderAsync())
                    {
                        string[] array = { "Data" };
                        var ds = new DataSet();
                        ds.Load(dataReader, LoadOption.OverwriteChanges, array);
                        if (ds != null && ds.Tables != null && ds.Tables[0].Rows.Count > 0)
                        {
                            return false;
                        }
                    }
                }
            }
            catch (System.Exception ex)
            {

                throw;
            }


            return true;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<DataTable> GetCategoryDetail(int id)
        {
            using (var command = CreateCommand("prc_category_getDetail"))
            {
                command.Parameters.Add(new SqlParameter("@id", id));

                using (var dataReader = await command.ExecuteReaderAsync())
                {
                    string[] array = { "Data" };
                    var ds = new DataSet();
                    ds.Load(dataReader, LoadOption.OverwriteChanges, array);
                    return ds.Tables[0];
                }
            }
        }

        public async Task<DataTable> GetListReport(CategoryFilterDto input)
        {
            using (var command = CreateCommand("prc_report_getList"))
            {
                command.Parameters.Add(new SqlParameter("@term", (input.term ?? string.Empty).Trim().ToLower()));
                command.Parameters.Add(new SqlParameter("@page", input.page ?? 1));
                command.Parameters.Add(new SqlParameter("@pageSize", input.pageSize ?? 10));


                using (var dataReader = await command.ExecuteReaderAsync())
                {
                    string[] array = { "Data" };
                    var ds = new DataSet();
                    ds.Load(dataReader, LoadOption.OverwriteChanges, array);
                    return ds.Tables[0];
                }
            }
        }

        public async Task UpdateProcessed(int id, int value)
        {
            using (var command = CreateCommand("prc_report_updateProcessed"))
            {
                command.Parameters.Add(new SqlParameter("@id", id));
                command.Parameters.Add(new SqlParameter("@value", value));

                await command.ExecuteNonQueryAsync();
            }
        }
    }

    public interface ICategoryRepository
    {
        Task<DataSet> GetListCategory(CategoryFilterDto input);
        Task<bool> CreateOrUpdate(CategoryInputDto input, long userId);
        Task<DataTable> GetCategoryDetail(int id);

        Task<DataTable> GetListReport(CategoryFilterDto input);
        Task UpdateProcessed(int id, int value);
    }
}