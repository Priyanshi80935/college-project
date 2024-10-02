package com.tech.dao;

import com.tech.model.Flight;
import com.tech.util.ConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FlightDao {

    public void addFlight(Flight flight) {
        String sql = "INSERT INTO flight (flight_number, source, destination, price) VALUES (?, ?, ?, ?)";

        try (PreparedStatement preparedStatement = ConnectionUtil.getConnection().prepareStatement(sql)) {

            preparedStatement.setString(1, flight.getFlightNumber());
            preparedStatement.setString(2, flight.getSource());
            preparedStatement.setString(3, flight.getDestination());
            preparedStatement.setDouble(4, flight.getPrice());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Flight getFlightById(Long id) {
        String sql = "SELECT id, flight_number, Source, destination, Price FROM flight WHERE id = ?";
        Flight flight = null;

        try (PreparedStatement preparedStatement = ConnectionUtil.getConnection().prepareStatement(sql)) {

            preparedStatement.setLong(1, id);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    flight = new Flight(rs.getLong("id"), rs.getString("flight_number"), rs.getString("Source") ,rs.getString("destination"), rs.getDouble("Price"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flight;
    }

    public List<Flight> viewFlights() {
        List<Flight> flights = new ArrayList<>();
        String sql = "SELECT id, flight_number, Source, destination, Price FROM flight";

        try (PreparedStatement preparedStatement = ConnectionUtil.getConnection().prepareStatement(sql);
             ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                flights.add(new Flight(rs.getLong("id"), rs.getString("flight_number"),rs.getString("Source"),
                        rs.getString("destination"),
                        rs.getDouble("Price")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flights;
    }

    public void updateFlight(Flight flight) {
        String sql = "UPDATE flight SET flight_number = ?, Source = ?, destination = ?, Price = ? WHERE id = ?";

        try (PreparedStatement preparedStatement = ConnectionUtil.getConnection().prepareStatement(sql)) {

            preparedStatement.setString(1, flight.getFlightNumber());
            preparedStatement.setString(2, flight.getSource());
            preparedStatement.setString(3, flight.getDestination());
            preparedStatement.setDouble(4, flight.getPrice());
            preparedStatement.setLong(5, flight.getId());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteFlight(Long id) {
        String sql = "DELETE FROM flight WHERE id = ?";

        try (PreparedStatement preparedStatement = ConnectionUtil.getConnection().prepareStatement(sql)) {

            preparedStatement.setLong(1, id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
