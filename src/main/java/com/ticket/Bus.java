package com.ticket;

import java.sql.Date;
import java.sql.Time;

public class Bus {
	
	private int busId;             
    private String busName;    
    private String busNumber;        
    private int seatCount;         
    private String destinationFrom;  
    private String destinationTo;   
    private Time departureTime;    
    private Date departureDate;  
    private double adultSeatPrice;  
    private double childSeatPrice;   
    private String note;        
    private byte[] busImage;   
    private int busOpId;   

    // Getters and setters

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
