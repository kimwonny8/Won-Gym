<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="kjw59_project.model.won.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>payment Progress</title>
<link rel="stylesheet" href="<%=cssDir%>/cart.css">
<link rel="stylesheet" href="<%=cssDir%>/chargeCoin.css">
<style>
.bottom {
	background-image: url("<%=imgDir%>/cart.jpg");
}

</style>
</head>

<body>
	<%@ include file="../module/header.jsp"%>
	<%
	ArrayList<CartVO> cartList;
	cartList = (ArrayList<CartVO>) session.getAttribute("cartList");
			CartVO cart;
			
			m_coin = (Integer)session.getAttribute("m_coin");
			int totalCnt=cartList.size();
			int totalCoin=0;
	%>
	<div class="bottom">
		<p class="menuTitle">결제 진행</p>
	</div>

	<div class="cartForm">
		<p class="onTheFormP" style="text-align: center;">선택한 상품</p>
		<table class="tableForm" style="margin-top: 0;">
			<thead>
				<tr>
					<th>트레이너정보</th>
					<th>신청분류</th>
					<th>결제금액</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (cartList.size() == 0) {
				%>
				<p>결제할 상품이 없습니다.</p>
				<%
				} else {
				for (int i = 0; i < cartList.size(); i++) {					
					cart = cartList.get(i);
					
					totalCoin += cart.getMp_coin(); // 전체 금액
					String thumbsnail = cart.getMi_thum_name();
					int mp_cnt = cart.getMp_cnt();
					String select;
					if (mp_cnt == 0)
						select = "상담요청";
					else
						select = "수업 " + mp_cnt + "회";
				%>
				<tr>
					<td>
						<p class="tableT">
							<img class="cartImg" src="<%=memberThumbDir%>/<%=thumbsnail%>" width=70>
							<%=cart.getT_name()%>
							트레이너<br> 대구시
							<%=cart.getC_code()%></p>
					</td>
					<td><%=select%></td>
					<td><%=cart.getMp_coin()%> 코인</td>
				<tr>
					<%
					}
					}
					%>
				
			</tbody>
		</table>

		<form method="post" action="./paymentComplete.won" onsubmit="return chkCoin()">
		<div class="paymentForm">
			<p class="onTheFormP" style="text-align: center;">신청자 추가 정보</p>
			<div class="paymentFormInner">
				<div class="formInputLineH">
					<p>키</p>
					<input type="number" min=0 max=200 required name="mp_tall" id="mp_tall" class="inputBox">
				</div>
				<div class="formInputLineH">
					<p>체중</p>
					<input type="number"  min=0 max=200 required name="mp_weight" id="mp_weight" class="inputBox">
				</div>
				<div class="formInputLineH">
					<p>상세정보</p>
					<input type="text" name="mp_detail" id="mp_detail" maxlength="50" required class="inputBox"
						placeholder="ex) 허리가 좋지 않습니다.">
				</div>
			</div>
		</div>
		<% int afterCoin = m_coin - totalCoin; %>
		<div class="orderList">
			<div class="orderListLeft">
				<p>총 주문 금액</p>
			</div>
			<div class="orderListRight">
				<div class="orderListH">
					<p>주문상품 수</p>
					<p><%=totalCnt%> 개</p>
				</div>
				<div class="orderListH">
					<p>결제 금액</p>
					<p><%=totalCoin %> 코인</p>
				</div>
				<div class="orderListH">
					<p>현재 잔액 금액</p>
					<p><%=m_coin%> 코인</p>
				</div>
				<div class="orderListH lastH">
					<p>결제 후 잔액 금액</p>
					<p style="color: red; font-size: 1vw"><%=afterCoin %> 코인</p>
				</div>
			</div>
		</div>
		<input type="hidden" name="afterCoin" value="<%=afterCoin%>">
		<input type="submit" class="Btn inputBtn" value="신청하기" id="orderBtn">
		</form>
	</div>
	<%@ include file="../module/footer.jsp"%>
	
<script>
function chkCoin() {
	const afterCoin = <%=afterCoin%>;
	if(afterCoin < 0 ){
		alert("결제할 금액이 없습니다. 코인 충전 후 이용해주세요!");
		return false;
	}
	else {
		return true;
	}
	
}
</script>
</body>
</html>