namespace TicketBookingUI.Models
{
    public class Booking
    {
        public int Id { get; set; }

        public int EventId { get; set; }

        public int UserId { get; set; }

        public DateTime BookedAt { get; set; }
    }
}