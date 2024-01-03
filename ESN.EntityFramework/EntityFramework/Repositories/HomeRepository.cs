using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using Abp.EntityFramework;
using ESN.Dtos.Public;

namespace ESN.EntityFramework.Repositories
{
    public class HomeRepository : ESNRepositoryBase, IHomeRepository
    {
        public HomeRepository(IDbContextProvider<ESNDbContext> dbContextProvider) : base(dbContextProvider)
        {
        }

        public async Task<DataSet> GetHomeData()
        {
            using (var command = CreateCommand("prc_home_getHomeMainData"))
            {
                using (var dataReader = await command.ExecuteReaderAsync())
                {
                    string[] array = { "bookNews", "bookSellest", "bookRead", "bookRate" };
                    var ds = new DataSet();
                    ds.Load(dataReader, LoadOption.OverwriteChanges, array);
                    return ds;
                }
            }
        }

        /// <summary>
        /// GetBookHomeDetail
        /// </summary>
        /// <param name="bookId"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        public async Task<DataSet> GetBookHomeDetail(int bookId, long userId)
        {
            using (var command = CreateCommand("prc_home_getHomeBookDetail"))
            {
                command.Parameters.Add(new SqlParameter("@bookId", bookId));
                command.Parameters.Add(new SqlParameter("@userId", userId));
                
                using (var dataReader = await command.ExecuteReaderAsync())
                {
                    string[] array = { "bookData", "chapters", "rateting", "bookRate", "bookInterest", "buyChapter"};
                    var ds = new DataSet();
                    ds.Load(dataReader, LoadOption.OverwriteChanges, array);
                    return ds;
                }
            }
        }

