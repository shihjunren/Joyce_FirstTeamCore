using Microsoft.AspNetCore.Mvc;

namespace FirstTeamCore.Controllers
{
    public class MemberController : SuperController
    {
        public IActionResult Info()
        {
            return View();
        }

        public IActionResult Review()
        {
            return View();
        }
    }
}
