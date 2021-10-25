<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<!--초기화 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<!--리뷰 CSS-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reviews.css">
<title>UGLYS</title>
</head>
<body>
<!-- HEADER -->
	<jsp:include page="module/header.jsp" />
	<section id="rev_use">
	<div id="max-w-lg">
        <h2>후기</h2>
		<!-- 후기 시작 -->
		<ol id="rev_use_ol">
			<!-- 이미지 -->
			<div class="text-img">
			<c:set var="content_img" value="${review.content_img }" />
				<c:choose>
				    <c:when test="${empty content_img}">
				    	<!-- 기본이미지 넣어주세요 -->
				        <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="">
				    </c:when>
				    <c:otherwise>
					    <img src="${review.content_img }" alt="" >
				    </c:otherwise>
				</c:choose>
				</div>
			<!-- 게시글 -->
			<div class="board">
				<!-- 글 제목 -->
				<!-- 내용 -->
				<div class="text-all">
					<p class="text-title">
						제목 : ${review.title}
					</p>
					<p class="text-content">
						${review.content}
						</p>
					<!-- 작성 정보 -->
					<p class="writer">
						조회수 : ${review.viewCnt} <br>
						작성자 : ${review.writer} <br>
						작성일 : ${review.regDate} <br>
					</p>
				</div>
			</div>
			<!-- 버튼 -->
			<hr>
                	<div id="sit_use_wbtn01"><!-- 수정 / 삭제 버튼 링크 추가. user_id 와 writer가 같아야 뜸. -->
               		<c:if test="${user.user_id == review.writer}">
                  		<a href="updateReview.do?reviewNum=${review.reviewNum }" class="btn01">글 수정/삭제</a> 
               		</c:if><!-- 글 목록 링크 추가 -->
                  	<a href="getReviewList.do?pageNum=${param.pageNum}&amount=10&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}" class="btn01">후기 목록</a>
               </div>
			</div>
		</div>
	</section>
	<!-- FOOTER -->
	<jsp:include page="module/footer.jsp" />
</body>
</html>