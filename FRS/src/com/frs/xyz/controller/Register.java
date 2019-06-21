package com.frs.xyz.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.frs.xyz.bean.XYZ_User_Bean;
import com.frs.xyz.dao.UserDAO;
import com.frs.xyz.service.Admin_User_Service;

@WebServlet("/register")
public class Register extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String email = request.getParameter("email");
		String phoneNumber = request.getParameter("phonenumber");
		boolean status = UserDAO.checkmail(email, phoneNumber);
		if (status == false) {
			// PrintWriter out = response.getWriter();
			request.setAttribute("exist", "Email or phonenumber already exists");
			// out.println("<script type=\"text/javascript\">");
			// out.println("alert('Email or Phonenumber already exists ');");

			// out.println("</script>");

			RequestDispatcher rd = request.getRequestDispatcher("/Register.jsp");
			rd.forward(request, response);
			// response.sendRedirect("Register.jsp");
		} else {

			String first_Name = request.getParameter("firstname");
			String last_Name = request.getParameter("lastname");

			String password = request.getParameter("password");

			String user_Name = first_Name + " " + last_Name;
			XYZ_User_Bean userBean = new XYZ_User_Bean();
			userBean.setUser_First_Name(first_Name);
			userBean.setUser_Last_Name(last_Name);
			userBean.setEmail(email);
			userBean.setPassword(password);
			userBean.setPhoneNumber(phoneNumber);
			userBean.setUserName(user_Name);

			Admin_User_Service insertDetails = new Admin_User_Service();
			String userid = insertDetails.insertUser(userBean);
			int flag = 0;
			System.out.println("Registered successfully");
			PrintWriter out = response.getWriter();
			userBean.setUserid(userid);
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Registered Successfully and your userid is " + userid + "');");

			out.println("</script>");
			// List<XYZ_User_Bean> arraylist = new ArrayList<>();
			/// arraylist.add(userBean);

			request.setAttribute("userid", userid);
			flag = 1;
			if (flag == 1) {
				RequestDispatcher rd = request.getRequestDispatcher("/UserAcnt.jsp");
				rd.include(request, response);
			}
		}
	}
}
