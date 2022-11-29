<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sign-up</title>
<style>
a {
	text-decoration-line: none;
}
.bottom {
	width: 70%;
	height: 20vh;
	background-image: url("../../image/login.jpg");
	background-repeat: no-repeat;
	background-size: 100% 50vh;
	opacity: 0.8;
	display: flex;
	align-items: center;
}

.gradeContents {
	width: 50%;
	margin: auto;
}

.gradeSelect {
	margin-bottom: 5vh;
	margin-top: 10vh;
	display: flex;
	justify-content: space-around;
	align-items: center;
}

.gradeSelectBtn {
	text-align: center;
	width: 15vw;
	border: none;
	background-color: white;
	padding-top: 3vh;
	margin-bottom: 6vh;
	font-size: 1rem;
	border-radius: 10px;
	padding: 1vh;
	opacity: 0.7;
}
.gradeSelectBtn:hover {
	opacity: 1;
}

.gradeIcon {
	width: 10vw;
	margin: 2vh;
}

</style>

</head>
<body>
	<%@ include file="../module/header.jsp"%>

	<div class="bottom">
		<p class="menuTitle">회원가입</p>
	</div>

	<div class="gradeContents">
		<div class="gradeSelect">
		
			<a href="<%=wonViewDir%>/signup_text.jsp?m_grade=client"  class="gradeSelectBtn">
				<img class="gradeIcon"
					src="https://cdn-icons-png.flaticon.com/512/456/456283.png">
				<p>일반 회원</p>
			</a>
		
			<a href="<%=wonViewDir%>/signup_text.jsp?m_grade=trainer"  class="gradeSelectBtn">
				<img class="gradeIcon"
					src="https://cdn-icons-png.flaticon.com/512/2235/2235532.png">
				<p>트레이너 회원</p>
			</a>
		</div>
	</div>

	<%@ include file="../module/footer.jsp"%>
</body>
</html>