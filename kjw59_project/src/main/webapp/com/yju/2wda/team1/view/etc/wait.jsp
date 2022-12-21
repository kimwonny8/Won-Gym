<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error</title>
<style>

.bottom {
	background-image: url("<%=imgDir%>/wait.jpg");
}
.errorForm{
	height: 70%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center; 
	padding: 2vw 0;
}

.errorForm > p {
	font-size: 1.5vw;
}
.errorForm > img {
	height: 20vw;
}
</style>
</head>
<body>
<%@ include file="../module/header.jsp"%>
<div class="bottom">
		<p class="menuTitle">준비 중</p>
	</div>
<div class="errorForm">
	<img src="<%=imgDir%>/prepare.jpg">
	<a href="<%=rootDir%>/index.jsp">홈으로</a>
</div>
<%@ include file="../module/footer.jsp"%>
</body>
</html>