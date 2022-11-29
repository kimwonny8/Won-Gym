<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WorkOutNow Class Open</title>
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
<link rel="stylesheet" href="../../css/style.css">
</head>
<body>
	<%@ include file="../module/header.jsp"%>
	
	<div class="bottom">
		<p class="menuTitle">수업신청</p>
	</div>
	
	<div class="form">
		<!-- 검색하는 부분 -->
	<div>
	
	</div>
	
	<!-- 글쓰기 -->
	<button onclick="location.href='<%=wonViewDir%>/uploadPT.jsp'">글쓰기</button>
	</div>
	
	
	<%@ include file="../module/footer.jsp"%>
</body>
</html>