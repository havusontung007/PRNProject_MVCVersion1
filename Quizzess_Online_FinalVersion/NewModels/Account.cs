using Quizzess_Online_FinalVersion.DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Quizzess_Online_FinalVersion.NewModels
{
    public class Account
    {
        private string username;
        private string password;
        private string email;
        private string fullname;

        public Account(string username, string password, string email, string fullname)
        {
            this.Username = username;
            this.Password = password;
            this.Email = email;
            this.Fullname = fullname;
        }

        public string Username { get => username; set => username = value; }
        public string Password { get => password; set => password = value; }
        public string Email { get => email; set => email = value; }
        public string Fullname { get => fullname; set => fullname = value; }
        public static List<Account> GetAllAccount()
        {
            List<Account> account = new List<Account>();
            DataTable dataTable = AccountDAL.GetAllAccount();
            foreach (DataRow dr in dataTable.Rows)
            {
                string username = dr[0].ToString();
                string password = dr[1].ToString();
                string email = dr[2].ToString();
                string fullname = dr[3].ToString();
                Account acc = new Account(username, password, email, fullname);
                account.Add(acc);
            }
            return account;
        }
        public static int AddAccount(string username, string pass, string email, string fullname)
        {
            return AccountDAL.AddAccount(username,  pass,  email,fullname);
        }
    }
}