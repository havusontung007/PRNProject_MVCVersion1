using Quizzess_Online_FinalVersion.NewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace Quizzess_Online_FinalVersion.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            List<Account> accnt = NewModels.Account.GetAllAccount();
            string pass = Encryptor.MD5Hash(password);
            foreach (Account account in accnt)
            { 
                if (username.Equals(account.Username) || username.Equals(account.Email))
                {
                    if (password.Equals(account.Password))
                    {
                        Session["user"] = account.Username;
                    

                        return RedirectToAction("Index", "Home");
                       }
                    
                    else
                    {
                        break;
                }}

            }

            ViewData["ErrorAccount"] = "Username or password is wrong!!!";
            return View();

        }
        public ActionResult Logout()
        {
            Session["user"] = null;

            return RedirectToAction("Index", "Home");
        }
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]

        public ActionResult Register(string username, string password, string email, string fullname)
        {
            int a = checkAccount(username);
            if(a == 1)
            {
                ViewData["message"] = "Username: " + username + "đã tồn tại, nhập một username khác";
                return View();
            }
            else
            {
            Account.AddAccount(username,  password, email, fullname);
                ViewData["RegisterSuccess"] = "Register succesfully, pls Log in";

                Session["user"] = username;

                return RedirectToAction("Index", "Home");
            }
        }
        public int checkAccount(string username)
        {
            int a = 0;
            List<Account> accnt = NewModels.Account.GetAllAccount();
            foreach (Account account in accnt)
            {
                if (username.Equals(account.Username))
                {
                    a = 1; break;
                }
                else
                {

                     a = 0;

                }
            }



            return a;
        }
        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");

            }
            return byte2String;
        }

    }
}