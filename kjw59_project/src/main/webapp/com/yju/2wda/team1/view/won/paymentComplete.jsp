<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Application Complete!</title>
<link rel="stylesheet" href="<%=cssDir%>/chargeCoin.css">
<style>
.bottom {
	width: 70%;
	height: 20vh;
	background-image: url("<%=imgDir%>/cart.jpg");
	background-repeat: no-repeat;
	background-size: 100% 60vh;
	opacity: 0.8;
	display: flex;
	align-items: center;
}

</style>
</head>
<body>
<%  String money = request.getParameter("money");
	String total = request.getParameter("total"); %>
	<%@ include file="../module/header.jsp"%>
	<div class="bottom">
		<p class="menuTitle">신청 완료</p>
	</div>
	
	<div class="depositForm">
		<div class="depositFormInner">
			<p>신청이 완료되었습니다!</p>
			<p>자세한 내용은 마이페이지에서 확인하세요!</p>
			<br>
			<a href="<%=rootDir%>/index.jsp" class="btn">홈으로</a>
		</div>
	</div>
	
	<%@ include file="../module/footer.jsp"%>	
</body>
</html>