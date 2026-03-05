using System.Text;
using System.Text.Json;

namespace TicketBookingUI.Services
{
    public class ApiService
    {
        private readonly HttpClient _httpClient;

        public ApiService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<List<string>> GetEvents()
        {
            var response = await _httpClient.GetAsync("/events");

            response.EnsureSuccessStatusCode();

            var json = await response.Content.ReadAsStringAsync();

            return JsonSerializer.Deserialize<List<string>>(json);
        }

        public async Task<string> Login(object loginData)
        {
            var content = new StringContent(
                JsonSerializer.Serialize(loginData),
                Encoding.UTF8,
                "application/json");

            var response = await _httpClient.PostAsync("/auth/login", content);

            return await response.Content.ReadAsStringAsync();
        }

        public async Task<string> Register(object registerData)
        {
            var content = new StringContent(
                JsonSerializer.Serialize(registerData),
                Encoding.UTF8,
                "application/json");

            var response = await _httpClient.PostAsync("/auth/register", content);

            return await response.Content.ReadAsStringAsync();
        }
    }
}