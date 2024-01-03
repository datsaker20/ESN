(function () {
    const controllerId = 'app.views.category.index';
    angular.module('app').controller(controllerId, [
        '$scope', '$state', 'abp.services.app.category', '$uibModal', function ($scope, $state, categoryService, $uibModal) {
            var vm = this;

            vm.pageSize = 15;
            vm.page = 1;
            vm.totalItems = 0;
            vm.term = '';
            
            vm.data = [];

            vm.search = function(btnSearch) {
                if(!!btnSearch) {
                    vm.page  = 1;
                }
                let input = {
                    page: vm.page,
                    pageSize: vm.pageSize,
                    term: vm.term
                }
                categoryService.getListCategory(input).then(res => {
                    var data = res.data.data;
                    
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
            
            vm.create = function() {
                vm.edit({
                    id: 0,
                    category_id: 0,
                    is_display: true
                });
            }
            
            vm.edit = function(item) {
                var modalInstance = $uibModal.open({
                    templateUrl: '/App/Main/views/category/editModal.cshtml',
                    controller: 'app.views.category.editModal as vm',
                    backdrop: 'static',
                    resolve: {
                        categoryDetail: function () {
                            return JSON.parse(JSON.stringify(item));
                        }
                    }
                });

                modalInstance.rendered.then(function () {
                });

                modalInstance.result.then(function () {
                    vm.search();
                });
            }
            
            vm.delete = function(item) {
                abp.message.confirm(
                    "Delete this category ?",
                    "Delete",
                    function (result) {
                        if (result) {
                            categoryService.createOrUpdate({ id: item.id, is_deleted: true})
                                .then(function (res) {
                                    if(res.data) {
                                        abp.notify.info("Deleted category successfully");
                                        vm.search();
                                    } else {
                                        abp.notify.info("Can not delete category, because exists books associate with its");
                                    }
                                });
                        }
                    });
            }
        }
    ]);
})();