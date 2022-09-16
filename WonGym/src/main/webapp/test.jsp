<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스 연결 JSP페이지</title>
</head>
<body>
<%
	String driverName="org.mariadb.jdbc.Driver";
	String url="jdbc:mariadb://localhost/book_db";
	String user="root";
	String pw="root";
	
	Class.forName(driverName);
	System.out.println("드라이버 연결 성공");
	
	Connection con=DriverManager.getConnection(url, user, pw);
	System.out.println("데이터베이스 연결 성공");
	con.close();
%>
</body>
</html>