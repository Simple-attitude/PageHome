using DTO;
using EntitySerives;
using EntitySerives.ModelSerives;
using MVCHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using WebUI.Models;

namespace WebUI.Controllers
{
    public class MainController : Controller
    {
        [HttpGet]
        public ActionResult Edit()
        {
            UserSerives serives = new UserSerives();
            UserDTO user= serives.GetUser((long)Session["UserId"]);
            return View(user);
        }
        [HttpPost]
        public ActionResult Edit(MainEditPwd model)
        {
            UserSerives serives = new UserSerives();
            var result= serives.EditPwd((long)Session["UserId"], model.Name, model.OldPassword, model.NewPassword);
            if (result)
            {
                return Json(new AjaxResult()
                {
                    Msg="修改成功",
                    Status="ok"
                });
            }
            else
            {
                return Json(new AjaxResult()
                {
                    Msg = "修改失败",
                    Status = "error"
                });
            }
        }
        // GET: Main
        public ActionResult Index()
        {
            UserSerives userSerives = new UserSerives();
            if (Session["UserId"]!=null)
            {
                UserDTO user = userSerives.GetUser((long)(Session["UserId"]));
                if (user.AdminUser != "管理员")
                {
                    return Redirect("Default/Index");
                }
                //userDTO = userSerives.GetUser(1);
                return View(user);
            }
            return Redirect("Default/Index");
        }
        public ActionResult Console()
        {
            ViewData["Articles"] = new ArticleSerives().GetArticles().Count;
            ViewData["Users"] = new UserSerives().GetUsers().Count;
            return View();
        }
    }
}