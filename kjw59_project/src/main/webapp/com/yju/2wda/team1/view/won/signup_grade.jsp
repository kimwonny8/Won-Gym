<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>sign-up</title>
<style>
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
<link rel="stylesheet" href="../../css/style.css">

</head>
<body>
	<%@ include file="../module/header.jsp"%>

	<div class="bottom">
		<p class="menuTitle">회원가입</p>
	</div>

	<div class="gradeContents">
		<div class="gradeSelect">
			<button class="gradeSelectBtn">
				<img class="gradeIcon"
					src="https://cdn-icons-png.flaticon.com/512/456/456283.png">
				<p>일반 회원</p>
			</button>

			<button class="gradeSelectBtn">
				<img class="gradeIcon"
					src="https://cdn-icons-png.flaticon.com/512/2235/2235532.png">
				<p>트레이너 회원</p>
			</button>
		</div>
	</div>

	<%@ include file="../module/footer.jsp"%>
</body>
</html>