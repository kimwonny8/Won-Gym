<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<style>
.inputBtn > p {
	font-size : 0.8rem;
}
a {
	text-decoration-line: none;
	color: black;
}
.bottom {
	width: 70%;
	height: 20vh;
	background-image: url("../../image/login.jpg");
	background-repeat: no-repeat;
	background-size: 100% 50vh;
	opacity: 0.6;
	display: flex;
	align-items: center;
}
</style>
</head>

<body>
	<%@ include file="../module/header.jsp"%>

	<div class="bottom">
		<p class="menuTitle">로그인</p>
	</div>
	
	<form method="post" action="./loginMember.won" class="form">
		<div class="FormInputLine">
			<p>아이디</p>
			<input type="text" name="m_id" class="inputBox">
		</div>
		<div class="FormInputLine">
			<p>비밀번호</p>
			<input type="password" name="m_pw" class="inputBox">
		</div>
		<div class="FormInputLine">
			<button onclick="location.href='<%=rootDir%>/index.jsp'" class="Btn inputBtn"><p>로그인</p></button>
		</div>
		<a href="<%=beerViewDir%>/signup_grade.jsp">회원가입</a>
	</form>

	<%@ include file="../module/footer.jsp"%>
</body>
</html>