<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="kjw59_project.model.won.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>payment Progress</title>
<style>
.bottom {
	width: 70%;
	height: 20vh;
	background-image: url("<%=imgDir%>/cart.jpg");
	background-repeat: no-repeat;
	background-size: 100% 50vh;
	opacity: 0.8;
	display: flex;
	align-items: center;
}

.paymentForm {
	width: 60%;
	margin-top: 5vw;
	margin-bottom: 2vw;
	border-top: 0.05vw solid #DCDCDC;
	border-bottom: 0.05vw solid #DCDCDC;
	padding: 1.5vw 0;
}

.paymentFormInner {
	width: 70%;
}

.onTheFormP {
	width: 70%;
	margin-bottom: 0.8vw;
	font-size: 0.9vw;
}

.tableT {
	display: flex;
	justify-items: center;
	align-items: center;
	width: 50%;
}

</style>
<link rel="stylesheet" href="<%=cssDir%>/mypage.css">
</head>
<body>
	<%@ include file="../module/header.jsp"%>
	<%
	ArrayList<CartVO> classList;
	classList = (ArrayList<CartVO>) session.getAttribute("classList");
	CartVO cart = classList.get(0);
	
	m_name = cart.getM_name();
	String m_birth = cart.getM_birth();
	String m_gender = cart.getM_gender();
	String m_phone = cart.getM_phone();
	int mp_tall = cart.getMp_tall();
	int mp_weight = cart.getMp_weight();
	String mp_detail = cart.getMp_detail();
	
	%>
	<div class="bottom">
		<p class="menuTitle">신청내역관리</p>
	</div>
	
	
	<div class="paymentForm">
		<p class="onTheFormP">신청자 추가 정보</p>
		<div class="paymentFormInner">
		<div class="formInputLineH">
				<p>이름</p>
				<input type="text" disabled value="<%=m_name%>"
					class="inputBox">
			</div>
			<div class="formInputLineH">
				<p>생년월일</p>
				<input type="text" disabled value="<%=m_birth%>"
					class="inputBox">
			</div>
			<div class="formInputLineH">
				<p>성별</p>
				<input type="text" disabled value="<%=m_gender%>"
					class="inputBox">
			</div>
			<div class="formInputLineH">
				<p>휴대폰번호</p>
				<input type="text" disabled value="<%=m_phone%>"
					class="inputBox">
			</div>
			
			<div class="formInputLineH">
				<p>키</p>
				<input type="text" disabled value="<%=mp_tall%>"
					class="inputBox">
			</div>
			<div class="formInputLineH">
				<p>체중</p>
				<input type="text" disabled value="<%=mp_weight %>"
					class="inputBox">
			</div>
			<div class="formInputLineH">
				<p>상세정보</p>
				<input type="text" disabled value="<%=mp_detail %>"
					class="inputBox">
			</div>
		</div>
	</div>
	</div>
	<%@ include file="../module/footer.jsp"%>

</body>
</html>