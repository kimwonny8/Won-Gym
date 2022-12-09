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
</style>
</head>
<body>
<%@ include file="../module/header.jsp"%>
<div class="bottom">
		<p class="menuTitle">오류</p>
	</div>
<div style="text-align:center;">
 <h1>오류페이지! 관리자에게 문의하세요</h1>
</div>
<%@ include file="../module/footer.jsp"%>
</body>
</html>