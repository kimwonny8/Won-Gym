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
		<p class="menuTitle">ȸ������</p>
	</div>

	<div class="form formLong">
		<div class="formInner">
			<div class="formInputLineH">
				<p>* ���̵�</p>
				<input type="text" class="inputBox">
			</div>
			<p class="inputCheck">���̵� �Է����ּ���.</p>
			<div class="formInputLineH">
				<p>* ��й�ȣ</p>
				<input type="password" class="inputBox">
			</div>
			<div class="formInputLineH">
				<p>* ��й�ȣ Ȯ��</p>
				<input type="password" class="inputBox">
			</div>
			<p class="inputCheck">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</p>
			<div class="formInputLineH">
				<p>* �̸�</p>
				<input type="text" class="inputBox">
			</div>
			<div class="formInputLineH">
				<p>�������</p>
				<input type="text" class="inputBox" placeholder="ex) 19970117">
			</div>
			<div class="formInputLineH">
				<p>����</p>
				<input type="radio" name="gender" id="man" style="margin-left: 0;">
				<label for="man" style="font-size: 0.8rem; margin-left: 0;">��</label>
				<input type="radio" name="gender" id="woman"> <label
					for="woman" style="font-size: 0.8rem; margin-left: 0;">��</label> <input
					type="radio" name="gender" id="noGender"> <label
					for="noGender" style="font-size: 0.8rem; margin-left: 0;">���þ���</label>
			</div>
			<div class="formInputLineH">
				<p>�޴�����ȣ</p>
				<input type="text" class="inputBox" placeholder="ex) 01012345678">
			</div>
			<div class="formInputLineH">
				<p>* ����</p>
				<input type="text" class="inputBox" placeholder="ex) �뱸�� ������">
			</div>

		</div>
		<div class="FormInputLine">
			<button class="Btn inputBtn inputBtnSmall">ȸ������</button>
		</div>
	</div>


	<%@ include file="../module/footer.jsp"%>
</body>
</html>