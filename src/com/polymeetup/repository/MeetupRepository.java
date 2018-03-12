package com.polymeetup.repository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.polymeetup.model.Showmeetup;
import com.polymeetup.util.DbUtil;


public class MeetupRepository {
	private Connection dbConnection;
	CallableStatement stmt = null;
	public MeetupRepository()
	{
		dbConnection = DbUtil.getConnection();
	}
/*
	public void save(String userName, String password, String firstName, String lastName, String dateOfBirth, String emailAddress) {
		try {
			PreparedStatement prepStatement = dbConnection.prepareStatement("insert into users(userName, password, firstName, lastName, dateOfBirth, emailAddress) values (?, ?, ?, ?, ?, ?)");
			prepStatement.setString(1, userName);
			prepStatement.setString(2, password);
			prepStatement.setString(3, firstName);
			prepStatement.setString(4, lastName);
			prepStatement.setDate(5, new java.sql.Date(new SimpleDateFormat("MM/dd/yyyy")
			.parse(dateOfBirth.substring(0, 10)).getTime()));
			prepStatement.setString(6, emailAddress);
			
			prepStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ParseException e) {			
			e.printStackTrace();
		}
	}
*/
	public void save(String firstName, String lastName, String streetAddress,String city,String state,
			String country, String zipcode,String phoneNumber, String emailAddress,String userName, String password ) {
		
		try {
			String sql = "{call sp_InsertUsers (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
		     stmt = dbConnection.prepareCall(sql);

				stmt.setString(1, firstName);
				stmt.setString(2, lastName);
				stmt.setString(3, streetAddress);
				stmt.setString(4, city);
				stmt.setString(5, state);
				stmt.setString(6, country);
				stmt.setInt(7, Integer.parseInt(zipcode));
				stmt.setInt(8, Integer.parseInt(phoneNumber));
				stmt.setString(9, emailAddress);
				stmt.setString(10, userName);
				stmt.setString(11, password);
				
				stmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void saveMeetup(String meetupName, String mDescription, String locationCampus,String locationName,String userMeet,
			String category, String meetupDate,String timings) {
		
		try {
			String sql = "{call sp_InsertMeetUp (?, ?, ?, ?, ?, ?, ?, ?)}";
		     stmt = dbConnection.prepareCall(sql);

				stmt.setString(1, meetupName);
				stmt.setString(2, mDescription);
				stmt.setString(3, locationCampus);
				stmt.setString(4, locationName);
				stmt.setString(5, userMeet);
				stmt.setString(6, category);
				stmt.setDate(7, new java.sql.Date(new SimpleDateFormat("MM/dd/yyyy")
						.parse(meetupDate.substring(0, 10)).getTime()));
				stmt.setString(8, timings);
								
				stmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	public List<Showmeetup> showMeetupLoc(String locationShowInput)
	{
	     List<Showmeetup> listshow=new ArrayList();
		try {
			String sql = "{call SP_ShowAllMeetUps_Locations (?)}";
		     stmt = dbConnection.prepareCall(sql);

				stmt.setString(1, locationShowInput);
				
				ResultSet rs = stmt.executeQuery();
              
				while (rs.next()) {
				    	  Showmeetup show=new Showmeetup();
				         show.setMeetName(rs.getString(1));
				         show.setMeetDescription(rs.getString(2));
				         show.setMmeetupDate(rs.getString(3));
				         show.setMeettimings(rs.getString(4));
				         show.setMeetlocationName(rs.getString(5));
				         show.setMeetlocationCampus(rs.getString(6));
				         show.setMeetcategory(rs.getString(7));
				         show.setMeetuserMeet(rs.getString(8));
				         listshow.add(show);
				      }				    
				 	      
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return listshow;	
	}
	public boolean findByUserName(String userName) {
		try {
			PreparedStatement prepStatement = dbConnection.prepareStatement("select count(*) from users where userName = ?");
			prepStatement.setString(1, userName);	
						
			ResultSet result = prepStatement.executeQuery();
			if (result != null) {	
				while (result.next()) {
					if (result.getInt(1) == 1) {
						return true;
					}				
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean findByLogin(String userName, String password) {
		try {
			PreparedStatement prepStatement = dbConnection.prepareStatement("select password from users where userName = ?");
			prepStatement.setString(1, userName);			
			
			ResultSet result = prepStatement.executeQuery();
			if (result != null) {
				while (result.next()) {
					if (result.getString(1).equals(password)) {
						return true;
					}
				}				
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
}
