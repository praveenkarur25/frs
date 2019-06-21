package com.frs.xyz.service;

import com.frs.xyz.bean.XYZ_User_Bean;
import com.frs.xyz.dao.UserDAO;

public class Admin_User_Service {

	public static String isValidDetails(String userID, String password) {

		UserDAO userDAO = new UserDAO();
		String usertype = userDAO.isAdminOrUser(userID, password);
		System.out.println(usertype);
		if (usertype.equals("A")) {
			return "A";
		} else if (usertype.equals("C")) {
			return "C";
		} else if (usertype.equals("exist")) {
			return "exist";
		} else
			return "invalid";
	}

	public static String insertUser(XYZ_User_Bean xyz_User_Bean) {
		UserDAO userDAO = new UserDAO();
		String userid = userDAO.insertUserDetails(xyz_User_Bean);
		return userid;

	}

}
