using System.Web;
using System.Web.Mvc;

namespace Quizzess_Online_FinalVersion
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
