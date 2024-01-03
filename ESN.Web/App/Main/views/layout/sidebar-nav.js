(function () {
    var controllerId = 'app.views.layout.sidebarNav';
    angular.module('app').controller(controllerId, [
        '$rootScope', '$state', 'appSession',
        function ($rootScope, $state, appSession) {
            var vm = this;

            vm.menuItems = [
                createMenuItem(App.localize("Book Approve"), "Pages.ApproveBook", "business", "admin_home"),
                createMenuItem(App.localize("Categories management"), "Pages.CategoryMng", "business", "category_mng"),
                createMenuItem(App.localize("Report management"), "Pages.ReportMng", "business", "report_mng"),
                createMenuItem(App.localize("Best sellers"), "Pages.BestSeller", "business", "best_seller"),

                createMenuItem(App.localize("Users"), "Pages.Users", "people", "users"),
                createMenuItem(App.localize("Roles"), "Pages.Roles", "local_offer", "roles"),

                createMenuItem(App.localize("Payment ticket"), "Pages.PaymentTicket", "local_offer", "ticket"),
            ];

            vm.showMenuItem = function (menuItem) {
                if (menuItem.permissionName) {
                    return abp.auth.isGranted(menuItem.permissionName);
                }

                return true;
            }

            function createMenuItem(name, permissionName, icon, route, childItems) {
                return {
                    name: name,
                    permissionName: permissionName,
                    icon: icon,
                    route: route,
                    items: childItems
                };
            }
        }
    ]);
})();