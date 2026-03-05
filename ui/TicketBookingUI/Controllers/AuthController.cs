using Microsoft.AspNetCore.Mvc;
using TicketBookingUI.Models;
using TicketBookingUI.Services;

namespace TicketBookingUI.Controllers
{
    public class AuthController : Controller
    {
        private readonly ApiService _apiService;

        public AuthController(ApiService apiService)
        {
            _apiService = apiService;
        }

        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(User user)
        {
            var result = await _apiService.Login(user);

            ViewBag.Message = result;

            return View();
        }

        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Register(User user)
        {
            var result = await _apiService.Register(user);

            ViewBag.Message = result;

            return View();
        }
    }
}