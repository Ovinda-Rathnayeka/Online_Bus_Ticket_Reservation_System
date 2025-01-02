package com.ticket;

import java.sql.Date;
import java.sql.Time;

public class Bus {
	
	private int busId;               // Primary key for the bus
    private String busName;          // Bus name
    private String busNumber;        // Unique bus number
    private int seatCount;           // Total number of seats in the bus
    private String destinationFrom;  // Starting point of the bus journey
    private String destinationTo;    // Destination of the bus journey
    private Time departureTime;    // Departure time (stored as a String for simplicity)
    private Date departureDate;    // Departure date (stored as a String for simplicity)
    private double adultSeatPrice;   // Price for adult seats
    private double childSeatPrice;   // Price for child seats
    private String note;             // Additional notes about the bus (if any)
    private byte[] busImage;         // Image of the bus
    private int busOpId;             // Foreign key referencing bus operator ID

    // Getters and setters for each field

    public int getBusId() {
        return busId;
    }

    public void setBusId(int busId) {
        this.busId = busId;
    }

    public String getBusName() {
        return busName;
    }

    public void setBusName(String busName) {
        this.busName = busName;
    }

    public String getBusNumber() {
        return busNumber;
    }

    public void setBusNumber(String busNumber) {
        this.busNumber = busNumber;
    }

    public int getSeatCount() {
        return seatCount;
    }

    public void setSeatCount(int seatCount) {
        this.seatCount = seatCount;
    }

    public String getDestinationFrom() {
        return destinationFrom;
    }

    public void setDestinationFrom(String destinationFrom) {
        this.destinationFrom = destinationFrom;
    }

    public String getDestinationTo() {
        return destinationTo;
    }

    public void setDestinationTo(String destinationTo) {
        this.destinationTo = destinationTo;
    }

    public Time getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(Time time) {
        this.departureTime = time;
    }

    public Date getDepartureDate() {
        return departureDate;
    }

    public void setDepartureDate(Date date) {
        this.departureDate = date;
    }

    public double getAdultSeatPrice() {
        return adultSeatPrice;
    }

    public void setAdultSeatPrice(double adultSeatPrice) {
        this.adultSeatPrice = adultSeatPrice;
    }

    public double getChildSeatPrice() {
        return childSeatPrice;
    }

    public void setChildSeatPrice(double childSeatPrice) {
        this.childSeatPrice = childSeatPrice;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public byte[] getBusImage() {
        return busImage;
    }

    public void setBusImage(byte[] busImage) {
        this.busImage = busImage;
    }

    public int getBusOpId() {
        return busOpId;
    }

    public void setBusOpId(int busOpId) {
        this.busOpId = busOpId;
    }

}
