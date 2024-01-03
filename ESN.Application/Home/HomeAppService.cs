using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;
using Abp.Application.Services;
using Abp.Domain.Repositories;
using ESN.Authorization.Users;
using ESN.Dtos;
using ESN.Dtos.Public;
using ESN.EntityFramework.Repositories;

namespace ESN.Home
{
    public class HomeAppService: ESNAppServiceBase, IHomeAppService
    {
        private readonly IHomeRepository _homeRepository;
        private readonly IBookRepository _bookRepository;
        private readonly IRepository<User, long> _userRepository;

        public HomeAppService(IHomeRepository homneRepository, IBookRepository bookRepository,
            IRepository<User, long> userRepository)
        {
            _homeRepository = homneRepository;
            _bookRepository = bookRepository;
            _userRepository = userRepository;
        }
        
        public async Task<IEnumerable<CategorySelectItemDto>> GetCategoryForSelect()
        {
            return await _bookRepository.GetCategoryForSelect();
        }

        public async Task<DataSet> GetDataMainHome()
        {
            return await _homeRepository.GetHomeData();
        }

        public async Task<DataSet> GetBookHomeDetail(int bookId)
        {
            var userId = AbpSession?.UserId.GetValueOrDefault() ?? 0;
            return await _homeRepository.GetBookHomeDetail(bookId, userId);
        }

        public async Task<DataSet> GetCommentOfRate(int rateId)
        {
            var userId = AbpSession?.UserId.GetValueOrDefault() ?? 0;
            return await _homeRepository.GetCommentOfRate(rateId, userId);
        }

        public async Task<DataTable> CreateOrDeleteComment(CommentDto input)
        {
            var userId = AbpSession?.UserId.GetValueOrDefault() ?? 0;
            return await _homeRepository.CreateOrDeleteComment(input, userId);
        }

        public async Task BookmarkBook(int bookId)
        {
            var userId = AbpSession?.UserId.GetValueOrDefault() ?? 0;
            await _homeRepository.BookmarkBook(bookId, userId);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public async Task<bool> BuyChapterOrAllBook(BuyBookDto input)
        {
            var userId = AbpSession?.UserId.GetValueOrDefault() ?? 0;
            
            //check so du coin
            var user = await GetCurrentUserAsync();
            user.Coin = user.Coin ?? 0;
            
            if (input.price > user.Coin)
            {
                return false;
            }
            
            var price = await _homeRepository.BuyChapterOrAllBook(input.bookId, input.chapterId, input.isAllBook, userId);
            user.Coin -= input.price;
            await _userRepository.UpdateAsync(user);

            var author = await _userRepository.FirstOrDefaultAsync(x => x.Id == input.authorId);
            author.Coin = author.Coin ?? 0;

            author.Coin += ConvertHelper.ToInt32(Math.Round(input.price * 0.9));
            await _userRepository.UpdateAsync(author);
            
            // insert noti
            var notiInput = new NotiInputDto()
            {
                bookId = input.bookId,
                chapterId = 0,
                noti_content = $"you got {input.price} coins for selling books name: {input.bookName}"
            };
            
            await _bookRepository.InsertNoti(notiInput, author.Id, true);
            await _bookRepository.InsertCoinChangeHistory(input, userId);

            return true;
        }

        public async Task FollowAuthor(int authorId)
        {
            var userId = AbpSession?.UserId.GetValueOrDefault() ?? 0;
            await _homeRepository.FollowAuthor(authorId, userId);
        }

        public async Task ReportBook(ReportBookDto input)
        {
            var userId = AbpSession?.UserId.GetValueOrDefault() ?? 0;
            await _homeRepository.ReportBook(input, userId);
        }

        public async Task InsertUpdateRateComment(RateBookInputDto input)
        {
            var userId = AbpSession?.UserId.GetValueOrDefault() ?? 0;
            await _homeRepository.InsertUpdateRateComment(input, userId);
        }

        public async Task<DataTable> GetChapterDetail(int chapterId)
        {
            var userId = AbpSession?.UserId.GetValueOrDefault() ?? 0;
            return await _homeRepository.GetChapterDetail(chapterId, userId);
        }

        public async Task<DataSet> GetMyAccountData()
        {
            var userId = AbpSession?.UserId.GetValueOrDefault() ?? 0;
            return await _homeRepository.GetMyAccountData(userId);
        }

        public async Task<string> ChangePassword(LoginInput loginModel)
        {
            var currentUser = await GetCurrentUserAsync();
            var isCorrectPassword = await UserManager.CheckPasswordAsync(currentUser, loginModel.Password);

            if (!isCorrectPassword) return "Incorrect password!";
            await UserManager.ChangePasswordAsync(currentUser, loginModel.NewPassword);
            return "";

        }

        public async Task UpdateUserInfo(string firstName, string lastName)
        {
            var currentUser = await GetCurrentUserAsync();
            currentUser.Surname = firstName;
            currentUser.Name = lastName;
            
            await UserManager.UpdateAsync(currentUser);
        }

        public async Task<DataSet> GetBookByAuthor(AuthorBookFilter input)
        {
            return await _homeRepository.GetBookByAuthor(input, AbpSession.UserId.GetValueOrDefault());
        }

        public async Task<DataTable> GetBookBuyMost(BookMostFilter input)
        {
            return await _homeRepository.GetBookBuyMost(input, AbpSession.UserId.GetValueOrDefault(0));
        }

        public async Task<DataSet> GetBookByCategory(CategoryBookFilter input)
        {
            return await _homeRepository.GetBookByCategory(input);
        }

        public async Task<bool> CheckNewNoti()
        {
            var userId = AbpSession?.UserId.GetValueOrDefault() ?? 0;
            return await _homeRepository.CheckNewNoti(userId);
        }

        public async Task<DataTable> GetListNoti(int? page, int? pageSize)
        {
            var userId = AbpSession?.UserId.GetValueOrDefault() ?? 0;
            await _homeRepository.UpdateNotiStatus(userId);
            return await _homeRepository.GetListNoti(page.GetValueOrDefault(1), pageSize.GetValueOrDefault(20), userId);
        }

        public async Task<int> GetUserCoin()
        {
            var userId = AbpSession?.UserId.GetValueOrDefault() ?? 0;
            if (userId == 0)
            {
                return 0;
            }

            var user = await GetCurrentUserAsync();
            return user.Coin.GetValueOrDefault(0);
        }

        public async Task<DataTable> GetPaymentMethod(PaymentHistDto input)
        {
            return await _homeRepository.GetPaymentMethod(input, AbpSession.UserId.GetValueOrDefault(0));
        }

        public async Task<DataTable> GetPaymentMethodByUser(PaymentHistDto input)
        {
            return await _homeRepository.GetPaymentMethodByUser(input, AbpSession.UserId.GetValueOrDefault(0));
        }

        public async Task<DataTable> GetDataBienDongSoDu(PaymentHistDto input)
        {
            return await _homeRepository.GetDataBienDongSoDu(input, AbpSession.UserId.GetValueOrDefault(0));
        }

        public async Task ProcessPayment(int id, int status)
        {
            await _homeRepository.ProcessPayment(id, status, AbpSession.UserId.GetValueOrDefault(0));
        }

        public async Task<DataTable> GetPaymentMethodAdmin(PaymentHistDto input)
        {
            return await _homeRepository.GetPaymentMethod(input, 0);
        }

        public async Task CreatePaymentTicket(PaymentGenDto input)
        {
            await _homeRepository.CreatePaymentTicket(input, AbpSession.UserId.GetValueOrDefault(0));
        }

        /// <summary>
        /// 
        /// </summary>
        public async Task UpdateNotiStatus()
        {
            await _homeRepository.UpdateNotiStatus(AbpSession.UserId.GetValueOrDefault(0));
        }
        
    }

