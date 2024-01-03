using System.Threading.Tasks;
using Abp.Application.Services;
using ESN.Sessions.Dto;

namespace ESN.Sessions
{
    public interface ISessionAppService : IApplicationService
    {
        Task<GetCurrentLoginInformationsOutput> GetCurrentLoginInformations();
    }
}
