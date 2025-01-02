package com.addbus;

public class bus {
    private int busId;
    private String busName;
    private String busNumber;
    private int seatCount;
    private String destinationFrom;
    private String destinationTo;
    private String departureTime; 
    private String departureDate; 
    private double adultSeatPrice;
    private double childSeatPrice;
    private String note;
    private byte[] image; 
    private int busOperatorId;

    // Constructor
    public  bus(int busId, String busName, String busNumber, int seatCount,
               String destinationFrom, String destinationTo, String departureTime,
               String departureDate, double adultSeatPrice, double childSeatPrice,
               String note, byte[] image, int busOperatorId) {
        this.busId = busId;
        this.busName = busName;
        this.busNumber = busNumber;
        this.seatCount = seatCount;
        this.destinationFrom = destinationFrom;
        this.destinationTo = destinationTo;
        this.departureTime = departureTime;
        this.departureDate = departureDate;
        this.adultSeatPrice = adultSeatPrice;
        this.childSeatPrice = childSeatPrice;
        this.note = note;
        this.image = image;
        this.busOperatorId = busOperatorId;
    }

    // Getters
    public int getBusId() {
        return busId;
    }

    public String getBusName() {
        return busName;
    }

    public String getBusNumber() {
        return busNumber;
    }

    public int getSeatCount() {
        return seatCount;
    }

    public String getDestinationFrom() {
        return destinationFrom;
    }

    public String getDestinationTo() {
        return destinationTo;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public String getDepartureDate() {
        return departureDate;
    }

    public double getAdultSeatPrice() {
        return adultSeatPrice;
    }

    public double getChildSeatPrice() {
        return childSeatPrice;
    }

    public String getNote() {
        return note;
    }

    public byte[] getImage() {
        return image;
    }

    public int getBusOperatorId() {
        return busOperatorId;
    }

    
    public String getImageUrl() {
        return "/ImageServlet?id=" + busId; 
    }
}
