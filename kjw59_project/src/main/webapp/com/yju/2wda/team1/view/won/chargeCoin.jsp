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
 <!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
	<% 
	m_id = (String)session.getAttribute("m_id");
	m_name = (String)session.getAttribute("m_name");
	m_coin = (Integer)session.getAttribute("m_coin");  %>
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
				<input type="radio" name="coin" id="100코인" value="107"><label for="100코인"> 100 코인 + <b>7 코인!</b></label>
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
					<p style="color: red; font-size: 1vw" id="money">원</p>
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
		<input type="button" class="btn" onclick="pay()" value="카카오 페이">
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
		else if(chk == 107) money = 100*1000;
		else if(chk == 220) money = 200*1000;
		else money = chk*1000;
		
		total = Number(currMoney)+Number(chk);
		$('#cnt').text(chk+" 개");
		$('#money').text(money+" 원");
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

function pay() {
	$(function(){
    var IMP = window.IMP; // 생략가능
    IMP.init('imp05343127'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
    var msg;
    
    IMP.request_pay({
        pg : 'kakaopay',
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : '코인충전',
        amount : money,
        buyer_name : '<%=m_name%>',
<%--    buyer_email : '<%=email%>',
        buyer_tel : '<%=phone%>',
        buyer_addr : '<%=address%>', --%>
        buyer_postcode : '123-456',
        //m_redirect_url : 'http://www.naver.com'
    }, function(rsp) {
        if ( rsp.success ) {
            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
            jQuery.ajax({
                url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                type: 'POST',
                dataType: 'json',
                data: {
                    imp_uid : rsp.imp_uid
                    //기타 필요한 데이터가 있으면 추가 전달
                }
            }).done(function(data) {
                //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                if ( everythings_fine ) {
                    msg = '결제가 완료되었습니다.';
                    msg += '\n고유ID : ' + rsp.imp_uid;
                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                    msg += '\결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;
                    
                    alert(msg);
                } else {
                    //[3] 아직 제대로 결제가 되지 않았습니다.
                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                }
            });
            //성공시 이동할 페이지
            location.href="<%=wonViewDir%>/paymentSuccess.jsp?money="+money+"&&total="+total;
        } else {
            msg = '결제에 실패하였습니다.';
            msg += '\n에러내용 : ' + rsp.error_msg;
            //실패시 이동할 페이지
			history.back();
            alert(msg);
        }
    });
	});
};
</script>
</body>
</html>