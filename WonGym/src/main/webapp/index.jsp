<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Welcome to Won-Gym</title>
</head>
<body>
<form method="post" action="./member.jsp">
아이디 : <input type="text" name="mb_id" size="20" placeholder="아이디를 입력해주세요.">
<br> 비밀번호 : <input type="password" name="mb_pw" size="20" placeholder="비밀번호를 입력해주세요.">
<input type="hidden" name="actionType" value="signIn">
<input type="submit" value="로그인">
</form>
<br><a href="./signUp.jsp">회원가입</a>
</body>
</html>