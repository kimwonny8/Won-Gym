<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome WorkOutNow!</title>
<script src="http://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>

</head>
<style>
.mainImage {
	width: 70%;
	height: 90%;
}
</style>
<link rel="stylesheet" href="<%=cssDir%>/slide.css">

</head>
<body style="overflow-x:hidden; overflow-y:auto;" >
	<%@ include file="./com/yju/2wda/team1/view/module/header.jsp"%>
	<!-- 메인이미지 캐러셀 코드 -->
	<div class="container">
		<div class="slideContainer">
			<ul class="slideWrap">
				<li class="slide slide4"><img src="<%=imgDir%>/s1.jpg"></li>
				<li class="slide slide1"><img src="<%=imgDir%>/s0.jpg"></li>
				<li class="slide slide2"><img src="<%=imgDir%>/s2.jpg"></li>
				<li class="slide slide3"><img src="<%=imgDir%>/s3.jpg"></li>
				<li class="slide slide4"><img src="<%=imgDir%>/s1.jpg"></li>
				<li class="slide slide1"><img src="<%=imgDir%>/s0.jpg"></li>
			</ul>
			<ul class="pageBtWrap">
				<li><a href="#" class="pageBt addPageBt"></a></li>
				<li><a href="#" class="pageBt"></a></li>
				<li><a href="#" class="pageBt"></a></li>
				<li><a href="#" class="pageBt"></a></li>
			</ul>
		</div>
	</div>
	

	<%@ include file="./com/yju/2wda/team1/view/module/footer.jsp"%>
<script>
	$(function() {
		var winW = cnt = setId = 0;

		resizeFn(); //함수 호출
		setTimeout(resizeFn, 100); //오픈하자마다 실행

		function resizeFn() { //반응형 이미지크기 조정함수
			winW = $(window).innerWidth();

			$(".slide").css({
				width : winW
			}); //창크기에 슬라이드이미지 맞춤

		};

		$(window).resize(function() {
			resizeFn(); //창크기 변경될 때 마다 함수 반복 실행
		});

		autoplayFn(); //함수 호출

		function autoplayFn() { //2.5초마다 슬라이드 자동 작동
			setId = setInterval(nextCountFn, 2500);
		};

		$(".pageBt").each(function(idx) { //page버튼 클릭시마다 해당 이미지로 이동
			$(this).click(function() {
				clearInterval(setId); //autoplay함수 정지
				cnt = idx;
				mainslideFn();
			});
		});

		function nextCountFn() { //count(cnt)가 증가될때마다 슬라이드 작동
			cnt++;
			mainslideFn();
		};

		function prevCountFn() { //count가 감소될때마다 슬라이드 작동
			cnt--;
			mainslideFn();
		};

		function mainslideFn() { //메인슬라이드 함수
			$(".slideWrap").stop().animate({
				left : (-100 * cnt) + "%"
			}, 600, function() {
				if (cnt > 3) {
					cnt = 0; //count가 끝까지 이동했을때 다시 처음으로 돌아감
				}
				if (cnt < 0) {
					cnt = 3
				}
				$(".slideWrap").stop().animate({
					left : (-100 * cnt) + "%"
				}, 0)
			});
			$(".pageBt").removeClass("addPageBt");
			$(".pageBt").eq(cnt > 3 ? cnt = 0 : cnt).addClass("addPageBt");
		};
		//animation사용시에는 stop을 넣어 부드럽게(덜컹거리지 않음)
		//count 변경시마다 버튼색깔 변경됨

	});
</script>	
</body>
</html>