using Abp.EntityFramework;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ESN.Dtos;
using ESN.Dtos.Public;

namespace ESN.EntityFramework.Repositories
{
    public class BookRepository : ESNRepositoryBase, IBookRepository
    {
        public BookRepository(IDbContextProvider<ESNDbContext> dbContextProvider) : base(dbContextProvider)
        {
        }

        public async Task<IEnumerable<CategorySelectItemDto>> GetCategoryForSelect()
        {
            var result = new List<CategorySelectItemDto>();
            using (var command = CreateCommand("prc_suggestion_SuggestByKey"))
            {
                command.Parameters.Add(new SqlParameter("@keyCode", "category"));
                command.Parameters.Add(new SqlParameter("@term", string.Empty));

                using (var dataReader = await command.ExecuteReaderAsync())
                {
                    string[] array = { "Data" };
                    var ds = new DataSet();
                    ds.Load(dataReader, LoadOption.OverwriteChanges, array);
                    if (ds.Tables.Count > 0)
                    {
                        result = ds.Tables[0].AsEnumerable().Select(MapItemCategorySelect).ToList();
                    }
                }
            }

            return result;
        }

        /// <summary>
        /// create, edit, delete book
        /// </summary>
        /// <param name="input"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        public async Task<int> SaveBook(BookCreateOrEditDto input, long userId)
        {
            var bookId = 0;
            using (var command = CreateCommand("prc_book_createOrEditBook"))
            {
                command.Parameters.Add(new SqlParameter("@id", input.id));
                command.Parameters.Add(new SqlParameter("@anhBiaUrl", input.anhBiaUrl));
                command.Parameters.Add(new SqlParameter("@giaTronBo", input.giaTronBo ?? 0));
                command.Parameters.Add(new SqlParameter("@moTa", input.moTa ?? string.Empty));
                command.Parameters.Add(new SqlParameter("@trangThai", input.trangThai ?? 1));
                command.Parameters.Add(new SqlParameter("@tenTruyen", input.tenTruyen));
                command.Parameters.Add(new SqlParameter("@ownerId", userId));
                command.Parameters.Add(new SqlParameter("@isDeleted", input.isDeleted));
                command.Parameters.Add(new SqlParameter("@isPublish", input.isPublish));
                command.Parameters.Add(new SqlParameter("@approverid", userId));
                command.Parameters.Add(new SqlParameter("@isFreeBook", input.isFreeBook));
                command.Parameters.Add(new SqlParameter("@isCompleted", input.isCompleted));

                if (input.theLoai != null && input.theLoai.Count > 0)
                {
                    command.Parameters.Add(new SqlParameter("@theLoai", string.Join(",", input.theLoai.Select(x => x.Id))));
                }

                if (input.id.GetValueOrDefault(0) == 0)
                {
                    command.Parameters.Add(new SqlParameter("@bookNo", Guid.NewGuid().ToString()));
                }

                bookId = ConvertHelper.ToInt32(await command.ExecuteScalarAsync());
            }

            if (input.listChapter != null && input.listChapter.Count > 0)
            {
                foreach (var chapter in input.listChapter)
                {
                    if (input.isDeleted)
                    {
                        chapter.isDeleted = true;
                    }
                    chapter.bookId = input.id.GetValueOrDefault(0) == 0 ? bookId : bookId != input.id ? input.id : bookId;
                    await SaveChapter(chapter, userId);
                }
            }

            return bookId;
        }

        /// <summary>
        /// create, edit, delete chapter
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public async Task SaveChapter(ChapterCreateOrEdit input, long userId)
        {
            using (var command = CreateCommand("prc_book_createOrEditChapter"))
            {
                command.Parameters.Add(new SqlParameter("@id", input.id));
                command.Parameters.Add(new SqlParameter("@giaBan", input.giaBan));
                command.Parameters.Add(new SqlParameter("@noiDung", input.noiDung));
                command.Parameters.Add(new SqlParameter("@tieuDe", input.tieuDe));
                command.Parameters.Add(new SqlParameter("@trangThai", input.trangThai ?? 1));
                command.Parameters.Add(new SqlParameter("@bookId", input.bookId));
                command.Parameters.Add(new SqlParameter("@isDeleted", input.isDeleted));
                command.Parameters.Add(new SqlParameter("@isPublish", input.isPublish));
                command.Parameters.Add(new SqlParameter("@approverid", userId));

                if (input.id.GetValueOrDefault(0) == 0)
                {
                    command.Parameters.Add(new SqlParameter("@chapterNo", Guid.NewGuid().ToString()));
                }

                await command.ExecuteNonQueryAsync();
            }
        }

