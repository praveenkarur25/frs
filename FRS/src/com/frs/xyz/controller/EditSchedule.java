package com.frs.xyz.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.frs.xyz.dao.ScheduleDAO;

@WebServlet(urlPatterns = "/schedule")
@SuppressWarnings("serial")
public class EditSchedule extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// String routeid = request.getParameter("routeid");
		String flightId = request.getParameter("flightid");
		String departuretime = request.getParameter("departuretime");
		int duration = Integer.parseInt(request.getParameter("duration"));
		String days[] = request.getParameterValues("days");
		int status = ScheduleDAO.updateSchedule(flightId, days, duration, departuretime);
		if (status == 1) {
			PrintWriter out = response.getWriter();

			out.println("<script type=\"text/javascript\">");
			out.println("alert('Schedule modified successfully');");

			out.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher("Schedule.jsp");
			rd.include(request, response);
		}
	}
}
