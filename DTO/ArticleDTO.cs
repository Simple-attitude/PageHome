using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class ArticleDTO:BaseDTO
    {
        public string Title { get; set; }
        public string TypeName { get; set; }
        public string Content { get; set; }
        public string UserName { get; set; }
        public DateTime? UpdateTime { get; set; }
    }
}
