(function () {
  //Block copy content
  function a1(e) {
    e.preventDefault();
  }

  function a2(e) {
    //document.onkeydown = function(e) {
    // "F12" key
    if (event.keyCode == 123) {
      disabledEvent(e);
    }
    // "U" key
    if (e.ctrlKey && e.keyCode == 85) {
      disabledEvent(e);
    }
    // "I" key
    if (e.ctrlKey && e.shiftKey && e.keyCode == 73) {
      disabledEvent(e);
    }
    // "J" key
    if (e.ctrlKey && e.shiftKey && e.keyCode == 74) {
      disabledEvent(e);
    }
    // "S" key + macOS
    if (
      e.keyCode == 83 &&
      (navigator.platform.match("Mac") ? e.metaKey : e.ctrlKey)
    ) {
      disabledEvent(e);
    }
  }
  window.onload = function () {
    let oldHref = document.location.href;
    const body = document.querySelector("body");
    const observer = new MutationObserver((mutations) => {
      mutations.forEach(() => {
        if (oldHref !== document.location.href) {
          oldHref = document.location.href;
          /* Changed ! your code here */
          if (location.href.indexOf("/read-book/") > -1) {
            document.addEventListener("contextmenu", a1, false);
            document.addEventListener("keydown", a2, false);
            function disabledEvent(e) {
              if (e.stopPropagation) {
                e.stopPropagation();
              } else if (window.event) {
                window.event.cancelBubble = true;
              }
              e.preventDefault();
              return false;
            }
          } else {
            document.removeEventListener("contextmenu", a1, false);
            document.removeEventListener("keydown", a2, false);
          }
        }
      });
    });
    observer.observe(body, { childList: true, subtree: true });
  };

  const controllerId = "app.views.public.book-detail";
  angular.module("app").controller(controllerId, [
    "$rootScope",
    "$scope",
    "$state",
    "abp.services.app.home",
    "$stateParams",
    function ($rootScope, $scope, $state, homeServices, $stateParams) {
      var bookId = 0;
      $scope.bookData = {};
      $scope.bookInterest = {};
      $scope.bookRate = {};
      $scope.buyChapter = [];
      $scope.chapters = [];
      $scope.rateting = [];

      $scope.rateComment = "";
      $scope.rateScore = 0;
      $scope.userRate = {
        rate: 0,
        comment: "",
      };

      $scope.haveRate = false;
      $scope.isEditrateComment = false;
      $scope.isCheckAll = false;
      $scope.chapterSelected = [];

      $scope.pageSize = 10;
      $scope.chaptersSeperate = [];
      $scope.chapterOffset = 0;

      $scope.onInterestBook = function () {
        if (!abp.session || !abp.session.userId) {
          abp.notify.error("Please login first");
          return;
        }

        homeServices.bookmarkBook(bookId).then((res) => {
          $scope.bookInterest.isInterest = !$scope.bookInterest.isInterest;
          $scope.bookInterest.quantity +=
            $scope.bookInterest.isInterest || 0 ? 1 : -1;

          let message = "Add book to your library successfully!";
          if (!$scope.bookInterest.isInterest) {
            message = "Remove book to your library successfully!";
          }

          abp.notify.success(message);
        });
      };

      $scope.submitReview = function () {
        if (!abp.session || !abp.session.userId) {
          abp.notify.error("Please login first");
          return;
        }

        homeServices
          .insertUpdateRateComment({
            rate: $scope.rateScore,
            rateComment: $scope.rateComment,
            bookId: bookId,
          })
          .then(() => {
            $scope.haveRate = true;
            $("#rateCommentTextarea").prop("disabled", true);
            $scope.isEditrateComment = false;

            reloadRateComment();
          });
      };

      $scope.setRateScore = function (value) {
        $scope.rateScore = value;
      };

      $scope.editRateComment = function () {
        $("#rateCommentTextarea").prop("disabled", false);
        $scope.haveRate = false;
        $scope.isEditrateComment = true;
      };

      $scope.deleteRateComment = function () {
        homeServices
          .insertUpdateRateComment({
            rate: $scope.rateScore,
            rateComment: $scope.rateComment,
            bookId: bookId,
            isDeleted: true,
          })
          .then(() => {
            $scope.haveRate = false;
            $("#rateCommentTextarea").prop("disabled", false);
            $scope.isEditrateComment = false;
            $(".vote-total > a > i").css("color", "#666");
            $(".vote-total > a").removeClass("active");
            $("#rateCommentTextarea").val("");

            reloadRateComment();
          });
      };

      function reloadRateComment() {
        homeServices.getBookHomeDetail(bookId).then((res) => {
          $scope.rateting = res.data.rateting;
        });
      }

      $scope.cancelEditRate = function () {
        $scope.haveRate = true;
        $scope.isEditrateComment = false;
        $("#rateCommentTextarea").prop("disabled", true);
      };

      function init() {
        bookId = $stateParams.bookId;

        if (bookId > 0) {
          homeServices.getBookHomeDetail(bookId).then((res) => {
            $scope.bookData = res.data.bookData[0];
            $scope.bookInterest = res.data.bookInterest[0];
            $scope.bookRate = res.data.bookRate[0];
            $scope.buyChapter = res.data.buyChapter;
            $scope.chapters = res.data.chapters;
            $scope.rateting = res.data.rateting;

            $scope.isReported = $scope.bookData.isReported;

            $scope.bookRate.rate = $scope.bookRate.rate || 0;

            var userRateElm = $scope.rateting.find(
              (x) => x.userId === abp.session.userId
            );
            if (userRateElm) {
              $scope.haveRate = !!userRateElm;
              $scope.userRate = {
                rate: userRateElm.rate,
                comment: userRateElm.rateComment,
              };

              $scope.rateComment = userRateElm.rateComment;
              $scope.rateScore = userRateElm.rate;
              if ($scope.haveRate) {
                $("#rateCommentTextarea").prop("disabled", true);
              }
            }

            $scope.chapters.forEach((x, index) => {
              if (
                index >= $scope.chapterOffset &&
                index < $scope.chapterOffset + $scope.pageSize
              ) {
                $scope.chaptersSeperate.push(x);
              }
            });

            $scope.chapterOffset = $scope.chapterOffset + $scope.pageSize;

            setTimeout(function () {
              $(".vote-total > a").hover(
                function () {
                  $(".vote-total > a > i").css("color", "#666");
                  var value = +$(this).data("value");
                  for (let i = 1; i <= value; i++) {
                    $(`.vote-total > a[data-value="${i}"] > i`).css(
                      "color",
                      "#f07c29"
                    );
                  }
                },
                function () {
                  if ($(".vote-total > a.active")) {
                    $(".vote-total > a > i").css("color", "#666");
                    var value = +$(".vote-total > a.active").data("value");
                    for (let i = 1; i <= value; i++) {
                      $(`.vote-total > a[data-value="${i}"] > i`).css(
                        "color",
                        "#f07c29"
                      );
                    }
                  }
                }
              );

              $(".vote-total > a").click(function () {
                $(".vote-total > a").removeClass("active");
                $(this).addClass("active");
              });
            }, 500);
          });
        }
      }

      $scope.openSubComment = function (rate) {
        homeServices.getCommentOfRate(rate.id).then((res) => {
          rate.isSubOpen = !rate.isSubOpen;
          if (rate.isSubOpen) {
            rate.subComment = res.data.comments || [];
          }
        });
      };

      $scope.addSubComment = function (sub, rate) {
        if (!abp.session || !abp.session.userId) {
          abp.notify.error("Please login first");
          return;
        }

        homeServices
          .createOrDeleteComment({
            id: 0,
            RateId: rate.id,
            IsDelete: false,
            Comment: sub.textInput,
          })
          .then((res) => {
            rate.subComment.push(res.data[0]);
            sub.textInput = "";
          });
      };

      $scope.deleteSubComment = function (sub, rate) {
        homeServices
          .createOrDeleteComment({
            id: sub.id,
            RateId: rate.id,
            IsDelete: true,
            Comment: sub.textInput,
          })
          .then((res) => {
            rate.subComment = rate.subComment.filter((x) => x.id !== sub.id);
          });
      };

      $scope.checkIsUserSub = function (sub) {
        return sub.userId === abp.session.userId;
      };

      $scope.chooseAllChap = function () {
        console.log($scope.chapters);
        $scope.isCheckAll = !$scope.isCheckAll;
        $scope.chapters.forEach((elm) => {
          console.log(elm);
          if (elm.price > 0 && !$scope.isBought(elm)) {
            elm.isChecked = $scope.isCheckAll;
          }
        });

        if ($scope.isCheckAll) {
          $scope.chapterSelected = JSON.parse(
            JSON.stringify(
              $scope.chapters.filter((x) => x.price > 0 && !$scope.isBought(x))
            )
          );
        } else {
          $scope.chapterSelected = [];
        }
      };

      $scope.followAuthor = function (auhtorId) {
        if (!abp.session || !abp.session.userId) {
          abp.notify.error("Please login first");
          return;
        }

        homeServices.followAuthor(auhtorId).then(() => {
          let message = "Follow author successfully";
          if ($scope.bookData.isFollowed) {
            message = "UnFollow author successfully";
          }

          $scope.bookData.isFollowed = !$scope.bookData.isFollowed;
          abp.notify.success(message);
        });
      };

      $scope.chooseChapter = function (chapter) {
        if (chapter.isChecked) {
          if ($scope.chapters.every((x) => x.isChecked)) {
            $scope.isCheckAll = true;
          }
          $scope.chapterSelected.push(chapter);
        } else {
          $scope.isCheckAll = false;

          let index = $scope.chapterSelected.findIndex(
            (x) => x.id === chapter.id
          );
          $scope.chapterSelected.splice(index, 1);
        }
      };

      $scope.isBought = function (chapter) {
        if (!$scope.buyChapter) {
          return false;
        }

        return (
          $scope.buyChapter.some((x) => x.isAllBook) ||
          $scope.buyChapter.findIndex((x) => x.chapterId === chapter.id) > -1
        );
      };

        $scope.buyChapterFnc = function () {
            if (!abp.session || !abp.session.userId) {
                abp.notify.error("Please login first");
                return;
            }

            let selectedChapterIds = $scope.chapterSelected.map(x => x.id);

            if (!selectedChapterIds.length) {
                abp.notify.warn('Please select at least a chapter to buy!');
                return;
            }

            // Kiểm tra xem có ít nhất một chương nào đó trong danh sách đã được mua hay không
            let hasBoughtChapters = $scope.chapters.some(chapter => chapter.isBought && selectedChapterIds.includes(chapter.id));

            if (hasBoughtChapters) {
                // Nếu có ít nhất một chương đã được mua, hiển thị thông báo và thoát khỏi hàm
                abp.notify.info('At least one selected chapter is already purchased.');
                return;
            }

            abp.message.confirm(
                "Do you want to buy selected chapters?",
                "Buy chapter",
                function (result) {
                    if (result) {
                        let data = {
                            bookId: bookId,
                            isAllBook: false,
                            chapterId: selectedChapterIds,
                            price: $scope.getPriceChapSelected(),
                            authorId: $scope.bookData.ownerId,
                            bookName: $scope.bookData.name
                        };

                        homeServices.buyChapterOrAllBook(data).then((res) => {
                            if (!res.data) {
                                abp.notify.error("You don't have enough coins. Please top up more coins.");
                                return;
                            }
                            $scope.chapterSelected = [];
                            homeServices.getBookHomeDetail(bookId).then(res => {
                                $scope.buyChapter = res.data.buyChapter;
                                $scope.chapters = res.data.chapters;

                                abp.notify.success('Buy chapters successfully!');
                                console.log('buyChapterFnc; ', $scope.buyChapter, $scope.chapters);
                            })
                        })
                    }
                });
        }


      $scope.getPriceChapSelected = function () {
        return $scope.chapterSelected
          .map((x) => x.price || 0)
          .reduce((a, b) => a + b, 0);
      };

      $scope.byAllBook = function () {
        if (!abp.session || !abp.session.userId) {
          abp.notify.error("Please login first");
          return;
        }

        abp.message.confirm(
          "Do you want to buy this book?",
          "Buy book",
          function (result) {
            if (result) {
              let data = {
                bookId: bookId,
                isAllBook: true,
                chapterId: [],
                price: $scope.bookData.price,
                authorId: $scope.bookData.ownerId,
                bookName: $scope.bookData.name,
              };

              homeServices.buyChapterOrAllBook(data).then((res) => {
                if (!res.data) {
                  abp.notify.error(
                    "you don't have enough coins, please top up more coins"
                  );
                  return;
                }

                $scope.chapterSelected = [];
                homeServices.getBookHomeDetail(bookId).then((res) => {
                  $scope.buyChapter = res.data.buyChapter;
                  $scope.chapters = res.data.chapters;

                  abp.notify.success("Buy book successfully!");
                  console.log(
                    "buyChapterFnc; ",
                    $scope.buyChapter,
                    $scope.chapters
                  );
                });
              });
            }
          }
        );
      };

      $scope.checkBuyAllBook = function () {
        return $scope.buyChapter.some((x) => x.isAllBook);
      };

      $scope.readChapter = function (chapterId) {
        $state.go("read-book", { chapterId });
      };

      $scope.checkLoadMore = function () {
        return $scope.chapterOffset < $scope.chapters.length;
      };

      $scope.loadMore = function () {
        $scope.chapters.forEach((x, index) => {
          if (
            index >= $scope.chapterOffset &&
            index < $scope.chapterOffset + $scope.pageSize
          ) {
            $scope.chaptersSeperate.push(x);
          }
        });

        $scope.chapterOffset = $scope.chapterOffset + $scope.pageSize;
      };

      $scope.checkOwnerAuthor = function () {
        if (!$scope.bookData || !$scope.bookData.ownerId) {
          return true;
        }

        return abp.session.userId === $scope.bookData.ownerId;
      };

      $rootScope.reportComment = "";
      $scope.isReported = false;

      $scope.onReportBook = function () {
        $("#modalReport").modal("show");
      };

      $rootScope.processReport = function () {
        homeServices
          .reportBook({
            bookId: bookId,
            chapterId: 0,
            comment: $scope.reportComment,
            type: 1,
          })
          .then(() => {
            $("#modalReport").modal("hide");
            $rootScope.reportComment = "";
            $scope.isReported = true;
            abp.notify.success("Report book successfully!");
          });
      };

      $rootScope.closeModalReport = function () {
        $("#modalReport").modal("hide");
      };

      init();
    },
  ]);
})();
