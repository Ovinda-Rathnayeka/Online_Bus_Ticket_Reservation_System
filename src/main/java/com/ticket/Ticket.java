package com.ticket;

import com.userprofile.Person;

public class Ticket extends Person{
    // Ticket details
    private int ticketId;
    private String bookingDate;
    private int seatCountAdult;
    private int seatCountChild;
    private String tripType;

    // User information
    private int userId;
    private String fullName;
    private String email;
    private String contact;

    // Payment information
    private double totalPrice;

    // Bus information
    private int busid;
    private String busName;
    private String destinationFrom;
    private String destinationTo;

    // Seat price and departure information
    private double adultSeatPrice;
    private double childSeatPrice;
    private String departureDate;
    private String departureTime;

    // Getters and Setters for ticket details
    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public String getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }

    public int getSeatCountAdult() {
        return seatCountAdult;
    }

    public void setSeatCountAdult(int seatCountAdult) {
        this.seatCountAdult = seatCountAdult;
    }

    public int getSeatCountChild() {
        return seatCountChild;
    }

    public void setSeatCountChild(int seatCountChild) {
        this.seatCountChild = seatCountChild;
    }

    public String getTripType() {
        return tripType;
    }

    public void setTripType(String tripType) {
        this.tripType = tripType;
    }

    // Getters and Setters for user information
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    // Getters and Setters for payment details
    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    // Getters and Setters for bus information
    public int getBusid() {
        return busid;
    }

    public void setBusid(int busid) {
        this.busid = busid;
    }

    public String getBusName() {
        return busName;
    }

    public void setBusName(String busName) {
        this.busName = busName;
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

    // Getters and Setters for seat prices and departure information
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

    public String getDepartureDate() {
        return departureDate;
    }

    public void setDepartureDate(String departureDate) {
        this.departureDate = departureDate;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }
}
