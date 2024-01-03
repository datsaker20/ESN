(function () {
    angular.module('app').controller('app.views.bookApprove.approveModal', [
        '$scope', '$timeout', 'abp.services.app.books', 'bookId', '$uibModalInstance',
        function ($scope, $timeout, bookService, bookId, $uibModalInstance) {
            var vm = this;

            vm.bookId = bookId;
            
            vm.close = function () {
                $uibModalInstance.dismiss();
            }
        }
    ]);
})();
