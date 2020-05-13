using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace EntitySerives
{
    public abstract class BaseModel
    {
        public long Id { get; set; }
        public DateTime CreateTime { get; set; } = DateTime.Now;
        public DateTime ? DeleteTime { get; set; }
        public bool IsDeleted { get; set; } = false;

    }
}
