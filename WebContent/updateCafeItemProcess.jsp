
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<link rel="stylesheet" href="css/cafeDirectory.css">

<%
	String savedid = request.getParameter("savedid");
	String newId = request.getParameter("id");
	String name = request.getParameter("name");
	String type = request.getParameter("type");
	String price = request.getParameter("price");

	if (newId != null) {
		Connection con = null;
		PreparedStatement stmt = null;

		try {
			Class.forName("com.mysql.jdbc.Driver"); //load driver
			con = DriverManager.getConnection("jdbc:mysql://localhost/cafe?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root", "199165"); //create connection
			String query = "Update cafeitem set id=?, name=?, type=?, price=? where id=" + savedid;
			stmt = con.prepareStatement(query);
			stmt.setString(1, newId);
			stmt.setString(2, name);
			stmt.setString(3, type);
			stmt.setString(4, price);
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