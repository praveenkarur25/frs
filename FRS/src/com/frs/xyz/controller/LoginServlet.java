package com.frs.xyz.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.frs.xyz.service.Admin_User_Service;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
		rd.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userID = request.getParameter("userid");
		String password = request.getParameter("password");

		String details = Admin_User_Service.isValidDetails(userID, password);
		if (details.equals("A")) {
			response.sendRedirect("Flights.jsp");
		} else if (details.equals("C")) {
			response.sendRedirect("UserAcnt.jsp");

		} else {
//			PrintWriter out = response.getWriter();
//
//			out.println("<script type=\"text/javascript\">");
//			out.println("alert('UserID or password is incorrect');");
//			out.println("</script>");
			request.setAttribute("exist", "Userid or password is incorrect");

			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			rd.forward(request, response);
		}

	}

}
