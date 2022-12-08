<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="kjw59_project.model.won.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<script src="http://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%=cssDir%>/cart.css">
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

.myPageForm {
	padding: 3vw 1vw;
	display: flex;
	margin-top: 5vw;
	margin-bottom: 5vw;
	width: 50%;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	border: 0.05vw solid #DCDCDC;
}

.myPageClass {
	width: 80%;
	height: 12vw;
	font-size: 0.9vw;
	border-top: 0.01vw solid gray;
	border-bottom: 0.01vw solid gray;
	padding: 1vw 0;
	display: flex;
	flex-direction: column;
	justify-content: space-around;
	margin-top: 1vw;
	margin-bottom: 3vw;
}

.mypageBtn {
	font-size: 0.8vw;
	width: 10vw;
	height: 2vw;
	background-color: #72787F;
	color: white;
	border: none;
}

.mypageBtn:hover {
	opacity: 0.7;
}

.basicForm {
	width: 60%;
	margin-top: 2vw;
	margin-bottom: 2vw;
	text-align: center;
	margin-bottom: 2vw;
}

.basicFormInner {
	margin-top: 1vw;
	padding: 1.5vw 0;
	border-top: 0.05vw solid #DCDCDC;
	border-bottom: 0.05vw solid #DCDCDC;
	width: 70%;
	height: 20vw;
	display: flex;
	align-items: center;
}

.cartForm {
	text-align: center;
	margin-top: 2vw;
	margin-bottom: 2vw;
}

.tableForm {
	width: 60%;
	border-collapse: collapse;
	margin-top: 2vw;
	margin-bottom: 2vw;
}

th {
	border-top: 0.05vw solid #DCDCDC;
	border-bottom: 0.05vw solid #DCDCDC;
	padding: 1vw 0.5vw;
	font-size: 0.8vw;
}

td {
	padding: 1vw 0.5vw;
	font-size: 0.8vw;
	border-top: 0.05vw solid #DCDCDC;
}

img {
border-radius : 50%;
}
</style>
<link rel="stylesheet" href="<%=cssDir%>/mypage.css">
</head>
<body>
	<%@ include file="../module/header.jsp"%>
	<%
	ArrayList<CartVO> cartList;
	cartList = (ArrayList<CartVO>) session.getAttribute("cartList");
	CartVO cart;
	%>
	<div class="bottom">
		<p class="menuTitle">신청내역관리</p>
	</div>

	<div class="cartForm">
		<%
		if (cartList.size() == 0) {
		%>
		<div class="basicForm">

			<div class="basicFormInner">
				<p>신청 내역이 없습니다.</p>
			</div>
		</div>

		<%
		} else {
		%>
		<table class="tableForm">
			<thead>
				<tr>
					<th>구매한 날짜</th>
					<th>상태</th>
					<th>트레이너정보</th>
					<th>신청분류</th>
					<th>결제금액</th>
					<th>입력한 추가 정보</th>

				</tr>
			</thead>
			<tbody>
				<%
				String[] arr = new String[cartList.size()+1];
				for (int i = 0; i < cartList.size(); i++) {
					cart = cartList.get(i);
					String state = cart.getMp_state();
					if(state.equals("PC")) state = "대기중";
					else if(state.equals("CP")) state = "진행중";
					else state="완료";
					
					String date = cart.getMp_date();
					date = date.substring(0, 11);
					arr[i + 1] = date;

					int mp_cnt = cart.getMp_cnt();
					String select;
					if (mp_cnt == 0)
						select = "상담요청";
					else
						select = "수업 " + mp_cnt + "회";

					if (date.equals(arr[i])) {
				%>
					<tr>
					<td style="border-top:none;"></td>
					<td style="border-top:none;"><b><%=state %></b></td>
					<td style="border-top:none;"><img src="<%=memberThumbDir%>/<%=cart.getMi_thum_name()%>"
						width=100 height=100> <br><%=cart.getT_name()%> 트레이너 <br>대구시 <%=cart.getC_code()%></td>
					<td style="border-top:none;"><%=select%></td>
					<td style="border-top:none;"><%=cart.getMp_coin()%> 코인</td>
					<td style="border-top:none;">키 : <%=cart.getMp_tall()%><br> 몸무게 : <%=cart.getMp_weight()%><br>
						상세정보 : <%=cart.getMp_detail()%></td>
					</tr>
				<%
				} else {
				%>

				<tr>
					<td><%=date%></td>
					<td><b><%=state %></b></td>
					<td><img src="<%=memberThumbDir%>/<%=cart.getMi_thum_name()%>"
						width=100> <br><%=cart.getT_name()%> 트레이너 <br>대구시
						<%=cart.getC_code()%></td>
					<td><%=select%></td>
					<td><%=cart.getMp_coin()%> 코인</td>
					<td>키 : <%=cart.getMp_tall()%><br> 몸무게 : <%=cart.getMp_weight()%><br>
						상세정보 : <%=cart.getMp_detail()%></td>
				<tr>
					<%
					}
					%>
				
			</tbody>
			<%
			}
			}
			%>
		</table>
	</div>

	<%@ include file="../module/footer.jsp"%>
</body>
</html>