using DTO;
using MVCHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;

namespace EntitySerives.ModelSerives
{
    public class UserSerives
    {
        public bool EditPwd(long id, string name, string oldPassword, string newPassword)
        {
            using (PHPDBContext ctx=new PHPDBContext())
            {
                BaseSerives<Users> serives = new BaseSerives<Users>(ctx);
                var user= serives.GetById(id);
                string solt = user.PasswordSalt;
                string pwd = CommonHelper.CalcMD5(oldPassword + solt);
                if (pwd==user.PasswordHash)
                {
                    string newPwd = CommonHelper.CalcMD5(newPassword + solt);
                    user.Name = name;
                    user.PasswordHash = newPwd;
                    ctx.SaveChanges();
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
        public List<UserDTO> Search(string startTime, string endTime, string username)
        {
            List<UserDTO> list = new List<UserDTO>();
            if (startTime != string.Empty && endTime != string.Empty)
            {
                DateTime start = Convert.ToDateTime(startTime).Date;
                DateTime end = Convert.ToDateTime(endTime).Date;
                using (PHPDBContext ctx = new PHPDBContext())
                {
                    BaseSerives<Users> serives = new BaseSerives<Users>(ctx);
                    var result = serives.GetAll().Where(e => e.CreateTime > start && e.CreateTime < end).Where(e => e.Name.Contains(username));
                    foreach (var item in result.ToList())
                    {
                        UserDTO user = new UserDTO();
                        user.Id = item.Id;
                        user.Name = item.Name;
                        user.PhoneNum = item.PhoneNum;
                        user.AdminUser = item.AdminUser;
                        user.CreateTime = item.CreateTime;
                        user.Email = item.Email;
                        list.Add(user);
                    }
                    return list;
                }
            }
            else
            {
                using (PHPDBContext ctx = new PHPDBContext())
                {
                    BaseSerives<Users> serives = new BaseSerives<Users>(ctx);
                    var result = serives.GetAll().Where(e => e.Name.Contains(username));
                    foreach (var item in result.ToList())
                    {
                        UserDTO user = new UserDTO();
                        user.Id = item.Id;
                        user.Name = item.Name;
                        user.PhoneNum = item.PhoneNum;
                        user.AdminUser = item.AdminUser;
                        user.CreateTime = item.CreateTime;
                        user.Email = item.Email;
                        list.Add(user);
                    }
                    return list;
                }
            }
        }

        public void Edit(long id, string name, string phoneNum, string email, string adminUser)
        {
            using (PHPDBContext ctx = new PHPDBContext())
            {
                BaseSerives<Users> serives = new BaseSerives<Users>(ctx);
                var user = serives.GetById(id);
                user.Name = name;
                user.PhoneNum = phoneNum;
                user.Email = email;
                user.AdminUser = adminUser;
                ctx.SaveChanges();
            }
        }

        /// <summary>
        /// 删除用户
        /// </summary>
        /// <param name="id"></param>
        public void Delete(long id)
        {
            using (PHPDBContext context = new PHPDBContext())
            {
                BaseSerives<Users> serives = new BaseSerives<Users>(context);
                serives.MarkDeleted(id);
                context.SaveChanges();
            }
        }

        /// <summary>
        /// 获取所有用户
        /// </summary>
        /// <returns></returns>
        public List<UserDTO> GetUsers()
        {
            List<UserDTO> list = new List<UserDTO>();
            using (PHPDBContext context = new PHPDBContext())
            {
                BaseSerives<Users> baseSerives = new BaseSerives<Users>(context);
                var result = baseSerives.GetAll();                
                foreach (var item in result)
                {
                    UserDTO user = new UserDTO();
                    user.Id = item.Id;
                    user.Name = item.Name;
                    user.PhoneNum = item.PhoneNum;
                    user.Email = item.Email;
                    user.CreateTime = item.CreateTime;
                    user.AdminUser = item.AdminUser;
                    list.Add(user);
                }
            }
            return list;
        }
        public List<UserDTO> GetUsers(int page, int limit)
        {
            List<UserDTO> list = new List<UserDTO>();
            using (PHPDBContext context = new PHPDBContext())
            {
                var result = context.Users.Where(e => e.IsDeleted == false).OrderBy(e=>e.Id).Skip((page - 1) * limit).Take(limit);
                foreach (var item in result)
                {
                    UserDTO user = new UserDTO();
                    user.Id = item.Id;
                    user.Name = item.Name;
                    user.PhoneNum = item.PhoneNum;
                    user.Email = item.Email;
                    user.CreateTime = item.CreateTime;
                    user.AdminUser = item.AdminUser;
                    list.Add(user);
                }
            }
            return list;
        }
        /// <summary>
        /// 添加用户
        /// </summary>
        /// <param name="name">用户名</param>
        /// <param name="phone">账号</param>
        /// <param name="email">电子邮箱</param>
        /// <param name="pwd">密码</param>
        /// <returns></returns>
        public long AddNew(string name, string phone, string adminUser, string email, string pwd)
        {
            using (PHPDBContext context = new PHPDBContext())
            {
                BaseSerives<Users> baseSerives = new BaseSerives<Users>(context);
                bool exists = baseSerives.GetAll().Any(e => e.PhoneNum == phone);
                if (exists)
                {
                    return -1;
                }
                else
                {
                    Users user = new Users();
                    user.PhoneNum = phone;
                    user.Name = name;
                    user.Email = email;
                    user.AdminUser = adminUser;
                    string salt = CommonHelper.CreateVerifyCode(4);
                    string hash = CommonHelper.CalcMD5(pwd + salt);
                    user.PasswordHash = hash;
                    user.PasswordSalt = salt;
                    context.Users.Add(user);
                        context.SaveChanges();
                                return user.Id;
                }
            }
        }

        /// <summary>
        /// 获取用户数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public UserDTO GetUser(long id)
        {
            using (PHPDBContext context = new PHPDBContext())
            {
                BaseSerives<Users> serives = new BaseSerives<Users>(context);
                Users user = serives.GetById(id);
                UserDTO userDTO = new UserDTO();
                userDTO.Id = user.Id;
                userDTO.AdminUser = user.AdminUser;
                userDTO.Name = user.Name;
                userDTO.PhoneNum = user.PhoneNum;
                userDTO.Email = user.Email;
                return userDTO;
            }
        }

        /// <summary>
        /// 获取手机号是否存在
        /// </summary>
        /// <param name="phone"></param>
        /// <returns></returns>
        public long GetPhoneById(string phone)
        {
            using (PHPDBContext context = new PHPDBContext())
            {
                long id = new BaseSerives<Users>(context).GetAll().SingleOrDefault(e => e.PhoneNum == phone).Id;
                return id;
            }
        }

        /// <summary>
        /// 登录判断
        /// </summary>
        /// <param name="phone"></param>
        /// <param name="pwd"></param>
        /// <returns></returns>
        public bool CheckLogin(string phone, string pwd)
        {
            using (PHPDBContext context = new PHPDBContext())
            {
                BaseSerives<Users> baseSerives = new BaseSerives<Users>(context);
                var user = baseSerives.GetAll().SingleOrDefault(e => e.PhoneNum == phone);
                if (user != null)
                {
                    string hash = user.PasswordHash;
                    string salt = user.PasswordSalt;
                    string password = CommonHelper.CalcMD5(pwd + salt);
                    return password == hash;
                }
                return false;
            }
        }
    }
}