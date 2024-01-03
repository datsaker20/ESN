(function () {
    const controllerId = 'app.views.category.editModal';
    angular.module('app').controller(controllerId, [
        '$scope', '$state', 'abp.services.app.category', 'categoryDetail', '$uibModalInstance', 'abp.services.app.home', '$rootScope',  
        function ($scope, $state, categoryService, categoryDetail, $uibModalInstance, homeServices, $rootScope) {
            var vm = this;
            
            vm.categoryRoot = [...$rootScope.categoriesRoot];
            vm.categoryRoot.splice(0, 0, {
                id: 0,
                name: 'None'
            })
            vm.category = categoryDetail;
            
            vm.category.parent_id_obj = vm.categoryRoot.find(x => x.id === (vm.category.parent_id || 0))

            vm.cancel = function () {
                $uibModalInstance.dismiss({});
            };
            
            
            
            vm.save = function() {
                if(!vm.category.name) {
                    abp.notify.error('Please enter category name!');
                    return;
                }

                let dataSave = {
                    id: vm.category.id,
                    name: vm.category.name,
                    order: vm.category.order || 0,
                    parent_id: !!vm.category.parent_id_obj ? vm.category.parent_id_obj.id : 0,
                    is_display: vm.category.is_display,
                    is_deleted: false
                }

                categoryService.createOrUpdate(dataSave).then(res => {
                    abp.notify.info(App.localize('SavedSuccessfully'));
                    $uibModalInstance.close();
                })
            }
        }
    ]);
})();