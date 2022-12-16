<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<script
  src="http://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
 <link rel="stylesheet" href="<%=cssDir%>/mypage.css">
<style>
.bottom {
	background-image: url("<%=imgDir%>/mypage.jpg");
}

</style>

</head>
<body>

	<%@ include file="../module/header.jsp"%>
	<% 
	if(session.getAttribute("loginState")== null || session.getAttribute("loginState").equals("logout")){
	%>
		<script>
			alert("로그인 후 이용해 주세요!");
			window.location.href = '/kjw59_project/index.jsp';
		</script>
	<% } 
	else { 
		m_coin = (Integer)session.getAttribute("m_coin"); 
		m_name = (String)session.getAttribute("m_name"); 
		m_grade = (String)session.getAttribute("m_grade"); 
		mi_thum_name = (String)session.getAttribute("mi_thum_name"); 
	%>
	<div class="bottom">
		<p class="menuTitle">마이페이지</p>
	</div>
	
	<div class="myPageForm">
		<div class="coinMenu">
			<p><%=m_coin%> 코인</p>
			<a href="<%=wonViewDir%>/chargeCoin.jsp" class="btn">코인충전</a>
		</div>
		
        <div class="myPageTop">
            <form method="post" action="./updateMemberPhoto.won" enctype="multipart/form-data" class="myPageLeft">
                <div class="myPageImage">
               <% if(mi_thum_name == null) { %>
                	<img class="myPageImageInner" src="<%=imgDir%>/user.png" width="150"/>
               <% } else {  %>
               		<img class="myPageImageInner" src="<%=memberThumbDir%>/<%=mi_thum_name%>" width="150"/>  
               <% } %>
                </div>
                <div class="addMyPageImage">
                <div class="filebox">
		            <label for="file">사진선택</label>
	  				<input type="file" name="file" id="file">  
	            </div>
	            <p id="fileName" class="inputCheck" style="color:gray;"></p>
	            <p id="inputCheck" class="inputCheck"></p>
	            <div style="display:flex;">
	            <input type="button" class="smallBtn" value="저장" onclick="chkFile()">
	            <button id="submitBtn" class="smallBtn" style="display:none;">제출</button> 
	            </div>
	            </div>
            </form>
            
        <!-- 마이페이지 수업 현황 부분 -->
        <div class="myPageRight">
            <div class="mypageColumn"><p><b class="bigText"><%=m_name %></b>님</p></div>
            <div class="myPageClass">
              	<button onclick="location.href='<%=wonViewDir%>/mypageChkPw.jsp'" class="mypageBtn">회원정보수정/탈퇴</button>
            <% if(m_grade.equals("일반")) { %>	
            	<button onclick="location.href='./manageApplication.won'" class="mypageBtn">신청내역관리</button>
            	<% } else { %>
            	<button onclick="location.href='./manageClient.won'" class="mypageBtn">신청내역관리</button>
            	<% } %>
            	<button class="mypageBtn" onclick="alert('준비 중인 기능입니다.')">게시물관리</button>                
            </div>
            <div class="myPageBottom">
            	
            </div>
        </div>
    </div>
    </div>
    <% } %>
	
	<%@ include file="../module/footer.jsp"%>
	
<script type="text/javascript">
$("#file").on('change',function(){
	  var fileName = $("#file").val();
	  $("#fileName").text(fileName);
	});
	
function chkFile(){
	var file = $('#file').val();
	console.log(file);
	if(file == ""){
		$('#inputCheck').text("파일을 선택해주세요!");
	} else {
		$('#inputCheck').text("제출버튼을 눌러 저장을 완료해주세요.");
		$('#submitBtn').show();
	}
} 
</script>
</body>
</html>