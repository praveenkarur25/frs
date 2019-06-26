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

@WebServlet("/edit")
public class Flight_EditDetails extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("Flights.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String flight_Name = request.getParameter("flightName");
		String flightId = request.getParameter("flightid");
		System.out.println(flight_Name);
		int fare = Integer.parseInt(request.getParameter("fare"));

		int firstclass_fare = Integer.parseInt(request.getParameter("fare"));
		int economey_fare = (firstclass_fare * 25) / 100 + firstclass_fare;
		int business_fare = (firstclass_fare * 25) / 100 + firstclass_fare;

		int fareArr[] = new int[] { economey_fare, business_fare, firstclass_fare };

		Flight_Details flightDetails = new Flight_Details();
		boolean updateStatus = flightDetails.update(flightId, flight_Name, fareArr);
		if (updateStatus == true) {
			PrintWriter out = response.getWriter();

			out.println("<script type=\"text/javascript\">");
			out.println("alert('Flight Details updated successfully.');");

			out.println("</script>");

			RequestDispatcher rd = request.getRequestDispatcher("Flights.jsp");
			rd.include(request, response);

		}

	}

}
