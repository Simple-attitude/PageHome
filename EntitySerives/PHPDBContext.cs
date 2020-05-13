using EntitySerives.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace EntitySerives
{
    public class PHPDBContext:DbContext
    {
        public PHPDBContext():base("name=connstr")
        {

        }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Configurations.AddFromAssembly(Assembly.GetExecutingAssembly());
        }
        public DbSet<Users>  Users { get; set; }
        public DbSet<Article>  Articles { get; set; }
    }
}
