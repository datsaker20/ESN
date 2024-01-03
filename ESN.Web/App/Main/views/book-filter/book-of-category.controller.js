(function () {
        const controllerId = 'app.views.public.bookOfCategory';
        angular.module('app').controller(controllerId, [
            '$scope', '$state', 'abp.services.app.home', '$stateParams', function ($scope, $state, homeServices, $stateParams) {
                $scope.pageSize = 12;
                $scope.page = 1;
                $scope.totalItems = 0;
                $scope.data = [];
                $scope.sortBy = '';
                $scope.isFollowed = false;
                $scope.subCategories = [];
                var categoryId = $stateParams.categoryId;
                $scope.categoryName = '';
                $scope.selectedSub = 0;

                $scope.pageChanged = function() {
                    search(categoryId);
                }
                
                function search(cateId) {
                    homeServices.getBookByCategory({
                        page: $scope.page,
                        pageSize: $scope.pageSize,
                        categoryId: cateId,
                        sortBy: $scope.sortBy
                    }).then(res => {
                        $scope.data = res.data.data;
                        if(cateId === categoryId) {
                            $scope.subCategories = res.data.subCategories;
                            if($scope.data.length > 0) {
                                $scope.categoryName = $scope.data[0].categoryName;
                            }
                        }
                        
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
                    search($scope.selectedSub || categoryId);
                }

                /**filter by sub category
                 * 
                 * @param subId
                 */
                $scope.filterSub = function(subId) {
                    $scope.selectedSub = subId
                    search($scope.selectedSub || categoryId);
                }
                
                search(categoryId);
            }
        ])}
)()