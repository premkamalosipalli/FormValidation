<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet resultset; 
	PreparedStatement pstmt;
	System.out.println(request.getParameter("email"));
	try {
		Class.forName("org.h2.Driver");
		conn = DriverManager.getConnection("jdbc:h2:~/test", "sa", "");
		stmt = conn.createStatement();
	} catch (ClassNotFoundException | SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	stmt.execute(
			"CREATE TABLE IF NOT EXISTS Registration(FIRSTNAME VARCHAR(225), LASTNAME VARCHAR(255), MOBILE VARCHAR(255),"
					+ " EMAIL VARCHAR(255),CITY VARCHAR(255), STATE VARCHAR(255), PASSWORD VARCHAR(255)) ");
	pstmt = conn.prepareStatement("SELECT EMAIL FROM  Registration where EMAIL =?");
	pstmt.setString(1,request.getParameter("email"));
	resultset = pstmt.executeQuery();

	if (!resultset.next()) {// STLOC_ID is not present in the table then insert it in the table..
		System.out.println("stdloc value =" + request.getParameter("email"));
		pstmt = conn.prepareStatement(
				"insert into Registration(FIRSTNAME,LASTNAME,MOBILE,EMAIL,CITY,STATE,PASSWORD) values(?,?,?,?,?,?,?)");
		pstmt.setString(1,request.getParameter("firstname"));
		pstmt.setString(2,request.getParameter("lastname"));
		pstmt.setString(3,request.getParameter("mobile"));
		pstmt.setString(4,request.getParameter("email"));
		pstmt.setString(5,request.getParameter("city"));
		pstmt.setString(6,request.getParameter("state"));
		pstmt.setString(7,request.getParameter("password"));
		
		pstmt.executeUpdate();
		resultset.close();		
	} else {

		pstmt = conn.prepareStatement("UPDATE Registration set FIRSTNAME=?,LASTNAME=?,MOBILE=?,EMAIL=?,"
				+ "CITY=?,STATE=? WHERE EMAIL="
				+ request.getParameter("email") + ";");
		pstmt.setString(1,request.getParameter("firstname"));
		pstmt.setString(2,request.getParameter("lastname"));
		pstmt.setString(3,request.getParameter("mobile"));
		pstmt.setString(4,request.getParameter("email"));
		pstmt.setString(5,request.getParameter("city"));
		pstmt.setString(6,request.getParameter("state"));
		pstmt.setString(7,request.getParameter("password"));
		
		pstmt.executeUpdate();

	}
	%>
</body>
</html>