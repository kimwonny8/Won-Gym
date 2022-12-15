<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sign-up</title>
<script
  src="http://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
<style>
.bottom {
	width: 70%;
	height: 20vh;
	background-image: url("<%=imgDir%>/login.jpg");
	background-repeat: no-repeat;
	background-size: 100% 50vh;
	opacity: 0.8;
	display: flex;
	align-items: center;
}
.inputCheckRight{
	color: red;
	font-size: 0.8vw;
	float: right;
	width: 65%;
}
</style>
</head>
<body>
	<%@ include file="../module/header.jsp"%>
	
	<div class="bottom">
		<p class="menuTitle">회원가입</p>
	</div>
	
<%
	m_grade=request.getParameter("m_grade");
	if(m_grade.equals("client")) {
%>

	<div class="form formLong">
		<div class="formInner">
			<div class="formInputLineH">
				<p>* 아이디</p>
				<input type="text" id="m_id" name="m_id" oninput="checkId()" class="inputBox">
			</div>
			<p id="inputCheckId" class="inputCheckRight"></p>
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
				<input type="text" id="m_name" name="m_name" oninput="checkName()" class="inputBox">	
			</div>
			<p id="inputCheckName" class="inputCheckRight"></p> 
			<div class="formInputLineH">
				<p>* 생년월일</p>
				<input type="text" id="m_birth" name="m_birth" maxlength="8" class="inputBox" oninput="checkBirth()" placeholder="ex) 19970117">
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
				<p>* 휴대폰번호</p>
				<input type="text" name="m_phone" id="m_phone" maxlength="11" class="inputBox" oninput="checkPhone()" placeholder="ex) 01012345678">
			</div>
			<p id="inputCheckPhone" class="inputCheckRight"></p> 
			<div class="formInputLineH">
				<p>* 구(대구 시범 운영중) </p>
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
		<input type="hidden" id="m_grade" name="m_grade" value="<%=m_grade%>">
			<input type="button" id="submitBtn" value="회원가입" class="Btn inputBtn inputBtnSmall">
		</div>
	</div>
	<% } else if(m_grade.equals("trainer")) { %>
		<div class="form formLong">
		<div class="formInner">
			<div class="formInputLineH">
				<p>* 아이디</p>
				<input type="text" id="m_id" name="m_id" oninput="checkId()" class="inputBox">
			</div>
			<p id="inputCheckId" class="inputCheckRight"></p>
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
				<input type="text" id="m_name" name="m_name" oninput="checkName()" class="inputBox">	
			</div>
			<p id="inputCheckName" class="inputCheckRight"></p> 
			<div class="formInputLineH">
				<p>* 생년월일</p>
				<input type="text" id="m_birth" name="m_birth" maxlength="8" class="inputBox" oninput="checkBirth()" placeholder="ex) 19970117">
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
				<p>* 휴대폰번호</p>
				<input type="text" name="m_phone" id="m_phone" maxlength="11" class="inputBox" oninput="checkPhone()" placeholder="ex) 01012345678">
			</div>
			<p id="inputCheckPhone" class="inputCheckRight"></p> 
			<div class="formInputLineH">
				<p>* 구(대구 시범 운영중) </p>
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
		<div class="formInputLineH">
				<p>* 자격증 종류</p>
				<p><input type="text" name="license_name" id="license_name" class="inputBox">
		</div>	
		<p id="inputCheckLicenseName" class="inputCheckRight"></p> 	
			<div class="formInputLineH">		
				<p>* 자격증 번호</p>
				<input type="number" name="license_number" id="license_number" class="inputBox" placeholder="숫자만 입력">			
		</div>
		</div>
		<div class="FormInputLine">
		<input type="hidden" id="m_grade" name="m_grade" value="<%=m_grade%>">
			<input type="button" id="submitBtn2" value="회원가입" class="Btn inputBtn inputBtnSmall">
		</div>
		<p id="inputCheckLicenseNumber" class="inputCheckRight"></p> 	
	</div>
	<% } else { %>
		<jsp:forward page="/kjw59_project/com/yju/2wda/team1/view/etc/error.jsp" />
	<% } %>

	<%@ include file="../module/footer.jsp"%>
<script type="text/javascript">
window.onpageshow = function(event) {
    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
    alert("잘못된 접근입니다.");
    location.href="/kjw59_project/index.jsp";
  }
}
function checkId() {
	var m_id = $('#m_id').val();
	
	if (m_id == "" || m_id == null) {
		$('#inputCheckId').text("아이디를 입력해주세요.");
	}
		$.ajax({
			type : "post",
			data : {m_id : $("#m_id").val()},
			url : "./chkId.won",
			success : function(value) {
				console.log(value);
				if(value=="" || value == null) {
					$('#inputCheckId').text("중복된 아이디입니다.");
				}
				else {
					$('#inputCheckId').text("사용 가능한 아이디입니다.");
				}
			} 
		});
	
};


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
function checkName() {
	var m_name = $('#m_name').val();
	
	if (m_name == "") {
		$('#inputCheckName').text("이름을 입력해주세요.");
	}
	else {
		$('#inputCheckName').text("");
	}
}

