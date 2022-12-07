<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정 - 변경할 내용 입력</title>
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
	background-size: 100% 50vh;
	opacity: 0.8;
	display: flex;
	align-items: center;
}
</style>
<link rel="stylesheet" href="<%=cssDir%>/style.css">
<script>
function checkPw() {
	var m_pw = $('#m_pw').val();
	var m_pw2 = $('#m_pw2').val();
	
	if (m_pw == "") {
		$('#inputCheckPw').text("비밀번호를 입력해주세요.");
	}
	else if (m_pw2 == "") {
		$('#inputCheckPw').text("비밀번호를 입력해주세요.");
	}
	
	else if(m_pw != m_pw2) {
		 $('#inputCheckPw').text("비밀번호가 일치하지 않습니다.");
	}
	else {
		 $('#inputCheckPw').text("비밀번호가 일치합니다.");
	}
}

$(document).ready(function() {
	$("#submitBtn").click(function() {
		var m_pw = $("#m_pw").val();
		var m_pw2 = $("#m_pw2").val();
		
		if (m_pw == "") {
			$('#inputCheckPw').text("비밀번호를 입력해주세요.");
			$("#m_pw").focus();
			return;
		}
		if (m_pw2 == "") {
			$('#inputCheckPw').text("비밀번호를 입력해주세요.");
			$("#m_pw2").focus();
			return;
		}
		if(m_pw2 != m_pw){
			 $('#inputCheckPw').text("비밀번호가 일치하지 않습니다.");
			 $("#m_pw").val("");
			 $("#m_pw2").val("");
			return;
		}
			
 	 	$.ajax({
			type : "post",
			data : {m_pw : $("#m_pw").val(), m_birth : $("#m_birth").val(),
					m_gender : $('[name=m_gender]:checked').val(), m_phone : $("#m_phone").val(),
					c_code : $("#c_code").val()},
			url : "./updateMember.won",
			success : function(value) {
				console.log(value);
				if(value=="" || value == null) {
					alert("회원 정보 수정에 실패했습니다.");
					location.href="/kjw59_project/com/yju/2wda/team1/view/won/updateMember.jsp";
				}
				else {
					alert("회원 정보가 수정되었습니다.");
					location.href="/kjw59_project/com/yju/2wda/team1/view/won/myPage.jsp";
				}
			}

		}); 
	});

}); 
</script>
</head>
<body>
	<%@ include file="../module/header.jsp"%>
	<% m_id = (String)session.getAttribute("m_id");
	 m_name = (String)session.getAttribute("m_name");
	 m_grade = (String)session.getAttribute("m_grade");%>
	<div class="bottom">
		<p class="menuTitle">회원정보수정</p>
	</div>
	
	<div class="form formLong">
		<div class="formInner">
			<div class="formInputLineH">
				<p>* 아이디</p>
				<input type="text" name="m_id" value="<%=m_id %>" disabled required class="inputBox">
			</div>
			<div class="formInputLineH">
				<p>* 비밀번호</p>
				<input type="password" id="m_pw" name="m_pw" oninput="checkPw()" class="inputBox">
			</div>
			<div class="formInputLineH">
				<p>* 비밀번호 확인</p>
				<input type="password" id="m_pw2" name="m_pw2" oninput="checkPw()" class="inputBox">
			</div>
	 			<p id="inputCheckPw" class="inputCheck"></p>
			<div class="formInputLineH">
				<p>* 이름</p>
				<input type="text" value="<%=m_name%>" name="m_name" disabled class="inputBox">	
			</div>
			<div class="formInputLineH">
				<p>생년월일</p>
				<input type="text" id="m_birth" name="m_birth" class="inputBox" placeholder="ex) 19970117">
			</div>
			<div class="formInputLineH">
				<p>성별</p>
				<input type="radio" name="m_gender" id="man" value="남" style="margin-left: 0;">
				<label for="man" style="font-size: 0.8rem; margin-left: 0;">남</label>
				<input type="radio" name="m_gender" id="woman" value="여"> 
				<label for="woman"  style="font-size: 0.8rem; margin-left: 0;">여</label> 
				<input type="radio" name="m_gender" id="noGender" checked value="선택안함"> 
				<label for="noGender" style="font-size: 0.8rem; margin-left: 0;">선택안함</label>
			</div>
			<div class="formInputLineH">
				<p>휴대폰번호</p>
				<input type="text" name="m_phone" id="m_phone" class="inputBox" placeholder="ex) 01012345678">
			</div>
			<div class="formInputLineH">
				<p>* 구(대구만 시범 운영중) </p>
				<select id="c_code" name="c_code" class="inputBox">
					<option value="수성구">수성구</option>
					<option value="중구">중구</option>
					<option value="동구">동구</option>
					<option value="서구">서구</option>
					<option value="남구">남구</option>
					<option value="북구">북구</option>
					<option value="달서구">달서구</option>
					<option value="달성군">달성군</option>
				</select>
			</div>

		</div>
		<div class="FormInputLine">
		<input type="hidden" name="m_grade" value="<%=m_grade%>">
			<input type="button" id="submitBtn" value="회원정보수정" class="Btn inputBtn inputBtnSmall">
		</div>
	</div>
	
<%@ include file="../module/footer.jsp"%>
</body>
</html>