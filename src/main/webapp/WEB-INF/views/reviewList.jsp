<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!--초기화 CSS --> 
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common.css">
<!--리뷰 CSS-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reviews.css">
<!-- 영문, 숫자 폰트-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:300,400" />
<!--검색 CSS, js-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reviewSearch.css" />
<script
	src="${pageContext.request.contextPath}/resources/js/extention/choices.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/extention/custom-materialize.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/extention/flatpickr.js"></script>
<title>UGLYS</title>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="module/header.jsp" />
	<!--상품 검색 시작-->
	<div class="s132">
		<form action="getReviewList.do" method="post"> <!-- 10.18 검색 수정 -->
			<div class="inner-form">
				<div class="input-field first-wrap">
					<div class="input-select">
						<select data-trigger="" name="searchCondition"><!-- 10.18 name 수정 -->
							<option value="TITLE">제목</option> <!-- 10.18 value 추가 -->
							<option value="CONTENT">내용</option> <!-- 10.18 value 추가 -->
						</select>
					</div>
				</div>
				<div class="input-field second-wrap">
					<input id="search" name="searchKeyword" type="text" placeholder="Enter Keywords" /> <!-- 10.18 name 추가 -->
				</div>
				<div class="input-field third-wrap">
					<button  class="btn-search" type="submit">Search</button> <!-- 10.18 submit 으로 변경 -->
				</div>
			</div>
			<!--제목/내용-->
			<script>
				const choices = new Choices('[data-trigger]', {
					searchEnabled : false,
					itemSelectText : ''
				});
			</script>
			<!--상품 검색 끝-->
			<!-- 검색창, 후기 게시판, 페이징네이션, 사용후기 버튼 전체 정렬 -->
			<div id="sit_center_t">
				<!--후기 게시판 시작-->
				<section id="sit_use">
					<h2>후기 게시판</h2>
					<!--상품 사용후기 시작-->
					<section id="sit_use_list">
						<ol id="sit_use_ol">
									<c:forEach items="${reviewList}" var="reviewVO">
									<li class="sit_use_li">
											<button type="button" class="sit_use_li_title">
												<a href="getReview.do?pageNum=${pageMaker.cri.pageNum}
									  	 				&amount=10&reviewNum=${reviewVO.reviewNum}
										 				&searchCondition=${param.searchCondition}
										 				&searchKeyword=${param.searchKeyword}">
													<td>
													
													<c:set var="content_img" value="${reviewVO.content_img }" />
				<c:choose>
				    <c:when test="${empty content_img}">
				    	<!-- 기본이미지 넣어주세요 -->
				        <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="" class="absolute w-full h-full object-cover" width="100">
				    </c:when>
				    <c:otherwise>
					    <img src="/uglys/resources/${reviewVO.content_img }" alt=""
														class="absolute w-full h-full object-cover" width="100">
				    </c:otherwise>
				</c:choose>
														
															제목 : ${reviewVO.title}
													</td>
													<dl class="sit_use_dl">
														<dt>작성자</dt>
														<dd>작성자 : ${reviewVO.writer}</dd>
														<dt>작성일</dt>
														<dd>작성일 : ${reviewVO.regDate}</dd>
														<dt>조회수</dt>
														<dd>조회수 : ${reviewVO.viewCnt}</dd>
													</dl>
												</a>
											</button>
											</li>
							</c:forEach>
						</ol>
					</section>
					<!--상품 사용후기 끝-->
					<!--페이징 시작--> <!-- 10.18  페이징  수정-->
					<nav class="pg_wrap">
						<span class="pg"><span class="sound_only">열린</span>
						<c:if test="${pageMaker.prev}">				<!-- 이전 페이지 -->
							<a href="getReviewList.do?pageNum=${pageMaker.startPage -1}&amount=10" class="pg_page pg_next"> < </a>
						</c:if> 
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num"> <!-- 하단 페이징 -->
							<a href="getReviewList.do?pageNum=${num}&amount=10&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}" class="pg_page">${num}</a><span class="sound_only"></span>
						</c:forEach>
							<c:if test="${pageMaker.next}"> <!-- 다음 페이지 -->
								<a href="getReviewList.do?pageNum=${pageMaker.endPage + 1}" class="pg_page pg_end">>></a> </span>
							</c:if> 
					</nav>
					<!-- 페이징 끝-->
					<!--사용후기 쓰기-->
					<div id="sit_use_wbtn02">
						<a href="insertReview.do" class="btn02">사용후기 쓰기</a>
					</div>
			</div>
	</div>
	<!-- FOOTER -->
	<jsp:include page="module/footer.jsp" />
</body>
</html>


