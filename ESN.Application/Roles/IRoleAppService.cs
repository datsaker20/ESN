using System.Threading.Tasks;
using Abp.Application.Services;
using Abp.Application.Services.Dto;
using ESN.Roles.Dto;

namespace ESN.Roles
{
    public interface IRoleAppService : IAsyncCrudAppService<RoleDto, int, PagedResultRequestDto, CreateRoleDto, RoleDto>
    {
        Task<ListResultDto<PermissionDto>> GetAllPermissions();
    }
}
