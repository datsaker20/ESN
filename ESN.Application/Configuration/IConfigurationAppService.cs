using System.Threading.Tasks;
using Abp.Application.Services;
using ESN.Configuration.Dto;

namespace ESN.Configuration
{
    public interface IConfigurationAppService: IApplicationService
    {
        Task ChangeUiTheme(ChangeUiThemeInput input);
    }
}