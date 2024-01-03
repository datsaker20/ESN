(function () {
    const controllerId = 'app.views.public.bookOfAuthor';
    angular.module('app').controller(controllerId, [
        '$scope', '$state', 'abp.services.app.home', '$stateParams', function ($scope, $state, homeServices, $stateParams) {
        $scope.pageSize = 10;
        $scope.page = 1;
        $scope.totalItems = 0;
        $scope.data = [];
        $scope.sortBy = '';
        $scope.authorName = '';
        $scope.isFollowed = false;
        var authorId = $stateParams.authorId;

        $scope.pageChanged = function() {
            search();
        }
        function search() {
            homeServices.getBookByAuthor({
                page: $scope.page,
                pageSize: $scope.pageSize,
                authorId: authorId,
                sortBy: $scope.sortBy
            }).then(res => {
                console.log('----sdfdf111', res.data.data);
                $scope.data = res.data.data;
                if($scope.data.length > 0) {
                    $scope.totalItems = $scope.data[0].total;
                    $scope.authorName = $scope.data[0].author;
                    $scope.isFollowed = $scope.data[0].isFollowed;
                }
            })
        }
        
        
        $scope.followAuthor = function() {
            homeServices.followAuthor(authorId).then(() => {
                let message = 'Follow author successfully'
                if($scope.isFollowed) {
                    message = 'UnFollow author successfully'
                }

                $scope.isFollowed = !$scope.isFollowed;
                abp.notify.success(message);
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