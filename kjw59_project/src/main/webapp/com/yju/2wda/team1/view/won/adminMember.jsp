<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="kjw59_project.model.won.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<link rel="stylesheet" href="<%=cssDir%>/cart.css">
<script
  src="http://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
<style>
td > a {
	font-size: 0.8vw;
}
.bottom {
	background-image: url("<%=imgDir%>/mypage.jpg");
}

</style>
</head>
<body>
<%@ include file="../module/header.jsp"%>
<%
	ArrayList<MemberDTO> memberList;
	memberList = (ArrayList<MemberDTO>) session.getAttribute("memberList");
	MemberDTO member;
%>
<div class="bottom">
	<p class="menuTitle">회원 관리</p>
</div>

<div class="cartForm">
	<form method="post" action="./adminMember.won">
		<select name="search">
			<option value="전체" selected>전체</option>
			<option value="m_id">아이디</option>
			<option value="m_name">이름</option>
			<option value="m_birth">생년월일</option>
			<option value="m_gender">성별</option>
			<option value="m_phone">휴대폰번호</option>
			<option value="c_code">동네</option>
			<option value="m_grade">회원 등급</option>
		</select>
		<input type="text" class="inputBox" name="searchContent">
		<button class="smallBtn">검색</button>
	</form>
		<%
		if (memberList.size() == 0) {
		%>
		<div class="basicForm">

			<div class="basicFormInner">
				<p>회원이 없습니다.</p>
			</div>
		</div>

		<%
		} else {
		%>
		<table class="tableForm">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>휴대폰번호</th>
					<th>코인</th>
					<th>동네</th>
					<th>회원 등급</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (int i = 0; i < memberList.size(); i++) {
					member = memberList.get(i);
					String grade = member.getM_grade();
					if(grade.equals("client")) grade = "일반";
					else if(grade.equals("trainer")) grade = "트레이너";
					else if(grade.equals("trainerW")) grade = "트레이너(대기중)";
					if(member.getM_id().equals("admin")) continue;
				%>
				<tr>
					<td><%=member.getM_id() %></td>
					<td><%=member.getM_name() %></td>
					<td><%=member.getM_birth() %></td>
					<td><%=member.getM_gender() %></td>
					<td><%=member.getM_phone() %></td>
					<td><%=member.getM_coin() %></td>
					<td><%=member.getC_code() %></td>
					<% if(grade.equals("트레이너(대기중)")) { %>
						<td><a href="./adminTrainerDetail.won?m_id=<%=member.getM_id()%>"><%=grade %></a></td>
					<% } else { %>
					<td><%=grade %></td> <% } %>
					<td>
					<form method="post" action="./updateGrade.won">
						<select name="m_grade">
							<option value="client">client</option>
							<option value="trainer">trainer</option>
						</select>
						<input type="hidden" name="m_id" value="<%=member.getM_id() %>">
						<button class="smallBtn">변경</button>
						<a href="./expulsionMember.won?m_id=<%=member.getM_id() %>" onclick="return chk()">추방</a></td>
					</form>
				<tr>	
			</tbody>
				<% } }%>
		</table>
</div>
<%@ include file="../module/footer.jsp"%>
<script>
function chk() {
	return confirm("정말 추방시키시겠습니까?");
}
</script>
</body>
</html>