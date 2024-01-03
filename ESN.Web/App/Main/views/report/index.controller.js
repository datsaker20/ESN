(function () {
    const controllerId = 'app.views.report.index';
    angular.module('app').controller(controllerId, [
        '$scope', '$state', 'abp.services.app.category', function ($scope, $state, categoryService) {
            var vm = this;

            vm.pageSize = 10;
            vm.page = 1;
            vm.totalItems = 0;
            vm.term = '';

            vm.search = function(btnSearch) {
                if(!!btnSearch) {
                    vm.page  = 1;
                }
                let input = {
                    page: vm.page,
                    pageSize: vm.pageSize,
                    term: vm.term
                }
                categoryService.getListReport(input).then(res => {
                    var data = res.data;

                    vm.data = data;

                    if(data.length > 0) {
                        vm.totalItems = +data[0].total;
                    } else {
                        vm.totalItems = 0;
                    }
                })
            }

            vm.search();

            vm.pageChanged = function() {
                vm.search();
            }
            
            vm.unPublic = function(item) {
                categoryService.updateProcessed(item.id, 1).then(res => {
                    let message = '';
                    if(item.type == 1) {
                        message = 'UnPublic book successfully.';
                    } else {
                        message = 'UnPublic chapter successfully.';
                    }
                    abp.notify.info(message);
                    vm.search();
                })
            }
            
            vm.skip = function(item) {
                categoryService.updateProcessed(item.id, 2).then(res => {
                    let message = '';
                    if(item.type == 1) {
                        message = 'Skip report book successfully.';
                    } else {
                        message = 'Skip report chapter successfully.';
                    }
                    abp.notify.info(message);
                    vm.search();
                })
            }
        }
    ]);
})();