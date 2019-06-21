package com.frs.xyz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.frs.xyz.bean.XYZ_Flight_Bean;
import com.frs.xyz.util.DBUtil;

public class Flight_DAO {

	public String addFlightDetails(XYZ_Flight_Bean addFlight) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String availabledays = "";
		int id = 0;
		int i = 0;
		for (i = 0; i < addFlight.getDays().length - 1; i++) {
			availabledays += addFlight.getDays()[i] + ",";
		}
		// int arri = Integer.parseInt(dept.substring(0, 2)) + duration;
		// String arrivaltime = arri + dept.substring(2, 5);
		availabledays = availabledays + addFlight.getDays()[i];
		String flightname = addFlight.getFlight_Name().substring(0, 2).toUpperCase();

		try {
			connection = DBUtil.getConnection();
			Statement statement = connection.createStatement();
			resultSet = statement.executeQuery("select flightid_seq.nextval from dual");
			while (resultSet.next()) {
				id = resultSet.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String flightid = flightname + id;
		System.out.println(flightid);
		addFlight.setFlightid(flightid);

		int flag = 0;
		// addFlight.getArr_Time()
		// System.out.println(addFlight.getDept_Time() + "gysudg");
		String query = "insert into frs_tbl_flight(flight_name,flight_From,flight_To,First_class_fare,Arrivaltime,Departuretime,Business_class_fare,Economy_class_fare,flightid,availabledays)values('"
				+ addFlight.getFlight_Name() + "','" + addFlight.getFlight_From() + "','" + addFlight.getFlight_To()
				+ "','" + addFlight.getFirstclass_fare() + "','" + addFlight.getArr_Time() + "','"
				+ addFlight.getDept_Time() + "','" + addFlight.getBusiness_fare() + "','" + addFlight.getEconomy_fare()
				+ "','" + flightid + "','" + availabledays + "')";

		try {
			connection = DBUtil.getConnection();
			connection.setAutoCommit(false);
			// System.out.println(addFlight.getFlight_Name());
			// System.out.println(addFlight.getFlight_From());
			// System.out.println(addFlight.getFirstclass_fare());
			preparedStatement = connection.prepareStatement(query);
			// preparedStatement.setString(1, addFlight.getFlight_Name());
			// preparedStatement.setString(2, addFlight.getFlight_From());

//			preparedStatement.setString(3, addFlight.getFlight_via());
//			preparedStatement.setString(4, addFlight.getFlight_To());
//			preparedStatement.setString(5, addFlight.getDept_Time());
//			preparedStatement.setString(6, addFlight.getArr_Time());
//			preparedStatement.setInt(7, addFlight.getBusiness_fare());
//			preparedStatement.setInt(8, addFlight.getEconomy_fare());
//			preparedStatement.setInt(9, addFlight.getFirstclass_fare());
			preparedStatement.execute();
			connection.commit();
			System.out.println("updated");
			String routeid = RouteDAO.insertRoute(addFlight);

			flag = ScheduleDAO.insertSchedule(addFlight, routeid);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(connection, preparedStatement, resultSet);
		}

		if (flag == 1) {
			return "success";
		} else
			return "fail";
	}

	public int updateFlight(String flight_Name, String flight_id, int fare[]) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int status = 0;
		int id = 0;
		String flightname = flight_Name.substring(0, 2).toUpperCase();

		try {
			connection = DBUtil.getConnection();
			Statement statement = connection.createStatement();
			resultSet = statement.executeQuery("select flightid_seq.nextval from dual");
			while (resultSet.next()) {
				id = resultSet.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String flightid = flightname + id;
		System.out.println(flightid);

		String query = "update frs_tbl_flight set flight_name='" + flight_Name + "',flightid='" + flightid
				+ "',economy_class_fare='" + fare[0] + "',Business_class_fare='" + fare[1] + "',first_class_fare='"
				+ fare[2] + "' where flightid = '" + flight_id + "'";

		String schedule = "update frs_tbl_schedule set flightid='" + flightid + "' where flightid ='" + flight_id + "'";
		try {
			connection = DBUtil.getConnection();

			preparedStatement = connection.prepareStatement(schedule);
//			preparedStatement.setString(2, flight_Name);
//
//			preparedStatement.setInt(1, 1);
//			preparedStatement.setInt(8, fare[0]);
//			preparedStatement.setInt(9, fare[2]);

			status = preparedStatement.executeUpdate();
			connection.commit();
			System.out.println(status + "hi");

		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			connection = DBUtil.getConnection();

			preparedStatement = connection.prepareStatement(query);
//			preparedStatement.setString(2, flight_Name);
//
//			preparedStatement.setInt(1, 1);
//			preparedStatement.setInt(8, fare[0]);
//			preparedStatement.setInt(9, fare[2]);

			status = preparedStatement.executeUpdate();
			connection.commit();
			System.out.println(status + "hi");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(connection, preparedStatement, resultSet);
		}
		return status;

	}

	public int deleteFlight(String flight_id) {
		String flightid = flight_id;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int status = 0;
		String query = "delete from frs_tbl_flight where flightid ='" + flightid + "'";
		String deleteSchedule = "delete from frs_tbl_schedule where flightid ='" + flightid + "'";
		String deleteRoute = "delete from frs_tbl_route where flightid ='" + flightid + "'";
		try {
			connection = DBUtil.getConnection();
			preparedStatement = connection.prepareStatement(deleteSchedule);
			status = preparedStatement.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(connection, preparedStatement, resultSet);
		}
		try {
			connection = DBUtil.getConnection();
			preparedStatement = connection.prepareStatement(query);
			status = preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			connection = DBUtil.getConnection();
			preparedStatement = connection.prepareStatement(deleteRoute);
			status = preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(connection, preparedStatement, resultSet);
		}
		return status;
	}

	public static ArrayList<String> search(String from, String to, String day) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		ArrayList<String> flightid = new ArrayList<>();
		int status = 0;
		String sql = "select flightid,availabledays from frs_tbl_flight where flight_From ='" + from
				+ "' AND flight_to ='" + to + "'";

		// String flight = "select availabledays from frs_tbl_schedule where flight"
		try {
			connection = DBUtil.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Pattern pattern = Pattern.compile(day);
				Matcher m = pattern.matcher(resultSet.getString("availabledays"));
				if (m.find()) {
					flightid.add(resultSet.getString("flightid"));
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(connection, preparedStatement, resultSet);
		}
		return flightid;
	}

}
