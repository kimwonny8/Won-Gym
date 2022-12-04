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
	background-image: url("../../image/mypage.jpg");
	background-repeat: no-repeat;
	background-size: 100% 60vh;
	opacity: 0.8;
	display: flex;
	align-items: center;
}
</style>
<link rel="stylesheet" href="<%=cssDir%>/mypage.css">
<script type="text/javascript">
$(document).ready(function(){
	
});  
</script>
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
	<% } else { 
	m_name = (String)session.getAttribute("m_name"); %>
	<div class="bottom">
		<p class="menuTitle">마이페이지</p>
	</div>
	
	<div class="myPageForm">
        <div class="myPageTop">
            <form method="post" action="./updateMemberPhoto.won" enctype="multipart/form-data" class="myPageLeft">
                <div class="myPageImage"></div>
	            <input type="file" name="file">
	            <div> 
	            	<button>추가</button> 
	            </div>
            </form>
            
        <!-- 마이페이지 수업 현황 부분 -->
        <div class="myPageRight">
            <div class="mypageColumn"><p><b class="bigText"><%=m_name %></b>님</p></div>
            <div class="myPageClass">
                <h3>👉수업현황</h3>
                <div class="myPageClassStatus">
                    <div class="myPageClassStatusLeft">
                        <div class="mypageColumn">
                            <p>상담 대기중 0</p>
                        </div>
                        <div class="mypageColumn">
                            <p>상담 진행중 0</p>
                        </div>
                        <div  class="mypageColumn">
                            <p>상담 완료 0</p>
                        </div>
                    </div>
                    <div class="myPageClassStatusRight">
                        <div class="mypageColumn"><p>현재 남은 수업 <b class="bigText">30회</b></p></div>
                        <div class="mypageColumn">
                            <p>완료된 수업 0</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 마이페이지 버튼 -->
        <div class="myPageBottom">
            <button onclick="location.href='<%=wonViewDir%>/mypageChkPw.jsp'" class="mypageBtn">회원정보수정/탈퇴</button>
            <!-- <button class="mypageBtn">게시글관리</button> -->
<!--             <button class="mypageBtn">스케줄관리</button> -->
        </div>
    </div>
    <% } %>
	
	<%@ include file="../module/footer.jsp"%>
</body>
</html>