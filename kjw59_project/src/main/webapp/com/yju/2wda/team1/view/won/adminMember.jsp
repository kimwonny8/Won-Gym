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
		<input type="text" name="searchContent">
		<button>검색</button>
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
					<td><%=member.getM_grade() %></td>
					<td><a href="./expulsionMember.won?m_id=<%=member.getM_id() %>">추방</a></td>
				<tr>	
			</tbody>
				<% } }%>
		</table>
</div>
<%@ include file="../module/footer.jsp"%>
</body>
</html>