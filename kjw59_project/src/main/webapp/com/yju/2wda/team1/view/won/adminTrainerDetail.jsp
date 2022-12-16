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
.FormInputLine {
	align-items: center;
}
.basicFormInner {
	flex-direction: column; 
}
.inputBox {
	margin-top: 0.5vw;
	text-align: center;
}
</style>
</head>
<body>
<%@ include file="../module/header.jsp"%>
<% ArrayList<TrainerDTO> trainerList;
	trainerList = (ArrayList<TrainerDTO>)session.getAttribute("trainerList");
	TrainerDTO trainer=null;
	if(trainerList.size() != 0) {
		trainer = trainerList.get(0);
	} else {
		response.sendRedirect("/kjw59_project/com/yju/2wda/team1/view/etc/error.jsp");
	}
%>

<div class="bottom">
	<p class="menuTitle">트레이너 관리</p>
</div>

<div class="basicForm">
	<div class="basicFormInner" style="height: 100%;">
		<div class="FormInputLine">
		<p>아이디<br><input type="text" class="inputBox" value="<%=trainer.getT_id()%>" disabled></p>
		</div>
		<div class="FormInputLine">
		<p>자격증 이름<br><input type="text" class="inputBox" value="<%=trainer.getT_license_name()%>" disabled></p>
		</div>
		<div class="FormInputLine">
		<p>자격증 번호<br><input type="text" class="inputBox" value="<%=trainer.getT_license_num()%>" disabled></p>
		</div>
		<button onclick="history.back();" class="btn" style="margin-bottom:1vw;" >뒤로</button>
	</div>
</div>

<%@ include file="../module/footer.jsp"%>
</body>
</html>