package com.frs.xyz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.frs.xyz.bean.Route_Bean;
import com.frs.xyz.bean.XYZ_Flight_Bean;
import com.frs.xyz.util.DBUtil;

public class RouteDAO {
	public static String insertRoute(XYZ_Flight_Bean addFlight) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int status = 0;
		int id = 0;
		String from = addFlight.getFlight_From().substring(0, 2).toUpperCase();
		String to = addFlight.getFlight_To().substring(0, 2).toUpperCase();

		try {
			connection = DBUtil.getConnection();
			Statement statement = connection.createStatement();
			resultSet = statement.executeQuery("select routeid_seq.nextval from dual");
			while (resultSet.next()) {
				id = resultSet.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String routeID = from + to + id;

		System.out.println(routeID);
		System.out.println(addFlight.getFlightid() + "trytryr");
		String query = "insert into frs_tbl_route(routeid,source,destination,distance,fare,flightid)values('" + routeID
				+ "','" + addFlight.getFlight_From() + "','" + addFlight.getFlight_To() + "','" + 500 + "','"
				+ addFlight.getFare() + "','" + addFlight.getFlightid() + "')";
		try {
			connection = DBUtil.getConnection();
			preparedStatement = connection.prepareStatement(query);
			status = preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(connection, preparedStatement, resultSet);
		}
		return routeID;

	}

	public int updateRoute(Route_Bean route) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int status = 0;
		int id = 0;
		String from = route.getSource().substring(0, 2).toUpperCase();
		String to = route.getDestination().substring(0, 2).toUpperCase();

		try {
			connection = DBUtil.getConnection();
			Statement statement = connection.createStatement();
			resultSet = statement.executeQuery("select routeid_seq.nextval from dual");
			while (resultSet.next()) {
				id = resultSet.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String routeID = from + to + id;
		System.out.println(routeID);
		String flight = "update frs_tbl_flight set flight_From='" + route.getSource() + "',flight_to='"
				+ route.getDestination() + "' where flightid='" + route.getFlightid() + "'";
		try {
			connection = DBUtil.getConnection();
			// Statement statement = connection.createStatement();
			// resultSet = statement.executeQuery("select routeid_seq.nextval from dual");
			preparedStatement = connection.prepareStatement(flight);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		String query = "update frs_tbl_route set routeid='" + routeID + "',source='" + route.getSource()
				+ "',destination='" + route.getDestination() + "',distance='" + route.getDistance() + "',fare='"
				+ route.getFare() + "' where routeid = '" + route.getRouteid() + "'";
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

	public int deleteRoute(String routeid) {
		// String flightid = flight_id;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int status = 0;
		String query = "delete from frs_tbl_route where routeid ='" + routeid + "'";
		try {
			connection = DBUtil.getConnection();
			preparedStatement = connection.prepareStatement(query);
			status = preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(connection, preparedStatement, resultSet);
		}
		return status;
	}

}
