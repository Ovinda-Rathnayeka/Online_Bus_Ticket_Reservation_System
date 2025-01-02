package com.userprofile;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;







public class UserDBUtill {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

    public static boolean insertcustomer(String firstname, String lastname, String nic, String email, String password) {
        
        boolean isSuccess = false;

        
        try (
            
            Connection con = DBConnect.getConnection();
            
            
            PreparedStatement pstmt = con.prepareStatement(
                "INSERT INTO user (firstname, lastname, nic, email, password) VALUES (?, ?, ?, ?, ?)"
            )
        ) {
            
            pstmt.setString(1, firstname);
            pstmt.setString(2, lastname);
            pstmt.setString(3, nic);
            pstmt.setString(4, email);
            pstmt.setString(5, password);
            
            
            int result = pstmt.executeUpdate();
            
            
            isSuccess = result > 0;

        } catch (SQLException e) {
        	
            e.printStackTrace();
        }
        
        return isSuccess;
    }
    
    
    
    public static boolean validate(String email, String password,HttpServletRequest request) {
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from user where email='"+email+"' and password='"+password+"'";
			
			 
			
			
			rs = stmt.executeQuery(sql);
			
			
			
			if (rs.next()) {
				
				int id = rs.getInt("userid"); 
				 HttpSession session = request.getSession();  // Get or create the session
		         session.setAttribute("userid",id);
		         
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
    
    
    public static boolean validatebus(String email, String password,HttpServletRequest request) {
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from busoperator where email='"+email+"' and password='"+password+"'";
			
			 
			
			
			rs = stmt.executeQuery(sql);
			
			
			
			if (rs.next()) {
				
				int id = rs.getInt("busopid"); 
				 HttpSession session = request.getSession();  // Get or create the session
		         session.setAttribute("busopid",id);
		         
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
    
    
	
	public static List<user> getUser(int id) {
		
		ArrayList<user> user = new ArrayList<>();
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from user where userid='"+id+"'";
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				int id1 = rs.getInt(1);
				String firstname = rs.getString(2);
				String lastname = rs.getString(3);
				String nic = rs.getString(4);
				String birthday = rs.getString(5);
				int phone = rs.getInt(6);
				String address = rs.getString(7);
				String email1 = rs.getString(8);
				String password = rs.getString(9);
				
				user us = new user(id1,firstname,lastname,nic,birthday,phone,address,email1,password);
				user.add(us);
			}
			
		} catch (Exception e) {
			
		}
		
		return user;	
	}
	
	
	
	public static boolean updateuser(int id, String firstname, String lastname, String nic, String birthday, String phone, String address, String email) {
	    boolean isSuccess = false;

	    try {
	        con = DBConnect.getConnection();
	        stmt = con.createStatement();
	        
	        
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        java.util.Date utilDate = sdf.parse(birthday); 
	        Date sqlDate = new Date(utilDate.getTime());   

	        // Update SQL query with the correct date
	        String sql = "UPDATE user SET firstname='" + firstname + "', lastname='" + lastname + "', nic='" + nic + "', birthday='" + sqlDate + "', phone='" + phone + "', address='" + address + "', email='" + email + "' WHERE userid='" + id + "'";
	        
	        int rs = stmt.executeUpdate(sql);
	        
	        if (rs > 0) {
	            isSuccess = true;
	        } else {
	            isSuccess = false;
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return isSuccess;
	}
	
	
	public static List<user> getUserDetails(int id) {
    	
    	
    	
    	ArrayList<user> user = new ArrayList<>();
    	
    	try {
    		
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		String sql = "select * from user where userid='"+id+"'";
    		rs = stmt.executeQuery(sql);
    		
    		while(rs.next()) {
    			int id1 = rs.getInt(1);
				String firstname = rs.getString(2);
				String lastname = rs.getString(3);
				String nic = rs.getString(4);
				String birthday = rs.getString(5);
				int phone = rs.getInt(6);
				String address = rs.getString(7);
				String email1 = rs.getString(8);
				String password = rs.getString(9);
    			
				user us = new user(id1,firstname,lastname,nic,birthday,phone,address,email1,password);
				user.add(us);
    		}
    		
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}	
    	return user;	
    }
	
	
	
	public static boolean deleteCustomer(int userId) {
    	
		
    	
    	try {
    		
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		String sql = "delete from user where userid='"+userId+"'";
    		int r = stmt.executeUpdate(sql);
    		
    		if (r > 0) {
    			isSuccess = true;
    		}
    		else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
    	
    	return isSuccess;
    }



	



	
}

