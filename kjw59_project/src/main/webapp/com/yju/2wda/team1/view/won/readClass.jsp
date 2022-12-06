<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="kjw59_project.model.won.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WorkOutNow Class Open</title>
<script
  src="http://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
  <link rel="stylesheet" href="<%=cssDir%>/readClass.css">
<style>
.bottom {
	width: 70%;
	height: 20vh;
	background-image: url("<%=imgDir%>/class.jpg");
	background-repeat: no-repeat;
	background-size: 100% 50vh;
	opacity: 0.8;
	display: flex;
	align-items: center;
}
</style>
<script>
function addToCart(){
	var state = '<%=(String)session.getAttribute("loginState")%>';
	var grade = '<%=(String)session.getAttribute("m_grade")%>';
	console.log(state);
	if(state === "login" && grade !== "트레이너"){
		var select;
		if($('#pt_select').val() == 0) select = "상담"; 
		else select= ($('#pt_select').val())+"회";
		$('#inputCheck').text(select);
		$('#submitBtn').show();	
	} 
	else {
		if(grade === "트레이너"){
			alert("일반회원만 사용 가능합니다.");
		}
		else alert("로그인 후 이용해주세요.");
		return;
	}
} 
</script>
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
			<form method="post" action="./addToCart.won">
				옵션 선택: 
				<select name="pt_select" id="pt_select">
					<option value="0">상담</option>
					<option value="1">1회</option>
					<option value="5">5회</option>
					<option value="10">10회</option>
					<option value="20">20회</option>
					<option value="30">30회</option>
					<option value="50">50회</option>
					<option value="100">100회</option>
				</select>
				<p id="inputCheck"></p>
				<input type="button" onclick="addToCart()" value="추가">
				<button id="submitBtn" style="display:none;">장바구니</button>
			</form>	
		</div>
		<div class="readFormBottom">
			<p><%=allVO.getPt_content() %></p>
		</div>
	</div>

	<%@ include file="../module/footer.jsp"%>
</body>
</html>