using Microsoft.AspNetCore.Mvc;
using TicketBookingUI.Services;

namespace TicketBookingUI.Controllers
{
    public class HomeController : Controller
    {
        private readonly ApiService _apiService;

        public HomeController(ApiService apiService)
        {
            _apiService = apiService;
        }

        public async Task<IActionResult> Index()
        {
            var events = await _apiService.GetEvents();

            return View(events);
        }
    }
}