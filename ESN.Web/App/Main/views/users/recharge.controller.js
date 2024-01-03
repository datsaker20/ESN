(function () {
    angular.module('app').controller('app.views.users.recharge1', [
        '$scope', '$uibModalInstance', 'abp.services.app.books', 'user',
        function ($scope, $uibModalInstance, bookService, user) {
            var vm = this;
            vm.user = JSON.parse(JSON.stringify(user));
            vm.user.coinDest = 0;
            vm.user.coin = vm.user.coin || 0;

            vm.save = function () {
                if(vm.user.coinDest <= 0) {
                    abp.notify.warn('Please enter money greater than 0');
                    return;
                }
                
                bookService.rechargeUser(vm.user.coinDest, vm.user.id).then(res => {
                    abp.notify.info(App.localize('SavedSuccessfully'));
                    $uibModalInstance.close();
                })
            };

            vm.cancel = function () {
                $uibModalInstance.dismiss({});
            };
            
            vm.convertMoneyToCoin = function() {
                if(vm.user.money <= 0) {
                    abp.notify.warn('Please enter money greater than 0');
                    return;
                }
                
                vm.user.coinDest = Math.floor(vm.user.money / 1000);
            }
            
        }
    ]);
})();