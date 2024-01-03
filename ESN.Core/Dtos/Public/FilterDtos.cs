namespace ESN.Dtos.Public
{
    public class FilterDtos
    {
        
    }
    
    public class AuthorBookFilter
    {
        public int? page { get; set; }
        public int? pageSize { get; set; }
        public int authorId { get; set; }
        public string sortBy { get; set; }
    }
    
    public class BookMostFilter
    {
        public int? page { get; set; }
        public int? pageSize { get; set; }
        public string mode { get; set; }
    }
    
    public class CategoryBookFilter
    {
        public int? page { get; set; }
        public int? pageSize { get; set; }
        public int? categoryId { get; set; }
        public string sortBy { get; set; }
        public string keyword { get; set; }
    }

    public class PaymentHistDto
    {
        public int? page { get; set; }
        public int? pageSize { get; set; }
        public string term { get; set; }
    }

    public class PaymentGenDto
    {
        public string code { get; set; }
        public int amount { get; set; }
    }
}