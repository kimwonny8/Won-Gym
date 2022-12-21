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

.ck.ck-editor {
	height: 65%;
}

.ck.ck-toolbar>.ck-toolbar__items {
	font-size: 0.8vw;
	justify-content: center;
}

.ck.ck-editor__main>.ck-editor__editable:not(.ck-focused) {
	height: 25vw;
}

.ck-rounded-corners .ck.ck-editor__main>.ck-editor__editable, .ck.ck-editor__main>.ck-editor__editable.ck-rounded-corners
	{
	height: 25vw;
}
/* page-loading */
#loading {
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	position: fixed;
	display: block;
	opacity: 0.8;
	background: white;
	z-index: 99;
	text-align: center;
}

#loading>img {
	position: absolute;
	top: 47%;
	left: 50%;
	z-index: 100;
}

#loading>p {
	position: absolute;
	top: 57%;
	left: 47%;
	z-index: 101;
}
.no-scroll {
    overflow: hidden;
}
</style>
</head>
<body class="no-scroll">
	<%@ include file="../module/header.jsp"%>
	<%
	String t_name = (String) session.getAttribute("m_name");
	String c_code = (String) session.getAttribute("c_code");

	PtDTO pt;
	String pt_title = "";
	int pt_con_c = 0;
	int pt_one_c = 0;
	int pt_code = 0;
	String pt_content = "";
	boolean update = false; // true면 글 수정중, false면 글 작성중

	ArrayList<PtDTO> ptList = (ArrayList<PtDTO>) session.getAttribute("ptList");

	if (ptList != null) {
		pt_code = (int) session.getAttribute("pt_code");
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

	<!--로딩바-->
	<div id="loading" style="margin-left: 0px;">
		<img src="<%=imgDir%>/loading.gif">
		<p>페이지를 불러오는 중입니다.<br>잠시만 기다려 주세요.</p>
	</div>

	<%
	if (update == false) {
	%>
	<!-- 글 작성 -->
	<form method="post" action="./uploadPT.won" class="writeTotalForm">
		<div class="writeForm">
			<div class="wirteFormLeft">
				<p>사진은 본인 프로필 사진으로 자동 지정됩니다.</p>
				<br> <a href="<%=wonViewDir%>/myPage.jsp"
					class="Btn middleMenuBtn">👉 클릭 시 프로필 사진 추가 페이지로 이동</a>
			</div>
			<div class="wirteFormRight">
				<div class="wirteFormRightOne">
					<p>제목</p>
					<input type="text" name="pt_title" class="inputBox" required>
				</div>
				<div class="wirteFormRightOne">
					<p>이름</p>
					<input type="text" name="t_name" value="<%=t_name%>" disabled
						class="inputBox">
				</div>
				<div class="wirteFormRightOne">
					<p>동네</p>
					<input type="text" name="c_code" value="<%=c_code%>" disabled
						class="inputBox">
				</div>
				<div class="wirteFormRightOne">
					<p>상담 가격</p>
					<input type="number" min="0" name="pt_con_c" required
						class="inputBox">
				</div>
				<div class="wirteFormRightOne">
					<p>회당 가격</p>
					<input type="number" min="0" name="pt_one_c" required
						class="inputBox">
				</div>
			</div>
		</div>
		<!-- 내용 바로 위 -->
		<div class="writeContent">
			<div class="writeContentTop">
				<p>내용</p>
			</div>
			<textarea class="writeContentBox" id="editor" name="pt_content"></textarea>
			<button class="writeBtn" id="submit"
				style="margin-top: 3vh; padding: 0.5vh 0;">작성 완료</button>
		</div>
	</form>
	<%
	} else {
	%>
	<!-- 글 수정 -->
	<form method="post" action="./updatePtContent.won"
		class="writeTotalForm">
		<div class="writeForm">
			<div class="wirteFormLeft">
				<p>사진은 본인 프로필 사진으로 자동 지정됩니다.</p>
				<br> <a href="<%=wonViewDir%>/myPage.jsp"
					class="Btn middleMenuBtn">👉 클릭 시 프로필 사진 추가 페이지로 이동</a>
			</div>
			<div class="wirteFormRight">
				<div class="wirteFormRightOne">
					<p>제목</p>
					<input type="text" name="pt_title" required value="<%=pt_title%>"
						class="inputBox">
				</div>
				<div class="wirteFormRightOne">
					<p>이름</p>
					<input type="text" name="t_name" value="<%=t_name%>" disabled
						class="inputBox">
				</div>
				<div class="wirteFormRightOne">
					<p>동네</p>
					<input type="text" name="c_code" value="<%=c_code%>" disabled
						class="inputBox">
				</div>
				<div class="wirteFormRightOne">
					<p>상담 가격</p>
					<input type="number" min="0" name="pt_con_c" value="<%=pt_con_c%>"
						required class="inputBox">
				</div>
				<div class="wirteFormRightOne">
					<p>회당 가격</p>
					<input type="number" min="0" name="pt_one_c" value="<%=pt_one_c%>"
						required class="inputBox">
				</div>
			</div>
		</div>
		<!-- 내용 바로 위 -->
		<div class="writeContent">
			<div class="writeContentTop">
				<p>내용</p>
			</div>
			<input type="hidden" name="pt_code" value="<%=pt_code%>">
			<textarea required class="writeContentBox" id="editor"
				name="pt_content"><%=pt_content%></textarea>
			<button class="writeBtn" style="margin-top: 3vh; padding: 0.5vh 0;">수정
				완료</button>
		</div>
	</form>

	<%
	}
	%>
	<%@ include file="../module/footer.jsp"%>
	<script
		src="https://cdn.ckeditor.com/ckeditor5/35.4.0/super-build/ckeditor.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="  crossorigin="anonymous"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		setTimeout(function() {
		    $("#loading").hide();
		    document.body.classList.remove('no-scroll');
		}, 1500);
		
	}); 
	</script>
	<script src="<%=jsDir%>/editor.js"></script>
	
</body>
</html>