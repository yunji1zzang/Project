<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta name="format-detection" content="telephone=no">

<meta name="description" content="맛있는 채소를 좀 더 싸게!">
<meta name="keywords" content="어글리채소,못생긴채소,채소">

<!-- import CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">
<!-- fontawesome -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	crossorigin="anonymous" />

<title>UGLYS</title>
</head>

<body>
	<div class="wrapper">
		<h2 class="sr-only">못난이채소 소개 페이지</h2>
		<!-- HEADER -->
		<jsp:include page="module/header.jsp" />

		<!-- MAIN -->
		<main id="main">
			<section class="sec-visual row me-0">
				<div class="col-sm-6">
					<h3>보기 좋은 야채가 맛도 좋다?</h3>
					<p>
						어글리스에서는 못생겼지만 맛이 좋은 야채들을<br> 소비자가격 대비 <strong>10~40%</strong>나
						저렴하게 판매하고 있습니다.
					</p>
					<c:choose>
					<c:when test="${empty user }">
						<a href="user/login" class="btn btn-green">시작하기</a>
					</c:when>
					<c:otherwise>
						<button type="button" onclick="alert('결제모듈 미구현')" class="btn btn-green">시작하기
						</button>
					</c:otherwise>
				</c:choose>
				
			</section>
			<section class="sec-pros">
				<div class="pros1">
					<span><i class="fas fa-leaf"></i>친환경 채소</span>
					<p class="pc">
						땅에게도, 사람에게도 이로운<br> <b>친환경 농법</b>으로 자란<br> 채소만을 보내드려요.
					</p>
					<p class="mb">
						땅에게도, 사람에게도 이로운<br> <b>친환경 농법</b>으로 자란 채소만을 보내드려요.
					</p>
				</div>
				<div class="pros2">
					<span><i class="fas fa-money-bill"></i>저렴한 가격</span>
					<p class="pc">
						시중의 친환경 농산물 대비<br> <b>10~40%</b> 저렴해요.
					</p>
					<p class="mb">
						시중의 친환경 농산물 대비 <b>10~40%</b> 저렴해요.
					</p>
				</div>
				<div class="pros3">
					<span><i class="fas fa-book-open"></i>레시피 페이퍼</span>
					<p class="pc">
						채소박스를 이용해<br> 만들 수 있는 <b>레시피</b>도<br> 함께 드려요.<br>
					</p>
					<p class="mb">
						채소박스를 이용해 만들 수 있는 <b>레시피</b>도 함께 드려요.<br>
					</p>
				</div>
			</section>
			<section class="sec-introduction">
				<figure>
					<img src="${pageContext.request.contextPath}/resources/img/img-vegetable.png" alt="채소들">
				</figure>
				<div>
					<h3>못난이 채소란?</h3>
					<p>
						너무 작거나, 너무 크거나 혹은 흠집이 있거나<br> 모양이 불균형하거나 색이 불균일하는 등<br>
						품질에 이상은 없지만 생김새로 인해 유통되지 못한 채소들입니다.
					</p>
				</div>
			</section>
			<section class="sec-introduction2">
				<h3>알고 계세요?</h3>
				<p>
					매년 버려지는 농산물을 생산하는데 <strong>15조 리터</strong>의 물과 <strong>90만톤</strong>의
					비료가 낭비됩니다.<br> 농산물을 폐기할 때에는 메탄과 이산화질소가 생성되어 지구온난화에 악영향을 끼칩니다.<br>
					어글리스는 못난이채소의 소비를 확대화하여 보다 나은 지구의 환경을 꿈꾸고 있습니다.
				</p>
			</section>
			<section class="sec-reviews">
				<h3>
					어글리스의 <b>신</b><b>선</b><b>한</b> 후기<i class="fas fa-comment-dots"></i>
				</h3>
				<div>
					<a class="card"> <img src="${pageContext.request.contextPath}/resources/img/img-review.jpg"
						alt="후기 사진" class="card-img-top">
						<div class="card-body">
							<span class="card-title"> <b>김다밍</b>님
							</span>
							<p class="card-text text-trunc">배송 진짜 빨라요 저희집에 cctv 달려있는줄
								알았네요 제가 구독하기 누른 거 어떻게 아셨어여?? 민간인 사찰 불법 아닌지??? 맛도 기대이상! 이제 맨날
								채소먹을거예여!!!!!!!!!</p>
						</div>
					</a> <a class="card"> <img
						src="${pageContext.request.contextPath}/resources/img/img-review2.jpg" alt="후기 사진"
						class="card-img-top">
						<div class="card-body">
							<span class="card-title"><b>한윤즤</b>님</span>
							<p class="card-text text-trunc">보기도 좋은 떡이 맛도 좋다는 말은 거짓말이었어요
								그러니까 대박 맛있는 거예요 완전 강추 강추 머더라 내가 무슨 말을 하고 싶ㅇ픈건ㄴ지 나도 몰라 흐흑</p>
						</div>
					</a> <a class="card"> <img
						src="${pageContext.request.contextPath}/resources/img/img-review3.jpg" alt="후기 사진"
						class="card-img-top">
						<div class="card-body">
							<span class="card-title"><b>김듄긔</b>님</span>
							<p class="card-text text-trunc">둘이 먹다 셋이 죽어도 모르는 채소의 퀄리티</p>
						</div>
					</a>
				</div>
			</section>
			<section class="sec-slogan">
				<h3>UGLYS SAVE THE PLANET</h3>
				<p>
					농산물의 폐기는 지구온난화의 원인이 되고 물, 비료, 노동 등의 에너지의 낭비로 이어집니다.<br> 건강한
					식탁과 지속가능한 환경을 위해 함께 해주세요.
				</p>
				<c:choose>
					<c:when test="${empty user }">
						<a href="user/login" class="btn">시작하기</a>
					</c:when>
					<c:otherwise>
						<a href="user/insertUser" class="btn">시작하기</a>
					</c:otherwise>
				</c:choose>
			</section>
		</main>

		<!-- FOOTER -->
		<jsp:include page="module/footer.jsp" />
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>

</html>