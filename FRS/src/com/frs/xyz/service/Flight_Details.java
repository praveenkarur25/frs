package com.frs.xyz.service;

import com.frs.xyz.bean.XYZ_Flight_Bean;
import com.frs.xyz.dao.Flight_DAO;

public class Flight_Details {

	public static String addFlight(XYZ_Flight_Bean addFlight) {

		Flight_DAO add = new Flight_DAO();
		String status = add.addFlightDetails(addFlight);

		if (status.equals("success")) {
			System.out.println("Flight Details Added to database successfully");
			return "success";
		} else {
			System.out.println("fail");
			return "fail";
		}

	}

	public boolean update(String flight_id, String flight_Name, int fareArr[]) {
		Flight_DAO update = new Flight_DAO();
		int status = update.updateFlight(flight_Name, flight_id, fareArr);
		if (status == 1)
			return true;
		else
			return false;
	}

	public boolean delete(String flight_id) {
		Flight_DAO delete = new Flight_DAO();
		int status = delete.deleteFlight(flight_id);
		if (status == 1)
			return true;
		else
			return false;
	}
}
