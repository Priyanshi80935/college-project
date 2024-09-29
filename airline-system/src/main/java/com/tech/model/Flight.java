package com.tech.model;

public class Flight {
    private Long id;
    private String flightNumber;
    private String destination;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFlightNumber() {
        return flightNumber;
    }

    public void setFlightNumber(String flightNumber) {
        this.flightNumber = flightNumber;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public Flight() {
    }

    public Flight(Long id, String flightNumber, String destination) {
        this.id = id;
        this.flightNumber = flightNumber;
        this.destination = destination;
    }

    @Override
    public String toString() {
        return "Flight{" +
                "id=" + id +
                ", flightNumber='" + flightNumber + '\'' +
                ", destination='" + destination + '\'' +
                '}';
    }
}
