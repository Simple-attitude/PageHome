using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntitySerives.Model
{
    public class Article:BaseModel
    {
        public string Title { get; set; }
        public string Content { get; set; }
        public DateTime ?UpdateTime { get; set; }
        public long  UserId { get; set; }
        public string TypeName { get; set; }

        public virtual Users  Users { get; set; }
        //public virtual ICollection<Image> Images { get; set; }

    }
}
