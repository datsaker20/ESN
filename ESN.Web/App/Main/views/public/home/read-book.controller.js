(function () {
    const controllerId = 'app.views.public.readBook';
    angular.module('app').controller(controllerId, [
        '$scope', '$state', 'abp.services.app.home', '$stateParams', '$rootScope', function ($scope, $state, homeServices, $stateParams, $rootScope) {
            const chapterId = $stateParams.chapterId;
            $scope.chapterDetail = {};
            $rootScope.reportComment = '';
            $scope.isReported = false;
            
            var buyChapter = [];
            var chapters = [];
            
            function init() {
                homeServices.getChapterDetail(chapterId).then(res => {
                    $scope.chapterDetail = res.data[0];
                    $scope.isReported = res.data[0].isReported;
                    
                    homeServices.getBookHomeDetail(res.data[0].book_id).then(res => {
                        buyChapter = res.data.buyChapter;
                        chapters = res.data.chapters.filter(x => !x.price || buyChapter.indexOf(y => y.id == x.id) > -1);
                    })
                })
            }
            
            $scope.checkNext = function() {
                let cIndex = chapters.findIndex(x => x.id == $scope.chapterDetail.id );
                if(cIndex > -1 && cIndex < chapters.length - 1) {
                    return true;
                }
                
                return false;
            }

            $scope.checkPre = function() {
                let cIndex = chapters.findIndex(x => x.id == $scope.chapterDetail.id );
                if(cIndex > -1 && cIndex > 0) {
                    return true;
                }

                return false;
            }
            
            $scope.clickNavigater = function(type) {
                let cIndex = chapters.findIndex(x => x.id == $scope.chapterDetail.id );
                if(type == 'next') {
                    if(cIndex > -1 && cIndex < chapters.length - 1) {
                        $state.go('read-book', {chapterId: chapters[cIndex + 1].id});
                    }
                } else {
                    if(cIndex > -1 && cIndex > 0) {
                        $state.go('read-book', {chapterId: chapters[cIndex - 1].id});
                    }
                }
            }
            
            init();
            
            $scope.reportChapter = function() {
                $('#modalReport').modal('show');
            }
            
            $rootScope.processReport = function() {
                homeServices.reportBook({
                    bookId: $scope.chapterDetail.book_id,
                    chapterId: chapterId,
                    comment: $scope.reportComment,
                    type: 0
                }).then(() => {
                    $('#modalReport').modal('hide');
                    $rootScope.reportComment = '';
                    $scope.isReported = true;
                    abp.notify.success('Report chapter successfully!');
                })
            }
            
            $rootScope.closeModalReport = function() {
                $('#modalReport').modal('hide'); 
            }
        }])
})()