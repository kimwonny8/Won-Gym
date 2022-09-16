<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>home</title>
</head>
<body>
	<h2>메인 페이지</h2>
<%
	String mb_name = (String)session.getAttribute("mb_name");
	String mb_id = (String)session.getAttribute("mb_id");
%>
<a href="./edit.jsp"><%=mb_name %></a> 님 환영합니다.
<%=mb_id %>
<form method="post" action="./member.jsp">
<input type="hidden" name="actionType" value="signOut">
<input type="submit" value="로그아웃">
<a href="./deleteMember.jsp?mb_id=<%=mb_id%>">회원탈퇴</a>
</form>
</body>
</html>