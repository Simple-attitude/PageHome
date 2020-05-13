using DTO;
using EntitySerives.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntitySerives.ModelSerives
{
    public class ArticleSerives
    {
        public List<ArticleDTO> GetArticles(string typeName)
        {
            using (PHPDBContext ctx = new PHPDBContext())
            {
                List<ArticleDTO> articles = new List<ArticleDTO>();
                BaseSerives<Article> serives = new BaseSerives<Article>(ctx);
                var result= serives.GetAll().Where(e => e.TypeName == typeName).ToList();
                foreach (var item in result)
                {
                    ArticleDTO article = new ArticleDTO();
                    article.Id = item.Id;
                    article.Title = item.Title;
                    article.TypeName = item.TypeName;
                    article.Content = item.Content;
                    article.CreateTime = item.CreateTime;
                    article.UserName = item.Users.Name;
                    articles.Add(article);
                }
                return articles;
            }
        }
        public long Edit(long id, long userID, string title, string typeName, string content)
        {
            using (PHPDBContext ctx = new PHPDBContext())
            {
                BaseSerives<Article> serives = new BaseSerives<Article>(ctx);
                var exists = serives.GetAll().All(e => e.Title == title);
                if (exists)
                {
                    return -1;
                }
                var result = serives.GetById(id);
                result.Content = content;
                result.Title = title;
                result.TypeName = typeName;
                result.UpdateTime = DateTime.Now;
                result.UserId = userID;
                ctx.SaveChanges();
                return result.Id;
            }
        }
        public ArticleDTO GetArticle(long id)
        {
            using (PHPDBContext ctx = new PHPDBContext())
            {
                BaseSerives<Article> serives = new BaseSerives<Article>(ctx);
                var result = serives.GetById(id);
                ArticleDTO article = new ArticleDTO();
                article.Id = result.Id;
                article.Title = result.Title;
                article.Content = result.Content;
                article.TypeName = result.TypeName;
                article.CreateTime = result.CreateTime;
                article.UserName = result.Users.Name;
                return article;
            }
        }
        public long Add(string title, string typeName, string content, long userID)
        {
            using (PHPDBContext ctx = new PHPDBContext())
            {
                Article article = new Article();
                article.Title = title;
                article.TypeName = typeName;
                article.Content = content;
                article.UserId = userID;
                ctx.Articles.Add(article);
                ctx.SaveChanges();
                return article.Id;
            }
        }
        public void Delete(long id)
        {
            using (PHPDBContext ctx = new PHPDBContext())
            {
                BaseSerives<Article> serives = new BaseSerives<Article>(ctx);
                serives.MarkDeleted(id);
                ctx.SaveChanges();
            }
        }
        public List<ArticleDTO> GetArticles(int page,int limit)
        {
            List<ArticleDTO> list = new List<ArticleDTO>();
            using (PHPDBContext ctx = new PHPDBContext())
            {
                BaseSerives<Article> serives = new BaseSerives<Article>(ctx);
                var result = serives.GetAll().Include(e=>e.Users).Where(e=>e.IsDeleted==false).OrderBy(e=>e.Id).Skip((page-1)*limit).Take(limit);
                foreach (var item in result.ToList())
                {
                    ArticleDTO article = new ArticleDTO();
                    article.Id = item.Id;
                    article.Title = item.Title;
                    article.TypeName = item.TypeName;
                    article.UserName = item.Users.Name;
                    article.Content = item.Content;
                    article.CreateTime = item.CreateTime;
                    article.UpdateTime = item.UpdateTime;
                    list.Add(article);
                }
                return list;
            }

        }
        public List<ArticleDTO> GetArticles()
        {
            List<ArticleDTO> list = new List<ArticleDTO>();
            using (PHPDBContext ctx = new PHPDBContext())
            {
                BaseSerives<Article> serives = new BaseSerives<Article>(ctx);
                var result = serives.GetAll();
                foreach (var item in result.ToList())
                {
                    ArticleDTO article = new ArticleDTO();
                    article.Id = item.Id;
                    article.Title = item.Title;
                    article.TypeName = item.TypeName;
                    article.UserName = item.Users.Name;
                    article.Content = item.Content;
                    article.CreateTime = item.CreateTime;
                    article.UpdateTime = item.UpdateTime;
                    list.Add(article);
                }
                return list;
            }

        }
        public List<ArticleDTO> GetArticles(string startTime, string endTime, string title)
        {
            List<ArticleDTO> list = new List<ArticleDTO>();
            if (startTime!=string.Empty&&endTime!=string.Empty)
            {
                DateTime start = Convert.ToDateTime(startTime).Date;
                DateTime end = Convert.ToDateTime(endTime).Date;
                using (PHPDBContext ctx = new PHPDBContext())
                {
                    BaseSerives<Article> serives = new BaseSerives<Article>(ctx);
                    var result = serives.GetAll().Where(e => e.CreateTime > start && e.CreateTime < end).Where(e => e.Title.Contains(title));
                    foreach (var item in result.ToList())
                    {
                        ArticleDTO article = new ArticleDTO();
                        article.Id = item.Id;
                        article.Title = item.Title;
                        article.TypeName = item.TypeName;
                        article.UserName = item.Users.Name;
                        article.Content = item.Content;
                        article.CreateTime = item.CreateTime;
                        article.UpdateTime = item.UpdateTime;
                        list.Add(article);
                    }
                    return list;
                }

            }
            else
            {
                using (PHPDBContext ctx = new PHPDBContext())
                {
                    BaseSerives<Article> serives = new BaseSerives<Article>(ctx);
                    var result = serives.GetAll().Where(e => e.Title.Contains(title));
                    foreach (var item in result.ToList())
                    {
                        ArticleDTO article = new ArticleDTO();
                        article.Id = item.Id;
                        article.Title = item.Title;
                        article.TypeName = item.TypeName;
                        article.UserName = item.Users.Name;
                        article.Content = item.Content;
                        article.CreateTime = item.CreateTime;
                        article.UpdateTime = item.UpdateTime;
                        list.Add(article);
                    }
                    return list;
                }
            }


        }
    }
}
