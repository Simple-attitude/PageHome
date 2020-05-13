using EntitySerives.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntitySerives
{
    public class Users : BaseModel
    {
        public string Name { get; set; }
        public string Email { get; set; }
        public string PhoneNum { get; set; }
        public string PasswordHash { get; set; }
        public string PasswordSalt { get; set; }
        public  string AdminUser { get; set; }
        public virtual ICollection<Article>  Articles { get; set; }
    }
}
