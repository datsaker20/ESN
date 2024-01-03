(function () {
    var controllerId = 'app.views.layout';
    angular.module('app').controller(controllerId, [
        '$scope', '$timeout', 'abp.services.app.home', '$rootScope', '$state', function ($scope, $timeout, homeServices, $rootScope, $state) {
            var vm = this;
            //Layout logic...
            $rootScope.categoriesRoot = [];
            $rootScope.categoriesAll = [];
            $rootScope.isNewNoti = false;
            $rootScope.userCoin = 0;
            $rootScope.isLogon = abp.session != null && !!abp.session.userId;
            
            function getCategory() {
                homeServices.getCategoryForSelect().then(res => {
                    const data = res.data;
                    $rootScope.categoriesAll = data;
                    console.log('categoriesAll', $scope.categoriesAll);
                    
                    $rootScope.categoriesRoot = data.filter(x => x.parentId === x.id)
                        .map(x => {
                            return {
                                ...x,
                                subCate: data.filter(y => y.parentId == x.id && y.id != y.parentId)
                            }
                        });
                })
                
                if(abp.session && abp.session.userId) {
                    homeServices.getUserCoin().then(res => {
                        $rootScope.userCoin = res.data;
                    })
                    
                    function checkNotiNew() {
                        homeServices.checkNewNoti().then(res => {
                            $rootScope.isNewNoti = res.data;
                        })
                    }

                    $rootScope.$on('refreshCheckNoti', function() {
                        checkNotiNew();
                    })

                    checkNotiNew();
                }
                
            }
            
            $rootScope.keyword = '';
            $rootScope.searchBook = function() {
                $state.go('search-books', {keyword: $rootScope.keyword}, {reload: true})
            }

            vm.activateLeftSideBar = function () {
                $timeout(function () {
                    $.AdminBSB.leftSideBar.activate();
                }, 1000);
            };

            vm.activateRightSideBar = function () {
                $timeout(function () {
                    $.AdminBSB.rightSideBar.activate();
                }, 1000);
            };

            vm.activateTopBar = function () {
                $.AdminBSB.search.activate();
                $.AdminBSB.navbar.activate();
            };

            getCategory();
            
            $rootScope.goToNotification = function() {
                $state.go('my-account', {tab: 'notification'})
            }
            
            $rootScope.goToRecharge = function() {
                $state.go('my-account', {tab: 'recharge'})
            }
        }]);
})();