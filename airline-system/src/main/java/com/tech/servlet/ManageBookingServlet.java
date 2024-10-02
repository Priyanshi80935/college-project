package com.tech.servlet;

import com.tech.dao.BookingDao;  // Update to use BookingDao
import com.tech.model.Booking;    // Update to use Booking model

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/booking")  // Change servlet mapping
public class ManageBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingDao bookingDao;  // Use BookingDao instead of UserDao

    @Override
    public void init() throws ServletException {
        bookingDao = new BookingDao(); // Initialize DAO for booking interactions
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        
        if (action == null || action.isEmpty()) {
            viewBookings(req, resp);  // Method for viewing bookings
        } else {
            handleActions(req, resp, action);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action != null) {
            try {
                handleActions(req, resp, action);
            } catch (Exception e) {
                e.printStackTrace();
                resp.sendRedirect("error.jsp");
            }
        }
    }

    private void handleActions(HttpServletRequest req, HttpServletResponse resp, String action) throws IOException, ServletException {
        switch (action) {
            case "add":
                addBooking(req, resp);   // Method for adding a booking
                break;
            case "edit":
                editBooking(req, resp);  // Method for editing a booking
                break;
            case "update":
                updateBooking(req, resp); // Method for updating a booking
                break;
            case "delete":
                deleteBooking(req, resp); // Method for deleting a booking
                break;
            case "view":
            default:
                viewBookings(req, resp);   // Method for viewing bookings
                break;
        }
    }

    private void editBooking(HttpServletRequest req, HttpServletResponse resp) {
        String id = req.getParameter("id");
        Booking booking = bookingDao.findById(id);  // Fetch booking by ID
        req.setAttribute("currentBooking", booking);
        try {
            viewBookings(req, resp);
        } catch (IOException | ServletException e) {
            e.printStackTrace();
        }
    }

    private void addBooking(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        // Collect booking data from request
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String departureCity = req.getParameter("departureCity");
        String destinationCity = req.getParameter("destinationCity");
        String departureDate = req.getParameter("departureDate");
        String returnDate = req.getParameter("returnDate");
        int numberOfPassengers = Integer.parseInt(req.getParameter("numberOfPassengers"));
        String paymentMethod = req.getParameter("paymentMethod");

        // Create a new Booking object
        Booking booking = new Booking();
        booking.setFullName(fullName);
        booking.setEmail(email);
        booking.setDepartureCity(departureCity);
        booking.setDestinationCity(destinationCity);
        booking.setDepartureDate(java.sql.Date.valueOf(departureDate)); // Assuming proper date format
        booking.setReturnDate(java.sql.Date.valueOf(returnDate)); // Assuming proper date format
        booking.setNumberOfPassengers(numberOfPassengers);
        booking.setPaymentMethod(paymentMethod);

        // Add booking to the database
        bookingDao.addBooking(booking);

        // Redirect back to the booking list
        viewBookings(req, resp);
    }

    private void updateBooking(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        // Collect updated booking data
        String id = req.getParameter("id"); // Using String for id
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String departureCity = req.getParameter("departureCity");
        String destinationCity = req.getParameter("destinationCity");
        String departureDate = req.getParameter("departureDate");
        String returnDate = req.getParameter("returnDate");
        int numberOfPassengers = Integer.parseInt(req.getParameter("numberOfPassengers"));
        String paymentMethod = req.getParameter("paymentMethod");

        // Update the booking object
        Booking booking = new Booking();
        booking.setId(Integer.parseInt(id)); // Assuming id is still an int in the Booking class
        booking.setFullName(fullName);
        booking.setEmail(email);
        booking.setDepartureCity(departureCity);
        booking.setDestinationCity(destinationCity);
        booking.setDepartureDate(java.sql.Date.valueOf(departureDate));
        booking.setReturnDate(java.sql.Date.valueOf(returnDate));
        booking.setNumberOfPassengers(numberOfPassengers);
        booking.setPaymentMethod(paymentMethod);

        // Update booking in the database
        bookingDao.updateBooking(booking);

        // Refresh the booking list
        viewBookings(req, resp);
    }

    private void deleteBooking(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        int id =Integer.parseInt (req.getParameter("id"));

        // Delete the booking from the database
        bookingDao.deleteBooking(id); // Assuming deleteBooking accepts a string ID

        // Refresh the booking list
        viewBookings(req, resp);
    }

    private void viewBookings(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        // Retrieve the list of bookings from the database
        List<Booking> bookings = bookingDao.viewBookings();

        // Set the list of bookings as an attribute to the request
        req.setAttribute("bookings", bookings);

        // Forward to the manage-booking.jsp page to display bookings
        req.getRequestDispatcher("booking.jsp").forward(req, resp);
    }
}
