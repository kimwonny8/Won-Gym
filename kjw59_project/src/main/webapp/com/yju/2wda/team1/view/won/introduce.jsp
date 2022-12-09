<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome!</title>
<link rel="stylesheet" href="<%=cssDir%>/introduce.css">
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

</style>
</head>
<body>
	<%@ include file="../module/header.jsp"%>
	<div class="bottom">
		<p class="menuTitle">소개</p>
	</div>

	<div class="introduceForm">
		<div class="greetingMent">
			<p>	WorkOutNow 에 오신 것을 환영합니다! 
				<span class="icon1"><img src="https://www.comwel.or.kr/_res/daegu/img/content/greeting-ic01.jpg"></span>
				<span class="icon2"><img src="https://www.comwel.or.kr/_res/daegu/img/content/greeting-ic02.jpg"></span>
			</p>
		</div>
			<div class="introduceText">
			<p>
			<br>해당 사이트는 위치기반 트레이너 매칭 및 스케줄, 운동 기록 관리 사이트입니다. 
			<br>조만간 스케줄, 운동 기록 관리 등 다양한 메뉴를 오픈 할 예정이니 많은 관심 부탁드립니다.
			<br>꾸준히 발전해나가는 사이트가 되겠습니다!
			</p>
			<br><br>
			<p>제작 : 김정원 <br>
			주소 : 대구광역시 북구 복현로 35</p>
		</div>
		<div id="map" style="width: 70%; height: 350px;"></div>
	</div>
	<%@ include file="../module/footer.jsp"%>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4812fa94181ca8ca90c57cfcf8a685b9"></script>
	<script>
		const container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		let options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(35.8963228, 128.622045), //지도의 중심좌표.
			level : 3
		//지도의 레벨(확대, 축소 정도)
		};
		let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	</script>
</body>
</html>