<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="kjw59_project.model.won.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WorkOutNow Class Open</title>
<style>
.bottom {
	width: 70%;
	height: 20vh;
	background-image: url("<%=imgDir%>/class.jpg");
	background-repeat: no-repeat;
	background-size: 100% 50vh;
	opacity: 0.8;
	display: flex;
	align-items: center;
}

</style>
<link rel="stylesheet" href="<%=cssDir%>/class.css">
</head>
<body>
	<%@ include file="../module/header.jsp"%>
	<%
	String s_c_code=(String)session.getAttribute("select_c_code");
	if(s_c_code == null) s_c_code="전체";
	
	m_grade = (String) session.getAttribute("m_grade");
	allClassVO allVO;
	ArrayList<allClassVO> classList;

	classList = (ArrayList<allClassVO>) session.getAttribute("classList");
	%>

	<div class="bottom">
		<p class="menuTitle">수업신청</p>
	</div>

	<div class="classTotalForm">

		<div class="classMenu">
			<!-- 검색하는 부분 -->
			<form method="post" action="./getClassList.won" class="classMenuSearch">
				동네
				<select id="c_code" name="c_code">
					<option value="전체">전체</option>
					<option value="수성구">수성구</option>
					<option value="중구">중구</option>
					<option value="동구">동구</option>
					<option value="서구">서구</option>
					<option value="남구">남구</option>
					<option value="북구">북구</option>
					<option value="달서구">달서구</option>
					<option value="달성군">달성군</option>
				</select>
				<button>검색</button>
			</form>
			<!-- 현재 __ 검색 중 -->
			<div class="classMenuMsg">
			<p>현재 대구시 <%=s_c_code %> 검색 중</p>
			<p style="width: 5vw; border-bottom: 1px solid gray; margin-top: 0.5vw"></p>
			</div>
			<!-- 글쓰기 -->
			<div class="classMenuWrite">
			<%	if (session.getAttribute("m_grade") == null || m_grade.equals("일반")) {
			} else { %> <button class="Btn" onclick="location.href='<%=wonViewDir%>/uploadClass.jsp'">글쓰기</button> <%	}%>
			</div>
		</div>

		<!-- 상품 리스트 -->
		<div class="classContent">
			<% if(classList.size()==0){ %> 
				<p>존재하는 상품이 없습니다.</p>
			<% } else { 
			for (int i = 0; i < classList.size(); i++) {
				allVO = classList.get(i);
				String thumbsnail = allVO.getMi_thum_name();
			%>
			<a href="./selectPt.won?pt_code=<%=allVO.getPt_code() %>" class="classContentOne">
				<div>
				<img class="classContentImg" src="<%=memberThumbDir%>/<%=thumbsnail%>">
				</div>
				<p><%=allVO.getM_name()%></p>
				<p>" <%=allVO.getPt_title()%> "</p>
			<% } }%>
			</a>
		</div>
	</div>

	<%@ include file="../module/footer.jsp"%>
</body>
</html>