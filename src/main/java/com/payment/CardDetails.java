package com.payment;

import com.userprofile.Person;

public class CardDetails extends Person {
    private int paymentId;        // Unique ID for the payment (from the payments table)
    private String cardNumber;    // Card number (masked or formatted appropriately)
    private String expiryDate;    // Expiry date (MM/YY format)
    private String cvc;           // CVC (Card Verification Code)
    private String cardHolderName; // Name on the card
    private String cardType;      // Card type (Visa, MasterCard, etc.)
    private int userId;           // User ID associated with this card
    private int ticketId;         // Ticket ID associated with this card

    
    
    
    public CardDetails(int paymentId, String cardNumber, String expiryDate, String cvc, String cardHolderName, String cardType, int userId, int ticketId) {
        this.paymentId = paymentId;
        this.cardNumber = cardNumber;
        this.expiryDate = expiryDate;
        this.cvc = cvc;
        this.cardHolderName = cardHolderName;
        this.cardType = cardType;
        this.userId = userId;
        this.ticketId = ticketId;
    }

    // Getter and setter methods for all fields

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }

    public String getCvc() {
        return cvc;
    }

    public void setCvc(String cvc) {
        this.cvc = cvc;
    }

    public String getCardHolderName() {
        return cardHolderName;
    }

    public void setCardHolderName(String cardHolderName) {
        this.cardHolderName = cardHolderName;
    }

    public String getCardType() {
        return cardType;
    }

    public void setCardType(String cardType) {
        this.cardType = cardType;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }
}
