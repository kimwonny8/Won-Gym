<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="kjw59_project.model.won.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart - Buy Now!</title>
<style>
.bottom {
	width: 70%;
	height: 20vh;
	background-image: url("../../image/cart.jpg");
	background-repeat: no-repeat;
	background-size: 100% 30vh;
	opacity: 0.8;
	display: flex;
	align-items: center;
}

.cartForm {
	width: 50vw;
	text-align: center;
	margin-top: 2vw;
	margin-bottom: 2vw;
	 border-collapse : collapse;
}

input[type="checkbox"] {
	display: none;
}

input[type="checkbox"]+label {
	display: inline-block;
	width: 1.2vw;
	height: 1.2vw;
	border: 0.1vw solid #707070;
	position: relative;
}

input[id="check1"]:checked+label::after {
	content: '✔️';
	font-size: 0.8vw;
	width: 1.2vw;
	height: 1.2vw;
	text-align: center;
	position: absolute;
	left: 0;
	top: 0;
}
th {
    background-color: gray;
    color: white;
    padding: 1vw 0.5vw;
    font-size: 0.9vw;
}

td {
    padding: 1vw 0.5vw;
    font-size: 0.8vw;
    border-bottom: 0.05vw solid #DCDCDC;
}

.view, .delete {
    border: 0.1vw solid gray;
    padding: 0.2vw 0.5vw;
    font-size: 0.7vw;
}

.view {
    background-color: gray;
    color: white;
}

.delete {
    background-color: white;
}

</style>
<link rel="stylesheet" href="<%=cssDir%>/class.css">
</head>
<body>
	<%@ include file="../module/header.jsp"%>
	<%
	ArrayList<cartVO> cartList;
	cartList = (ArrayList<cartVO>) request.getAttribute("cartList");
	cartVO cart;
	%>
	<div class="bottom">
		<p class="menuTitle">장바구니</p>
	</div>

	<table class="cartForm">
		<thead>
			<tr>
				<th>선택</th>
				<th>트레이너정보</th>
				<th>신청분류</th>
				<th>결제금액</th>
				<th>옵션</th>
			</tr>
		</thead>
		<tbody>
			<%
			if (cartList.size() == 0) {
			%>
			<p>장바구니에 담긴 상품이 없습니다.</p>
			<%
			} else {
			for (int i = 0; i < cartList.size(); i++) {
				cart = cartList.get(i);
				String thumbsnail = cart.getMi_thum_name();
				int mp_cnt = cart.getMp_cnt();
				String select;

				if (mp_cnt == 0)
					select = "상담요청";
				else
					select = "수업 " + mp_cnt + "회";
			%>

			<tr>
				<td><input type="checkbox" class="cntChkBtn" id="check1"> 
				<label	for="check1"></label></td>
				<td><img src="<%=memberThumbDir%>/<%=thumbsnail%>" width=100>
					<br><%=cart.getT_name()%> 트레이너 <br>대구시 <%=cart.getC_code()%></td>
				<td><%=select%></td>
				<td><%=cart.getMp_coin()%></td>
				<td><a href="#" class="view">수정</a>
				<a href="#" class="delete">삭제</a></td>
			<tr>
				<%
				}
				}
				%>
		</tbody>
	</table>
	
	<div class="orderList">
		<div class="orderListLeft"><p>총 주문 금액</p></div>
		<div class="orderListRight">
			<div class="orderListH"><p>주문상품 수</p>	<p></p></div>
			<div class="orderListH"><p>주문 금액</p><p></p></div>
			<div class="orderListH"><p>할인 금액</p><p></p></div>
			<div class="orderListH"><p>최종 결제 금액</p><p></p></div>
		</div>
	</div>
	<button>주문하기</button>

	<%@ include file="../module/footer.jsp"%>
</body>
</html>