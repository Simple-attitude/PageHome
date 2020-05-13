using DTO;
using EntitySerives.ModelSerives;
using MVCHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using WebUI.Models;

namespace WebUI.Controllers
{
    public class UserController : Controller
    {
        public ActionResult Search(string startTime,string endTime, string username)
        {
            UserSerives serives = new UserSerives();
            var data= serives.Search(startTime, endTime, username);
            return Json(new TableData<UserDTO>
            {
                Code = 0,
                Count = data.Count,
                Data = data,
                Msg = "查询成功"
            }) ;
        }
        [HttpGet]
        public ActionResult Edit(long id)
        {
            if (Session["UserId"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            UserSerives serives = new UserSerives();
            UserDTO user= serives.GetUser(id);
            return View(user);
        }
        [HttpPost]
        public ActionResult Edit(UserModel user)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return Json(new AjaxResult()
                    {
                        Status = "error",
                        Msg = CommonHelper.GetValidMsg(ModelState)
                    });
                }
                UserSerives serives = new UserSerives();
                serives.Edit(user.Id,user.Name,user.PhoneNum,user.Email,user.AdminUser);
                return Json(new AjaxResult() { 
                    Status="ok",
                    Msg="修改成功"
                });
            }
            catch (Exception ex)
            {
                return Json(new AjaxResult()
                {
                    Status = "error",
                    Msg = ex.Message
                });
            }
        }
        /// <summary>
        /// 批量删除
        /// </summary>
        /// <param name="idsStr"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult ManyDelete(long [] idsStr) 
        {
            foreach (var item in idsStr)
            {
                UserSerives serives = new UserSerives();
                serives.Delete(item);
            }
            return Json(new AjaxResult()
            {
                Status = "ok",
                Msg = "删除成功"
            }) ;
        }
        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Delete(long id) {
            UserSerives serives = new UserSerives();
            serives.Delete(id);
            return Json(new AjaxResult() { Status= "ok", Msg="删除成功" });
        }
        public ActionResult List(int page,int limit) {
            if (Session["UserId"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            UserSerives user = new UserSerives();
            List<UserDTO> users = user.GetUsers(page, limit);
            int count = user.GetUsers().Count;
                return Json(new TableData<UserDTO>
                {
                    Code = 0,
                    Count = count,
                    Msg = "查询成功",
                    Data = users
                });
            

        }
        // GET: User
        public ActionResult Index()
        {
            if (Session["UserId"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            return View();
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
        public ActionResult Add(UserDTO model)
        {
            long result = new UserSerives().AddNew(model.Name, model.PhoneNum,model.AdminUser, model.Email, model.Password);
            if (result != -1)
            {
                return Json(new AjaxResult() { Status = "ok", Msg = "添加成功" });
            }
            else
            {
                return Json(new AjaxResult() { Status = "error",Msg="手机号已存在" });
            }
        }
        public ActionResult Edit()
        {
            if (Session["UserId"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            return View();
        }
    }
}