(function () {
    'use strict';

    var app = angular.module('app', [
        'ngAnimate',
        'ngSanitize',

        'ui.router',
        'ui.bootstrap',
        'ui.jq',

        'abp',
        'ckeditor',
        'ui.select'
    ]);
    //Configuration for Angular UI routing.
    app.config([
        '$stateProvider', '$urlRouterProvider', '$locationProvider', '$qProvider',
        function ($stateProvider, $urlRouterProvider, $locationProvider, $qProvider) {
            $locationProvider.hashPrefix('');
            $qProvider.errorOnUnhandledRejections(false);

            if (isAdminLayout === 'admin') {
                if (abp.auth.hasPermission('Pages.ApproveBook')) {
                    $stateProvider
                        .state('admin_home', {
                            url: '/book-approve',
                            templateUrl: '/App/Main/views/book-approve/index.cshtml',
                            menu: 'approveBook'
                        });
                }

                if (abp.auth.hasPermission('Pages.CategoryMng')) {
                    $stateProvider
                        .state('category_mng', {
                            url: '/category-mng',
                            templateUrl: '/App/Main/views/category/index.cshtml'
                        });
                }

                if (abp.auth.hasPermission('Pages.ReportMng')) {
                    $stateProvider
                        .state('report_mng', {
                            url: '/report-mng',
                            templateUrl: '/App/Main/views/report/index.cshtml'
                        });
                }

                if (abp.auth.hasPermission('Pages.BestSeller')) {
                    $stateProvider
                        .state('best_seller', {
                            url: '/best-seller',
                            templateUrl: '/App/Main/views/best-seller/index.cshtml'
                        });
                }

                if (abp.auth.hasPermission('Pages.PaymentTicket')) {
                    $stateProvider
                        .state('ticket', {
                            url: '/ticket-mng',
                            templateUrl: '/App/Main/views/ticket/index.cshtml'
                        });
                }

                if (abp.auth.hasPermission('Pages.Users')) {
                    $stateProvider
                        .state('users', {
                            url: '/users',
                            templateUrl: '/App/Main/views/users/index.cshtml',
                            menu: 'Users' //Matches to name of 'Users' menu in kahngtestNavigationProvider
                        });
                }

                if (abp.auth.hasPermission('Pages.Roles')) {
                    $stateProvider
                        .state('roles', {
                            url: '/roles',
                            templateUrl: '/App/Main/views/roles/index.cshtml',
                            menu: 'Roles' //Matches to name of 'Tenants' menu in kahngtestNavigationProvider
                        });
                }

                $urlRouterProvider.otherwise('/book-approve');
            } else {
                $stateProvider
                    .state('home', {
                        url: '/',
                        templateUrl: '/App/Main/views/public/frontend.cshtml'
                    })
                    .state('book-detail', {
                        url: '/book-detail/:bookId',
                        templateUrl: '/App/Main/views/public/book-detail.cshtml'
                    })
                    .state('read-book', {
                        url: '/read-book/:chapterId',
                        templateUrl: '/App/Main/views/public/read-chapter.cshtml'
                    })
                    .state('category-books', {
                        url: '/category-books/:categoryId',
                        templateUrl: '/App/Main/views/book-filter/book-of-category.cshtml'
                    })
                    .state('search-books', {
                        url: '/search-books?keyword&order&category',
                        templateUrl: '/App/Main/views/book-filter/book-search.cshtml'
                    })
                    .state('book-buy-most', {
                        url: '/book-buy-most/:mode',
                        templateUrl: '/App/Main/views/book-filter/book-buy-most.cshtml'
                    });

                if (abp.session && abp.session.userId) {
                    $stateProvider
                        .state('my-account', {
                            url: '/my-account/:tab',
                            templateUrl: '/App/Main/views/home/home.cshtml',
                        })
                        .state('create-book', {
                            url: '/create-book/:bookId',
                            templateUrl: '/App/Main/views/home/VietTruyen.cshtml'
                        })
                        .state('create-edit-chapter', {
                            url: '/create-edit-chapter/:bookId/:chapterId',
                            templateUrl: '/App/Main/views/home/chapter-create-or-edit.cshtml'
                        })
                        .state('author-books', {
                            url: '/author-books/:authorId',
                            templateUrl: '/App/Main/views/book-filter/book-of-author.cshtml'
                        })

                }

                $urlRouterProvider.otherwise('/');
            }
        }
    ]);

    app.filter('propsFilter', function () {
        return function (items, props) {
            var out = [];

            if (angular.isArray(items)) {
                var keys = Object.keys(props);

                items.forEach(function (item) {
                    var itemMatches = false;

                    for (var i = 0; i < keys.length; i++) {
                        var prop = keys[i];
                        var text = props[prop].toLowerCase();
                        if (item[prop].toString().toLowerCase().indexOf(text) !== -1) {
                            itemMatches = true;
                            break;
                        }
                    }

                    if (itemMatches) {
                        out.push(item);
                    }
                });
            } else {
                // Let the output be the input untouched
                out = items;
            }

            return out;
        };
    });

    app.directive('customOnChange', function () {
        return {
            restrict: 'A',
            link: function (scope, element, attrs) {
                var onChangeHandler = scope.$eval(attrs.customOnChange);
                element.on('change', onChangeHandler);
                element.on('$destroy', function () {
                    element.off();
                });

            }
        };
    });

})();