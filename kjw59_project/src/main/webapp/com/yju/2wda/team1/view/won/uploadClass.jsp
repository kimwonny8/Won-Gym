<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="kjw59_project.model.won.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>upload class</title>
<link rel="stylesheet" href="<%=cssDir%>/writeform.css">
<style>
.bottom {
	background-image: url("<%=imgDir%>/class.jpg");
}
</style>
</head>
<body>
	<%@ include file="../module/header.jsp"%>
<%
String t_name = (String)session.getAttribute("m_name");
	String c_code = (String)session.getAttribute("c_code");
	
	PtDTO pt;
	String pt_title ="";
	int pt_con_c=0;
	int pt_one_c=0;
	String pt_content="";
	boolean update = false; // true면 글 수정중, false면 글 작성중
	
	ArrayList<PtDTO> ptList=(ArrayList<PtDTO>)session.getAttribute("ptList");
	
	if(ptList != null ){
		update = true; 
		pt = ptList.get(0);
		pt_title = pt.getPt_title();
		pt_con_c = pt.getPt_con_c();
		pt_one_c = pt.getPt_one_c();
		pt_content = pt.getPt_content();
	}
%>

	<div class="bottom">
		<p class="menuTitle">수업신청</p>
	</div>
<% if(update == false) { %>
	<!-- 글 작성 -->
	<form method="post" action="./uploadPT.won" class="writeTotalForm">
		<div class="writeForm">
			<div class="wirteFormLeft">
				<p>사진은 본인 프로필 사진으로 자동 지정됩니다.</p>
				<br>
				<a href="<%=wonViewDir%>/myPage.jsp" class="Btn middleMenuBtn">👉 클릭 시 프로필 사진 추가 페이지로 이동</a>
			</div>
			<div class="wirteFormRight">
				<div class="wirteFormRightOne">
					<p>제목</p><input type="text" name="pt_title" class="inputBox" required>
				</div>
				<div class="wirteFormRightOne">
					<p>이름</p><input type="text" name="t_name" value="<%=t_name %>" disabled class="inputBox">
				</div>
				<div class="wirteFormRightOne">
					<p>동네</p> <input type="text" name="c_code" value="<%=c_code%>" disabled class="inputBox">
				</div>
				<div class="wirteFormRightOne">
					<p>상담 가격</p> <input type="number" min="0" name="pt_con_c" required class="inputBox">
				</div>
				<div class="wirteFormRightOne">
					<p>회당 가격</p> <input type="number" min="0" name="pt_one_c" required class="inputBox">
				</div>
			</div>
		</div>
		<!-- 내용 바로 위 -->
		<div class="writeContent">
			<div class="writeContentTop">
				<p>내용</p>
			</div>
			<textarea required class="writeContentBox" name="pt_content"></textarea>
			<button class="writeBtn" style="margin-top:3vh;" >작성 완료</button>
		</div>
	</form>
<% } else { %> 
	<!-- 글 수정 -->
	<form method="post" action="./updatePtContent.won" class="writeTotalForm">
		<div class="writeForm">
			<div class="wirteFormLeft">
				<p>사진은 본인 프로필 사진으로 자동 지정됩니다.</p>
				<br>
				<a href="<%=wonViewDir%>/myPage.jsp" class="Btn middleMenuBtn">👉 클릭 시 프로필 사진 추가 페이지로 이동</a>
			</div>
			<div class="wirteFormRight">
				<div class="wirteFormRightOne">
					<p>제목</p>
					<input type="text" name="pt_title" required value="<%=pt_title%>" class="inputBox">
				</div>
				<div class="wirteFormRightOne">
					<p>이름</p><input type="text" name="t_name" value="<%=t_name %>" disabled class="inputBox">
				</div>
				<div class="wirteFormRightOne">
					<p>동네</p> <input type="text" name="c_code" value="<%=c_code%>" disabled class="inputBox">
				</div>
				<div class="wirteFormRightOne">
					<p>상담 가격</p> <input type="number" min="0" name="pt_con_c" value="<%=pt_con_c%>" required class="inputBox">
				</div>
				<div class="wirteFormRightOne">
					<p>회당 가격</p> <input type="number" min="0" name="pt_one_c" value="<%=pt_one_c%>" required class="inputBox">
				</div>
			</div>
		</div>
		<!-- 내용 바로 위 -->
		<div class="writeContent">
			<div class="writeContentTop">
				<p>내용</p>
			</div>
			<textarea required class="writeContentBox" name="pt_content"><%=pt_content%></textarea>
			<button class="writeBtn" style="margin-top:3vh;" >수정 완료</button>
		</div>
	</form>
	
<% } %>
	<%@ include file="../module/footer.jsp"%>
	<script type="text/javascript">
	window.onpageshow = function(event) {
	    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
	    alert("잘못된 접근입니다.");
	    location.href="/kjw59_project/index.jsp";
	  }
	}
	</script>
</body>
</html>