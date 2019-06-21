package com.frs.xyz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.frs.xyz.bean.XYZ_Flight_Bean;
import com.frs.xyz.util.DBUtil;

public class ScheduleDAO {
	public static int insertSchedule(XYZ_Flight_Bean flight, String routeid) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String days = "";
		int flag = 0;
		int i = 0;
		for (i = 0; i < flight.getDays().length - 1; i++) {
			days += flight.getDays()[i] + ",";
		}
		days = days + flight.getDays()[i];
		int dept = Integer.parseInt(flight.getDept_Time().substring(0, 2));
		int arr = Integer.parseInt(flight.getArr_Time().substring(0, 2));
		System.out.println(dept);
		System.out.println(arr);
		int duration = 0;
		if (dept > arr) {
			duration = (24 - dept) + arr;
		} else
			duration = arr - dept;
		String query = "insert into frs_tbl_schedule (flightid,routeid,travelduration,availabledays,departuretime,Arrivaltime)values('"
				+ flight.getFlightid() + "','" + routeid + "','" + duration + "','" + days + "','"
				+ flight.getDept_Time() + "','" + flight.getArr_Time() + "' )";
		try {
			connection = DBUtil.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.execute();
			flag = 1;
			connection.commit();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			DBUtil.close(connection, preparedStatement, resultSet);
		}
		return flag;
	}

	public static int updateSchedule(String flightid, String days[], int duration, String dept) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String availabledays = "";
		int flag = 0;
		int i = 0;
		for (i = 0; i < days.length - 1; i++) {
			availabledays += days[i] + ",";
		}
		int arri = Integer.parseInt(dept.substring(0, 2)) + duration;
		String arrivaltime = arri + dept.substring(2, 5);
		availabledays = availabledays + days[i];
		String flight = "update frs_tbl_flight set departuretime= '" + dept + "', arrivaltime='" + arrivaltime
				+ "',availabledays='" + availabledays + "' where flightid='" + flightid + "'";

		String query = "update frs_tbl_schedule set departuretime='" + dept + "',travelduration='" + duration
				+ "',availabledays='" + availabledays + "' where flightid='" + flightid + "'";
		try {
			connection = DBUtil.getConnection();
			// Statement statement = connection.createStatement();
			// resultSet = statement.executeQuery("select routeid_seq.nextval from dual");
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			connection = DBUtil.getConnection();
			// Statement statement = connection.createStatement();
			// resultSet = statement.executeQuery("select routeid_seq.nextval from dual");
			preparedStatement = connection.prepareStatement(flight);
			preparedStatement.executeUpdate();
			flag = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(connection, preparedStatement, resultSet);
		}

		return flag;
	}
}
