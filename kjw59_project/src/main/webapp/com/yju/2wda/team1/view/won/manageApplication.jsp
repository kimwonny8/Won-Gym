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
<link rel="stylesheet" href="<%=cssDir%>/mypage.css">
<style>
.bottom {
	background-image: url("<%=imgDir%>/mypage.jpg");
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

	<div class="manageSearchMenu">
		<a href="./manageApplication.won">전체</a>/
		<a href="./manageApplication.won?search=PC">대기중</a>/
		<a href="./manageApplication.won?search=CP">진행중</a>/
		<a href="./manageApplication.won?search=CC">완료</a>/
		<a href="./manageApplication.won?search=RE">취소</a>
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
					else if(state.equals("RE")) state="취소(환불완료)";
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
					<td></td>
					<td><b><%=state %></b></td>
					<td><img src="<%=memberThumbDir%>/<%=cart.getMi_thum_name()%>"
						width=100 height=100> <br><%=cart.getT_name()%> 트레이너 <br>대구시 <%=cart.getC_code()%></td>
					<td><%=select%></td>
					<td><%=cart.getMp_coin()%> 코인</td>
					<td style="width:30%">키 : <%=cart.getMp_tall()%><br> 몸무게 : <%=cart.getMp_weight()%><br>
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