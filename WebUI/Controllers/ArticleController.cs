using DTO;
using EntitySerives.Model;
using EntitySerives.ModelSerives;
using MVCHelper;
using System;
using System.Linq;
using System.Web.Mvc;
using WebUI.Models;

namespace WebUI.Controllers
{
    public class ArticleController : Controller
    {

        [HttpGet]
        public ActionResult Edit(long id) 
        {
            if (Session["UserId"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            ArticleSerives serives = new ArticleSerives();
            ArticleDTO article= serives.GetArticle(id);
            return View(article);
        }
        [HttpPost]
        public ActionResult Edit(ArticleModel article)
        {
            long userId = (long)Session["UserId"];
            ArticleSerives serives = new ArticleSerives();
            var result= serives.Edit(article.Id,userId,article.Title,article.TypeName,article.Content);
            if (result==-1)
            {
                return Json(new AjaxResult() { Status = "error", Msg = "此文章名已存在" });
            }
            else
            {
                return Json(new AjaxResult() { Status = "ok", Msg = "编辑成功" });
            }
        }
        [HttpPost]
        public ActionResult Add(ArticleModel article)
        {
            long userId = (long)Session["UserId"];
            ArticleSerives serives = new ArticleSerives();
            var result= serives.Add(article.Title,article.TypeName,article.Content,userId);
            if (result>0)
            {
                return Json(new AjaxResult() { Status="ok",Msg="添加成功" });
            }
            else
            {
                return Json(new AjaxResult() { Status = "error", Msg = "添加失败" });
            }
        }
        [HttpGet]
        public ActionResult Add() {
            if (Session["UserId"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            return View();
        }
        [HttpPost]
        public ActionResult ManyDelete(long[] idsStr)
        {
            ArticleSerives serives = new ArticleSerives();
            foreach (var item in idsStr)
            {
                serives.Delete(item);
            }
            return Json(new AjaxResult() { 
                Status="ok",
                Msg="删除成功"  
            });
        }
        [HttpPost]
        public ActionResult Delete(long id)
        {
            ArticleSerives serives = new ArticleSerives();
            serives.Delete(id);
            return Json(new AjaxResult() { 
             Status="ok",
             Msg="删除成功"
            });
        }
        // GET: Article
        public ActionResult ArticleList()
        {
            if (Session["UserId"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            return View();
        }
        public ActionResult List(int page,int limit)
        {
            if (Session["UserId"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            ArticleSerives serives = new ArticleSerives();
            var data = serives.GetArticles(page,limit);
            int count = serives.GetArticles().Count;
            return Json(new TableData<ArticleDTO>
            {
                Code = 0,
                Count = count,
                Msg = "查询成功",
                Data = data
            });
        }
        public ActionResult SearchList(string startTime, string endTime, string title)
        {
            if (Session["UserId"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            ArticleSerives serives = new ArticleSerives();
            var data = serives.GetArticles(startTime,endTime,title);
            return Json(new TableData<ArticleDTO>
            {
                Code = 0,
                Count = data.Count,
                Msg = "查询成功",
                Data = data
            });
        }
    }
}