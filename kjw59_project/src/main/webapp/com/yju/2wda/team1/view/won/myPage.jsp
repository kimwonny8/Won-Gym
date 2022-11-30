<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
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
</head>
<body>
	<%@ include file="../module/header.jsp"%>
	
	<div class="bottom">
		<p class="menuTitle">마이페이지</p>
	</div>
	
	<form class="myPageForm">
        <div class="myPageTop">
            <div class="myPageLeft">
                <div class="myPageImage"><input type="file"></div>
            </div>
        <!-- 마이페이지 수업 현황 부분 -->
        <div class="myPageRight">
            <div class="mypageColumn"><p><b class="bigText">김정원</b>님</p></div>
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
            <button class="mypageBtn">회원정보수정/탈퇴</button>
            <button class="mypageBtn">게시글관리</button>
            <button class="mypageBtn">스케줄관리</button>
        </div>
    </form>
	
	<%@ include file="../module/footer.jsp"%>
</body>
</html>