    public interface IHomeAppService: IApplicationService
    {
        Task<IEnumerable<CategorySelectItemDto>> GetCategoryForSelect();
        Task<DataSet> GetDataMainHome();
        Task<DataSet> GetBookHomeDetail(int bookId);
        Task<DataSet> GetCommentOfRate(int rateId);
        Task<DataTable> CreateOrDeleteComment(CommentDto input);
        Task BookmarkBook(int bookId);
        Task<bool> BuyChapterOrAllBook(BuyBookDto input);
        Task FollowAuthor(int authorId);
        Task ReportBook(ReportBookDto input);
        Task InsertUpdateRateComment(RateBookInputDto input);
        Task<DataTable> GetChapterDetail(int chapterId);
        Task<DataSet> GetMyAccountData();
        Task<string> ChangePassword(LoginInput loginModel);
        Task UpdateUserInfo(string firstName, string lastName);
        Task<DataSet> GetBookByAuthor(AuthorBookFilter input);
        Task<DataTable> GetBookBuyMost(BookMostFilter input);
        Task<DataSet> GetBookByCategory(CategoryBookFilter input);
        Task<bool> CheckNewNoti();
        Task<DataTable> GetListNoti(int? page, int? pageSize);
        Task<int> GetUserCoin();
        Task<DataTable> GetPaymentMethod(PaymentHistDto input);
        Task<DataTable> GetPaymentMethodByUser(PaymentHistDto input);
        Task<DataTable> GetDataBienDongSoDu(PaymentHistDto input);
        Task<DataTable> GetPaymentMethodAdmin(PaymentHistDto input);
        Task ProcessPayment(int id, int status);
        Task CreatePaymentTicket(PaymentGenDto input);
        Task UpdateNotiStatus();
    }

    public class LoginInput
    {
        public string Password { get; set; }
        public string NewPassword { get; set; }
    }

}