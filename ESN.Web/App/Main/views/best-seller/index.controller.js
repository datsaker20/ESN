(function () {
    const controllerId = 'app.views.best-seller.index';
    angular.module('app').controller(controllerId, [
        '$scope', '$state', 'abp.services.app.books', function ($scope, $state, bookService) {
            var vm = this;

            vm.data = [];

            function getData() {
                bookService.getBestSellers().then(res => {
                    vm.data = res.data;
                })
            }

            getData();
        }
    ]);
})();