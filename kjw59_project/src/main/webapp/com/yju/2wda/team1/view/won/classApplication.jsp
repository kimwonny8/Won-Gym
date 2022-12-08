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
select {
	width: 7vw;
	padding: 3px;
	border: 0.01rem solid #D9D9D9;
}
select option {
  background:  #D9D9D9;
  padding: 3px;
}
</style>
<link rel="stylesheet" href="<%=cssDir%>/class.css">
</head>
<body>
	<%@ include file="../module/header.jsp"%>
	<%
		String searchContent=(String)session.getAttribute("searchContent");
		if(searchContent == null) searchContent="전체";
		
		m_grade = (String) session.getAttribute("m_grade");
		AllClassVO allVO;
		ArrayList<AllClassVO> classList;

		classList = (ArrayList<AllClassVO>) session.getAttribute("classList");
	%>

	<div class="bottom">
		<p class="menuTitle">수업신청</p>
	</div>

	<div class="classTotalForm">

		<div class="classMenu">
			<!-- 검색하는 부분 -->
			<form method="post" action="./getClassList.won" class="classMenuSearch">
				
				<select name="search">
					<option value="전체" selected>전체</option>
					<option value="c_code">동네</option>
					<option value="t_id">아이디</option>
					<option value="pt_title">제목</option>
					<option value="pt_content">내용</option>
				</select>
				<input type="text" name="searchContent" id="text" class="inputBox"> 
				
				<select id="city" name="citySearchContent" style="display:none">
					<option value="수성구">수성구</option>
					<option value="중구">중구</option>
					<option value="동구">동구</option>
					<option value="서구">서구</option>
					<option value="남구">남구</option>
					<option value="북구">북구</option>
					<option value="달서구">달서구</option>
					<option value="달성군">달성군</option>
				</select>
				<button class="smallBtn">검색</button>
				
			</form>
			<!-- 현재 __ 검색 중 -->
			<div class="classMenuMsg">
			<p>현재 <%=searchContent %> 검색 중</p> 
			<p style="width: 5vw; border-bottom: 1px solid gray; margin-top: 0.5vw"></p>
			</div>
			<!-- 글쓰기 -->
			<div class="classMenuWrite">
			<%	if (session.getAttribute("m_grade") == null || m_grade.equals("일반") || m_grade.equals("관리자")) {
			} else { 
			%> <button class="Btn" onclick="location.href='<%=wonViewDir%>/uploadClass.jsp'">글쓰기</button> <%	}%>
			</div>
		</div>

		<!-- 상품 리스트 -->
		<div class="classContent" id="classContent">
			<% if(classList.size()==0){ %> 
				<p>존재하는 상품이 없습니다.</p>
			<% } else { 
			for (int i = 0; i < classList.size(); i++) {
				allVO = classList.get(i);
				String thumbsnail = allVO.getMi_thum_name();
			%>
			<a href="./selectPt.won?pt_code=<%=allVO.getPt_code() %>" class="classContentOne">
				<div>
				<img class="classContentImg" src="<%=memberThumbDir%>/<%=thumbsnail%>">
				</div>
				<p><%=allVO.getM_name()%></p>
				<p>" <%=allVO.getPt_title()%> "</p>
			<% } }%>
			</a>
		</div>
	</div>

	<%@ include file="../module/footer.jsp"%>
<script>
$(document).ready(function() {
	  $('select[name=search]').change(function() {
	    var result = $('select[name=search]').val();
	    if (result == 'c_code') {
	      $('#city').show();
	      $('#text').hide();
	    } else {
		     $('#city').hide();
		     $('#text').show();
	    }
	  }); 
	}); 

/* 스크롤 페이징 진행할 예정
 var page = 0;

	function getList() {
		$.ajax({
			type : "post",
			data : page,
			url : "./getClassList.won",
			success : function(value) {
				console.log(value);
			}
		});
	};

    $(window).scroll(function() {
        if ($(window).scrollTop() == $(document).height() - $(window).height()) {
          console.log(++page);
          $("#classContent").append('<h1>Page ' + page + '</h1>');

        }
    }); */
  </script>
</body>
</html>