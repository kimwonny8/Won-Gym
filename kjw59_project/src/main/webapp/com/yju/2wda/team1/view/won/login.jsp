<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script
  src="http://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
<style>
.inputBtn > p {
	font-size : 0.8rem;
}
a {
	text-decoration-line: none;
	color: black;
}
.bottom {
	width: 70%;
	height: 20vh;
	background-image: url("<%=imgDir%>/login.jpg");
	background-repeat: no-repeat;
	background-size: 100% 50vh;
	opacity: 0.6;
	display: flex;
	align-items: center;
}
</style>
<script>
	 	$(document).ready(function() {
		$("#loginMember").click(function() {
			var m_id = $("#m_id").val();
			var m_pw = $("#m_pw").val();

			if (m_id == "") {
				$('#inputCheck').text("아이디를 입력해주세요.");
				$("#m_id").focus();
				return;
			}
			if (m_pw == "") {
				$('#inputCheck').text("비밀번호를 입력해주세요.");
				$("#m_pw").focus();
				return;
			}
			$.ajax({
				type : "post",
				data : {m_id: $("#m_id").val(), m_pw : $("#m_pw").val()},
				url : "./loginMember.won",
				success : function(value) {
					console.log(value);
					if(value=="" || value == null){
						 $('#inputCheck').text("일치하는 정보가 없습니다.");
						 $("#m_id").val("");
						 $("#m_pw").val("");
					}
					else {
						location.href="/kjw59_project/index.jsp";
					}
				}

			});
		});

	}); 
</script>
</head>

<body>
	<%@ include file="../module/header.jsp"%>

	<div class="bottom">
		<p class="menuTitle">로그인</p>
	</div>
	
	<div class="form">
	<div id="inputCheck" class="inputCheck"></div>
		<div class="FormInputLine">
			<p>아이디</p>
			<input type="text" id="m_id" name="m_id" class="inputBox">
		</div>
		<div class="FormInputLine">
			<p>비밀번호</p>
			<input type="password" id="m_pw" name="m_pw" class="inputBox">
		</div>
		<div class="FormInputLine">
			<input type="button" id="loginMember" class="Btn inputBtn" value="로그인">
		</div>
		<a href="<%=wonViewDir%>/signup_grade.jsp">회원가입</a>
	</div>

	<%@ include file="../module/footer.jsp"%>
</body>
</html>