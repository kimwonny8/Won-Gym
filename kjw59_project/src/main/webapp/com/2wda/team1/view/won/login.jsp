<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/style.css">
</head>
<body>
	<%@ include file="../module/header.jsp"%>

	<div class="bottom">
		<p class="menuTitle">로그인</p>
	</div>
	
	<div class="form">
		<div class="FormInputLine">
			<p>아이디</p>
			<input type="text" class="inputBox">
		</div>
		<div class="FormInputLine">
			<p>비밀번호</p>
			<input type="password" class="inputBox">
		</div>
		<div class="FormInputLine">
			<button class="Btn inputBtn">로그인</button>
		</div>
		<div class="FormInputLine">
			<button class="Btn">회원가입</button>
		</div>
	</div>

	<%@ include file="../module/footer.jsp"%>
</body>
</html>