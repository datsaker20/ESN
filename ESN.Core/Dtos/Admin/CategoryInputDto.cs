namespace ESN.Dtos.Admin
{
    public class CategoryInputDto
    {
        public int? id { get; set; }
        public string name { get; set; }
        public int? order { get; set; }
        public int? parent_id { get; set; }
        public bool is_display { get; set; }
        public bool is_deleted { get; set; }

    }
}