<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="kjw59_project.model.won.*"%>
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
	background-image: url("<%=imgDir%>/mypage.jpg");
}

</style>
<link rel="stylesheet" href="<%=cssDir%>/style.css">

</head>
<body>
	<%@ include file="../module/header.jsp"%>
	<% 
	ArrayList<MemberDTO> list;
	list =(ArrayList<MemberDTO>)session.getAttribute("list");
	MemberDTO member = null;
	if(list.size() != 0){
		member = list.get(0);
	}
	else {
		response.sendRedirect("/kjw59_project/com/yju/2wda/team1/view/etc/error.jsp");
	}
	%>
	<div class="bottom">
		<p class="menuTitle">회원정보수정</p>
	</div>
	
	<div class="form formLong">
		<div class="formInner">
			<div class="formInputLineH">
				<p>* 아이디</p>
				<input type="text" name="m_id" value="<%=member.getM_id() %>" disabled required class="inputBox">
			</div>
			<div class="formInputLineH">
				<p>* 비밀번호</p>
				<input type="password" id="m_pw" name="m_pw" oninput="checkPw()" class="inputBox">
			</div>
			<div class="formInputLineH">
				<p>* 비밀번호 확인</p>
				<input type="password" id="m_pw2" name="m_pw2" oninput="checkPw()" class="inputBox">
			</div>
	 			<p id="inputCheckPw" class="inputCheckRight"></p>
			<div class="formInputLineH">
				<p>* 이름</p>
				<input type="text" value="<%=member.getM_name() %>"name="m_name" disabled class="inputBox">	
			</div>
			<div class="formInputLineH">
				<p>생년월일</p>
				<input type="text" oninput="checkBirth()" id="m_birth" name="m_birth" value="<%=member.getM_birth() %>" maxlength="8" class="inputBox" placeholder="ex) 19970117">
			</div>
			<p id="inputCheckBirth" class="inputCheckRight"></p> 
			<div class="formInputLineH">
				<p>* 성별</p>
				<select name="m_gender" id="m_gender" class="inputBox">
						<option value="남" selected>남</option>
						<option value="여">여</option>
				</select>
			</div>
			<div class="formInputLineH">
				<p>휴대폰번호</p>
				<input type="text" oninput="checkPhone()" name="m_phone" id="m_phone" value="<%=member.getM_phone() %>" maxlength="11" class="inputBox" placeholder="ex) 01012345678">
			</div>
			<p id="inputCheckPhone" class="inputCheckRight"></p> 
			<div class="formInputLineH">
				<p>* 구(대구만 시범 운영중) </p>
				<select id="c_code" name="c_code" class="inputBox">
					<option value="수성구" selected>수성구</option>
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
<script>
window.onpageshow = function(event) {
    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
    alert("잘못된 접근입니다.");
    location.href="/kjw59_project/index.jsp";
  }
}

var pw=false;
var birth=true;
var phone=true;

function checkPw() {
	var m_pw = $('#m_pw').val();
	var m_pw2 = $('#m_pw2').val();
	
	if(m_pw.length < 6 || m_pw.length > 25) {
		$('#inputCheckPw').text("비밀번호를 6~25자 이내로 입력해주세요.");
		pw = false;
	}
	else {
		if(m_pw.length < 6) {
			$('#inputCheckPw').text("비밀번호를 6자리 이상 입력해주세요.");
			pw = false;
		}
		else if (m_pw == "") {
			$('#inputCheckPw').text("비밀번호를 입력해주세요.");
			pw = false;
		}
		else if (m_pw2 == "") {
			$('#inputCheckPw').text("비밀번호를 입력해주세요.");
			pw = false;
		}
		
		else if(m_pw != m_pw2) {
			 $('#inputCheckPw').text("비밀번호가 일치하지 않습니다.");
			 pw = false;
		}
		else {
			 $('#inputCheckPw').text("비밀번호가 일치합니다.");
			 pw = true;
		}
	}
}

function checkBirth() {
	const regBirth = /^(19[0-9][0-9]|20[0-2]{1}[0-9]{1})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
	var m_birth = $('#m_birth').val();
	var birthChk = regBirth.test(m_birth) ? true : false;
	
	if(birthChk == false) {
		$('#inputCheckBirth').text("생년월일을 다시 입력해주세요.");
		birth = false;
	}
	
	else if (m_birth == "") {
		$('#inputCheckBirth').text("생년월일을 입력해주세요.");
		birth = false;
	}
	
	else {
		$('#inputCheckBirth').text("");
		birth = true;
	}
}

function checkPhone() {
	var m_phone = $('#m_phone').val();
	const regPhone = /^01[0-9]{1}[0-9]{4}[0-9]{4}/;
	var phoneChk = regPhone.test(m_phone) ? true : false;
	
	if(phoneChk == false) {
		$('#inputCheckPhone').text("휴대폰 번호를 다시 입력해주세요.");
		phone=false;
	}
	
	else if (m_phone == "") {
		$('#inputCheckPhone').text("휴대폰번호를 입력해주세요.");
		phone=false;
	}
	else {
		$('#inputCheckPhone').text("");
		phone=true;
	}
}

$(document).ready(function() {
	$("#submitBtn").click(function() {
	if (pw == false) {
		checkPw();
		$("#m_pw").focus();
		return;
	}
	
	else if(birth == false) {
		$('#inputCheckBirth').text("생년월일을 다시 입력해주세요.");
		$("#m_birth").focus();
		return;
	}
	
	else if(phone == false) {
		$('#inputCheckPhone').text("휴대폰 번호를 다시 입력해주세요.");
		$("#m_phone").focus();
		return;
	}
	else {
 	 	$.ajax({
			type : "post",
			data : {m_pw : $("#m_pw").val(), m_birth : $("#m_birth").val(),
					m_gender : $('#m_gender').val(), m_phone : $("#m_phone").val(),
					c_code : $("#c_code").val()},
			url : "./updateMember.won",
			success : function(value) {
				console.log(value);
				if(value=="" || value == null) {
					alert("회원 정보 수정에 실패했습니다.");
					return;
				}
				else {
					alert("회원 정보가 수정되었습니다.");
					location.href="/kjw59_project/com/yju/2wda/team1/view/won/myPage.jsp";
				}
			}

		}); 
	}
	});

}); 
</script>
</body>
</html>