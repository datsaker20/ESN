namespace ESN.Dtos.Admin
{
    public class CategoryFilterDto
    {
        public int? page { get; set; }
        public int? pageSize { get; set; }
        public string term { get; set; }
        
    }
}