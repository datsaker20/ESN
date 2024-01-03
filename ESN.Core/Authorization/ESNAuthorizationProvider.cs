using Abp.Authorization;
using Abp.Localization;
using Abp.MultiTenancy;

namespace ESN.Authorization
{
    public class ESNAuthorizationProvider : AuthorizationProvider
    {
        public override void SetPermissions(IPermissionDefinitionContext context)
        {
            context.CreatePermission(PermissionNames.Pages_Users, L("Users"));
            context.CreatePermission(PermissionNames.Pages_Roles, L("Roles"));
            context.CreatePermission(PermissionNames.Pages_ApproveBook, L("Approve Book"));
            context.CreatePermission(PermissionNames.Pages_Category, L("Categories management"));
            context.CreatePermission(PermissionNames.PaymentTicket, L("Payment ticket"));
            context.CreatePermission(PermissionNames.Recharge, L("Recharge"));
            context.CreatePermission(PermissionNames.Pages_Report, L("Report management"));
            context.CreatePermission(PermissionNames.Pages_BestSeller, L("Best sellers"));
            context.CreatePermission(PermissionNames.Pages_Tenants, L("Tenants"), multiTenancySides: MultiTenancySides.Host);
        }

        private static ILocalizableString L(string name)
        {
            return new LocalizableString(name, ESNConsts.LocalizationSourceName);
        }
    }
}
