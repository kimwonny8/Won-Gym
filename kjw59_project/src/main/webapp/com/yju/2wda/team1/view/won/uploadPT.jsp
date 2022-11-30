<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
</style>
<link rel="stylesheet" href="<%=cssDir%>/wideform.css">
</head>

<body>
	<%@ include file="../module/header.jsp"%>
<% 
	String t_name = (String)session.getAttribute("m_name");
	String c_code = (String)session.getAttribute("c_code");
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
				<input type="text" name="pt_title" required class="inputBox">
				<p>이름</p>
				<input type="text" name="t_name" value=<%=t_name %> disabled class="inputBox">
				<p>동네</p>
				<input type="text" name="c_code" value=<%=c_code%> disabled class="inputBox">
				<p>상담 가격</p>
				<input type="number" min="0" name="pt_one_c" required class="inputBox">
				<p>회당 가격</p>
				<input type="number" min="0" name="pt_con_c" required class="inputBox">
			</div>
		</div>
		<!-- 내용 바로 위 -->
		<div class="writeContent">
			<div class="writeContentTop">
				<p>내용</p>
			</div>
			<textarea required class="writeContentBox" name="pt_content"></textarea>
			<button class="Btn inputBtn" style="margin-top:3vh;" >작성 완료</button>
		</div>
	</form>

	<%@ include file="../module/footer.jsp"%>
</body>
</html>