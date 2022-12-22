<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deposit without passbook</title>
<link rel="stylesheet" href="<%=cssDir%>/chargeCoin.css">
<style>
.bottom {
	background-image: url("<%=imgDir%>/mypage.jpg");
}
</style>
</head>
<body>
	<%@ include file="../module/header.jsp"%>
	<% m_coin = (Integer)session.getAttribute("m_coin");  %>
	<div class="bottom">
		<p class="menuTitle">결제완료</p>
	</div>
	
	<div class="depositForm">
		<div class="depositFormInner">
			<p>충전이 완료되었습니다!</p>
			<p>(주)WON</p>
			<br>
			<p style="margin: 1vw;">현재 잔액 코인: <%=m_coin %> 코인</p>
			<a href="<%=wonViewDir%>/myPage.jsp" class="btn">확인</a>
<%-- 			<p style="margin: 1vw;">결제 완료 금액 <b><%=money%></b> 원</p>
			<a href="./updateCoin.won?total=<%=total%>" class="btn">확인</a> --%>
		</div>
	</div>
	
	<%@ include file="../module/footer.jsp"%>	

</body>
</html>