<%@page import="com.frs.xyz.controller.AddFlight"%>
<%@page import="com.frs.xyz.service.Flight_Details"%>
<%@page import ="java.io.PrintWriter"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>

<%@ page language="java" import="com.frs.xyz.bean.*,java.util.*,com.frs.xyz.dao.*,com.frs.xyz.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%	
Connection connection = null;
PreparedStatement preparedStatement = null;
ResultSet resultSet = null;
String userid = (String)session.getAttribute("userid");
String query = "update frs_tbl_user_credentials set loginstatus = 0 where userid='"+userid+"'";
try{
	connection = DBUtil.getConnection();
	preparedStatement = connection.prepareStatement(query);
	preparedStatement.executeUpdate();
	//PrintWriter logout = response.getWriter();
	
	//out.println("<script type=\"text/javascript\">");
	//out.println("alert('logged out successfully')");

	//out.println("</script>");
	request.setAttribute("exist", ""+userid+" logged out successfully");
	RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
	rd.forward(request, response);
}
catch(Exception e){
	e.printStackTrace();
}


%>
</body>
</html>