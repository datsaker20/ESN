namespace ESN.Dtos.Public
{
    public class ReportBookDto
    {
        public int bookId { get; set; }
        public int? chapterId { get; set; }
        public string comment { get; set; }
        public int? type { get; set; }
    }

    public class RateBookInputDto
    {
        public int bookId { get; set; }
        public int rate { get; set; }
        public string rateComment { get; set; }
        public bool isDeleted { get; set; }
    }
}