<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sign-up</title>
<style>
.bottom {
	width: 70%;
	height: 20vh;
	background-image: url("../../image/login.jpg");
	background-repeat: no-repeat;
	background-size: 100% 50vh;
	opacity: 0.8;
	display: flex;
	align-items: center;
}
</style>
<link rel="stylesheet" href="../../css/style.css">
</head>
<body>
	<%@ include file="../module/header.jsp"%>
	
	<div class="bottom">
		<p class="menuTitle">회원가입</p>
	</div>
	
<%
	m_grade=request.getParameter("m_grade");
%>

	<form method="post" action="./signupMember.won" class="form formLong">
		<div class="formInner">
			<div class="formInputLineH">
				<p>* 아이디</p>
				<input type="text" name="m_id" required class="inputBox">
			</div>
<!-- 			<p class="inputCheck">아이디를 입력해주세요.</p> -->
			<div class="formInputLineH">
				<p>* 비밀번호</p>
				<input type="password" required name="m_pw" class="inputBox">
			</div>
			<div class="formInputLineH">
				<p>* 비밀번호 확인</p>
				<input type="password" required name="m_pw2" class="inputBox">
			</div>
<!-- 			<p class="inputCheck">비밀번호가 일치하지 않습니다.</p> -->
			<div class="formInputLineH">
				<p>* 이름</p>
				<input type="text" required name="m_name" class="inputBox">
			</div>
			<div class="formInputLineH">
				<p>생년월일</p>
				<input type="text" name="m_birth" class="inputBox" placeholder="ex) 19970117">
			</div>
			<div class="formInputLineH">
				<p>성별</p>
				<input type="radio" name="m_gender" id="man" style="margin-left: 0;">
				<label for="man" style="font-size: 0.8rem; margin-left: 0;">남</label>
				<input type="radio" name="m_gender" id="woman"> 
				<label for="woman" style="font-size: 0.8rem; margin-left: 0;">여</label> 
				<input type="radio" name="m_gender" id="noGender" checked> 
				<label for="noGender" style="font-size: 0.8rem; margin-left: 0;">선택안함</label>
			</div>
			<div class="formInputLineH">
				<p>휴대폰번호</p>
				<input type="text" name="m_phone" class="inputBox" placeholder="ex) 01012345678">
			</div>
			<div class="formInputLineH">
				<p>* 구(대구만 시범 운영중) </p>
				<select name="c_code" class="inputBox">
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
			<button id="submitAble"class="Btn inputBtn inputBtnSmall">회원가입</button>
		</div>
	</form>


	<%@ include file="../module/footer.jsp"%>
</body>
</html>