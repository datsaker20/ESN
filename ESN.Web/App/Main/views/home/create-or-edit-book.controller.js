(function () {
    angular.module('app').controller('app.createOrEditBook', [
        '$scope', '$state', 'abp.services.app.books', '$http', '$stateParams', '$q', '$rootScope',
        function ($scope, $state, bookServices, $http, $stateParams, $q, $rootScope) {
            const DATE_FORMAT_ALLOWS = ['DD-MM-YYYY', 'DD/MM/YYYY', 'YYY-MM-DDTHH:mm:ss', 'YYY-MM-DD', 'YYY/MM/DD', 'MM/DD/YYYY']
            let cateSelectMap = [];
            var giaTronBoOld = 0;

            $scope.isSubmited = false;
            $scope.action = 'nhap';
            $scope.truyenBackup = {};

            //props
            $scope.listChapter = [];
            $scope.truyen = {
                id: 0,
                anhBiaUrl: undefined,
                theLoai: [],
                tenTruyen: '',
                moTa: '',
                giaTronBo: 0,
                isPublish: true,
                trangThai: 1,
                isFreeBook: false
            }

            $scope.options = {
                language: 'vi',
                allowedContent: true,
                entities: false
            };

            $scope.listTheLoai = [];

            $scope.someGroupFn = function (item) {
                let i = cateSelectMap.find(x => x.id == item.parentId);
                if (!i) {
                    return '';
                } else {
                    return i.name;
                }
            };

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

                if (action === 'publish' && $scope.listChapter.length === 0) {
                    abp.notify.error('Books must have at least 1 chapter before publishing');
                    return;
                }

                //phải có ít nhất 1 chapter request approve(hoặc trạng thái > hơn) thì mới cho lưu(gửi duyệt)
                if ($scope.listChapter.every(x => x.trangThai == 1 || !x.trangThai) && action!='nhap') {
                    abp.notify.error('All chapters are in draft state and cannot be submitted for review. Please save draft.');
                    return;
                }

                if (['nhap', 'publish'].indexOf(action) > -1 && !validateBook(action)) {
                    return;
                }

                $scope.truyen.action = action;
                $scope.truyen.isChange = checkChangeData($scope.truyenBackup, $scope.truyen, ['moTa', 'theLoai', 'anhBiaUrl', 'tenTruyen'])
                bookServices.createOrEditBook($scope.truyen)
                    .then(() => {
                        abp.notify.success('Successfully');
                        $state.go('my-account');
                    })
            }

            /**
             * validate data before save
             * */
            function validateBook(action = 'nhap') {
                let flag = true;

                const fieldBookCheck = ['tenTruyen']
                if (action === 'publish') {
                    fieldBookCheck.push('moTa', 'theLoai', 'anhBiaUrl');
                }

                for (let prop in $scope.truyen) {
                    if (fieldBookCheck.indexOf(prop) > -1 && !$scope.truyen[prop]) {
                        flag = false;
                        break;
                    }
                }

                if (!flag) {
                    abp.notify.error('Please enter all required field!');
                    return false;
                }

                return true;
            }

            $scope.deleteChapter = function (chapter) {
                abp.message.confirm(
                    'Do you want to delete chapter?',
                    "Confirm",
                    function (result) {
                        if (!result) {
                            return;
                        }

                        bookServices.deleteChapter(chapter.id).then(res => {
                            abp.notify.success('Chapter was deleted!');
                            getTruyen($stateParams.bookId);
                        })
                    });
            }

            $scope.editChapter = function (chapter) {
                $state.go('create-edit-chapter', { bookId: $stateParams.bookId, chapterId: chapter.id });
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

            /**
             * get truyen detail
             * @param bookId_c
             */
            function getTruyen(bookId_c) {
                bookServices.getBookDetail(bookId_c).then(function (res) {
                    let { bookData, chapterData } = res.data;
                    chapterData = chapterData || [];
                    const bookItem = bookData[0];

                    $scope.truyen = {
                        id: bookItem.id,
                        anhBiaUrl: bookItem.cover_book,
                        theLoai: calTheLoai(bookItem.theLoaiId),
                        tenTruyen: bookItem.name,
                        moTa: bookItem.description,
                        giaTronBo: bookItem.price,
                        isPublish: bookItem.is_publish || false,
                        trangThai: bookItem.status,
                        isFreeBook: bookItem.is_book_free,
                        isCompleted: bookItem.isCompleted
                    }

                    $scope.truyenBackup = JSON.parse(JSON.stringify($scope.truyen));
                    giaTronBoOld = $scope.truyen.giaTronBo || 0;

                    $scope.listChapter = chapterData.map(x => {
                        let chap = {
                            tieuDe: x.title,
                            id: x.id,
                            trangThai: x.status,
                            giaBan: x.price,
                            ngayChinhSua: moment(x.lastModifiedAt).format('DD/MM/YYYY HH:mm'),
                            uniq: guid(),
                            noiDung: x.content,
                            isDeleted: false,
                            isPublish: x.is_publish,
                            request_approve_date: x.request_approve_date,
                            approve_reject_date: x.approve_reject_date,
                            approve_reject_user: x.approve_reject_user
                        }

                        return chap;
                    })
                })
            }

            function init() {
                const bookId_c = $stateParams.bookId;

                getCategoryDeopdown().then(() => {
                    if ($stateParams.bookId) {
                        getTruyen(bookId_c);
                    }
                });
            }

            function calTheLoai(catIds) {
                if (!catIds) {
                    return [];
                }

                return $scope.listTheLoai.filter(x => catIds.split(',').indexOf(x.id + '') > -1);
            }

            init();

            $scope.addChapter = function () {
                if (!$scope.truyen.id) {
                    abp.notify.info('Please save book infomation before create chapter!');
                    return;
                }
                $state.go('create-edit-chapter', { bookId: $stateParams.bookId, chapterId: 0 });
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

            $scope.checkFreeBook = function () {
                if ($scope.truyen.isFreeBook) {
                    $scope.truyen.giaTronBo = 0;
                } else if (!!$stateParams.bookId) {
                    $scope.truyen.giaTronBo = giaTronBoOld;
                }
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
    ]);
})();
