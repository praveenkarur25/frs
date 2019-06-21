package com.frs.xyz.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.frs.xyz.bean.Route_Bean;
import com.frs.xyz.service.RouteDetails;

@WebServlet("/route")
public class Route_Edit extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		String distance = request.getParameter("distance");
		int fare = Integer.parseInt(request.getParameter("fare"));
		String routeid = request.getParameter("route_id");
		String flightid = request.getParameter("flightid");
		System.out.println(routeid);

		Route_Bean route = new Route_Bean();
		route.setRouteid(routeid);
		route.setSource(source);
		route.setDestination(destination);
		route.setDistance(distance);
		route.setFare(fare);
		route.setFlightid(flightid);

		String status = RouteDetails.route(route);
		if (status.equals("saved")) {
			PrintWriter out = response.getWriter();

			out.println("<script type=\"text/javascript\">");
			out.println("alert('Route modified successfully');");

			out.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher("Route.jsp");
			rd.include(request, response);
		}

	}
}