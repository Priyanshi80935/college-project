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
        String sql = "INSERT INTO flight (flight_number, destination) VALUES (?, ?)";

        try (PreparedStatement preparedStatement = ConnectionUtil.getConnection().prepareStatement(sql)) {

            preparedStatement.setString(1, flight.getFlightNumber());
            preparedStatement.setString(2, flight.getDestination());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Flight getFlightById(Long id) {
        String sql = "SELECT id, flight_number, destination FROM flight WHERE id = ?";
        Flight flight = null;

        try (PreparedStatement preparedStatement = ConnectionUtil.getConnection().prepareStatement(sql)) {

            preparedStatement.setLong(1, id);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    flight = new Flight(rs.getLong("id"), rs.getString("flight_number"), rs.getString("destination"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flight;
    }

    public List<Flight> viewFlights() {
        List<Flight> flights = new ArrayList<>();
        String sql = "SELECT id, flight_number, destination FROM flight";

        try (PreparedStatement preparedStatement = ConnectionUtil.getConnection().prepareStatement(sql);
             ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                flights.add(new Flight(rs.getLong("id"), rs.getString("flight_number"), rs.getString("destination")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flights;
    }

    public void updateFlight(Flight flight) {
        String sql = "UPDATE flight SET flight_number = ?, destination = ? WHERE id = ?";

        try (PreparedStatement preparedStatement = ConnectionUtil.getConnection().prepareStatement(sql)) {

            preparedStatement.setString(1, flight.getFlightNumber());
            preparedStatement.setString(2, flight.getDestination());
            preparedStatement.setLong(3, flight.getId());
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
