<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sign-up</title>
<link rel="stylesheet" href="<%=cssDir%>/grade.css">
<style>
.bottom {
	background-image: url("<%=imgDir%>/login.jpg");
}

</style>

</head>
<body>
	<%@ include file="../module/header.jsp"%>

	<div class="bottom">
		<p class="menuTitle">회원가입</p>
	</div>

	<div class="gradeContents">
		<div class="gradeSelect">
		
			<a href="<%=wonViewDir%>/signupText.jsp?m_grade=client"  class="gradeSelectBtn">
				<img class="gradeIcon"
					src="https://cdn-icons-png.flaticon.com/512/456/456283.png">
				<p>일반 회원</p>
			</a>
		
			<a href="<%=wonViewDir%>/signupText.jsp?m_grade=trainer"  class="gradeSelectBtn">
				<img class="gradeIcon"
					src="https://cdn-icons-png.flaticon.com/512/2235/2235532.png">
				<p>트레이너 회원</p>
			</a>
		</div>
	</div>

	<%@ include file="../module/footer.jsp"%>
</body>
</html>