<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<link rel="stylesheet" href="<%=cssDir%>/grade.css">
<script
  src="http://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
<style>
.bottom {
	width: 70%;
	height: 20vh;
	background-image: url("<%=imgDir%>/mypage.jpg");
	background-repeat: no-repeat;
	background-size: 100% 60vh;
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
	<p class="menuTitle">관리페이지</p>
</div>

<div class="gradeContents">
		<div class="gradeSelect">
		
			<a href="./adminMember.won"  class="gradeSelectBtn">
				<img class="gradeIcon"
					src="https://cdn-icons-png.flaticon.com/512/456/456283.png">
				<p>회원 관리</p>
			</a>
		
			<a href="./adminPost.won"  class="gradeSelectBtn">
				<img class="gradeIcon"
					src="https://cdn-icons-png.flaticon.com/512/6753/6753207.png">
				<p>게시글 관리</p>
			</a>
		</div>
	</div>

<%@ include file="../module/footer.jsp"%>
</body>
</html>