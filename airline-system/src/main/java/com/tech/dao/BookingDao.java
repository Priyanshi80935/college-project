package com.tech.dao;

import com.tech.model.Booking;
import com.tech.util.ConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookingDao {

    // Add a booking to the database
    public void addBooking(Booking booking) {
        try {
            Connection connection = ConnectionUtil.getConnection();
            String sql = "INSERT INTO bookings (fullName, email, departureCity, destinationCity, departureDate, returnDate, numberOfPassengers, paymentMethod) VALUES (?, ?, ?, ?, ?, ?, ?, ? )";
            
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, booking.getFullName());
                preparedStatement.setString(2, booking.getEmail());
                preparedStatement.setString(3, booking.getDepartureCity());
                preparedStatement.setString(4, booking.getDestinationCity());
                preparedStatement.setDate(5, new java.sql.Date(booking.getDepartureDate().getTime()));
                preparedStatement.setDate(6, new java.sql.Date(booking.getReturnDate().getTime()));
                preparedStatement.setInt(7, booking.getNumberOfPassengers());
                preparedStatement.setString(8, booking.getPaymentMethod());
                
                preparedStatement.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Retrieve all bookings from the database
    public List<Booking> viewBookings() {
        List<Booking> bookings = new ArrayList<>();
        try {
            Connection connection = ConnectionUtil.getConnection();
            String sql = "SELECT id, fullName, email, departureCity, destinationCity, departureDate, returnDate, numberOfPassengers, paymentMethod FROM bookings";
            
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        Booking booking = new Booking();
                        booking.setId(resultSet.getInt("id"));
                        booking.setFullName(resultSet.getString("fullName"));
                        booking.setEmail(resultSet.getString("email"));
                        booking.setDepartureCity(resultSet.getString("departureCity"));
                        booking.setDestinationCity(resultSet.getString("destinationCity"));
                        booking.setDepartureDate(resultSet.getDate("departureDate"));
                        booking.setReturnDate(resultSet.getDate("returnDate"));
                        booking.setNumberOfPassengers(resultSet.getInt("numberOfPassengers"));
                        booking.setPaymentMethod(resultSet.getString("paymentMethod"));
                        
                        bookings.add(booking);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookings;
    }

    // Update booking information
    public void updateBooking(Booking booking) {
        try {
            Connection connection = ConnectionUtil.getConnection();
            String sql = "UPDATE bookings SET fullName = ?, email = ?, departureCity = ?, destinationCity = ?, departureDate = ?, returnDate = ?, numberOfPassengers = ?, paymentMethod = ? WHERE id = ?";
            
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, booking.getFullName());
                preparedStatement.setString(2, booking.getEmail());
                preparedStatement.setString(3, booking.getDepartureCity());
                preparedStatement.setString(4, booking.getDestinationCity());
                preparedStatement.setDate(5, new java.sql.Date(booking.getDepartureDate().getTime()));
                preparedStatement.setDate(6, new java.sql.Date(booking.getReturnDate().getTime()));
                preparedStatement.setInt(7, booking.getNumberOfPassengers());
                preparedStatement.setString(8, booking.getPaymentMethod());
                preparedStatement.setInt(9, booking.getId());

                preparedStatement.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Delete a booking from the database
    public void deleteBooking(int id) {
        try {
            Connection connection = ConnectionUtil.getConnection();
            String sql = "DELETE FROM bookings WHERE id = ?";
            
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, id);
                preparedStatement.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Find a booking by ID
    public Booking findById(String id) {
        Booking booking = null;
        try {
            Connection connection = ConnectionUtil.getConnection();
            String sql = "SELECT id, fullName, email, departureCity, destinationCity, departureDate, returnDate, numberOfPassengers, paymentMethod FROM bookings WHERE id = ?";
            
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setLong(1, Long.valueOf(id));
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        booking = new Booking();
                        booking.setId(resultSet.getInt("id"));
                        booking.setFullName(resultSet.getString("fullName"));
                        booking.setEmail(resultSet.getString("email"));
                        booking.setDepartureCity(resultSet.getString("departureCity"));
                        booking.setDestinationCity(resultSet.getString("destinationCity"));
                        booking.setDepartureDate(resultSet.getDate("departureDate"));
                        booking.setReturnDate(resultSet.getDate("returnDate"));
                        booking.setNumberOfPassengers(resultSet.getInt("numberOfPassengers"));
                        booking.setPaymentMethod(resultSet.getString("paymentMethod"));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return booking;
    }
}
