<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Charge Coins!</title>
<script
  src="http://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%=cssDir%>/cart.css">
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
		<p class="menuTitle">코인 충전</p>
	</div>
	
	<div class="coinForm">
		<p style="font-size: 0.8vw;">충전할 코인 금액을 선택해주세요.</p>
		<div class="coinFormInner">
			<p style="text-align: right; font-size: 0.8vw;"> * 1코인 = 1000원 </p>
			<div class="coinSelectH">
				<input type="radio" name="coin" id="5코인" value="5"><label for="5코인"> 5 코인</label>
			</div>
			<div class="coinSelectH">
				<input type="radio" name="coin" id="10코인" value="10"><label for="10코인"> 10 코인</label>
			</div>
			<div class="coinSelectH">
				<input type="radio" name="coin" id="30코인" value="30"><label for="30코인"> 30 코인</label>
			</div>
			<div class="coinSelectH">
				<input type="radio" name="coin" id="50코인" value="53"><label for="50코인"> 50 코인 + <b>3 코인!</b></label>
			</div>
			<div class="coinSelectH">
				<input type="radio" name="coin" id="100코인" value="105"><label for="100코인"> 100 코인 + <b>5 코인!</b></label>
			</div>
			<div class="coinSelectH">
				<input type="radio" name="coin" id="200코인" value="220"><label for="200코인"> <b style="color:red;">정기결제</b>시 200 코인 + <b>20 코인!</b></label>
			</div>
		</div>
		
		
		<div class="orderList" style="width:70%;">
			<div class="orderListLeft">
				<p>총 주문 금액</p>
			</div>
			<div class="orderListRight">
				<div class="orderListH">
					<p>주문상품 수</p>
					<p id="cnt">개</p>
				</div>
				<div class="orderListH">
					<p>결제 금액</p>
					<p style="color: red; font-size: 1vw" id="money">코인</p>
				</div>
				<div class="orderListH">
					<p>현재 잔액 금액</p>
					<p><%=m_coin%> 코인</p>
				</div>
				<div class="orderListH lastH">
					<p>결제 후 잔액 금액</p>
					<p id="afterMoney">코인</p>
				</div>
			</div>
		</div>
		<input type="button" class="btn" id="nextBtn" value="무통장 입금">
		<input type="button" class="btn" onclick="alert('준비 중인 기능입니다.');" value="카드 결제">
		<input type="button" class="btn" onclick="alert('준비 중인 기능입니다.');" value="계좌 이체">
		
	</div>
	
	<%@ include file="../module/footer.jsp"%>
<script>
window.onpageshow = function(event) {
    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
    alert("잘못된 접근입니다.");
    location.href="/kjw59_project/index.jsp";
  }
}
	var money = 0;
	var total = 0;
	$(document).ready(function() {
	$('input[name="coin"]').change(function() {
		var currMoney = <%=m_coin%>;
		var chk = $('input[name="coin"]:checked').val();
		
		if(chk == 53) money = 50*1000;
		else if(chk == 105) money = 100*1000;
		else if(chk == 220) money = 200*1000;
		else money = chk*1000;
		
		total = Number(currMoney)+Number(chk);
		$('#cnt').text(chk+" 개");
		$('#money').text(money+" 코인");
		$('#afterMoney').text(total+" 코인");
	});	
		
	$("#nextBtn").click(function() {
		var val = $('input[name="coin"]:checked').val();
		if(val == undefined) {
			alert("충전할 코인 금액을 선택해주세요!");
		}
		else {
			location.href="<%=wonViewDir%>/deposit.jsp?money="+money+"&&total="+total;
		}
	});
}); 
</script>
</body>
</html>