package com.frs.xyz.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.frs.xyz.bean.XYZ_User_Bean;
import com.frs.xyz.dao.UserDAO;

@WebServlet("/update")
public class UpdateProfile extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.sendRedirect("UserHome.jsp");

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String city = request.getParameter("city");
		String phoneNumber = request.getParameter("phonenumber");
		String state = request.getParameter("state");
		String pincode = request.getParameter("pincode");
		String gender = request.getParameter("gender");
		String dob = request.getParameter("dob");
		System.out.println(dob);
		String userid = request.getParameter("userid");
		String district = request.getParameter("district");
		String street = request.getParameter("street");

		XYZ_User_Bean user = new XYZ_User_Bean();
		user.setCity(city);
		user.setDateOfBirth(dob);
		user.setDistrict(district);
		user.setGender(gender);
		user.setPhoneNumber(phoneNumber);
		user.setPincode(pincode);
		user.setState(state);
		user.setStreet(street);
		user.setUserid(userid);

		int flag = 0;
		flag = UserDAO.updateProfile(user);
		if (flag == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("userid", userid);
			RequestDispatcher rd = request.getRequestDispatcher("UserHome.jsp");
			rd.forward(request, response);
		}

		// boolean status = UserDAO.checkmail(email, phoneNumber);
	}
}
