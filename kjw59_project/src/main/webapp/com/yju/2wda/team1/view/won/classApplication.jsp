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
	background-image: url("../../image/class.jpg");
	background-repeat: no-repeat;
	background-size: 100% 50vh;
	opacity: 0.8;
	display: flex;
	align-items: center;
}
</style>
<link rel="stylesheet" href="<%=cssDir%>/wideform.css">
</head>
<body>
	<%@ include file="../module/header.jsp"%>
	<%
	m_grade = (String) session.getAttribute("m_grade");
	allClassVO allVO;
	ArrayList<allClassVO> classList;

	classList = (ArrayList<allClassVO>) request.getAttribute("classList");
	%>

	<div class="bottom">
		<p class="menuTitle">수업신청</p>
	</div>

	<div class="writeTotalForm">

		<div class="classMenu">
			<!-- 검색하는 부분 -->
			<div></div>

			<!-- 글쓰기 -->
			<%
			if (session.getAttribute("m_grade") == null || m_grade.equals("일반")) {
			} else {
			%><button
				onclick="location.href='<%=wonViewDir%>/uploadPT.jsp'">글쓰기</button>
			<%
			}
			%>
		</div>

		<!-- 상품 리스트 -->
		<div class="classContent">
			<%
			for (int i = 0; i < classList.size(); i++) {
				allVO = classList.get(i);
				String thumbsnail = allVO.getMi_thum_name();
			%>
			<div>
				<img src="<%=memberThumbDir%>/<%=thumbsnail%>" width="100">
			</div>
			<p><%=allVO.getM_name()%></p>
			<p><%=allVO.getPt_title()%></p>
			
			<% }%>
			</div>
	</div>

	<%@ include file="../module/footer.jsp"%>
</body>
</html>