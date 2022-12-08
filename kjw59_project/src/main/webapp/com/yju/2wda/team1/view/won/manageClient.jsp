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

.manageSearchMenu {
display: flex;
width: 20%;
margin-top: 2.5vw;
font-size: 1vw;
}
</style>
<link rel="stylesheet" href="<%=cssDir%>/mypage.css">
</head>
<body>
	<%@ include file="../module/header.jsp"%>
	<%
	ArrayList<MemberPtDTO> classList;
	classList = (ArrayList<MemberPtDTO>) session.getAttribute("classList");
	MemberPtDTO memberPt;
	%>
	<div class="bottom">
		<p class="menuTitle">신청내역관리</p>
	</div>
	
	<div class="manageSearchMenu">
		<a href="./manageClient.won">전체</a>/
		<a href="./manageClient.won?search=PC">대기중</a>/
		<a href="./manageClient.won?search=CP">진행중</a>/
		<a href="./manageClient.won?search=CC">완료</a>
	</div>
	
	<div class="cartForm">
		<%
		if (classList.size() == 0) {
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
					<th>번호</th>
					<th>아이디</th>
					<th>상품코드</th>
					<th>신청날짜</th>
					<th>상품종류</th>
					<th>상태</th>
					<th>옵션</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (int i = 0; i < classList.size(); i++) {
					memberPt = classList.get(i);
					String state = memberPt.getMp_state();
					
					if(state.equals("PC")) state = "대기중";
					else if(state.equals("CP")) state = "진행중";
					else state="완료";
					
					String date = memberPt.getMp_date();
					date = date.substring(0, 11);

					int mp_cnt = memberPt.getMp_cnt();
					String select;
					if (mp_cnt == 0)
						select = "상담요청";
					else
						select = "수업 " + mp_cnt + "회";
			%>
				<tr>
					<td><%=memberPt.getMp_code()%></td>
					<td><%=memberPt.getM_id()%>
					<td><a href="./selectPt.won?pt_code=<%=memberPt.getPt_code()%>">클릭시 이동 👉<%=memberPt.getPt_code() %></td>
					<td><%=date %></td>
					<td><%=select %></td>
					<td><b><%=state %></b></td>
					<% if(state.equals("대기중")) { %>
					<td>
						<a href="./updateState.won?mp_code=<%=memberPt.getMp_code()%>&mp_state=<%=memberPt.getMp_state()%>" class="smallBtn">수락</a>
						<a href="./refuseState.won?mp_code=<%=memberPt.getMp_code()%>" class="smallBtn">거절</a>
						<a href="./manageClientDetail.won?mp_code=<%=memberPt.getMp_code()%>" class="smallBtn">자세히</a>
					</td>
					<% } else if(state.equals("진행중")) {%>
					<td>
						<a href="./updateState.won?mp_code=<%=memberPt.getMp_code()%>&mp_state=<%=memberPt.getMp_state()%>" class="smallBtn">완료</a>
						<a href="./manageClientDetail.won?mp_code=<%=memberPt.getMp_code()%>" class="smallBtn">자세히</a>
					</td>
					<% } else { %>
					<td>
						<a href="./manageClientDetail.won?mp_code=<%=memberPt.getMp_code()%>" class="smallBtn">자세히</a>
					</td>
					<% } %>
				</tr>
				
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