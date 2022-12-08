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
<style>
.bottom {
	width: 70%;
	height: 20vh;
	background-image: url("<%=imgDir%>/mypage.jpg");
	background-repeat: no-repeat;
	background-size: 100% 60vh;
	opacity: 0.8;
	display: flex;
	align-items: center;
}
.myPageClass{
    width: 80%;
    height: 12vw;
    font-size: 0.9vw;
    border-top: 0.01vw solid gray;
    border-bottom: 0.01vw solid gray;
    padding: 1vw 0;
    display: flex;
    flex-direction: column;
 	justify-content: space-around;
 	margin-top: 1vw;
 	margin-bottom: 3vw;
}
</style>
<link rel="stylesheet" href="<%=cssDir%>/mypage.css">
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
	            <input type="file" id="file" name="file"> 
	            <p id="inputCheck" class="inputCheck"></p>
	            <input type="button" class="smallBtn" value="저장" onclick="chkFile()">
	            <button id="submitBtn" class="smallBtn" style="display:none;">제출</button> 
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
            	<button class="mypageBtn">게시글관리</button>                
            </div>
            <div class="myPageBottom">
            	
            </div>
        </div>
    </div>
    </div>
    <% } %>
	
	<%@ include file="../module/footer.jsp"%>
	
<script type="text/javascript">
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