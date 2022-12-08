<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deposit without passbook</title>
<style>
.bottom {
	width: 70%;
	height: 20vh;
	background-image: url("<%=imgDir%>/mypage.jpg");
	background-repeat: no-repeat;
	background-size: 100% 60vh;
	opacity: 0.8;
	display: flex;
	align-items: center;
}

.depositForm {
	width: 60%;
	margin-top: 2vw;
	margin-bottom: 2vw;
	text-align: center;
	margin-bottom: 2vw;
}
.depositFormInner{
	margin-top: 1vw;
	padding: 1.5vw 0;
	border-top: 0.05vw solid #DCDCDC;
	border-bottom: 0.05vw solid #DCDCDC;
	width: 70%;
	
}

.onTheFormP{
	width: 70%;
	text-align: left;
	font-size: 0.9vw;
}
.btn {
	padding: 0.5vw;
	width: 7vw;
	height: 2vw;
	margin: 2vw;
	background-color: #72787F;
	color: white;
	border: none;
	font-size: 0.9vw;
}
.btn:hover {
	opacity: 0.7;
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
			<p>카카오뱅크 3333-04-0123456</p>
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