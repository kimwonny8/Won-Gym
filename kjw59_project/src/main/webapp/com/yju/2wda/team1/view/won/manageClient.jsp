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
	width: 70%;
	height: 20vh;
	background-image: url("<%=imgDir%>/mypage.jpg");
	background-repeat: no-repeat;
	background-size: 100% 60vh;
	opacity: 0.8;
	display: flex;
	align-items: center;
}


</style>
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
		<a href="./manageClient.won?search=CC">완료</a>/
		<a href="./manageClient.won?search=RE">취소</a>
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
					else if(state.equals("RE")) state="취소(환불완료)";
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
						<a href="./refuseState.won?mp_code=<%=memberPt.getMp_code()%>&mp_coin=<%=memberPt.getMp_coin()%>&m_id=<%=memberPt.getM_id()%>" onclick="return chk()" class="smallBtn">거절</a>
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
<script>
function chk(){
	var val=confirm("정말 거절하시겠습니까?\n거절 후 코인은 자동 환불됩니다.");
	return val;
}
</script>
</body>
</html>