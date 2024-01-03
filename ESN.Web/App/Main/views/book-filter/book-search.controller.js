(function () {
        const controllerId = 'app.views.public.bookSearch';
        angular.module('app').controller(controllerId, [
            '$rootScope', '$scope', '$state', 'abp.services.app.home', '$stateParams', function ($rootScope, $scope, $state, homeServices, $stateParams) {
                $scope.pageSize = 12;
                $scope.page = 1;
                $scope.totalItems = 0;
                $scope.data = [];
                
                $scope.sortBy = '';
                $scope.categoryId = undefined;
                
                console.log('$state.params:  ', $state.params);
                function init() {
                    $rootScope.keyword = $state.params.keyword || '';
                    $scope.sortBy = $state.params.order || '';
                    $scope.categoryId = $state.params.category || 0;
                    search();
                }
                
                init();
                

                $scope.pageChanged = function() {
                    search();
                }

                /**
                 * search
                 * @param cateId
                 */
                function search() {
                    homeServices.getBookByCategory({
                        page: $scope.page,
                        pageSize: $scope.pageSize,
                        
                        categoryId: $scope.categoryId,
                        sortBy: $scope.sortBy,
                        keyword: $rootScope.keyword
                    }).then(res => {
                        $scope.data = res.data.data;

                        if($scope.data.length > 0) {
                            $scope.totalItems = $scope.data[0].total;
                        }
                    })
                }

                $scope.goToBookDetail = function(bookId) {
                    $state.go('book-detail', {bookId});
                }
                
                /**
                 * sort
                 * @param type
                 */
                $scope.filter = function(type) {
                    $scope.sortBy = type;
                    $scope.page = 1;
                    $state.go('search-books', {keyword: $rootScope.keyword, order: $scope.sortBy, category: $scope.categoryId})
                }

                /**
                 * filter by category
                 * @param categoryId
                 */
                $scope.filterByCategory = function(categoryId) {
                    $scope.sortBy = '';
                    $scope.page = 1;
                    $scope.categoryId = categoryId;

                    $state.go('search-books', {keyword: $rootScope.keyword, order: $scope.sortBy, category: $scope.categoryId});
                }

                
            }
        ])}
)()