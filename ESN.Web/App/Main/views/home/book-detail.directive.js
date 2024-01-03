(function () {
    angular.module('app').directive('bookDetail', function() {

        var controller = function ($scope, $state, bookServices, $http, $stateParams, $q, $rootScope) {
            const DATE_FORMAT_ALLOWS  = ['DD-MM-YYYY', 'DD/MM/YYYY', 'YYY-MM-DDTHH:mm:ss', 'YYY-MM-DD', 'YYY/MM/DD', 'MM/DD/YYYY']
            var cateSelectMap = [];
            const chapterTemplate = {
                tieuDe: 'Chapter 1',
                id: 0,
                trangThai: 1,
                giaBan: 0,
                noiDung: '',
                ngayChinhSua: moment().format('DD/MM/YYYY'),
                isDeleted: false,
                isPublish: true,
                isChange: false
            }

            $scope.isNew = true;
            $scope.isSubmited = false;
            $scope.action = 'nhap';

            //props
            $scope.truyen = {
                id: 0,
                anhBiaUrl: undefined,
                theLoai: undefined,
                tenTruyen: '',
                moTa: '',
                giaTronBo: 0,
                isPublish: true,
                trangThai: 1,
                listChapter: []
            }

            $scope.chapterSelected = undefined;

            $scope.options = {
                language: 'vi',
                allowedContent: true,
                entities: false
            };

            $scope.listTheLoai = [];


            // functions
            // Called when the editor is completely ready.
            $scope.onReady = function () {
            };

            $scope.someGroupFn = function (item) {
                return cateSelectMap.find(x => x.id == item.parentId).name;
            };

            $scope.addChapter = function (input) {
                let lastIndex = $scope.truyen.listChapter.length;
                let isNew = !input;

                if (!input) {
                    input = chapterTemplate;
                    input.tieuDe = 'Chapter ' + (lastIndex + 1);
                }

                const newChapter = $.extend({}, input, {
                    uniq: guid(),
                    backupData: $.extend({}, input),
                    isChange: isNew
                })

                newChapter.backupData = $.extend({}, newChapter);

                $scope.truyen.listChapter = [...$scope.truyen.listChapter, newChapter];
                $scope.chapterSelected = $scope.truyen.listChapter[lastIndex];
            }

            $scope.selectChapter = function (chapterUniq) {
                let chapter = $scope.truyen.listChapter.find(x => x.uniq == chapterUniq);

                setTimeout(function () {
                    $scope.$apply(function () {
                        $scope.chapterSelected = chapter;
                    })
                }, 0);
            }

            /**
             *
             * @param {any} event
             */
            $scope.onChonAnhBia = function () {
                $('#iptFile').click();
            }

            $scope.saveBook = function (action) {
                $scope.isSubmited = true;
                $scope.action = action;

                if (['nhap', 'publish'].indexOf(action) > -1 && !validateBook(action)) {
                    return;
                }

                $scope.truyen.action = action;
                if($scope.mode != 2) {
                    $scope.truyen.listChapter.forEach(c => {
                        c.isChange = checkChangeData(c, c.backupData, ['noiDung', 'tieuDe']);
                    })
                } else {
                    $scope.truyen.listChapter.forEach(c => {
                        c.trangThai = !!c.action ? c.action : c.trangThai;
                    })
                    
                    if(['approve', 'reject'].indexOf(action) > -1) {
                        $scope.truyen.trangThai = action === 'approve' ? 3 : action === 'reject' ? 4 : $scope.truyen.trangThai;
                    }
                }

                bookServices.createOrEditBook($scope.truyen)
                    .then(() => {
                        abp.notify.success('Successfully');
                        if($scope.mode == 2) {
                            $rootScope.$broadcast("completedApproved", {});
                        } else {
                            $state.go('my-account');
                        }
                    })
            }

            /**
             * validate data before save
             * */
            function validateBook(action = 'nhap') {
                let flag = true;
                let chapterErr = undefined;

                const fieldBookCheck = ['tenTruyen']; //['anhBiaUrl', 'tenTruyen', 'moTa', 'theLoai']
                const fieldChapterCheck = ['tieuDe']; //['tieuDe', 'noiDung']
                if(action === 'publish') {
                    fieldChapterCheck.push('noiDung');
                    fieldBookCheck.push('moTa', 'theLoai');
                }

                for (let prop in $scope.truyen) {
                    if (fieldBookCheck.indexOf(prop) > -1 && !$scope.truyen[prop]) {
                        flag = false;
                        break;
                    }
                }

                if (!flag) {
                    abp.notify.error('Vui lòng điền đầy đủ thông tin sách!');
                    return false;
                }

                $scope.truyen.listChapter.some(elm => {
                    for (let prop in elm) {
                        if (fieldChapterCheck.indexOf(prop) > -1 && !elm[prop]) {
                            chapterErr = elm;
                            flag = false;
                            return true;
                        }
                    }
                })

                if (!flag) {
                    abp.notify.error(`Vui lòng điền đầy đủ thông tin chapter: ${chapterErr.tieuDe}!`);
                    return false;
                }

                return true;
            }

            $scope.deleteChapter = function(chapter) {
                abp.message.confirm(
                    'Do you want to delete chapter?',
                    "Confirm",
                    function (result) {
                        if (!result) {
                            return;
                        }

                        if(!chapter.id) {
                            $scope.$apply(function () {
                                $scope.truyen.listChapter = [...$scope.truyen.listChapter.filter(x => x.uniq !== chapter.uniq)];
                            })
                        } else {
                            $scope.$apply(function () {
                                let index = $scope.truyen.listChapter.findIndex(x => x.uniq === chapter.uniq);
                                $scope.truyen.listChapter[index].isDeleted = true;
                            })
                        }
                    });
            }

            /**
             * get category select
             * */
            function getCategoryDeopdown() {
                let defer = $q.defer();

                bookServices.getCategoryForSelect().then(function (res) {
                    cateSelectMap = res.data.filter(x => x.id === x.parentId);

                    $scope.listTheLoai = res.data.filter(x => x.parentId !== x.id);

                    defer.resolve();
                })

                return defer.promise;
            }

            function init() {
                if($scope.mode == 2) {
                    CKEDITOR.config.readOnly = true;
                }
                const bookId_c = $scope.bookId === undefined ? $stateParams.bookId : $scope.bookId;
                
                $scope.isNew = !bookId_c;
                getCategoryDeopdown().then(() => {
                    if(!$scope.isNew) {
                        bookServices.getBookDetail(bookId_c).then(function (res) {
                            let {bookData, chapterData} = res.data;
                            chapterData = chapterData || [];
                            const bookItem = bookData[0];

                            $scope.truyen = {
                                id: bookItem.id,
                                anhBiaUrl: bookItem.cover_book,
                                theLoai: calTheLoai(bookItem.theLoaiId),
                                tenTruyen: bookItem.name,
                                moTa: bookItem.description,
                                giaTronBo: bookItem.price,
                                isPublish: bookItem.is_publish,
                                trangThai: bookItem.status,
                                isFreeBook: bookItem.is_book_free,
                                isCompleted: bookItem.isCompleted,
                                
                                listChapter: chapterData.map(x => {
                                    const chap = {
                                        tieuDe: x.title,
                                        id: x.id,
                                        trangThai: x.status,
                                        giaBan: x.price,
                                        ngayChinhSua: moment(x.lastModifiedAt).format('DD/MM/YYYY'),
                                        uniq: guid(),
                                        isChange: false,
                                        noiDung: x.content,
                                        isDeleted: false,
                                        isPublish: x.is_publish,
                                        request_approve_date: x.request_approve_date,
                                        approve_reject_date: x.approve_reject_date,
                                        approve_reject_user: x.approve_reject_user,
                                        action: 0
                                    }
                                    
                                    // báo đỏ để biết chapter trạng thái chờ duyệt
                                    if($scope.mode == 2) {
                                        chap.isChange = chap.trangThai == 2;
                                    }

                                    chap.backupData = $.extend({}, chap);

                                    return chap;
                                })

                            }

                            $scope.chapterSelected = $scope.truyen.listChapter.length > 0 ? $scope.truyen.listChapter[0] : undefined;
                        })
                    }
                });
                // $scope.addChapter();
            }
            
            $scope.checkChapterApprove = function () {
                return $scope.truyen.listChapter.some(x => x.trangThai === 2);
            }

            $scope.checkDisableApproveChapter = function () {
                return $scope.truyen.listChapter.every(x => x.trangThai == 1 || ((x.action == 4 || !x.action) && x.trangThai == 2));
            }

            $scope.checkShowRejectBook = function () {
                return $scope.truyen.listChapter.every(x => x.trangThai == 1 || (x.action == 4  && x.trangThai == 2)) && $scope.truyen.trangThai == 3;
            }

            $scope.checkApproveBook = function () {
                return $scope.truyen.listChapter.every(x => x.trangThai == 1 || ((x.action == 4 || !x.action) && x.trangThai == 2));
            }

            $scope.checkChangeChapter = function() {
                $scope.chapterSelected.isChange = checkChangeData($scope.chapterSelected, $scope.chapterSelected.backupData, ['noiDung', 'tieuDe']);
            }

            function calTheLoai(catIds) {
                if(!catIds) {
                    return [];
                }

                debugger;
                return $scope.listTheLoai.filter(x => catIds.split(',').indexOf(x.id + '') > -1);
            }
            
            $scope.isReadOnly = abReadOnly;

            function abReadOnly() {
                return $scope.mode == 2;
            }
                
            $scope.isReadOnly1 = function() {
                return $scope.mode == 2 ? true : undefined;
            }

            init();

            /**
             * disable book form when status in request and approved
             * @returns {boolean}
             */
            $scope.isDisableBookForm = function() {
                    return [2,3].indexOf($scope.truyen.trangThai) > -1;
                }


            /******************************************************************/
            $scope.fileProgress = function (evt) {
                const files = evt.target.files;
                if (checkFile(files)) {
                    const file = files[0];
                    uploadImage(file).then(res => {
                        $scope.truyen.anhBiaUrl = res.data.filePath;
                    })
                } else {

                }
            }

            function uploadImage(file) {
                var formdata = new FormData();
                formdata.append('file', file);

                return $http({
                    url: abp.appPath + 'home/Upload',
                    method: 'POST',
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    },
                    data: formdata,
                    headers: {
                        'Content-Type': undefined
                    }
                });
            }

            /**
             * validate file
             * @param files
             * @returns
             */
            function checkFile(files) {
                if (!files.length) {
                    abp.notify.error('Không có file để upload');
                    return false;
                }

                const file = files[0];

                // file không được vượt quá 5MB
                if (file.size / 1024 / 1024 > 5) {
                    abp.notify.error('File upload không được vượt quá 5MB.');
                    return false;
                }
                return true;
            }

            function guid() {
                function s4() {
                    return Math.floor((1 + Math.random()) * 0x10000)
                        .toString(16)
                        .substring(1);
                }
                return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
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
        }
        
        return {
            restrict: 'E',
            templateUrl: '/App/Main/views/home/book-detail-template.cshtml',
            scope: {
                mode: '=',
                bookId: '='
            },
            controller: ['$scope', '$state', 'abp.services.app.books', '$http', '$stateParams', '$q', '$rootScope', controller],
            link: function(scope, elem, attr) { 
            },
        };
    });
})();