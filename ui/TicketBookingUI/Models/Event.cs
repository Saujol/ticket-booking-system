namespace TicketBookingUI.Models
{
    public class Event
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public string Location { get; set; }

        public int AvailableSeats { get; set; }
    }
}