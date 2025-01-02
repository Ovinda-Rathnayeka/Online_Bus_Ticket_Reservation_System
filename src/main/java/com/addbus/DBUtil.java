package com.addbus;

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

import javax.servlet.http.Part;


public class DBUtil {
    
	  
	
	    public static void insertBus(String busName, String busNumber, int seatCount, String destinationFrom, 
	                                  String destinationTo, String departureTime, String departureDate, 
	                                  double adultSeatPrice, double childSeatPrice, String note, 
	                                  Part filePart, int busOperatorId) throws SQLException, IOException {
	        String sql = "INSERT INTO bus (bus_name, bus_number, seat_count, destination_from, destination_to, " +
	                     "departure_time, departure_date, adult_seat_price, child_seat_price, note, image, busopid) " +
	                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	        try (Connection connection = DBConnect.getConnection();
	             PreparedStatement statement = connection.prepareStatement(sql)) {

	            statement.setString(1, busName);
	            statement.setString(2, busNumber);
	            statement.setInt(3, seatCount);
	            statement.setString(4, destinationFrom);
	            statement.setString(5, destinationTo);
	            statement.setString(6, departureTime);
	            statement.setString(7, departureDate);
	            statement.setDouble(8, adultSeatPrice);
	            statement.setDouble(9, childSeatPrice);
	            statement.setString(10, note);

	            if (filePart != null && filePart.getSize() > 0) {
	                InputStream inputStream = filePart.getInputStream();
	                statement.setBlob(11, inputStream);
	            } else {
	                statement.setNull(11, java.sql.Types.BLOB);
	            }

	            statement.setInt(12, busOperatorId);

	            statement.executeUpdate();
	        }
	    }
	    
	    
	    public static List<bus> getAllBuses() throws SQLException {
	        List<bus> busList = new ArrayList<>();
	        String sql = "SELECT bus_id, bus_name, bus_number, seat_count, destination_from, "
	                   + "destination_to, departure_time, departure_date, adult_seat_price, "
	                   + "child_seat_price, note, image, busopid FROM bus";

	        try (Connection connection = DBConnect.getConnection();
	             PreparedStatement statement = connection.prepareStatement(sql);
	             ResultSet resultSet = statement.executeQuery()) {

	            while (resultSet.next()) {
	                bus bus = new bus(
	                    resultSet.getInt("bus_id"),
	                    resultSet.getString("bus_name"),
	                    resultSet.getString("bus_number"),
	                    resultSet.getInt("seat_count"),
	                    resultSet.getString("destination_from"),
	                    resultSet.getString("destination_to"),
	                    resultSet.getString("departure_time"), // Keep as String for now
	                    resultSet.getString("departure_date"), // Keep as String for now
	                    resultSet.getDouble("adult_seat_price"),
	                    resultSet.getDouble("child_seat_price"),
	                    resultSet.getString("note"),
	                    resultSet.getBytes("image"), // Fetch image as byte array
	                    resultSet.getInt("busopid")
	                );
	                busList.add(bus);
	            }
	        }
	        return busList;
	    }
	    
	    public static InputStream getImageById(int busId) throws SQLException {
	        String sql = "SELECT image FROM bus WHERE bus_id = ?";
	        
	        try (Connection connection = DBConnect.getConnection();
	             PreparedStatement statement = connection.prepareStatement(sql)) {
	            statement.setInt(1, busId);
	            ResultSet resultSet = statement.executeQuery();
	            
	            if (resultSet.next()) {
	                return resultSet.getBinaryStream("image");
	            }
	        }
	        return null; // No image found for the given ID
	    }
	    
	    public static bus getBusById(int busId) throws SQLException {
	        bus bus = null;
	        String sql = "SELECT * FROM bus WHERE bus_id = ?"; // Update the table name if needed

	        try (Connection connection = DBConnect.getConnection();
	             PreparedStatement statement = connection.prepareStatement(sql)) {
	            statement.setInt(1, busId);
	            ResultSet resultSet = statement.executeQuery();

	            if (resultSet.next()) {
	                bus = new bus(
	                    resultSet.getInt("bus_id"),
	                    resultSet.getString("bus_name"),
	                    resultSet.getString("bus_number"),
	                    resultSet.getInt("seat_count"),
	                    resultSet.getString("destination_from"),
	                    resultSet.getString("destination_to"),
	                    resultSet.getString("departure_time"),
	                    resultSet.getString("departure_date"),
	                    resultSet.getDouble("adult_seat_price"),
	                    resultSet.getDouble("child_seat_price"),
	                    resultSet.getString("note"),
	                    resultSet.getBytes("image"),
	                    resultSet.getInt("busopid") // Assuming you have a bus operator ID
	                );
	            }
	        }
	        return bus;
	    }

	    // Method to update bus details
	    public static void updateBus(int busId, String busName, String busNumber, int seatCount,
	                                 String destinationFrom, String destinationTo, String departureTime,
	                                 String departureDate, double adultSeatPrice, double childSeatPrice,
	                                 String note, Part filePart) throws SQLException, IOException {
	        String sql = "UPDATE bus SET bus_name = ?, bus_number = ?, seat_count = ?, destination_from = ?, "
	                   + "destination_to = ?, departure_time = ?, departure_date = ?, adult_seat_price = ?, "
	                   + "child_seat_price = ?, note = ?, image = ? WHERE bus_id = ?";

	        try (Connection connection = DBConnect.getConnection();
	             PreparedStatement statement = connection.prepareStatement(sql)) {
	            statement.setString(1, busName);
	            statement.setString(2, busNumber);
	            statement.setInt(3, seatCount);
	            statement.setString(4, destinationFrom);
	            statement.setString(5, destinationTo);
	            statement.setString(6, departureTime);
	            statement.setString(7, departureDate);
	            statement.setDouble(8, adultSeatPrice);
	            statement.setDouble(9, childSeatPrice);
	            statement.setString(10, note);

	            if (filePart != null && filePart.getSize() > 0) {
	                InputStream inputStream = filePart.getInputStream();
	                statement.setBlob(11, inputStream);
	            } else {
	                statement.setNull(11, java.sql.Types.BLOB);
	            }

	            statement.setInt(12, busId);
	            statement.executeUpdate();
	        }
	    }
	    
	    public static void deleteBus(int busId) throws SQLException {
	        String sql = "DELETE FROM bus WHERE bus_id = ?";
	        
	        try (Connection conn = DBConnect.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(sql)) {
	            stmt.setInt(1, busId);
	            stmt.executeUpdate();
	        }
	    }
	    
	    
	


   
   
}