<%@ page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<link rel="stylesheet" href="css/register.css">

<%
	try {

		Class.forName("com.mysql.jdbc.Driver"); //load driver

		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost/cafe?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
				"root", "199165"); //create connection

		String username, password;
		username = request.getParameter("username"); //txt_email
		password = request.getParameter("password");

		PreparedStatement loginpstmt = null;
		loginpstmt = con.prepareStatement("select * from login");
		ResultSet loginrs = loginpstmt.executeQuery(); //execute query and store in resultset object rs.
		if (loginrs.next()) {
			String loginusername = loginrs.getString("username");
			loginpstmt = con.prepareStatement("update login set username=?,password=? where username=?");
			loginpstmt.setString(1, username);
			loginpstmt.setString(2, password);
			loginpstmt.setString(3, loginusername);
			loginpstmt.executeUpdate();
		}

		con.close();

	} catch (Exception e) {
		out.println(e);
	}
%>

<%
	try {

		Class.forName("com.mysql.jdbc.Driver"); //load driver

		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost/cafe?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
				"root", "199165"); //create connection

		String dbusername, dbpassword, loginusername;

		String username, password, category;

		username = request.getParameter("username");
		password = request.getParameter("password");
		category = request.getParameter("category");

		PreparedStatement pstmt = null; //create statement

		pstmt = con.prepareStatement("select * from user where username=? AND password=?"); //sql select query 
		pstmt.setString(1, username);
		pstmt.setString(2, password);

		ResultSet rs = pstmt.executeQuery(); //execute query and store in resultset object rs.

		if (rs.next()) {

			dbusername = rs.getString("username");
			dbpassword = rs.getString("password");

			if (category.equals("user")) {

				if (username.equals(dbusername) && password.equals(dbpassword)) {
					response.sendRedirect("homepage.html");
				}

			} else {
%>
<div class="box2">
	<h1>Wrong Username and Password</h1>
	<form action="login.html">
		<button type="submit">Ok</button>
	</form>
</div>
<%
	}
		}

		else {
			if (username.equals("Admin") && password.equals("123")) {
				response.sendRedirect("adminHomepage.html"); //after login success redirect to welcome.jsp page
			}

			else {
%>
<div class="box2">
	<h1>Wrong Username and Password</h1>
	<form action="login.html">
		<button type="submit">Back</button>
	</form>
</div>
<%
	}

		}

		con.close(); //close connection 

	} catch (Exception e) {
		out.println(e);
	}
%>
