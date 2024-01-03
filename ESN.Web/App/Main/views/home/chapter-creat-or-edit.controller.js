(function () {
    const controllerId = 'chapter-create-edit-controller';
    angular.module('app').controller(controllerId, [
        '$scope', '$state', 'abp.services.app.books', '$stateParams', function ($scope, $state, bookServices, $stateParams) {
            const DATE_FORMAT_ALLOWS  = ['DD-MM-YYYY', 'DD/MM/YYYY', 'YYY-MM-DDTHH:mm:ss', 'YYY-MM-DD', 'YYY/MM/DD', 'MM/DD/YYYY']
            
            $scope.isSubmited = false;
            $scope.action = 'nhap';
            var bookId = 0;
            var chapterId = 0;
            
            $scope.chapter = undefined;
            
            var chapterBackup = {};

            $scope.onChangePublic = function () {
                if (!chapterId || $scope.chapter.trangThai != 3) {
                    return;
                }

                let message = '';
                if ($scope.chapter.isPublish) {
                    message = 'Do you want to hide this chapter ?';
                } else {
                    message = 'Do you want to make this chapter public?';
                }

                abp.message.confirm(
                    message,
                    '',
                    function (result) {
                        if (result) {
                            bookServices.updateChapterIsPublic(chapterId, $scope.chapter.isPublish).then(function () {
                                abp.notify.success($scope.chapter.isPublish ? 'make this chapter public successfully' : 'hide this chapter successfully');
                            })
                        }
                    });
            }
            
        
            $scope.saveChapter = function (action) {
                $scope.isSubmited = true;
                $scope.action = action;

                if (!validateBook(action)) {
                    return;
                }

                $scope.chapter.isChange = checkChangeData($scope.chapter, chapterBackup, ['noiDung', 'tieuDe']);
                $scope.chapter.action = action;

                bookServices.createOrEditChapter($scope.chapter)
                    .then(() => {
                        abp.notify.success('Successfully');
                        $state.go('create-book', {bookId: bookId});
                    })
            }

            /**
             * validate data before save
             * */
            function validateBook(action = 'nhap') {
                let flag = true;

                const fieldChapterCheck = ['tieuDe'];
                if(action === 'publish') {
                    fieldChapterCheck.push('noiDung');
                }

                for (let prop in $scope.chapter) {
                    if (fieldChapterCheck.indexOf(prop) > -1 && !$scope.chapter[prop]) {
                        flag = false;
                    }
                }

                if (!flag) {
                    abp.notify.error(`please enter required chapter information!`);
                    return false;
                }

                return true;
            }

            /**
             * compare 2 object data to detect change
             * @param {any} origin
             * @param {any} target
             * @param {any} fields
             */
            function checkChangeData(origin, target, fields) {
                return fields.some(key => {
                    if (!(origin.hasOwnProperty(key) && target.hasOwnProperty(key))) {
                        return false;
                    }

                    if ((origin[key] || '0').toString().trim().toLowerCase() !== (target[key] || '0').toString().trim().toLowerCase()) {
                        return !(moment(target[key], DATE_FORMAT_ALLOWS, true).isValid() && moment(origin[key], DATE_FORMAT_ALLOWS, true).isValid() && moment(target[key]).isSame(moment(origin[key])));

                    }
                })
            }
            
            function init() {
                bookId = +$stateParams.bookId;
                chapterId = +$stateParams.chapterId;

                $scope.chapter = {
                    id: 0,
                    trangThai: 1,
                    isPublish: true,
                    bookId: bookId,
                    ngayChinhSua: moment().format('DD/MM/YYYY HH:mm'),
                    giaBan: 0
                };
                $scope.chapter.bookId = bookId;
                
                if(!!chapterId) {
                    bookServices.getBookDetail(bookId).then(function (res) {
                        let {chapterData} = res.data;
                            
                        var dd = chapterData.map(x => {
                            return {
                                tieuDe: x.title,
                                id: x.id,
                                trangThai: x.status,
                                giaBan: x.price,
                                ngayChinhSua: moment(x.lastModifiedAt).format('DD/MM/YYYY HH:mm'),
                                isChange: false,
                                noiDung: x.content,
                                isDeleted: false,
                                isPublish: x.is_publish,
                                request_approve_date: x.request_approve_date,
                                approve_reject_date: x.approve_reject_date,
                                approve_reject_user: x.approve_reject_user,
                                action: 0,
                                bookId: bookId
                            }
                        })

                        $scope.chapter = dd.find(x => x.id === +chapterId);
                        chapterBackup = $.extend({}, $scope.chapter);
                    })
                }
            }
            
            init();
        }
    ]);
})();