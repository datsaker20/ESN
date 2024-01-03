using System.Threading.Tasks;
using Abp.Application.Services;
using ESN.Authorization.Accounts.Dto;

namespace ESN.Authorization.Accounts
{
    public interface IAccountAppService : IApplicationService
    {
        Task<IsTenantAvailableOutput> IsTenantAvailable(IsTenantAvailableInput input);

        Task<RegisterOutput> Register(RegisterInput input);
    }
}
