package com.frs.xyz.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.frs.xyz.service.Flight_Details;

@WebServlet("/delete")
public class DeleteFlight extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("Flights.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String flightid = request.getParameter("flightid");
		Flight_Details flightDetails = new Flight_Details();
		boolean deleteStatus = flightDetails.delete(flightid);

		if (deleteStatus == true) {
			PrintWriter out = response.getWriter();

			out.println("<script type=\"text/javascript\">");
			out.println("alert('Flight Details Deleted successfully.');");

			out.println("</script>");

			RequestDispatcher rd = request.getRequestDispatcher("Flights.jsp");
			rd.include(request, response);

		}

	}
}
