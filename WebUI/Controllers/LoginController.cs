using CaptchaGen;
using EntitySerives.ModelSerives;
using MVCHelper;
using System.IO;
using System.Web.Mvc;
using WebUI.Models;

namespace WebUI.Controllers
{
    public class LoginController : Controller
    {
        // GET: User
        //我的第一个MVC项目
        public ActionResult Index()
        {
            return View();
        }
        /// <summary>
        /// 主页
        /// </summary>
        /// <returns></returns>
        public ActionResult Home()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
        /// <summary>
        /// 注册
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Register(RegisterModel model)
        {
            if (!ModelState.IsValid)
            {
                return Json(new AjaxResult() { Status = "error", Msg = CommonHelper.GetValidMsg(ModelState) });
            }
            if (model.CaptCha!=(string)TempData["CaptCha"])
            {
                return Json(new AjaxResult() { Status="error",Msg="验证码错误"});
            }
            long result = new UserSerives().AddNew(model.Name,model.PhoneNum,"",model.Email,model.Password);
            if (result!=-1)
            {
                return Json(new AjaxResult() { Status = "ok",Msg="登陆成功"});
            }
            else
            {
                return Json(new AjaxResult() {Status="error",Msg="手机号已存在" });
            }
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        /// <summary>
        /// 登录
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Login(LoginModel user)
        {
            if (!ModelState.IsValid)
            {
                return Json(new AjaxResult() { Status = "error", Msg = CommonHelper.GetValidMsg(ModelState) });
            }
            if (user.CaptCha != (string)TempData["CaptCha"])
            {
                return Json(new AjaxResult() { Status = "error", Msg = "验证码错误" });
            }
            bool result = new UserSerives().CheckLogin(user.PhoneNum,user.Password);
            if (result)
            {
                Session["UserId"] = new UserSerives().GetPhoneById(user.PhoneNum);
                return Json(new AjaxResult() { Status = "ok" , Msg = "登陆成功" });
            }
            else
            {
                return Json(new AjaxResult() {Status="error",Msg="用户名或密码错误" });
            }
        }
        /// <summary>
        /// 验证码
        /// </summary>
        /// <returns></returns>
        public ActionResult CreateCaptCha()
        {
            string chap = CommonHelper.CreateVerifyCode(4);
            TempData["CaptCha"] = chap;
            MemoryStream ms = ImageFactory.GenerateImage(chap, 60, 150, 20, 6);
            return File(ms,"image/jpeg");
        }
    }
}