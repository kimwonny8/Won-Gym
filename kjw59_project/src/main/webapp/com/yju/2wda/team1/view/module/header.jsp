<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/globalData.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cssDir%>/style.css">

<style>
a {
	text-decoration-line: none;
	color: black;
}
</style>
</head>
<body>
	<%
	String m_name = null;
	String loginState = null;

	m_name = (String)session.getAttribute("m_name");
	loginState = (String)session.getAttribute("loginState");
	
	if(loginState.equals("login")){
	%>
		<div class="top">
		<button onclick="location.href='<%=rootDir%>/index.jsp'"></button>
		<div class="topMenu">
			<button onclick="location.href='<%=beerViewDir%>/cart.jsp'" class="Btn topMenuBtn">장바구니</button>
			<form method="post" action="./logoutMember.won">
				
				<button class="Btn topMenuBtn">로그아웃</button>
				<p class="topMenuBtn"><%=m_name %>님 환영합니다!</p>
			</form>
		</div>
	</div>
	<% } else { %>
	<div class="top">
		<button onclick="location.href='<%=rootDir%>/index.jsp'"></button>
		<div class="topMenu">
			<button onclick="location.href='<%=beerViewDir%>/signup_grade.jsp'"
				class="Btn topMenuBtn">회원가입</button>
			<button onclick="location.href='<%=beerViewDir%>/login.jsp'"
				class="Btn topMenuBtn">로그인</button>
		</div>
	</div>
	<% } %>
	
	<div class="middle">
		<div class="middleMenu">

			<a href="<%=beerViewDir%>/classApplication.jsp"
				class="Btn middleMenuBtn">수업신청</a>
			<button onclick="alert('준비 중인 기능입니다.')" class="Btn middleMenuBtn">트레이너채널</button>
			<button onclick="alert('준비 중인 기능입니다.')" class="Btn middleMenuBtn">자유게시판</button>
			<a href="<%=beerViewDir%>/myPage.jsp" class="Btn middleMenuBtn">마이페이지</a>
			<button onclick="alert('준비 중인 기능입니다.')" class="Btn middleMenuBtn">고객센터</button>
		</div>
	</div>
</body>
</html>