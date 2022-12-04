<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="kjw59_project.model.won.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WorkOutNow Class Open</title>
<style>
.bottom {
	width: 70%;
	height: 20vh;
	background-image: url("../../image/class.jpg");
	background-repeat: no-repeat;
	background-size: 100% 50vh;
	opacity: 0.8;
	display: flex;
	align-items: center;
}

.readTotalForm {
	margin-top: 10vh;
	margin-bottom: 10vh;
	width: 70%;
	height: 30vw;
	display: flex;
	flex-wrap: wrap;
}

.readFormLeft{
	width: 40%;
	display: flex;
	justify-content : space-around;
	align-items: center;
}

.classContentImg{
	width: 15vw;
	height: 15vw;
	margin-bottom: 1vw;
	border-radius: 50%;
}
.readFormRight {
	width: 60%;
	display: flex;
	flex-direction: column;
	justify-content : center;
	align-items: center;
}

}
</style>
</head>
<body>
	<%@ include file="../module/header.jsp"%>
	<%
	ArrayList<allClassVO> classList;
	classList = (ArrayList<allClassVO>) request.getAttribute("classList");
	allClassVO allVO = classList.get(0);
	%>
	<div class="bottom">
		<p class="menuTitle">수업신청</p>
	</div>

	<div class="readTotalForm">
		<div class="readFormLeft">
			<img class="classContentImg" src="<%=memberThumbDir%>/<%=allVO.getMi_thum_name()%>">
		</div>
		<div class="readFormRight">
			<div><%=allVO.getM_name()%> 트레이너</div>
			<div>
				<p>상담: <%=allVO.getPt_con_c()%> 코인</p>
				<p>1회: <%=allVO.getPt_one_c()%> 코인</p>
				<p>동네: 대구시 <%=allVO.getC_code()%></p>
				<p>" <%=allVO.getPt_title() %> "</p>
			</div>
			<form>
				옵션 선택: 
				<select name="pt_select">
					<option value="상담">상담</option>
					<option value="1회">1회</option>
				</select>
				<button>장바구니</button>
			</form>	
		</div>
		<div>
			<p><%=allVO.getPt_content() %></p>
		</div>
	</div>

	<%@ include file="../module/footer.jsp"%>
</body>
</html>