package com.frs.xyz.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.frs.xyz.dao.BookingDAO;

@WebServlet("/cancel")
public class TicketCancel extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ticketnumber = request.getParameter("ticketnumber");
		int status = BookingDAO.deleteTicket(ticketnumber);
		if (status == 1) {
			response.sendRedirect("MyBooking.jsp");
		}
	}
}