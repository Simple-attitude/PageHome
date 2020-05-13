using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration;

namespace EntitySerives.EntityConfig
{
    public class UserConfig:EntityTypeConfiguration<Users>
    {
        public UserConfig()
        {
            ToTable("User");
            this.Property(e => e.PhoneNum).HasMaxLength(11).IsRequired();
            this.Property(e => e.Name).IsRequired().HasMaxLength(50);
            this.Property(e => e.Email).IsRequired().HasMaxLength(50).IsUnicode(false);
            this.Property(e => e.PasswordHash).IsRequired().IsUnicode(false);
            this.Property(e => e.PasswordSalt).IsRequired().IsUnicode(false);
            this.Property(e => e.AdminUser).IsRequired().HasMaxLength(20);
            HasMany(e => e.Articles).WithRequired(e => e.Users).HasForeignKey(e => e.UserId).WillCascadeOnDelete(false);
        }
    }
}
