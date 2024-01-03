namespace ESN.Dtos.Public
{
    public class CommentDto
    {
        public int? Id { get; set; }
        public int RateId { get; set; }
        public string Comment { get; set; }
        public bool IsDelete { get; set; }
    }
}