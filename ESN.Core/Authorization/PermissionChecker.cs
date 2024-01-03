using Abp.Authorization;
using ESN.Authorization.Roles;
using ESN.Authorization.Users;

namespace ESN.Authorization
{
    public class PermissionChecker : PermissionChecker<Role, User>
    {
        public PermissionChecker(UserManager userManager)
            : base(userManager)
        {

        }
    }
}