        /// <summary>
        /// danh sach Book cua toi
        /// </summary>
        /// <param name="input"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        public async Task<DataTable> DanhSachBookCuaToi(BookCuaToiFilter input, long userId)
        {
            var result = new DataTable();
            using (var command = CreateCommand("prc_MyBook"))
            {
                command.Parameters.Add(new SqlParameter("@term", (input.Term ?? string.Empty).Trim().ToLower()));
                command.Parameters.Add(new SqlParameter("@page", input.page ?? 1));
                command.Parameters.Add(new SqlParameter("@pageSize", input.pageSize ?? 10));

                command.Parameters.Add(new SqlParameter("@userId", userId));

                using (var dataReader = await command.ExecuteReaderAsync())
                {
                    string[] array = { "Data" };
                    var ds = new DataSet();
                    ds.Load(dataReader, LoadOption.OverwriteChanges, array);
                    if (ds.Tables.Count > 0)
                    {
                        return ds.Tables[0];
                    }
                }
            }

            return result;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="bookId"></param>
        /// <param name="userId"></param>
        public async Task DeleteBook(int bookId, long userId)
        {
            using (var command = CreateCommand("prc_book_delete"))
            {
                command.Parameters.Add(new SqlParameter("@bookId", bookId));
                command.Parameters.Add(new SqlParameter("@userId", userId));

                await command.ExecuteNonQueryAsync();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="bookId"></param>
        /// <returns></returns>
        public async Task<DataSet> GetBookDetail(int bookId)
        {
            var ds = new DataSet();
            using (var command = CreateCommand("prc_book_getDetail"))
            {
                command.Parameters.Add(new SqlParameter("@bookId", bookId));

                using (var dataReader = await command.ExecuteReaderAsync())
                {
                    string[] array = { "bookData", "chapterData" };
                    ds = new DataSet();
                    ds.Load(dataReader, LoadOption.OverwriteChanges, array);
                }
            }

            return ds;
        }

        private CategorySelectItemDto MapItemCategorySelect(DataRow row)
        {
            return new CategorySelectItemDto()
            {
                Id = ConvertHelper.ToInt32(row["Id"]),
                Name = ConvertHelper.ToString(row["name"]),
                ParentId = ConvertHelper.ToInt32(row["parent_id"], 0),
            };
        }

        /// <summary>
        /// get approve book list data
        /// </summary>
        /// <param name="keyword"></param>
        /// <param name="status"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        public async Task<DataSet> GetApproveList(string keyword, int? status, long userId, int? rowOffset, int? maxResultCount)
        {
            var ds = new DataSet();
            using (var command = CreateCommand("prc_book_getApproveData"))
            {
                command.Parameters.Add(new SqlParameter("@keyword", keyword));
                command.Parameters.Add(new SqlParameter("@status", status));
                command.Parameters.Add(new SqlParameter("@userId", userId));
                command.Parameters.Add(new SqlParameter("@pageOffset", rowOffset));
                command.Parameters.Add(new SqlParameter("@maxItem", maxResultCount));

                using (var dataReader = await command.ExecuteReaderAsync())
                {
                    string[] array = { "data", "totalCount" };
                    ds = new DataSet();
                    ds.Load(dataReader, LoadOption.OverwriteChanges, array);
                }
            }

            return ds;
        }

        /// <summary>
        /// delete chapter by id
        /// </summary>
        /// <param name="chapterId"></param>
        /// <param name="userId"></param>
        public async Task DeleteChapter(int chapterId, long userId)
        {
            using (var command = CreateCommand("prc_chapter_delete"))
            {
                command.Parameters.Add(new SqlParameter("@chapterId", chapterId));
                command.Parameters.Add(new SqlParameter("@userId", userId));

                await command.ExecuteNonQueryAsync();
            }
        }

        /// <summary>
        /// create or edit single chapter
        /// </summary>
        /// <param name="input"></param>
        /// <param name="userId"></param>
        public async Task CreateOrEditChapter(ChapterCreateOrEdit input, long userId)
        {
            await SaveChapter(input, userId);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="input"></param>
        /// <param name="userId"></param>
        public async Task InsertNoti(NotiInputDto input, long userId, bool isForAutorOnly)
        {
            using (var command = CreateCommand("prc_notification_Insert"))
            {
                command.Parameters.Add(new SqlParameter("@bookId", input.bookId));
                command.Parameters.Add(new SqlParameter("@chapterId", input.chapterId));
                command.Parameters.Add(new SqlParameter("@noti_content", input.noti_content));
                command.Parameters.Add(new SqlParameter("@userId", userId));
                command.Parameters.Add(new SqlParameter("@isNotiForAuthor", isForAutorOnly));

                await command.ExecuteNonQueryAsync();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="input"></param>
        /// <param name="userId"></param>
        public async Task InsertCoinChangeHistory(BuyBookDto input, long userId)
        {
            using (var command = CreateCommand("prc_insert_blanceChange"))
            {
                command.Parameters.Add(new SqlParameter("@bookId", input.bookId));

                command.Parameters.Add(new SqlParameter("@isAllBook", input.isAllBook));
                command.Parameters.Add(new SqlParameter("@userId", userId));
                command.Parameters.Add(new SqlParameter("@price", input.price));
                command.Parameters.Add(new SqlParameter("@authorId", input.authorId));

                if (input.chapterId != null && input.chapterId.Count > 0)
                {
                    command.Parameters.Add(new SqlParameter("@chapterIds", string.Join(",", input.chapterId)));
                }

                await command.ExecuteNonQueryAsync();
            }
        }

        /// <summary>
        /// update chapter public or not
        /// </summary>
        /// <param name="chapterId"></param>
        /// <param name="isShow"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        public async Task UpdateChapterIsPublic(int chapterId, bool isShow, long userId)
        {
            using (var command = CreateCommand("prc_updateChapterIsPublic"))
            {
                command.Parameters.Add(new SqlParameter("@chapterId", chapterId));
                command.Parameters.Add(new SqlParameter("@isShow", isShow));
                command.Parameters.Add(new SqlParameter("@userId", userId));

                await command.ExecuteNonQueryAsync();
            }
        }

        public async Task<DataTable> GetBestSellers()
        {
            using (var command = CreateCommand("prc_book_get10BestSellers"))
            {
                using (var dataReader = await command.ExecuteReaderAsync())
                {
                    string[] array = { "Data" };
                    var ds = new DataSet();
                    ds.Load(dataReader, LoadOption.OverwriteChanges, array);
                    return ds.Tables[0];
                }
            }
        }

        //public async Task<DataTable> GetListReport(CategoryFilterDto input)
        //{
        //    using (var command = CreateCommand("prc_report_getList"))
        //    {
        //        command.Parameters.Add(new SqlParameter("@term", (input.term ?? string.Empty).Trim().ToLower()));
        //        command.Parameters.Add(new SqlParameter("@page", input.page ?? 1));
        //        command.Parameters.Add(new SqlParameter("@pageSize", input.pageSize ?? 10));


        //        using (var dataReader = await command.ExecuteReaderAsync())
        //        {
        //            string[] array = { "Data" };
        //            var ds = new DataSet();
        //            ds.Load(dataReader, LoadOption.OverwriteChanges, array);
        //            return ds.Tables[0];
        //        }
        //    }
        //}
    }

    public interface IBookRepository
    {
        Task<IEnumerable<CategorySelectItemDto>> GetCategoryForSelect();
        Task<int> SaveBook(BookCreateOrEditDto input, long userId);
        Task<DataTable> DanhSachBookCuaToi(BookCuaToiFilter input, long userId);

        Task DeleteBook(int bookId, long userId);
        Task<DataSet> GetBookDetail(int bookId);
        Task<DataSet> GetApproveList(string keyword, int? status, long userId, int? rowOffset, int? maxResultCount);
        Task DeleteChapter(int chapterId, long userId);
        Task CreateOrEditChapter(ChapterCreateOrEdit input, long userId);
        Task InsertNoti(NotiInputDto input, long userId, bool isForAutorOnly);
        Task InsertCoinChangeHistory(BuyBookDto input, long userId);
        Task UpdateChapterIsPublic(int chapterId, bool isShow, long userId);
        Task<DataTable> GetBestSellers();
    }
}
