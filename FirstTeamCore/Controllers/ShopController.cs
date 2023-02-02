using Microsoft.AspNetCore.Mvc;

namespace FirstTeamCore.Controllers
{
    public class ShopController : SuperController
    {
        public IActionResult ShopOrder()
        {
            return View();
        }

        public IActionResult ShopDetail()
        {
            return View();
        }


    }
}
