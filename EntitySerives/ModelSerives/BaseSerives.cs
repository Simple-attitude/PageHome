using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntitySerives.ModelSerives
{
    public class BaseSerives<T> where T:BaseModel
    {
        private PHPDBContext  pHPDB;
        public BaseSerives( PHPDBContext pHPDB)
        {
            this.pHPDB = pHPDB;
        }
        public IQueryable<T> GetAll() 
        {
            return pHPDB.Set<T>().Where(e => e.IsDeleted == false);
        }
        public T GetById(long id)
        {
            return pHPDB.Set<T>().SingleOrDefault(e => e.Id == id);
        }
        public void MarkDeleted(long id)
        {
            var data = GetById(id);
            data.IsDeleted = true;
            pHPDB.SaveChanges();
        }
    }
}
