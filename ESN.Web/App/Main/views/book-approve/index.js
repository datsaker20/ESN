(function () {
    angular.module('app').controller('app.views.book-approve.index', [
        '$scope', '$timeout', '$uibModal', 'abp.services.app.books', '$rootScope',
        function ($scope, $timeout, $uibModal, bookService, $rootScope) {
            var vm = this;
            var modalInstance;

            vm.data = [];
            vm.pageSize = 20;
            vm.page = 1;
            vm.totalItems = 0;
            
            vm.keyword = '';
            vm.status = '2';
            vm.isMyApprove = false;

            $rootScope.$on("completedApproved", function(evt, data) {
                modalInstance.close();
                getData();
            });

            function getData() {
                bookService.getApproveList(vm.keyword || undefined, vm.status, vm.isMyApprove, (vm.page - 1)* vm.pageSize, vm.pageSize).then(function (result) {
                    vm.data = result.data.data;
                    vm.totalItems = result.data.totalCount[0].totalRow;
                });
            }

            vm.openBookDetail = function (book) {
                modalInstance = $uibModal.open({
                    templateUrl: '/App/Main/views/book-approve/book-detail-approve-modal.cshtml',
                    controller: 'app.views.bookApprove.approveModal as vm',
                    backdrop: 'static',
                    windowTopClass : 'modal-xl',
                    resolve: {
                        bookId: function () {
                            return book.id;
                        }
                    }
                });

                modalInstance.rendered.then(function () {
                });
            };

            vm.search = function () {
                getData();
            };
            
            vm.pageChanged = function() {
                getData();
            }

            getData();
        }
    ]);
})();
