
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<link rel="stylesheet" href="css/cafeDirectory.css">

<%
	String savedno = request.getParameter("savedno");
	String newno = request.getParameter("no");
	String name = request.getParameter("name");
	String location = request.getParameter("location");
	String time = request.getParameter("time");

	if (newno != null) {
		Connection con = null;
		PreparedStatement stmt = null;

		try {
			Class.forName("com.mysql.jdbc.Driver"); //load driver
			con = DriverManager.getConnection("jdbc:mysql://localhost/cafe?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root", "199165"); //create connection
			String query = "Update cafedirectory set no=?, name=?, location=?, time=? where no=" + savedno;
			stmt = con.prepareStatement(query);
			stmt.setString(1, newno);
			stmt.setString(2, name);
			stmt.setString(3, location);
			stmt.setString(4, time);
			int i = stmt.executeUpdate();
			if (i > 0) {
				out.println("Record Updated Successfully");
			} else {
				out.println("There is a problem in updating this record");
			}

		} catch (SQLException sql) {
			request.setAttribute("error", sql);
			out.println(sql);
		}
	}
%>


<a href="cafeAdmin.jsp" class="btn btn-one">Show Cafe</a>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>