function checkBirth() {
	var m_birth = $('#m_birth').val();
	
	if (m_birth == "") {
		$('#inputCheckBirth').text("생년월일을 입력해주세요.");
	}
	else {
		$('#inputCheckBirth').text("");
	}
}

function checkPhone() {
	var m_phone = $('#m_phone').val();
	
	if (m_phone == "") {
		$('#inputCheckPhone').text("이름을 입력해주세요.");
	}
	else {
		$('#inputCheckPhone').text("");
	}
}


$(document).ready(function() {
	$("#submitBtn").click(function() {
		const m_id = $("#m_id").val();
		const m_pw = $("#m_pw").val();
		const m_pw2 = $("#m_pw").val();
		const m_name = $("#m_name").val();
		const m_birth = $('#m_birth').val();
		const m_phone = $('#m_phone').val();
		const regBirth = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
		const regPhone = /(\d{3})(\d{4})(\d{4})/;
		var birthChk = regBirth.test(m_birth) ? true : false;
		var phoneChk = regPhone.test(m_phone) ? true : false;
		
		if (m_id == "") {
			$('#inputCheckId').text("아이디를 입력해주세요.");
			$("#m_id").focus();
			return;
		}
		
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
		
		if (m_pw2 != m_pw) {
			$('#inputCheckPw').text("비밀번호가 일치하지 않습니다.");
			$("#m_pw").val("");
			$("#m_pw2").val("");
			return;
		}
		
		if (m_name == "") {
			$('#inputCheckName').text("이름을 입력해주세요.");
			$("#m_name").focus();
			return;
		}
		
		if(birthChk == false) {
			$('#inputCheckBirth').text("생년월일을 다시 입력해주세요.");
			$("#m_birth").focus();
			return;
		}
		
		if(phoneChk == false) {
			$('#inputCheckPhone').text("휴대폰 번호를 다시 입력해주세요.");
			$("#m_phone").focus();
			return;
		}
		
			
 	 	$.ajax({
			type : "post",
			data : {m_id : $("#m_id").val(), m_pw : $("#m_pw").val(),
					m_birth : $("#m_birth").val(), m_name : $("#m_name").val(),
					m_gender : $('#m_gender').val(), m_phone : $("#m_phone").val(),
					c_code : $("#c_code").val(), m_grade: $("#m_grade").val()},
			url : "./signupMember.won",
			success : function(value) {
				console.log(value);
				if(value=="" || value == null) {
					alert("회원가입 실패");
					history.go();
				}
				else {
					alert("회원가입이 완료되었습니다!");
					location.href="/kjw59_project/index.jsp";
				}
			}

		}); 
	});

}); 

$(document).ready(function() {
	$("#submitBtn2").click(function() {
		const m_id = $("#m_id").val();
		const m_pw = $("#m_pw").val();
		const m_pw2 = $("#m_pw").val();
		const m_name = $("#m_name").val();
		const m_birth = $('#m_birth').val();
		const m_phone = $('#m_phone').val();
		const regBirth = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
		const regPhone = /(\d{3})(\d{4})(\d{4})/;
		var birthChk = regBirth.test(m_birth) ? true : false;
		var phoneChk = regPhone.test(m_phone) ? true : false;
		const license_name = $('#license_name').val();
		const license_number = $('#license_number').val();
		
		if (m_id == "") {
			$('#inputCheckId').text("아이디를 입력해주세요.");
			$("#m_id").focus();
			return;
		}
		
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
		
		if (m_pw2 != m_pw) {
			$('#inputCheckPw').text("비밀번호가 일치하지 않습니다.");
			$("#m_pw").val("");
			$("#m_pw2").val("");
			return;
		}
		
		if (m_name == "") {
			$('#inputCheckName').text("이름을 입력해주세요.");
			$("#m_name").focus();
			return;
		}
		
		if(birthChk == false) {
			$('#inputCheckBirth').text("생년월일을 다시 입력해주세요.");
			$("#m_birth").focus();
			return;
		}
		
		if(phoneChk == false) {
			$('#inputCheckPhone').text("휴대폰 번호를 다시 입력해주세요.");
			$("#m_phone").focus();
			return;
		}
		
		if(license_name == "") {
			$('#inputCheckLicenseName').text("자격증 종류를 입력해주세요.");
			$("#license_name").focus();
			return;
		}
		
		if(license_number == "") {
			$('#inputCheckLicenseNumber').text("자격증 번호를 입력해주세요.");
			$("#license_number").focus();
			return;
		}
		
			
 	 	$.ajax({
			type : "post",
			data : {m_id : $("#m_id").val(), m_pw : $("#m_pw").val(),
					m_birth : $("#m_birth").val(), m_name : $("#m_name").val(),
					m_gender : $('#m_gender').val(), m_phone : $("#m_phone").val(),
					c_code : $("#c_code").val(), m_grade: $("#m_grade").val()},
					
			url : "./signupClient.won",
			success : function(value) {
				console.log(value);
				if(value=="" || value == null) {
					alert("회원가입 실패");
					history.go();
				}
				else {
					alert("회원가입이 완료되었습니다!");
					location.href="/kjw59_project/index.jsp";
				}
			}

		}); 
	});

}); 
</script>
</body>
</html>