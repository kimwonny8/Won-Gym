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
	background-image: url("<%=imgDir%>/login.jpg");
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
	<% } else if(m_grade.equals("trainerW")) { %>
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
				<input type="text" name="t_license_name" maxlength="40" id="t_license_name" class="inputBox">
		</div>
		<p id="inputCheckLicenseName" class="inputCheckRight"></p> 	
			<div class="formInputLineH">		
				<p>* 자격증 번호</p>
				<input type="text" name="t_license_num" maxlength="40" id="t_license_num" class="inputBox">			
				
		</div>
		<p style="text-align:center; color:blue;">자격증은 제출 후 수정할 수 없으니 신중히 입력해주세요.</p> 		
		</div>
		<div class="FormInputLine">
		<input type="hidden" id="m_grade" name="m_grade" value="<%=m_grade%>">
			<input type="button" id="submitBtn2" value="회원가입" class="Btn inputBtn inputBtnSmall">
		</div>
		<p id="inputCheckLicenseNumber" class="inputCheckRight"></p> 	
	</div>
	<% } else { %>
		<jsp:forward page="/com/yju/2wda/team1/view/etc/error.jsp" />
	<% } %>

	<%@ include file="../module/footer.jsp"%>
<script type="text/javascript">
window.onpageshow = function(event) {
    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
    alert("잘못된 접근입니다.");
    location.href="/kjw59_project/index.jsp";
  }
}
var id=false;
var pw=false;
var name=false;
var birth=false;
var phone=false;

function checkId() {
	const regId = /^[A-Za-z0-9]{5,20}$/
	var m_id = $('#m_id').val();
	var idChk = regId.test(m_id) ? true : false;
	
	if (m_id.search(/\s/) != -1) {
		$('#inputCheckId').text("아이디는 공백을 포함할 수 없습니다.");
		id=false;
	}
	
	else {
		if (m_id == "" || m_id == null) {
			$('#inputCheckId').text("아이디를 입력해주세요.");
			id=false;
		}
		else if(idChk==false){
			$('#inputCheckId').text("아이디는 5~20자, 영어, 숫자만 가능합니다.");
			id=false;
		}
		else {
			$.ajax({
				type : "post",
				data : {m_id : $("#m_id").val()},
				url : "./chkId.won",
				success : function(value) {
					console.log(value);
					if(value=="" || value == null) {
						$('#inputCheckId').text("중복된 아이디입니다.");
						id=false;
					}
					else {
						$('#inputCheckId').text("사용 가능한 아이디입니다.");
						id=true;
					}
				} 
			});
		}
	};
};

function checkPw() {
	var m_pw = $('#m_pw').val();
	var m_pw2 = $('#m_pw2').val();
	
	if (m_pw.search(/\s/) != -1) {
		$('#inputCheckPw').text("비밀번호는 공백을 포함할 수 없습니다.");
		pw = false;
	}
	
	else {
		if(m_pw.length < 6 || m_pw.length > 25) {
			$('#inputCheckPw').text("비밀번호를 6~25자 이내로 입력해주세요.");
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
function checkName() {
	var m_name = $('#m_name').val();
	
	if (m_name == "") {
		$('#inputCheckName').text("이름을 입력해주세요.");
		name = false;
	}
	else {
		$('#inputCheckName').text("");
		name = true;
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
		$('#inputCheckPhone').text("휴대폰번호를 다시 입력해주세요.");
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

function checkName(){
	var m_name = $('#m_name').val();
	const regName = /^[가-힣]+$/
	var nameChk = regName.test(m_name) ? true: false;
	
	if(nameChk == false) {
		$('#inputCheckName').text("공백없이 한글만 입력해주세요.");
		phone=false;
	}
	
	else if (m_name == "") {
		$('#inputCheckName').text("이름을 입력해주세요.");
		phone=false;
	}
	else {
		$('#inputCheckName').text("");
		phone=true;
	}
}


$(document).ready(function() {
	$("#submitBtn").click(function() {
		if (id == false) {
			checkId();
			$("#m_id").focus();
			return;
		}
		 
		else if (pw == false) {
			checkPw();
			$("#m_pw").focus();
			return;
		}
				
		else if (name == false) {
			checkName();
			$("#m_name").focus();
			return;
		}
		
		else if(birth == false) {
			checkBirth();
			$("#m_birth").focus();
			return;
		}
		
		else if(phone == false) {
			checkPhone();
			$("#m_phone").focus();
			return;
		}
	
		else {
 	 	$.ajax({
			type : "post",
			data : {m_id : $("#m_id").val(), m_pw : $("#m_pw").val(),
					m_birth : $("#m_birth").val(), m_name : $("#m_name").val(),
					m_gender : $('#m_gender').val(), m_phone : $("#m_phone").val(),
					c_code : $("#c_code").val(), m_grade: $("#m_grade").val()},
			url : "./signup.won",
			success : function(value) {
				console.log(value);
				if(value=="" || value == null) {
					alert("회원가입에 실패했습니다.");
					return;
				}
				else {
					alert("회원가입이 완료되었습니다!");
					location.href="/kjw59_project/index.jsp";
				}
			}

		}); 
		}
	});
		

}); 

$(document).ready(function() {
	$("#submitBtn2").click(function() {
		var t_license_name= $("#t_license_name").val();
		var t_license_num= $("#t_license_num").val();
		
		if (id == false) {
			checkId();
			$("#m_id").focus();
			return;
		}
		 
		else if (pw == false) {
			checkPw();
			$("#m_pw").focus();
			return;
		}
				
		else if (name == false) {
			checkName();
			$("#m_name").focus();
			return;
		}
		
		else if(birth == false) {
			checkBirth();
			$("#m_birth").focus();
			return;
		}
		
		else if(phone == false) {
			checkPhone();
			$("#m_phone").focus();
			return;
		}
	
		else if(t_license_name == "") {
			$('#inputCheckLicenseName').text("자격증 종류를 입력해주세요.");
			$("#t_license_name").focus();
			return;
		}
		
		else if(t_license_num == "") {
			$('#inputCheckLicenseNumber').text("자격증 번호를 입력해주세요.");
			$("#t_license_num").focus();
			return;
		}
		else {	
 	 	$.ajax({
			type : "post",
			data : {m_id : $("#m_id").val(), m_pw : $("#m_pw").val(),
					m_birth : $("#m_birth").val(), m_name : $("#m_name").val(),
					m_gender : $('#m_gender').val(), m_phone : $("#m_phone").val(),
					c_code : $("#c_code").val(), m_grade: $("#m_grade").val(),
					t_license_name: $("#t_license_name").val(), t_license_num: $("#t_license_num").val()},		
			url : "./signup.won",
			success : function(value) {
				console.log(value);
				if(value=="" || value == null) {
					alert("회원가입 실패");
					return;
				}
				else {
					alert("회원가입이 완료되었습니다!");
					location.href="/kjw59_project/index.jsp";
				}
			}

		}); 
		}
	});

}); 
</script>
</body>
</html>