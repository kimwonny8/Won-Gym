<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String mb_id=request.getParameter("mb_id");
%>

<a href="./main.jsp">�ڷ�</a>
<h1>ȸ�� Ż��</h1>
<form method="post" action="./member.jsp">
���̵� : <input type="text" name="mb_id" size="20" value="<%=mb_id %>"  disabled>
<br> ��й�ȣ : <input type="password" name="mb_pw" size="30">
<br> ��й�ȣ Ȯ�� : <input type="password" name="mb_pw2" size="30">
<input type="hidden" name="actionType" value="memberDelete">
<input type="submit" value="ȸ��Ż��">
</form>
</body>
</html>