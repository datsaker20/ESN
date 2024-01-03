using Abp.Application.Services;
using Abp.Runtime.Session;
using ESN.Dtos;
using ESN.EntityFramework.Repositories;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Abp.Authorization;
using Abp.Domain.Repositories;
using ESN.Authorization.Users;
using ESN.Dtos.Admin;
using System.Data.SqlClient;

namespace ESN.Books
{

    public class BooksAppService : ESNAppServiceBase, IBooksAppService
    {
        private readonly IBookRepository _bookRepository;
        private readonly IRepository<User, long> _repository;

        public BooksAppService(IBookRepository bookRepository, IRepository<User, long> repository)
        {
            _bookRepository = bookRepository;
            _repository = repository;
        }

        public async Task<IEnumerable<CategorySelectItemDto>> GetCategoryForSelect()
        {
            return await _bookRepository.GetCategoryForSelect();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="input"></param>
        public async Task CreateOrEditBook(BookCreateOrEditDto input)
        {
            switch (input.action)
            {
                case "publish" when (input.trangThai == 1 || input.trangThai == 4):
                // chờ duyệt
                case "publish" when input.trangThai == 3 && input.isChange:
                    input.trangThai = 2; // chờ duyệt
                    break;
                case "reject":
                    input.trangThai = 4;
                    break;
                case "approve":
                    input.trangThai = 3;
                    break;
            }

            await _bookRepository.SaveBook(input, AbpSession.UserId.GetValueOrDefault());
        }

        public async Task<DataTable> DanhSachBookCuaToi(BookCuaToiFilter input)
        {
            var userId = AbpSession?.UserId.GetValueOrDefault() ?? 0;
            return await _bookRepository.DanhSachBookCuaToi(input, userId);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="bookId"></param>
        public async Task DeleteBook(int bookId)
        {
            var userId = AbpSession?.UserId.GetValueOrDefault() ?? 1;
            await _bookRepository.DeleteBook(bookId, userId);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="bookId"></param>
        /// <returns></returns>
        public async Task<DataSet> GetBookDetail(int bookId)
        {
            return await _bookRepository.GetBookDetail(bookId);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="keyword"></param>
        /// <param name="status"></param>
        /// <param name="isMyApprove"></param>
        /// <returns></returns>
        public async Task<DataSet> GetApproveList(string keyword, int? status, bool isMyApprove, int? rowOffset, int? maxResultCount)
        {
            var userId = AbpSession?.UserId.GetValueOrDefault() ?? 1;
            return await _bookRepository.GetApproveList(keyword, status, isMyApprove ? userId : 0, rowOffset ?? 0, maxResultCount ?? 20);
        }

        /// <summary>
        /// delete single chapter
        /// </summary>
        /// <param name="chapterId"></param>
        public async Task DeleteChapter(int chapterId)
        {
            var userId = AbpSession?.UserId.GetValueOrDefault() ?? 1;
            await _bookRepository.DeleteChapter(chapterId, userId);
        }

        /**
         * create or edit single chapter
         */
        public async Task CreateOrEditChapter(ChapterCreateOrEdit input)
        {
            var userId = AbpSession?.UserId.GetValueOrDefault() ?? 1;
            if (input.action == "publish")
            {
                if (input.isChange || (input.isPublish && input.trangThai == 1)) // nháp publish hoặc đã đăng nhưng thay đổi nội dung, thì gửi duyệt
                {
                    input.trangThai = 2; // gui duyet
                }
            }

            await _bookRepository.CreateOrEditChapter(input, userId);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="input"></param>
        public async Task InsertNoti(NotiInputDto input)
        {
            var userId = AbpSession?.UserId.GetValueOrDefault() ?? 0;
            await _bookRepository.InsertNoti(input, userId, false);
        }

        [AbpAuthorize()]
        public async Task RechargeUser(int coin, long userId)
        {
            var user = await _repository.FirstOrDefaultAsync(x => x.Id == userId);
            var currentCoin = user.Coin ?? 0;
            user.Coin = currentCoin + coin;

            await _repository.UpdateAsync(user);
        }

        public async Task UpdateChapterIsPublic(int chapterId, bool isShow)
        {
            var userId = AbpSession?.UserId.GetValueOrDefault() ?? 1;

            await _bookRepository.UpdateChapterIsPublic(chapterId, isShow, userId);
        }

        public async Task<DataTable> GetBestSellers()
        {
            return await _bookRepository.GetBestSellers();
        }
    }

    public interface IBooksAppService : IApplicationService
    {
        Task<IEnumerable<CategorySelectItemDto>> GetCategoryForSelect();

        Task CreateOrEditBook(BookCreateOrEditDto input);

        Task<DataTable> DanhSachBookCuaToi(BookCuaToiFilter input);

        Task DeleteBook(int bookId);
        Task<DataSet> GetBookDetail(int bookId);
        Task<DataSet> GetApproveList(string keyword, int? status, bool isMyApprove, int? rowOffset, int? maxResultCount);
        Task DeleteChapter(int chapterId);
        Task CreateOrEditChapter(ChapterCreateOrEdit input);
        Task InsertNoti(NotiInputDto input);
        Task RechargeUser(int coin, long userId);
        Task UpdateChapterIsPublic(int chapterId, bool isShow);
        Task<DataTable> GetBestSellers();
    }
}
