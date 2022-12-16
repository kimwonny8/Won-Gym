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
<%  String money = request.getParameter("money");
	String total = request.getParameter("total"); %>
	<%@ include file="../module/header.jsp"%>
	<div class="bottom">
		<p class="menuTitle">무통장입금</p>
	</div>
	
	<div class="depositForm">
		<p class="onTheFormP">계좌번호 확인 후 입금해주세요.</p>
		<div class="depositFormInner">
			<p>계좌번호 : 00000000000</p>
			<p>(주)WON</p>
			<br>
			<p style="margin: 1vw;">입금하실 금액 <b><%=money%></b> 원</p>
			<a href="./updateCoin.won?total=<%=total%>" class="btn">확인</a>
		</div>
	</div>
	
	<%@ include file="../module/footer.jsp"%>	
<script>
window.onpageshow = function(event) {
    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
    alert("잘못된 접근입니다.");
    location.href="/kjw59_project/index.jsp";
  }
}
</script>
</body>
</html>