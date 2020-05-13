using DTO;
using EntitySerives.Model;
using EntitySerives.ModelSerives;
using PagedList;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebUI.Controllers
{
    public class DefaultController : Controller
    {
        public ViewResult Index(int? page)
        {
            ArticleSerives serives = new ArticleSerives();
            var Articles = serives.GetArticles().OrderBy(e=>e.CreateTime);
            int pageNumber = page ?? 1;
            int pageSize = 10;
            IPagedList<ArticleDTO> pagedList = Articles.ToPagedList(pageNumber, pageSize);
            ViewData["pagedList"] = pagedList;
            return View(pagedList);
        }
        // GET: Default
        public ActionResult Article()
        {
            ArticleSerives article = new ArticleSerives();
            List<ArticleDTO> list  = article.GetArticles();
            return View(list);
        }
        public ActionResult Single(long ? id) 
        {
            ArticleSerives article = new ArticleSerives();
            long a = id ?? 1;
            var result= article.GetArticle(a);
            UserSerives serives = new UserSerives();
            UserDTO user = serives.GetUser(1);
            ViewData["User"] = user;
            return View(result);
        }
        public ActionResult Search(string typeName)
        {
            ArticleSerives serives = new ArticleSerives();
            List<ArticleDTO> list = null;
            list= serives.GetArticles(typeName);
            return View(list);
        }
    }
}