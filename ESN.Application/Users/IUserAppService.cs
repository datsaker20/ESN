using System.Threading.Tasks;
using Abp.Application.Services;
using Abp.Application.Services.Dto;
using ESN.Roles.Dto;
using ESN.Users.Dto;

namespace ESN.Users
{
    public interface IUserAppService : IAsyncCrudAppService<UserDto, long, UserFilterDto, CreateUserDto, UpdateUserDto>
    {
        Task<ListResultDto<RoleDto>> GetRoles();
    }
}