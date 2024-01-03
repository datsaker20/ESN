using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ESN.Dtos
{
    public class BookCreateOrEditDto
    {
        public int? id { get; set; }
        public string anhBiaUrl { get; set; }
        public long? giaTronBo { get; set; }
        public string moTa { get; set; }
        public string tenTruyen { get; set; }
        public List<CategorySelectItemDto> theLoai { get; set; }
        public List<ChapterCreateOrEdit> listChapter { get; set; }
        public int? trangThai { get; set; }
        public bool isDeleted { get; set; }
        public bool isPublish { get; set; }
        public string action { get; set; }
        public bool isChange { get; set; }
        public bool isFreeBook { get; set; }
        public bool isCompleted { get; set; }

    }

    public class ChapterCreateOrEdit
    {
        public int? id { get; set; }
        public long? giaBan { get; set; }
        public string noiDung { get; set; }
        public string tieuDe { get; set; }
        public int? trangThai { get; set; }
        public int? bookId { get; set; }
        public bool isDeleted { get; set; }
        public bool isPublish { get; set; }
        public bool isChange { get; set; }
        public string action { get; set; }
        public string uniq { get; set; }
    }

    public class BookCuaToiFilter
    {
        public string Term { get; set; }
        public int? page { get; set; }
        public int? pageSize { get; set; }

    }

    public class NotiInputDto
    {
        public int? id { get; set; }
        public int? bookId { get; set; }
        public int? chapterId { get; set; }
        public string noti_content { get; set; }
    }
}
