<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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

	<div class="form formLong">
		<div class="formInner">
			<div class="formInputLineH">
				<p>* 아이디</p>
				<input type="text" class="inputBox">
			</div>
			<p class="inputCheck">아이디를 입력해주세요.</p>
			<div class="formInputLineH">
				<p>* 비밀번호</p>
				<input type="password" class="inputBox">
			</div>
			<div class="formInputLineH">
				<p>* 비밀번호 확인</p>
				<input type="password" class="inputBox">
			</div>
			<p class="inputCheck">비밀번호가 일치하지 않습니다.</p>
			<div class="formInputLineH">
				<p>* 이름</p>
				<input type="text" class="inputBox">
			</div>
			<div class="formInputLineH">
				<p>생년월일</p>
				<input type="text" class="inputBox" placeholder="ex) 19970117">
			</div>
			<div class="formInputLineH">
				<p>성별</p>
				<input type="radio" name="gender" id="man" style="margin-left: 0;">
				<label for="man" style="font-size: 0.8rem; margin-left: 0;">남</label>
				<input type="radio" name="gender" id="woman"> <label
					for="woman" style="font-size: 0.8rem; margin-left: 0;">여</label> <input
					type="radio" name="gender" id="noGender"> <label
					for="noGender" style="font-size: 0.8rem; margin-left: 0;">선택안함</label>
			</div>
			<div class="formInputLineH">
				<p>휴대폰번호</p>
				<input type="text" class="inputBox" placeholder="ex) 01012345678">
			</div>
			<div class="formInputLineH">
				<p>* 동네</p>
				<input type="text" class="inputBox" placeholder="ex) 대구시 복현동">
			</div>

		</div>
		<div class="FormInputLine">
			<button class="Btn inputBtn inputBtnSmall">회원가입</button>
		</div>
	</div>


	<%@ include file="../module/footer.jsp"%>
</body>
</html>