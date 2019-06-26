package com.frs.xyz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.frs.xyz.bean.XYZ_User_Bean;
import com.frs.xyz.util.DBUtil;

public class UserDAO {
	// To check Admin or not.
	public String isAdminOrUser(String userID, String password) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int status = 0;
		String flag = "invalid";
		String usertype = "C";
		String query = "select usertype,loginstatus from frs_tbl_user_credentials where userid='" + userID
				+ "' AND password='" + password + "'"; // Query for selecting values from frs_admin_table.
		try {
			connection = DBUtil.getConnection(); // Get connection

			preparedStatement = connection.prepareStatement(query); // preparing statement.
			resultSet = preparedStatement.executeQuery(); // Executing query and stored values in resultset.
//			while(resultSet.next()) {
//				if(resultSet.getString("usertype").equals("A")) {
//					
//				}
//			
			while (resultSet.next()) {

				usertype = resultSet.getString("usertype");
				status = resultSet.getInt("loginstatus");
				flag = "valid";
			}
		}

		catch (

		Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(connection, preparedStatement, resultSet);
		}
		if (flag == "valid") {

			if (status == 0) {
				return usertype;
			} else
				return "exist";

		} else
			return flag;
	}

	// To check user or not.

//	public int isValidUser(String userName, String password) {
//		Connection connection = null;
//		PreparedStatement preparedStatement = null;
//		ResultSet resultSet = null;
//		int flag = 0;
//		String query = "select email,password from frs_user_table"; // Query for selecting values from frs_admin_table.
//		try {
//			connection = DBUtil.getConnection(); // Get connection
//
//			preparedStatement = connection.prepareStatement(query); // preparing statement.
//			resultSet = preparedStatement.executeQuery(); // Executing query and stored values in resultset.
//			while (resultSet.next()) {
//				if (userName.equals(resultSet.getString(1)) && (password.equals(resultSet.getString(2)))) {
//					flag = 1;
//					break;
//
//				}
//			}
//
//		}
//
//		catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBUtil.close(connection, preparedStatement, resultSet);
//		}
//		return flag;
//	}

	public String insertUserDetails(XYZ_User_Bean xyz_User_Bean) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int flag = 0;
		String username = xyz_User_Bean.getUserName();
		username = username.substring(0, 2).toUpperCase();
		connection = DBUtil.getConnection();
		Statement statement;
		int id = 0;
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery("select idseq.nextval from dual");
			while (resultSet.next()) {
				id = resultSet.getInt(1);
				System.out.println(id);
			}
		} catch (SQLException e1) {

			e1.printStackTrace();
		}
		String userID = username + id;
		String query = "insert into frs_tbl_users_profile(firstname,lastname,username,email,password,phonenumber,id,userid) values(?,?,?,?,?,?,?,?)";
		try {
			connection = DBUtil.getConnection();

			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, xyz_User_Bean.getUser_First_Name());
			preparedStatement.setString(2, xyz_User_Bean.getUser_Last_Name());
			preparedStatement.setString(3, xyz_User_Bean.getUserName());
			preparedStatement.setString(4, xyz_User_Bean.getEmail());
			preparedStatement.setString(5, xyz_User_Bean.getPassword());
			preparedStatement.setString(6, xyz_User_Bean.getPhoneNumber());
			preparedStatement.setInt(7, id);
			preparedStatement.setString(8, userID);
			System.out.println(userID);
			// preparedStatement.setString(8, id_sequence.);
			preparedStatement.execute();
			flag = insertUserCredentials(userID, xyz_User_Bean.getPassword());

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(connection, preparedStatement, resultSet);
		}

		return userID;
	}

	public static int insertUserCredentials(String userid, String password) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int flag = 0;
		String query = "insert into frs_tbl_user_credentials(userid,password,usertype,loginstatus) values(?,?,?,?)";
		try {
			connection = DBUtil.getConnection();

			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, userid);
			preparedStatement.setString(2, password);
			preparedStatement.setString(3, "C");
			preparedStatement.setInt(4, 0);
			preparedStatement.execute();
			flag = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(connection, preparedStatement, resultSet);
		}

		return flag;

	}

	public static boolean checkmail(String email, String phonenumber) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		boolean status = true;
		String sql = "select email,phonenumber from frs_tbl_users_profile";
		try {
			connection = DBUtil.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				if (resultSet.getString("email").equals(email)
						|| resultSet.getString("phonenumber").equals(phonenumber)) {
					status = false;
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public static int updateProfile(XYZ_User_Bean user) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		// Date myDateStr = user.getDateOfBirth();
		// Date myDate = valueOf(myDateStr);
		int flag = 0;
		String sql = "update frs_tbl_users_profile set phonenumber='" + user.getPhoneNumber() + "',dob ='"
				+ user.getDateOfBirth() + "'," + "gender='" + user.getGender() + "',street ='" + user.getStreet()
				+ "',pincode='" + user.getPincode() + "',city='" + user.getCity() + "',state='" + user.getState()
				+ "',district='" + user.getDistrict() + "' where userid = '" + user.getUserid() + "'";
		try {
			connection = DBUtil.getConnection();

			preparedStatement = connection.prepareStatement(sql);
			// preparedStatement.setString(1, userid);
			// preparedStatement.setString(2, password);
			// preparedStatement.setString(3, "C");
			// preparedStatement.setInt(4, 0);
			preparedStatement.executeUpdate();
			flag = 1;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(connection, preparedStatement, resultSet);
		}

		return flag;
	}

	public static String loginStatus(String userid) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		// Date myDateStr = user.getDateOfBirth();
		// Date myDate = valueOf(myDateStr);
		int flag = 0;
		String sql = "update frs_tbl_user_credentials set loginstatus = 1 where userid ='" + userid + "'";
		try {
			connection = DBUtil.getConnection();

			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(connection, preparedStatement, resultSet);
		}
		return "success";
	}
}
