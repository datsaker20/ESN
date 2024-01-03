(function () {
    angular.module('app').controller('app.views.users.index', [
        '$scope', '$timeout', '$uibModal', 'abp.services.app.user',
        function ($scope, $timeout, $uibModal, userService) {
            var vm = this;
            vm.term = '';

            vm.users = [];

            function getUsers() {
                userService.getAll({term: vm.term}).then(function (result) {
                    vm.users = result.data.items;
                });
            }

            vm.openUserCreationModal = function () {
                var modalInstance = $uibModal.open({
                    templateUrl: '/App/Main/views/users/createModal.cshtml',
                    controller: 'app.views.users.createModal as vm',
                    backdrop: 'static'
                });

                modalInstance.rendered.then(function () {
                    $.AdminBSB.input.activate();
                });

                modalInstance.result.then(function () {
                    getUsers();
                });
            };

            vm.openUserEditModal = function (user) {
                var modalInstance = $uibModal.open({
                    templateUrl: '/App/Main/views/users/editModal.cshtml',
                    controller: 'app.views.users.editModal as vm',
                    backdrop: 'static',
                    resolve: {
                        id: function () {
                            return user.id;
                        }
                    }
                });

                modalInstance.rendered.then(function () {
                    $timeout(function () {
                        $.AdminBSB.input.activate();
                    }, 0);
                });

                modalInstance.result.then(function () {
                    getUsers();
                });
            };

            vm.delete = function (user) {
                abp.message.confirm(
                    "Delete user '" + user.userName + "'?",
                    "Delete",
                    function (result) {
                        if (result) {
                            userService.delete({ id: user.id })
                                .then(function () {
                                    abp.notify.info("Deleted user: " + user.userName);
                                    getUsers();
                                });
                        }
                    });
            }

            vm.refresh = function () {
                getUsers();
            };
            
            vm.recharge = function(user) {
                var modalInstance = $uibModal.open({
                    templateUrl: '/App/Main/views/users/recharge.cshtml',
                    controller: 'app.views.users.recharge1 as vm',
                    backdrop: 'static',
                    resolve: {
                        user: function () {
                            return user;
                        }
                    }
                });

                modalInstance.rendered.then(function () {
                    $timeout(function () {
                        $.AdminBSB.input.activate();
                    }, 0);
                });

                modalInstance.result.then(function () {
                    getUsers();
                });
            }
            
            vm.search = function() {
                getUsers();
            }
            
            vm.isGrantNapTien = function(){
                return abp.auth.hasPermission('Pages.Recharge');
            }

            getUsers();
        }
    ]);
})();
