<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="kjw59_project.model.won.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WorkOutNow Class Open</title>
<script src="http://code.jquery.com/jquery-3.5.1.js"
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
</head>
<body>
	<%@ include file="../module/header.jsp"%>
	<%
	ArrayList<AllClassVO> classList;
		classList = (ArrayList<AllClassVO>) session.getAttribute("classList");
		AllClassVO allVO = classList.get(0);
		
		int pt_code = (Integer)session.getAttribute("pt_code");
		m_id = (String)session.getAttribute("m_id");
		String t_id = allVO.getT_id();
	%>
	<div class="bottom">
		<p class="menuTitle">수업신청</p>
	</div>

	<div class="readTotalForm">
		<div class="readFormLeft">
			<img class="classContentImg"
				src="<%=memberThumbDir%>/<%=allVO.getMi_thum_name()%>">
		</div>
		<div class="readFormRight">
			<div><%=allVO.getM_name()%>
				트레이너
			</div>
			<div>
				<p>
					상담:
					<%=allVO.getPt_con_c()%>
					코인
				</p>
				<p>
					1회:
					<%=allVO.getPt_one_c()%>
					코인
				</p>
				<p>
					동네: 대구시
					<%=allVO.getC_code()%></p>
				<p>
					"
					<%=allVO.getPt_title()%>
					"
				</p>
			</div>
			<form method="post" action="./buyRightNow.won">
				옵션 선택: <select name="pt_select" id="pt_select">
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
				<input type="button" onclick="addPt()" value="추가" class="smallBtn">
				<br>
				<input type="button" onclick="addToCart()"  class="smallBtn" id="submitBtn" style="display: none;" value="장바구니">
				<!--  <input type="submit" onclick="buyRightNow()" id="submitBtn2" style="display: none;" value="바로구매">-->
			</form>
		</div>
		<div class="readFormBottom">
			<p><%=allVO.getPt_content()%></p>
		</div>
		<div class="optionBtn">
		<%
		if (m_id == null) {
		%>
		
		<%
		} else if(m_id.equals(t_id)) {%>
			<a href="./updatePt.won?pt_code=<%=pt_code%>">글 수정</a>
			<a href="./deletePt.won?pt_code=<%=pt_code%>" onclick="return deletePt()">글 삭제</a>
		<%}%> 
	</div>
	</div>
	

	<%@ include file="../module/footer.jsp"%>
	
<script>
function addToCart(){
	$.ajax({
		type : "post",
		data : {pt_select : $("#pt_select").val()},
		url : "./addToCart.won",
		success : function(value) {
			console.log(value);
			if(value=="" || value == null){
				 var tmp = confirm("현재 장바구니에 동일한 상품이 있습니다. \n확인 버튼 클릭시 장바구니로 이동합니다.");
				 if(tmp == true) {
					 location.href="./getCartList.won";
				 }
				 else {
					 history.go();
				 }
			}
			else {
				var tmp = confirm("장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?");
				if(tmp == true) {
					 location.href="./getCartList.won";
				}
				else {
					location.href="./getClassList.won";
				}
			}
		}

	});
}
function addPt(){
	var state = '<%=(String) session.getAttribute("loginState")%>';
	var grade = '<%=(String) session.getAttribute("m_grade")%>';
		if (state === "login" && grade !== "트레이너" && grade !== "관리자") {
			var select;
			if ($('#pt_select').val() == 0){
				select = "상담";}
			else{
				select = ($('#pt_select').val()) + "회";}
				$('#inputCheck').text(select);
				$('#submitBtn').show();
				$('#submitBtn2').show();
		} else {
			if (grade === "트레이너" || grade === "관리자") {
				alert("일반회원만 사용 가능합니다.");
			} else
				alert("로그인 후 이용해주세요.");
			return;
		}
	}
	
function deletePt() {
	var chk = confirm("정말 삭제하시겠습니까?");
	return chk;
}


</script>
</body>
</html>