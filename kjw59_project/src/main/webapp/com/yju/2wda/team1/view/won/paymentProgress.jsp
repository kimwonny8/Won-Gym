<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="kjw59_project.model.won.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>payment Progress</title>
<style>
.bottom {
	width: 70%;
	height: 20vh;
	background-image: url("<%=imgDir%>/cart.jpg");
	background-repeat: no-repeat;
	background-size: 100% 50vh;
	opacity: 0.8;
	display: flex;
	align-items: center;
}

.paymentForm {
	width: 60%;
	margin-top: 5vw;
	margin-bottom: 2vw;
	border-top: 0.05vw solid #DCDCDC;
	border-bottom: 0.05vw solid #DCDCDC;
	padding: 1.5vw 0;
}

.paymentFormInner {
	width: 70%;

}

.onTheFormP {
	width: 70%;
	margin-bottom: 0.8vw;
	font-size: 0.9vw;
}

.tableT {
	display: flex;
	justify-items: center;
	align-items: center;
	width: 50%;
}

img {
	margin: 0 1vw;
}
</style>
<link rel="stylesheet" href="<%=cssDir%>/cart.css">
</head>

<body>
	<%@ include file="../module/header.jsp"%>
	<%
	ArrayList<cartVO> cartList;
	cartList = (ArrayList<cartVO>) session.getAttribute("cartList");
	cartVO cart;
	
	int totalCnt=cartList.size();
	int totalCoin=0;
	%>
	<div class="bottom">
		<p class="menuTitle">결제 진행</p>
	</div>

	<div class="cartForm">
		<p class="onTheFormP">선택한 상품</p>
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
							<img src="<%=memberThumbDir%>/<%=thumbsnail%>" width=70>
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

		<div class="paymentForm">
			<p class="onTheFormP">신청자 정보</p>
			<div class="paymentFormInner">
				<div class="formInputLineH">
					<p>* 이름</p>
					<input type="text" id="m_name" name="m_name" oninput="checkName()"
						class="inputBox">
				</div>
				<div class="formInputLineH">
					<p>휴대폰번호</p>
					<input type="text" name="m_phone" id="m_phone" class="inputBox"
						placeholder="ex) 01012345678">
				</div>
				<div class="formInputLineH">
					<p>생년월일</p>
					<input type="text" id="m_birth" name="m_birth" class="inputBox"
						placeholder="ex) 19970117">
				</div>
				<div class="formInputLineH">
					<p>성별</p>
					<select name="m_gender" class="inputBox">
						<option value="남">남</option>
						<option value="여">여</option>
					</select>
				</div>
				<div class="formInputLineH">
					<p>키</p>
					<input type="text" name="mp_tall" id="mp_tall" class="inputBox">
				</div>
				<div class="formInputLineH">
					<p>체중</p>
					<input type="text" name="mp_weight" id="mp_weight" class="inputBox">
				</div>
				<div class="formInputLineH">
					<p>상세정보</p>
					<input type="text" name="mp_detail" id="mp_detail" class="inputBox"
						placeholder="ex) 허리가 좋지 않습니다. ">
				</div>
			</div>
		</div>
		
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
					<p>0 코인</p>
				</div>
				<div class="orderListH lastH">
					<p>결제 후 잔액 금액</p>
					<p style="color: red; font-size: 1vw">0 코인</p>
				</div>
			</div>
		</div>
		<input type="button" class="Btn inputBtn" value="주문하기" id="orderBtn">
		
	</div>
	<%@ include file="../module/footer.jsp"%>
</body>
</html>