<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.writeTotalForm {
	margin-top: 10vh;
	margin-bottom: 10vh;
	width: 70%;
	height: 100vh;
	border: 0.01rem solid #72787F;
}

.writeForm {
	display: flex;
	justify-content: space-evenly;
	align-items: center;
}

.bottom {
	width: 70%;
	height: 20vh;
	background-image: url("../../image/class.jpg");
	background-repeat: no-repeat;
	background-size: 100% 50vh;
	opacity: 0.8;
	display: flex;
	align-items: center;
}

.wirteFormLeft {
	margin-left: 10vw;
	hegiht: 30vh;
	padding: 5vh;
}

.wirteFormRight {
	margin-right: 10vw;
	hegiht: 30vh;
	padding: 3vh;
}

.writeContent {
	padding: 3vh;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 50vh;
}
.writeContentTop{
	padding: 2vh;
	width: 100%;
	float: left;
	display: flex;
	justify-content: space-between;
	align-items: center;
}
.writeContentBox{
	width: 70%;
	height: 40vh;
}
</style>
<link rel="stylesheet" href="../../css/style.css">
</head>

<body>
	<%@ include file="../module/header.jsp"%>
<% 
	String t_name = (String)session.getAttribute("m_name");
	String c_name = (String)session.getAttribute("c_name");
%>

	<div class="bottom">
		<p class="menuTitle">수업신청</p>
	</div>

	<form method="post" action="./uploadPT.won" enctype="multipart/form-data" class="writeTotalForm">
		<div class="writeForm">
			<div class="wirteFormLeft">
				<input type="file" placeholder="업로드할 프로필 사진을 선택해주세요.">
			</div>
			<div class="wirteFormRight">
				<p>제목</p>
				<input type="text" name="pt_title" class="inputBox">
				<p>이름</p>
				<input type="text" value=<%=t_name %> disabled class="inputBox">
				<p>동네</p>
				<input type="text" value=<%=c_name %> disabled class="inputBox">
				<p>상담 가격</p>
				<input type="text" name="pt_one_c" class="inputBox">
				<p>회당 가격</p>
				<input type="text" name="pt_con_c" class="inputBox">
			</div>
		</div>
		<!-- 내용 바로 위 -->
		<div class="writeContent">
			<div class="writeContentTop">
				<p>내용</p>
			</div>
			<textarea class="writeContentBox" name="pt_content"></textarea>
			<button class="Btn inputBtn" style="margin-top:3vh;" >작성 완료</button>
		</div>
	</form>

	<%@ include file="../module/footer.jsp"%>
</body>
</html>