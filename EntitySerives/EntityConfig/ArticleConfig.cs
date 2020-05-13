using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration;
using EntitySerives.Model;

namespace EntitySerives.EntityConfig
{
    public class ArticleConfig:EntityTypeConfiguration<Article>
    {
        public ArticleConfig()
        {
            ToTable("Article");
            this.Property(e => e.Title).HasMaxLength(20).IsRequired();
            this.Property(e => e.Content).IsRequired();
            //HasMany(e => e.Images).WithRequired(e => e.Article).HasForeignKey(e => e.ArticleId).WillCascadeOnDelete(false); 
        }
    }
}