        /// <summary>
        /// get c
        /// </summary>
        /// <param name="rateId"></param>
        /// <returns></returns>
        public async Task<DataSet> GetCommentOfRate(int rateId, long userId)
        {
            using (var command = CreateCommand("prc_home_getCommentOfRate"))
            {
                command.Parameters.Add(new SqlParameter("@rateId", rateId));
                command.Parameters.Add(new SqlParameter("@userId", userId));
                
                using (var dataReader = await command.ExecuteReaderAsync())
                {
                    string[] array = { "comments"};
                    var ds = new DataSet();
                    ds.Load(dataReader, LoadOption.OverwriteChanges, array);
                    return ds;
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="input"></param>
        /// <param name="useId"></param>
        /// <returns></returns>
        public async Task<DataTable> CreateOrDeleteComment(CommentDto input, long useId)
        {
            using (var command = CreateCommand("prc_home_createOrDeleteComment"))
            {
                command.Parameters.Add(new SqlParameter("@Id", input.Id));
                command.Parameters.Add(new SqlParameter("@RateId", input.RateId));
                command.Parameters.Add(new SqlParameter("@Comment", input.Comment));
                command.Parameters.Add(new SqlParameter("@IsDelete", input.IsDelete));
                command.Parameters.Add(new SqlParameter("@UseId", useId));

                using (var dataReader = await command.ExecuteReaderAsync())
                {
                    string[] array = { "data"};
                    var ds = new DataSet();
                    ds.Load(dataReader, LoadOption.OverwriteChanges, array);

                    if (ds.Tables.Count > 0)
                    {
                        return ds.Tables[0];
                    }
                    else
                    {
                        return null;
                    }
                }
            }
        }

        public async Task BookmarkBook(int bookId, long useId)
        {
            using (var command = CreateCommand("prc_home_BookmarkBook"))
            {
                command.Parameters.Add(new SqlParameter("@bookId", bookId));
                command.Parameters.Add(new SqlParameter("@useId", useId));

                await command.ExecuteNonQueryAsync();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="bookId"></param>
        /// <param name="chapterId"></param>
        /// <param name="isAllBook"></param>
        /// <param name="userId"></param>
        public async Task<int> BuyChapterOrAllBook(int bookId, List<int> chapterId, bool isAllBook, long userId)
        {
            int price = 0;
            if (isAllBook)
            {
                chapterId = new List<int>() {bookId};
            }

            if (chapterId != null && chapterId.Count > 0)
            {
                foreach (var id in chapterId)
                {
                    using (var command = CreateCommand("prc_home_BuyChapterOrAllBook"))
                    {
                        command.Parameters.Add(new SqlParameter("@bookId", bookId));
                        command.Parameters.Add(new SqlParameter("@chapterId", isAllBook ? 0 : id));
                        command.Parameters.Add(new SqlParameter("@isAllBook", isAllBook));
                        command.Parameters.Add(new SqlParameter("@userId", userId));

                        price += ConvertHelper.ToInt32(await command.ExecuteScalarAsync());
                    }
                }
            }

            return price;
        }

        /// <summary>
        /// follow author
        /// </summary>
        /// <param name="authorId"></param>
        /// <param name="userId"></param>
        public async Task FollowAuthor(int authorId, long userId)
        {
            using (var command = CreateCommand("prc_home_FollowAuthor"))
            {
                command.Parameters.Add(new SqlParameter("@authorId", authorId));
                command.Parameters.Add(new SqlParameter("@userId", userId));

                await command.ExecuteNonQueryAsync();
            }
        }

        /// <summary>
        /// report book
        /// </summary>
        /// <param name="bookId"></param>
        /// <param name="comment"></param>
        /// <param name="userId"></param>
        public async Task ReportBook(ReportBookDto input, long userId)
        {
            using (var command = CreateCommand("prc_home_ReportBook"))
            {
                command.Parameters.Add(new SqlParameter("@bookId", input.bookId));
                command.Parameters.Add(new SqlParameter("@userId", userId));
                command.Parameters.Add(new SqlParameter("@comment", input.comment));
                command.Parameters.Add(new SqlParameter("@type", input.type ?? 1));
                command.Parameters.Add(new SqlParameter("@chapterId", input.chapterId ?? 0));

                await command.ExecuteNonQueryAsync();
            }
        }

        public async Task InsertUpdateRateComment(RateBookInputDto input, long userId)
        {
            using (var command = CreateCommand("prc_home_InsertUpdateRateComment"))
            {
                command.Parameters.Add(new SqlParameter("@bookId", input.bookId));
                command.Parameters.Add(new SqlParameter("@rate", input.rate));
                command.Parameters.Add(new SqlParameter("@rateComment", input.rateComment));
                command.Parameters.Add(new SqlParameter("@userId", userId));
                command.Parameters.Add(new SqlParameter("@isDeleted", input.isDeleted));

                await command.ExecuteNonQueryAsync();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="chapterId"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        public async Task<DataTable> GetChapterDetail(int chapterId, long userId)
        {
            using (var command = CreateCommand("prc_home_GetChapterDetail"))
            {
                command.Parameters.Add(new SqlParameter("@chapterId", chapterId));
                command.Parameters.Add(new SqlParameter("@useId", userId));

                using (var dataReader = await command.ExecuteReaderAsync())
                {
                    string[] array = { "data"};
                    var ds = new DataSet();
                    ds.Load(dataReader, LoadOption.OverwriteChanges, array);

                    return ds.Tables.Count > 0 ? ds.Tables[0] : null;
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public async Task<DataSet> GetMyAccountData(long userId)
        {
            using (var command = CreateCommand("prc_home_GetMyAccountData"))
            {
                command.Parameters.Add(new SqlParameter("@useId", userId));

                using (var dataReader = await command.ExecuteReaderAsync())
                {
                    string[] array = { "favoriteBook", "followAuthor", "notification", "accountInfo", "boughtBook"};
                    var ds = new DataSet();
                    ds.Load(dataReader, LoadOption.OverwriteChanges, array);

                    return ds;
                }
            }
        }

        public async Task<DataSet> GetBookByAuthor(AuthorBookFilter input, long userId)
        {
            using (var command = CreateCommand("prc_home_GetBookByAuthor"))
            {
                command.Parameters.Add(new SqlParameter("@authorId", input.authorId));
                command.Parameters.Add(new SqlParameter("@page", input.page ?? 1));
                command.Parameters.Add(new SqlParameter("@pageSize", input.pageSize ?? 10));
                command.Parameters.Add(new SqlParameter("@sortBy", input.sortBy));
                command.Parameters.Add(new SqlParameter("@userId", userId));

                using (var dataReader = await command.ExecuteReaderAsync())
                {
                    string[] array = { "data"};
                    var ds = new DataSet();
                    ds.Load(dataReader, LoadOption.OverwriteChanges, array);

                    return ds;
                }
            }
        }

        public async Task<DataTable> GetBookBuyMost(BookMostFilter input, long userId)
        {
            using (var command = CreateCommand("prc_home_GetBookBuyMost"))
            {
                command.Parameters.Add(new SqlParameter("@mode", input.mode));
                command.Parameters.Add(new SqlParameter("@page", input.page ?? 1));
                command.Parameters.Add(new SqlParameter("@pageSize", input.pageSize ?? 10));
                command.Parameters.Add(new SqlParameter("@userId", userId));

                using (var dataReader = await command.ExecuteReaderAsync())
                {
                    string[] array = { "data"};
                    var ds = new DataSet();
                    ds.Load(dataReader, LoadOption.OverwriteChanges, array);

                    return ds.Tables[0];
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public async Task<DataSet> GetBookByCategory(CategoryBookFilter input)
        {
            using (var command = CreateCommand("prc_home_GetBookByCategory"))
            {
                command.Parameters.Add(new SqlParameter("@categoryId", input.categoryId));
                command.Parameters.Add(new SqlParameter("@page", input.page ?? 1));
                command.Parameters.Add(new SqlParameter("@pageSize", input.pageSize ?? 10));
                command.Parameters.Add(new SqlParameter("@sortBy", input.sortBy));
                command.Parameters.Add(new SqlParameter("@keyword", input.keyword));

                using (var dataReader = await command.ExecuteReaderAsync())
                {
                    string[] array = { "data", "subCategories"};
                    var ds = new DataSet();
                    ds.Load(dataReader, LoadOption.OverwriteChanges, array);

                    return ds;
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public async Task<bool> CheckNewNoti(long userId)
        {
            using (var command = CreateCommand("prc_home_CheckNewNoti"))
            {
                command.Parameters.Add(new SqlParameter("@userId", userId));

                var isExist = await command.ExecuteScalarAsync();
                return ConvertHelper.ToBoolean(isExist);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="page"></param>
        /// <param name="pageSize"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        public async Task<DataTable> GetListNoti(int page, int pageSize, long userId)
        {
            using (var command = CreateCommand("prc_notification_getListNoti"))
            {
                command.Parameters.Add(new SqlParameter("@page", page));
                command.Parameters.Add(new SqlParameter("@pageSize", pageSize));
                command.Parameters.Add(new SqlParameter("@userId", userId));

                using (var dataReader = await command.ExecuteReaderAsync())
                {
                    string[] array = { "data"};
                    var ds = new DataSet();
                    ds.Load(dataReader, LoadOption.OverwriteChanges, array);

                    return ds.Tables[0];
                }
            }
        }

        /// <summary>
        /// /
        /// </summary>
        /// <param name="input"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        public async Task<DataTable> GetPaymentMethod(PaymentHistDto input, long userId)
        {
            using (var command = CreateCommand("prc_payment_GetAll"))
            {
                command.Parameters.Add(new SqlParameter("@page", input.page));
                command.Parameters.Add(new SqlParameter("@pageSize", input.pageSize));
                command.Parameters.Add(new SqlParameter("@term", input.term));
                command.Parameters.Add(new SqlParameter("@userId", userId));

                using (var dataReader = await command.ExecuteReaderAsync())
                {
                    string[] array = { "data" };
                    var ds = new DataSet();
                    ds.Load(dataReader, LoadOption.OverwriteChanges, array);

                    return ds.Tables[0];
                }
            }
        }

        /// <summary>
        /// /
        /// </summary>
        /// <param name="input"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        public async Task<DataTable> GetPaymentMethodByUser(PaymentHistDto input, long userId)
        {
            try
            {
                using (var command = CreateCommand("prc_payment_GetByUser"))
                {
                    command.Parameters.Add(new SqlParameter("@page", input.page));
                    command.Parameters.Add(new SqlParameter("@pageSize", input.pageSize));
                    command.Parameters.Add(new SqlParameter("@term", input.term));
                    command.Parameters.Add(new SqlParameter("@userId", userId));

                    using (var dataReader = await command.ExecuteReaderAsync())
                    {
                        string[] array = { "data" };
                        var ds = new DataSet();
                        ds.Load(dataReader, LoadOption.OverwriteChanges, array);

                        return ds.Tables[0];
                    }
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine($"An error occurred: {ex.Message}");
                throw;
            }
        }


        /// <summary>
        /// GetDataBienDongSoDu
        /// </summary>
        /// <param name="input"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        public async Task<DataTable> GetDataBienDongSoDu(PaymentHistDto input, long userId)
        {
            using (var command = CreateCommand("prc_GetDataBienDongSoDu"))
            {
                command.Parameters.Add(new SqlParameter("@page", input.page));
                command.Parameters.Add(new SqlParameter("@pageSize", input.pageSize));
                command.Parameters.Add(new SqlParameter("@term", input.term));
                command.Parameters.Add(new SqlParameter("@userId", userId));

                using (var dataReader = await command.ExecuteReaderAsync())
                {
                    string[] array = { "data"};
                    var ds = new DataSet();
                    ds.Load(dataReader, LoadOption.OverwriteChanges, array);

                    return ds.Tables[0];
                }
            }
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <param name="status"></param>
        /// <param name="useId"></param>
        /// <returns></returns>
        public async Task ProcessPayment(int id, int status, long useId)
        {
            using (var command = CreateCommand("prc_payment_Process"))
            {
                command.Parameters.Add(new SqlParameter("@userId", useId));
                command.Parameters.Add(new SqlParameter("@id", id));
                command.Parameters.Add(new SqlParameter("@status", status));

                await command.ExecuteNonQueryAsync();
            }
        }

        public async Task CreatePaymentTicket(PaymentGenDto input, long userId)
        {
            using (var command = CreateCommand("prc_payment_Insert"))
            {
                command.Parameters.Add(new SqlParameter("@userId", userId));
                command.Parameters.Add(new SqlParameter("@amount", input.amount));
                command.Parameters.Add(new SqlParameter("@code", input.code));

                await command.ExecuteNonQueryAsync();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="userId"></param>
        public async Task UpdateNotiStatus(long userId)
        {
            using (var command = CreateCommand("prc_notification_updateReadStatus"))
            {
                command.Parameters.Add(new SqlParameter("@userId", userId));
                await command.ExecuteNonQueryAsync();
            }
        }
    }

    public interface IHomeRepository
    {
        Task<DataSet> GetHomeData();
        Task<DataSet> GetBookHomeDetail(int bookId, long userId);
        Task<DataSet> GetCommentOfRate(int rateId, long userId);
        Task<DataTable> CreateOrDeleteComment(CommentDto input, long useId);
        Task BookmarkBook(int bookId, long useId);
        Task<int> BuyChapterOrAllBook(int bookId, List<int> chapterId, bool isAllBook, long userId);
        Task FollowAuthor(int authorId, long userId);
        Task ReportBook(ReportBookDto input, long userId);
        Task InsertUpdateRateComment(RateBookInputDto input, long userId);
        Task<DataTable> GetChapterDetail(int chapterId, long userId);
        Task<DataSet> GetMyAccountData(long userId);
        
        Task<DataSet> GetBookByAuthor(AuthorBookFilter input, long userId);
        Task<DataSet> GetBookByCategory(CategoryBookFilter input);
        Task<bool> CheckNewNoti(long userId);
        Task<DataTable> GetListNoti(int page, int pageSize, long userId);
        
        Task<DataTable> GetPaymentMethod(PaymentHistDto input, long userId);
        Task<DataTable> GetPaymentMethodByUser(PaymentHistDto input, long userId);
        Task<DataTable> GetDataBienDongSoDu(PaymentHistDto input, long userId);
        
        Task ProcessPayment(int id, int status, long useId);
        Task CreatePaymentTicket(PaymentGenDto input, long userId);
        Task UpdateNotiStatus(long userId);

        Task<DataTable> GetBookBuyMost(BookMostFilter input, long userId);
    }
}