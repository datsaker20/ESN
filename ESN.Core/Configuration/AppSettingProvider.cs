using System.Collections.Generic;
using Abp.Configuration;

namespace ESN.Configuration
{
    public class AppSettingProvider : SettingProvider
    {
        public override IEnumerable<SettingDefinition> GetSettingDefinitions(SettingDefinitionProviderContext context)
        {
            return new[]
            {
                new SettingDefinition(AppSettingNames.UiTheme, "red", scopes: SettingScopes.Application | SettingScopes.Tenant | SettingScopes.User, isVisibleToClients: true),
                // new SettingDefinition("Abp.Net.Mail.DefaultFromAddress", "bobo09122000@gmail.com"),
                // new SettingDefinition("Abp.Net.Mail.DefaultFromDisplayName", "ESN"),
                // new SettingDefinition("Abp.Net.Mail.Host", "smtp.gmail.com"),
                // new SettingDefinition("Abp.Net.Mail.Port", "587"),
                // new SettingDefinition("Abp.Net.Mail.UserName", "bobo09122000@gmail.com"),
                // new SettingDefinition("Abp.Net.Mail.Password", "mocsahsvyzsyowaa"),
                // new SettingDefinition("Abp.Net.Mail.EnableSsl", "true"),
                // new SettingDefinition("Abp.Net.Mail.UseDefaultCredentials", "false"),
            };
        }
    }
}