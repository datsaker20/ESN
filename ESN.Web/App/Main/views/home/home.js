(function () {
    const controllerId = 'app.views.home';
    angular.module('app').controller(controllerId, [
        '$rootScope', '$scope', '$state', 'abp.services.app.books', 'abp.services.app.home', '$stateParams', function ($rootScope, $scope, $state, bookService, homeService, $stateParams) {
            var vm = this;

            vm.pageSize = 10;
            vm.page = 1;
            vm.totalItems = 0;

            vm.totalItemsNoti = 0;
            vm.pageNoti = 1;
            vm.pageSizeNoti = 10;

            vm.favoriteBook = [];
            vm.accountInfo = {};
            vm.boughtBook = []
            vm.followAuthor = [];
            vm.notification = [];

            vm.userNapTienId = abp.session ? abp.session.userId : '';

            vm.accountInfoEdit = {
                currentPassword: '',
                newPassword: '',
                rePassword: '',
                surname: '',
                name: ''
            }

            vm.onClickVietTruyen = function () {
                $state.go('create-book', {})
            }

            vm.listTruyen = [];
            vm.filter = {
                term: '',
                page: 1,
                pageSize: 10
            }

            vm.pageChanged = function () {
                getListBook();
            }

            function getListBook() {
                vm.filter.page = vm.page;
                vm.filter.pageSize = vm.pageSize;

                bookService.danhSachBookCuaToi(vm.filter).then(function (res) {
                    vm.listTruyen = res.data;
                    if (res.data.length > 0) {
                        vm.totalItems = res.data[0].totalRows;
                    }
                })
            }

            getListBook();

            vm.search = function () {
                getListBook();
            }

            /**
             * edit book
             * @param bookId
             */
            vm.editBook = function (bookId) {
                $state.go('create-book', { bookId })
            }

            /**
             * delete book
             * @param book
             */
            vm.deleteBook = function (book) {
                let message = `Un publish book ${book.name} ?`;

                abp.message.confirm(
                    message,
                    "UnPublish",
                    function (result) {
                        if (!result) {
                            return;
                        }

                        bookService.deleteBook(book.id).then(function () {
                            abp.notify.success('UnPublish successfully!');
                            getListBook();
                        })
                    });
            }

            vm.tabNotiClick = function () {
                homeService.getListNoti(vm.pageNoti, vm.pageSizeNoti).then(res => {
                    const data = res.data;
                    vm.notification = data;

                    if (data.length > 0) {
                        vm.totalItemsNoti = data[0].total;
                    } else {
                        vm.totalItemsNoti = 0;
                    }

                    $rootScope.$broadcast('refreshCheckNoti', undefined);
                })
            }

            vm.notiPageChange = function () {
                vm.tabNotiClick();
            }

            function init() {
                var activeTab = $stateParams.tab;


                if (activeTab == 'notification') {
                    $('#notification_t').addClass('active');
                    $('#notification').addClass('active show');

                    vm.tabNotiClick();


                } else if (activeTab == 'recharge') {
                    $('#recharge_t').addClass('active');
                    $('#recharge').addClass('active show');
                } else {
                    $('#dashboad_t').addClass('active');
                    $('#dashboad').addClass('active show');
                }

                homeService.getMyAccountData().then(x => {
                    var data = x.data;
                    vm.favoriteBook = data.favoriteBook;
                    vm.accountInfo = data.accountInfo[0];
                    vm.boughtBook = data.boughtBook;
                    vm.followAuthor = data.followAuthor;
                })
            }

            vm.goToBookDetail = function (bookId) {
                $state.go('book-detail', { bookId });
            }

            vm.gotoBookByAuthor = function (authorId) {
                $state.go('author-books', { authorId });
            }

            vm.saveChangePassword = function () {
                if (!vm.accountInfoEdit.currentPassword || !vm.accountInfoEdit.newPassword || !vm.accountInfoEdit.rePassword) {
                    abp.notify.error('Please text current password, new password and confirm password');
                    return;
                }

                homeService.changePassword({
                    Password: vm.accountInfoEdit.currentPassword,
                    NewPassword: vm.accountInfoEdit.newPassword
                }).then(res => {
                    if (!res.data) {
                        abp.notify.success("Change password successfully! Please login again!");
                        location.href = "/account/login";
                    } else {
                        abp.notify.error(res.data);
                    }
                })
            }

            vm.saveUserInfo = function () {
                if (!vm.accountInfo.surname || !vm.accountInfo.name) {
                    abp.notify.error("Please text first name and last name");
                    return;
                }

                homeService.updateUserInfo(vm.accountInfo.surname, vm.accountInfo.name).then(res => {
                    abp.notify.success("Change info successfully");
                })
            }

            init();

            vm.totalItemsPayment = 0;
            vm.pagePayment = 1;
            vm.pageSizePayment = 10;
            vm.paymentData = [];

            vm.ticketObj = {
                code: "",
                amount: 0,
                stk: "2151297453",
                accountName: "TRAN VIET DAT",
                bankName: "BIDV",
                bankNameFull: "Ngân hàng Thương mại cổ phần Đầu tư và Phát triển Việt Nam",
            };

            vm.pageChangedPayment = function () {
                searchPayment();
            }

            function searchPayment() {
                try {
                    homeService.getPaymentMethodByUser({
                        page: vm.pagePayment,
                        pageSize: vm.pageSizePayment,
                        term: ''
                    }).then(res => {
                        const data = res.data;

                        vm.paymentData = data;

                        if (data.length > 0) {
                            vm.totalItemsPayment = data[0].total;
                        } else {
                            vm.totalItemsPayment = 0;
                        }
                    })
                } catch (e) {
                    console.error("Error in searchPayment:", e);
                    alert("Có lỗi xảy ra trong quá trình tìm kiếm thanh toán. Vui lòng thử lại sau.");
                    throw e;
                }
            }


            searchPayment();

            vm.createTicket = function () {
                vm.ticketObj.code = genCode();
                vm.amount = 0;

                $('#modalCreateTicket').modal('show');
            }

            vm.saveTicket = function () {
                // validate
                if (vm.ticketObj.amount <= 0) {
                    abp.notify.warn('Amount must be greater than 0');
                    return;
                }

                if (vm.ticketObj.amount < 10000) {
                    abp.notify.warn('Amount minimum 10,000 VNĐ');
                    return;
                }

                if (vm.ticketObj.amount % 1000 > 0) {
                    abp.notify.warn('Amount must be a multiple of 1000');
                    return;
                }

                homeService.createPaymentTicket({
                    code: vm.ticketObj.code,
                    amount: vm.ticketObj.amount
                }).then(() => {
                    abp.notify.success('Create ticket successfully!');
                    $('#modalCreateTicket').modal('hide');
                    vm.pagePayment = 1;
                    searchPayment();
                })
            }

            vm.closeModalPayment = function () {
                $('#modalCreateTicket').modal('hide');
            }

            function genCode() {
                function s4() {
                    return Math.floor((1 + Math.random()) * 0x10000)
                        .toString(16)
                        .substring(1);
                }
                return `ESN ${s4() + s4()}`;
            }

            vm.totalItemsPaymentBD = 0;
            vm.pagePaymentBD = 1;
            vm.pageSizePaymentBD = 10;
            vm.bienDongSoDuData = [];

            function getDataBienDongSoDu() {
                homeService.getDataBienDongSoDu({
                    page: vm.pagePaymentBD,
                    pageSize: vm.pageSizePaymentBD,
                    term: ''
                }).then(res => {
                    const data = res.data;

                    vm.bienDongSoDuData = data;

                    if (data.length > 0) {
                        vm.totalItemsPaymentBD = data[0].total;
                    } else {
                        vm.totalItemsPaymentBD = 0;
                    }
                })
            }

            vm.pageChangedPaymentBD = function () {
                getDataBienDongSoDu();
            }

            getDataBienDongSoDu();
        }
    ]);
})();