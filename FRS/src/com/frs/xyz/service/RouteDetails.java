package com.frs.xyz.service;

import com.frs.xyz.bean.Route_Bean;
import com.frs.xyz.dao.RouteDAO;

public class RouteDetails {
	public static String route(Route_Bean route) {

		int status = 0;
		RouteDAO routeDao = new RouteDAO();
		status = routeDao.updateRoute(route);
		if (status == 1)
			return "saved";
		else
			return "fail";
	}

	public static boolean deleteRoute(String routeid) {
		int status = 0;
		RouteDAO routeDao = new RouteDAO();
		status = routeDao.deleteRoute(routeid);
		if (status == 1)
			return true;
		else
			return false;
	}
}
