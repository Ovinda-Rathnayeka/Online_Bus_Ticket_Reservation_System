package com.ticket;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;  // Import the standard java.sql.Connection
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


public class DBUtil {
    
	  
	
	public static void insertTicket(Ticket ticket) throws SQLException {
		
		
		
        String query = "INSERT INTO ticket (bookingdate,seatcountadult, seatcountchild, userid,fullname, email, contact, type, totalprice,busid) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = DBConnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setString(1, ticket.getBookingDate());
            pstmt.setInt(2, ticket.getSeatCountAdult());
            pstmt.setInt(3, ticket.getSeatCountChild());
            pstmt.setInt(4, ticket.getUserId());
            pstmt.setString(5, ticket.getFullName());
            pstmt.setString(6, ticket.getEmail());
            pstmt.setString(7, ticket.getContact());
            pstmt.setString(8, ticket.getTripType());
            pstmt.setDouble(9, ticket.getTotalPrice());
            pstmt.setInt(10,ticket.getBusid());
            

            pstmt.executeUpdate();
        }
    }
	
	public List<Ticket> getTicketsByUserId(int userId) {
	    List<Ticket> ticketList = new ArrayList<>();
	    
	    String query = "SELECT t.ticketid, t.bookingdate, t.seatcountadult, t.seatcountchild, t.fullname, " +
	                   "t.email, t.contact, t.totalprice, t.busid, t.type, b.bus_name,b.adult_seat_price,b.child_seat_price,b.destination_from, " +
	                   "b.destination_to " +
	                   "FROM ticket t " +
	                   "JOIN bus b ON t.busid = b.bus_id " +
	                   "WHERE t.userid = ?";

	    try (Connection connection = DBConnect.getConnection();
	         PreparedStatement statement = connection.prepareStatement(query)) {

	        statement.setInt(1, userId);
	        ResultSet resultSet = statement.executeQuery();

	        while (resultSet.next()) {
	            Ticket ticket = new Ticket();
	            ticket.setTicketId(resultSet.getInt("ticketid"));
	            ticket.setBookingDate(resultSet.getString("bookingdate"));
	            ticket.setSeatCountAdult(resultSet.getInt("seatcountadult"));
	            ticket.setSeatCountChild(resultSet.getInt("seatcountchild"));
	            ticket.setFullName(resultSet.getString("fullname"));
	            ticket.setEmail(resultSet.getString("email"));
	            ticket.setContact(resultSet.getString("contact"));
	            ticket.setTotalPrice(resultSet.getDouble("totalprice"));
	            ticket.setBusid(resultSet.getInt("busid"));
	            ticket.setTripType(resultSet.getString("type")); // Retrieve the type ("One-way" or "Round-trip")
	            
	            // Set bus details
	            ticket.setBusName(resultSet.getString("bus_name"));
	            ticket.setDestinationFrom(resultSet.getString("destination_from"));
	            ticket.setDestinationTo(resultSet.getString("destination_to"));
	            
	            ticketList.add(ticket);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return ticketList;
	}
	
	
	public static Ticket getTicketById(int ticketId) throws SQLException {
	    Ticket ticket = null;
	    String query = "SELECT t.ticketid, t.bookingdate, t.seatcountadult, t.seatcountchild, t.fullname, " +
	                   "t.email, t.contact, t.totalprice, t.busid, t.type, " +
	                   "b.bus_name, b.adult_seat_price, b.child_seat_price, b.destination_from, " +
	                   "b.destination_to " +
	                   "FROM ticket t " +
	                   "JOIN bus b ON t.busid = b.bus_id " +
	                   "WHERE t.ticketid = ?";

	    try (Connection connection = DBConnect.getConnection();
	         PreparedStatement statement = connection.prepareStatement(query)) {

	        statement.setInt(1, ticketId);
	        ResultSet resultSet = statement.executeQuery();

	        if (resultSet.next()) {
	            ticket = new Ticket();
	            ticket.setTicketId(resultSet.getInt("ticketid"));
	            ticket.setBookingDate(resultSet.getString("bookingdate"));
	            ticket.setSeatCountAdult(resultSet.getInt("seatcountadult"));
	            ticket.setSeatCountChild(resultSet.getInt("seatcountchild"));
	            ticket.setFullName(resultSet.getString("fullname"));
	            ticket.setEmail(resultSet.getString("email"));
	            ticket.setContact(resultSet.getString("contact"));
	            ticket.setTotalPrice(resultSet.getDouble("totalprice"));
	            ticket.setBusid(resultSet.getInt("busid"));
	            ticket.setTripType(resultSet.getString("type")); // Retrieve the type ("One-way" or "Round-trip")

	            // Set bus details
	            ticket.setBusName(resultSet.getString("bus_name"));
	            ticket.setAdultSeatPrice(resultSet.getDouble("adult_seat_price")); // Ensure you have this setter in the Ticket class
	            ticket.setChildSeatPrice(resultSet.getDouble("child_seat_price")); // Ensure you have this setter in the Ticket class
	            ticket.setDestinationFrom(resultSet.getString("destination_from"));
	            ticket.setDestinationTo(resultSet.getString("destination_to"));
	        }
	    }
	    return ticket;
	}
	
	public static void updateTicket(Ticket ticket) throws SQLException {
	    String query = "UPDATE ticket SET fullname = ?, email = ?, contact = ?, seatcountadult = ?, seatcountchild = ?, totalprice = ? WHERE ticketid = ?";
	    try (Connection con = DBConnect.getConnection();
	         PreparedStatement pstmt = con.prepareStatement(query)) {
	        
	        pstmt.setString(1, ticket.getFullName());
	        pstmt.setString(2, ticket.getEmail());
	        pstmt.setString(3, ticket.getContact());
	        pstmt.setInt(4, ticket.getSeatCountAdult());
	        pstmt.setInt(5, ticket.getSeatCountChild());
	        pstmt.setDouble(6, ticket.getTotalPrice());
	        pstmt.setInt(7, ticket.getTicketId());

	        pstmt.executeUpdate();
	    }
	}
	
	 public static void deleteTicketById(int ticketId) throws SQLException {
	        String query = "DELETE FROM ticket WHERE ticketid = ?";

	        try (Connection con = DBConnect.getConnection();
	             PreparedStatement pstmt = con.prepareStatement(query)) {

	            // Set the ticket ID in the query
	            pstmt.setInt(1, ticketId);

	            // Execute the delete query
	            pstmt.executeUpdate();
	        } catch (SQLException e) {
	            throw new SQLException("Error deleting the ticket with ID: " + ticketId, e);
	        }
	    }
	 
	 
	
	
	
	
	

	
	
	
	    
	   


	    
	    
	   
	


   
   
}