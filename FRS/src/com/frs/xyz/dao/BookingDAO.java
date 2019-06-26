package com.frs.xyz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.frs.xyz.bean.TicketBean;
import com.frs.xyz.util.DBUtil;

public class BookingDAO {
	public static int insertBooking(TicketBean ticket, String flightclass) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int status = 0;
		int id = 0;
		int bookedSeats = 0;
		int seat = 0;
		String from = "";
		String to = "";

		if (flightclass.equals("Economy")) {
			flightclass = "Economy_class_fare";
			// flight = "Economy";
		} else if (flightclass.equals("First")) {
			flightclass = "First_class_fare";
			// flight = "First";
		} else {
			flightclass = "Business_class_fare";
			// flight = "Business";
		}
		int fare = 0;
		// int flag = 0;
		String username = "select username from frs_tbl_users_profile where userid ='" + ticket.getUserid() + "'";
		// String flight = "select flight_name"
		String seats = "select booked_seats,flight_from,flight_to," + flightclass
				+ " from frs_tbl_flight where flightid = '" + ticket.getFlightid() + "'";
		try {
			connection = DBUtil.getConnection();
			Statement statement = connection.createStatement();
			resultSet = statement.executeQuery("select ticketid_seq.nextval from dual");
			while (resultSet.next()) {
				id = resultSet.getInt(1);
			}
			resultSet = statement.executeQuery(username);
			while (resultSet.next()) {
				username = resultSet.getString("username");
			}
			resultSet = statement.executeQuery(seats);
			while (resultSet.next()) {
				seat = resultSet.getInt("booked_seats");
				from = resultSet.getString("flight_from");
				to = resultSet.getString("flight_to");
				fare = resultSet.getInt(flightclass);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		// int seat = Integer.parseInt(seats);
		bookedSeats = ticket.getBookedSeats() + seat;
		String ticketid = "XYZ" + id;
		System.out.println(ticketid);
		System.out.println(username);
		String sql = "insert into frs_tbl_booking_details (userid,flightid,name,dateofjourney,seats,ticketnumber,username,flight_from,flight_to,fare) values('"
				+ ticket.getUserid() + "','" + ticket.getFlightid() + "','" + ticket.getNames() + "','"
				+ ticket.getDateofjourney() + "','" + ticket.getSeats() + "','" + ticketid + "','" + username + "','"
				+ from + "','" + to + "','" + fare + "')";

		String query = "update frs_tbl_flight set booked_seats='" + bookedSeats + "' where flightid ='"
				+ ticket.getFlightid() + "'";
		try {
			connection = DBUtil.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			connection = DBUtil.getConnection();
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.executeUpdate();
			status = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public static int deleteTicket(String ticketnumber) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int status = 0;
		String query = "delete from frs_tbl_booking_details where ticketnumber ='" + ticketnumber + "'";
		try {
			connection = DBUtil.getConnection();
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.executeUpdate();
			status = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(connection, preparedStatement, resultSet);
		}
		return status;

	}
}
