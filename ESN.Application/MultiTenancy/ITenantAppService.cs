using Abp.Application.Services;
using Abp.Application.Services.Dto;
using ESN.MultiTenancy.Dto;

namespace ESN.MultiTenancy
{
    public interface ITenantAppService : IAsyncCrudAppService<TenantDto, int, PagedResultRequestDto, CreateTenantDto, TenantDto>
    {
    }
}
