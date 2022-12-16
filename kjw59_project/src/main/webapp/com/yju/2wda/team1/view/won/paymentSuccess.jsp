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
		<p class="menuTitle">결제완료</p>
	</div>
	
	<div class="depositForm">
		<div class="depositFormInner">
			<p>확인을 누르시면 코인 충전이 완료됩니다.</p>
			<p>(주)WON</p>
			<br>
			<p style="margin: 1vw;">결제 완료 금액 <b><%=money%></b> 원</p>
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