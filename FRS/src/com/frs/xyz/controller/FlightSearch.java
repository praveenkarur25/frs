package com.frs.xyz.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.frs.xyz.dao.Flight_DAO;

@WebServlet("/search")
public class FlightSearch extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String date[] = request.getParameter("date").split("/");
		String day = dayofweek(Integer.parseInt(date[1]), Integer.parseInt(date[0]), Integer.parseInt(date[2]));
		System.out.println(from + to);

		ArrayList<String> flightid = Flight_DAO.search(from, to, day);
		request.setAttribute("flightid", flightid);
		RequestDispatcher rd = request.getRequestDispatcher("Flights.jsp");
		rd.forward(request, response);
	}

	static String dayofweek(int d, int m, int y) {

		String day = "";
		int t[] = { 0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4 };
		y -= (m < 3) ? 1 : 0;
		int date = (y + y / 4 - y / 100 + y / 400 + t[m - 1] + d) % 7;

		// public static void main(String arg[])
		// {

		// int date = dayofweek(22, 6, 2019);
		switch (date) {
		case 0:
			day = "Sun";
			break;
		case 1:
			day = "Mon";
			break;
		case 2:
			day = "Tue";
			break;
		case 3:
			day = "Wed";
			break;
		case 4:
			day = "Thu";
			break;
		case 5:
			day = "Fri";
			break;
		case 6:
			day = "Sat";
			break;
		}
		System.out.println(day);
		return day;

	}
}
