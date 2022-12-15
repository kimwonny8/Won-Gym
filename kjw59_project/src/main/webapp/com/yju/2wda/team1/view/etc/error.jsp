<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error</title>
<style>

.bottom {
	width: 70%;
	height: 20vh;
	background-image: url("<%=imgDir%>/mypage.jpg");
	background-repeat: no-repeat;
	background-size: 100% 50vh;
	opacity: 0.6;
	display: flex;
	align-items: center;
}
.errorForm{
	height: 20vw;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center; 
}

.errorForm > p {
	font-size: 1.5vw;
}
</style>
</head>
<body>
<%@ include file="../module/header.jsp"%>
<div class="bottom">
		<p class="menuTitle">오류</p>
	</div>
<div class="errorForm">
	<p><img src="<%=imgDir%>/error.png" width="20vw"> 오류페이지! 관리자에게 문의하세요</p>
	<br>
	<br>
	<a href="/kjw59_project/index.jsp">홈으로</a>
</div>
<%@ include file="../module/footer.jsp"%>
</body>
</html>