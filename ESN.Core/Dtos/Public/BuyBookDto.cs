using System.Collections.Generic;

namespace ESN.Dtos.Public
{
    public class BuyBookDto
    {
        public int bookId { get; set; }
        public string bookName { get; set; }
        public List<int> chapterId { get; set; }
        public bool isAllBook { get; set; }
        public int price { get; set; }
        public int authorId { get; set; }
    }
}