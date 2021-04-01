using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Quizzess_Online_FinalVersion.DAO
{
    public class AccountDAL
    {
        public static DataTable GetAllAccount()
        {
            string sql = "SELECT * FROM [User]";
            return Database.GetDataBySQL(sql);
        }

        public static int AddAccount(string username, string pass, string email, string fullname)
        {
            string sql = "INSERT INTO[dbo].[User] VALUES(@username, @password, @email, @fullname)";
            SqlParameter[] param = new SqlParameter[] {
                new SqlParameter("@username", SqlDbType.VarChar),
                new SqlParameter("@password", SqlDbType.VarChar),
                 new SqlParameter("@email", SqlDbType.NVarChar),
                new SqlParameter("@fullname", SqlDbType.NVarChar)
            };
            // Gan gia tri cho cac tham so kieu SqlParameter

            param[0].Value = username;
            param[1].Value = pass;
            param[2].Value = email;
            param[3].Value = fullname;


            return Database.ExecuteSQL(sql, param);
        }
        

        
    }
}