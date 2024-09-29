package com.tech.servlet;

import com.tech.dao.FlightDao;
import com.tech.model.Flight;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/manage-flight")
public class ManageFlightServlet extends HttpServlet {
    private FlightDao flightDao;

    @Override
    public void init() throws ServletException {
        flightDao = new FlightDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        handleRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        handleRequest(req, resp);
    }

    private void handleRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action") != null ? req.getParameter("action") : "view";

        try {
            switch (action) {
                case "add":
                    addFlight(req, resp);
                    break;
                case "edit":
                    editFlight(req, resp);
                    break;
                case "update":
                    updateFlight(req, resp);
                    break;
                case "delete":
                    deleteFlight(req, resp);
                    break;
                case "view":
                default:
                    viewFlights(req, resp);
            }
        } catch (Exception e) {
            req.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            viewFlights(req, resp);
        }
    }

    private void addFlight(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String flightNumber = req.getParameter("flightNumber");
        String destination = req.getParameter("destination");

        Flight flight = new Flight(null, flightNumber, destination);
        flightDao.addFlight(flight);

        resp.sendRedirect(req.getContextPath() + "/manage-flight");
    }

    private void editFlight(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        Flight flight = flightDao.getFlightById(id);

        req.setAttribute("flight", flight);
        viewFlights(req, resp);
    }

    private void updateFlight(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        Long id = Long.parseLong(req.getParameter("id"));
        String flightNumber = req.getParameter("flightNumber");
        String destination = req.getParameter("destination");

        Flight flight = new Flight(id, flightNumber, destination);
        flightDao.updateFlight(flight);

        resp.sendRedirect(req.getContextPath() + "/manage-flight");
    }

    private void deleteFlight(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        flightDao.deleteFlight(id);

        resp.sendRedirect(req.getContextPath() + "/manage-flight");
    }

    private void viewFlights(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Flight> flights = flightDao.viewFlights();
        req.setAttribute("flights", flights);
        req.getRequestDispatcher("flight.jsp").forward(req, resp);
    }
}