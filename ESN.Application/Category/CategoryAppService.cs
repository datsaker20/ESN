using System.Data;
using System.Threading.Tasks;
using Abp.Application.Services;
using ESN.Dtos.Admin;
using ESN.EntityFramework.Repositories;

namespace ESN.Category
{
    public class CategoryAppService: ESNAppServiceBase, ICategoryAppService
    {
        private readonly ICategoryRepository _categoryRepository;

        public CategoryAppService(ICategoryRepository categoryRepository)
        {
            _categoryRepository = categoryRepository;
        }

        public async Task<DataSet> GetListCategory(CategoryFilterDto input)
        {
            return await _categoryRepository.GetListCategory(input);
        }

        public async Task<bool> CreateOrUpdate(CategoryInputDto input)
        {
            return await _categoryRepository.CreateOrUpdate(input, AbpSession.UserId.GetValueOrDefault());
        }

        public async Task<DataTable> GetCategoryDetail(int id)
        {
            return await _categoryRepository.GetCategoryDetail(id);
        }

        public async Task<DataTable> GetListReport(CategoryFilterDto input)
        {
            return await _categoryRepository.GetListReport(input);
        }

        public async Task UpdateProcessed(int id, int value)
        {
            await _categoryRepository.UpdateProcessed(id, value);
        }
    }

    public interface ICategoryAppService : IApplicationService
    {
        Task<DataSet> GetListCategory(CategoryFilterDto input);
        Task<bool> CreateOrUpdate(CategoryInputDto input);
        Task<DataTable> GetCategoryDetail(int id);

        Task<DataTable> GetListReport(CategoryFilterDto input);
        Task UpdateProcessed(int id, int value);
    }
}