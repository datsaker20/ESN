(function () {
        const controllerId = 'app.views.public.bookBuyMost';
        angular.module('app').controller(controllerId, [
            '$scope', '$state', 'abp.services.app.home', '$stateParams', function ($scope, $state, homeServices, $stateParams) {
                $scope.pageSize = 10;
                $scope.page = 1;
                $scope.totalItems = 0;
                $scope.data = [];
                var mode = $stateParams.mode;

                $scope.pageChanged = function() {
                    search();
                }
                function search() {
                    homeServices.getBookBuyMost({
                        page: $scope.page,
                        pageSize: $scope.pageSize,
                        mode: mode
                    }).then(res => {
                        $scope.data = res.data;
                        if($scope.data.length > 0) {
                            $scope.totalItems = $scope.data[0].total;
                        } else {
                            $scope.totalItems = 0;
                        }
                    })
                }

                $scope.goToBookDetail = function(bookId) {
                    $state.go('book-detail', {bookId});
                }

                $scope.filter = function(type) {
                    $scope.sortBy = type;
                    $scope.page = 1;
                    search();
                }

                search();
            }
        ])}
)()