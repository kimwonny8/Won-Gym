<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome!</title>
<style>
.bottom {
	width: 70%;
	height: 20vh;
	background-image: url("<%=imgDir%>/intro.jpg");
	background-repeat: no-repeat;
	background-size: 100% 60vh;
	opacity: 0.8;
	display: flex;
	align-items: center;
}
.introduceForm {
	margin-top: 5vw;
	margin-bottom: 5vw;
	width: 70%;	
}
.introduceText {
	text-align: center;
	padding: 1vw;
}
</style>
</head>
<body>
	<%@ include file="../module/header.jsp"%>
	<div class="bottom">
		<p class="menuTitle">소개</p>
	</div>

	<div class="introduceForm">
		<div class="introduceText">
		<p>주소 : 대구광역시 북구 복현로 35</p>
		</div>
		<div id="map" style="width: 70%; height: 350px;"></div>
	</div>
	<%@ include file="../module/footer.jsp"%>
	<script type="text/javascript" 
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4812fa94181ca8ca90c57cfcf8a685b9"></script>
	<script>
	const container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	let options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(35.8963228, 128.622045), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	</script>
</body>
</html>