package com.payment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DBUtil {

    // Method to insert card payment into the payments table
    public static boolean insertCardPayment(String ticketId, String userId, String cardNumber, String expiryDate, String cvc, String cardName) {
        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement pst = null;

        try {
            con = DBConnect.getConnection();
            
            // SQL insert query
            String sql = "INSERT INTO payments (ticketId, userId, cardNumber, expiryDate, cvc, cardName) VALUES (?, ?, ?, ?, ?, ?)";
            pst = con.prepareStatement(sql);
            
            // Set parameters
            pst.setString(1, ticketId);
            pst.setString(2, userId);
            pst.setString(3, cardNumber);
            pst.setString(4, expiryDate);
            pst.setString(5, cvc);
            pst.setString(6, cardName);
            
            // Execute update
            int result = pst.executeUpdate();
            
            if (result > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return isSuccess;
    }

    // Method to get the list of cards for a specific user by userId
    public static List<CardDetails> getCardsByUserId(int userId) {
        List<CardDetails> cardList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            con = DBConnect.getConnection();
            
            // SQL query to select card details based on userId
            String sql = "SELECT paymentId, cardNumber, expiryDate, cvc, cardName, ticketId FROM payments WHERE userId = ?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, userId);

            rs = pst.executeQuery();
            while (rs.next()) {
                // Create a CardDetails object and add it to the list
                CardDetails card = new CardDetails(
                    rs.getInt("paymentId"),
                    rs.getString("cardNumber"),
                    rs.getString("expiryDate"),
                    rs.getString("cvc"),
                    rs.getString("cardName"),
                    "", // CardType can be blank as it's not in the table
                    userId,
                    rs.getInt("ticketId")
                );
                cardList.add(card);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return cardList;
    }
    
    // Method to get card details by paymentId
    public static CardDetails getCardById(int paymentId) {
        CardDetails card = null;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            con = DBConnect.getConnection();

            // SQL query to fetch card details for the given paymentId
            String sql = "SELECT paymentId, cardNumber, expiryDate, cvc, cardName, userId, ticketId FROM payments WHERE paymentId = ?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, paymentId); // Set the paymentId in the query

            // Execute the query
            rs = pst.executeQuery();

            // If a record is found, create a CardDetails object
            if (rs.next()) {
                int userId = rs.getInt("userId");
                int ticketId = rs.getInt("ticketId");
                String cardNumber = rs.getString("cardNumber");
                String expiryDate = rs.getString("expiryDate");
                String cvc = rs.getString("cvc");
                String cardName = rs.getString("cardName");

                // Create the card object
                card = new CardDetails(paymentId, cardNumber, expiryDate, cvc, cardName, "", userId, ticketId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return card;
    }

    // Method to update card details by paymentId
    public static boolean updateCardDetails(int paymentId, String cardNumber, String expiryDate, String cvc, String cardHolderName) {
        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement pst = null;

        try {
            con = DBConnect.getConnection();
            
            String sql = "UPDATE payments SET cardNumber = ?, expiryDate = ?, cvc = ?, cardName = ? WHERE paymentId = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, cardNumber);
            pst.setString(2, expiryDate);
            pst.setString(3, cvc);
            pst.setString(4, cardHolderName);
            pst.setInt(5, paymentId);

            int result = pst.executeUpdate();
            if (result > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return isSuccess;
    }

    // Method to delete a card by paymentId
    public static boolean deleteCard(int paymentId) {
        boolean isDeleted = false;
        Connection con = null;
        PreparedStatement pst = null;

        try {
            con = DBConnect.getConnection();
            
            String sql = "DELETE FROM payments WHERE paymentId = ?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, paymentId);

            int result = pst.executeUpdate();
            if (result > 0) {
                isDeleted = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return isDeleted;
    }
}
