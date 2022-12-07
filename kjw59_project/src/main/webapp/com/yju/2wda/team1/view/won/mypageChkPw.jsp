<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정/탈퇴 - 비밀번호 확인</title>
<script
  src="http://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
</head>
<link rel="stylesheet" href="<%=cssDir%>/mypage.css">
<style>
.inputBtn>p {
	font-size: 0.8rem;
}

a {
	text-decoration-line: none;
	color: black;
}

.bottom {
	width: 70%;
	height: 20vh;
	background-image: url("<%=imgDir%>/mypage.jpg");
	background-repeat: no-repeat;
	background-size: 100% 50vh;
	opacity: 0.6;
	display: flex;
	align-items: center;
}
</style>

<body>
	<%@ include file="../module/header.jsp"%>
	<% m_id=(String)session.getAttribute("m_id");  %>
	<div class="bottom">
		<p class="menuTitle">비밀번호 확인</p>
	</div>
 		
	<div id="form" style="font-size: 0.7vw; padding: 2vw;" class="form">
	<div style="font-size: 0.7vw; margin-bottom: 1vw;">본인 인증을 위해 비밀번호를 입력해주세요.</div>
	 <div id="inputCheck" class="inputCheck"></div>
	 <div class="FormInputLine">
			<p>아이디</p>
			<input type="text" id="m_id" name="m_id" value="<%=m_id %>" disabled class="inputBox">
		</div>
		<div class="FormInputLine">
			<p>비밀번호</p>
			<input type="password" id="m_pw" name="m_pw" class="inputBox">
		</div>
		<div class="FormInputLine">
			<p>비밀번호 확인</p>
			<input type="password" id="m_pw2" name="m_pw" class="inputBox">
		</div>
		<input type="button" id="deleteMember"  class="mypageBtn" value="회원탈퇴" style="margin-bottom: 1vh;">
		<input type="button" id="updateMember" class="mypageBtn" value="회원정보수정" >
<%-- 		<a href="<%=wonViewDir%>/updateMember.jsp">회원정보수정</a> --%>
	</div>

	<%@ include file="../module/footer.jsp"%>
<script>
	 	$(document).ready(function() {
		$("#updateMember").click(function() {
			var m_pw = $("#m_pw").val();
			var m_pw2 = $("#m_pw2").val();

			if (m_pw == "") {
				$('#inputCheck').text("비밀번호를 입력해주세요.");
				$("#m_pw").focus();
				return;
			}
			if (m_pw2 == "") {
				$('#inputCheck').text("비밀번호를 입력해주세요.");
				$("#m_pw2").focus();
				return;
			}
			if(m_pw2 != m_pw){
				 $('#inputCheck').text("비밀번호가 일치하지 않습니다.");
				 $("#m_pw").val("");
				 $("#m_pw2").val("");
				return;
			}
			$.ajax({
				type : "post",
				data : {m_pw : $("#m_pw").val()},
				url : "./updateMemberChkPw.won",
				success : function(value) {
					console.log(value);
					if(value=="" || value == null){
						 $('#inputCheck').text("비밀번호를 다시 입력해주세요");
						 $("#m_pw").val("");
						 $("#m_pw2").val("");
					}
					else {
						location.href="/kjw59_project/com/yju/2wda/team1/view/won/updateMember.jsp";
					}
				}

			});
		});

	}); 
	 	$(document).ready(function() {
			$("#deleteMember").click(function() {
				var m_pw = $("#m_pw").val();
				var m_pw2 = $("#m_pw2").val();

				if (m_pw == "") {
					$('#inputCheck').text("비밀번호를 입력해주세요.");
					$("#m_pw").focus();
					return;
				}
				else if (m_pw2 == "") {
					$('#inputCheck').text("비밀번호를 입력해주세요.");
					$("#m_pw2").focus();
					return;
				}
				else if(m_pw2 != m_pw){
					 $('#inputCheck').text("비밀번호가 일치하지 않습니다.");
					 $("#m_pw").val("");
					 $("#m_pw2").val("");
					return;
				}
				else {
					var chk = confirm("정말 탈퇴하시겠습니까?");
					if(chk == true) {
						$.ajax({
							type : "post",
							data : {m_pw : $("#m_pw").val()},
							url : "./deleteMemberChkPw.won",
							success : function(value) {
								console.log(value);
								if(value=="" || value == null){
									 $('#inputCheck').text("비밀번호를 다시 입력해주세요");
									 $("#m_pw").val("");
									 $("#m_pw2").val("");
								}
								else {
									alert("탈퇴되었습니다. 이용해주셔서 감사합니다.");
									location.href="/kjw59_project/index.jsp";
								}
							}

						});
					}
					else {
						alert("탈퇴가 되지 않았습니다.");
						return;
					}
				}
				
			});

		}); 
</script>
</body>
</html>