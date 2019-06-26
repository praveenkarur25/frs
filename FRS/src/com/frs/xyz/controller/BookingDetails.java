package com.frs.xyz.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.frs.xyz.bean.TicketBean;
import com.frs.xyz.dao.BookingDAO;

@WebServlet("/booking")
public class BookingDetails extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// String flight = (String) request.getAttribute("flight");
		// System.out.println(flight);
		// System.out.println(request.getAttribute("seat"));
		String userid = request.getParameter("userid");
		String flightid = request.getParameter("flightid");
		String flightclass = request.getParameter("class");
		String dateofjourney = request.getParameter("date");
		String seat[] = request.getParameterValues(flightclass);
		System.out.println(seat.length + "kjfdtyhkogfnh");
		String seats = "";
		int i = 0;
		for (i = 0; i < seat.length - 1; i++) {
			seats += seat[i] + ",";
		}
		seats = seats + seat[i];
		int bookedSeats = seat.length;
		System.out.println(bookedSeats + "srinibnuhjhdsfjbd");
		System.out.println(seats);
		String name[] = request.getParameterValues("name");
		String names = Arrays.toString(name);

		TicketBean ticket = new TicketBean();
		ticket.setDateofjourney(dateofjourney);
		ticket.setUserid(userid);
		ticket.setFlightid(flightid);
		ticket.setNames(names);
		ticket.setSeats(seats);
		ticket.setBookedSeats(bookedSeats);
		int status = BookingDAO.insertBooking(ticket, flightclass);
		if (status == 1) {
			// request.setAttribute("userid", userid);
			// request.setAttribute("flightid", flightid);
			// request.setAttribute("flightclass", flightclass);

			// RequestDispatcher rd = request.getRequestDispatcher("MyBooking.jsp");
			// rd.include(request, response);
			response.sendRedirect("MyBooking.jsp");
		}

	}

}
