(function () {
    const controllerId = 'app.views.public.home';
    angular.module('app').controller(controllerId, [
        '$scope', '$state', 'abp.services.app.home', function ($scope, $state, homeServices) {
            $scope.listBookSellest = [];
            $scope.listBookNew = [];
            $scope.listBookRead = [];
            $scope.listBookRate = [];
            
            function getHomeData() {
                homeServices.getDataMainHome()
                    .then(res => {
                        const data = res.data;
                        console.log('----', data);
                        
                        $scope.listBookSellest = data.bookSellest || [];
                        $scope.listBookNew = data.bookSellest || [];
                        $scope.listBookRead = data.bookRead || [];
                        $scope.listBookRate = data.bookRate || [];

                        setTimeout(function() {initUi();}, 50)
                    })
            }

            
            function init() {
                getHomeData();
                
            }

            function initUi() {
                $('.tab-active').owlCarousel({
                    smartSpeed: 1000,
                    nav: true,
                    autoplay: false,
                    dots: false,
                    loop: true,
                    margin: 20,
                    navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
                    responsive: {
                        0: {
                            items: 1
                        },
                        480: {
                            items: 2
                        },
                        768: {
                            items: 3
                        },
                        992: {
                            items: 4
                        },
                        1170: {
                            items: 4
                        },
                        1300: {
                            items: 5
                        }
                    }
                })
            }
            init();
        }
    ])
})()