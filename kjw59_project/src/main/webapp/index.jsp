<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome WorkOutNow!</title>
<style>
a {
	text-decoration-line: none;
}

.mainImage {
	width: 70%;
	height: 90%;
}
</style>
<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script> -->
</head>
<body>
	<%@ include file="./com/yju/2wda/team1/view/module/header.jsp"%>
	<!-- 메인이미지 캐러셀 코드 -->
	<div class="mainImage">
		<div id="carouselExampleInterval" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="5000">
					<img
						src="https://cdn.pixabay.com/photo/2015/01/10/18/45/gym-595597_960_720.jpg"
						class="d-block w-100" alt="...">

				</div>
				<div class="carousel-item" data-bs-interval="5000">
					<img
						src="https://cdn.pixabay.com/photo/2013/03/09/14/38/gym-91849_960_720.jpg"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img
						src="https://cdn.pixabay.com/photo/2018/01/27/19/45/race-3112028_960_720.jpg"
						class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleInterval" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>

	<%@ include file="./com/yju/2wda/team1/view/module/footer.jsp"%>
</body>
</html>