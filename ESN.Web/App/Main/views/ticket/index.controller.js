(function () {
    const controllerId = 'app.views.ticket.index';
    angular.module('app').controller(controllerId, [
        '$scope', '$state', 'abp.services.app.home', function ($scope, $state, homeService) {
            var vm = this;

            vm.pageSize = 10;
            vm.page = 1;
            vm.totalItems = 0;
            vm.term ='';

            vm.search = function(btnSearch) {
                if(!!btnSearch) {
                    vm.page  = 1;
                }
                let input = {
                    page: vm.page,
                    pageSize: vm.pageSize,
                    term: vm.term
                }
                homeService.getPaymentMethod(input).then(res => {
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

            vm.processTicket = function (item, status) {
                let message = 'Approve successfully!';
                if(status === 2) {
                    message = 'Reject successfully!';
                }
                
                homeService.processPayment(item.id, status).then(() => {
                    abp.notify.success(message);
                    vm.search(true);
                })
                
                
            }
        }
    ]);
})();