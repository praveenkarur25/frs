package com.frs.xyz.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.frs.xyz.service.RouteDetails;

@WebServlet("/deleteroute")
public class DeleteRoute extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String routeid = request.getParameter("routeid");
		// RouteDetails flightDetails = new RouteDetails();
		boolean deleteStatus = RouteDetails.deleteRoute(routeid);
		System.out.println(routeid);
		if (deleteStatus == true) {
			PrintWriter out = response.getWriter();

			out.println("<script type=\"text/javascript\">");
			out.println("alert('Route Details Deleted successfully.');");

			out.println("</script>");

			RequestDispatcher rd = request.getRequestDispatcher("Route.jsp");
			rd.include(request, response);

		}

	}
}
