<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header id="header">
	<h1 class="logo">
		<a href="/uglys" title="홈"> <img
			src="${pageContext.request.contextPath}/resources/img/logo.png" alt="UGLYS">
		</a>
	</h1>
	<ul class="menu">
		<li><a href="/uglys/reviews/getReviewList">후기게시판</a></li>
		<!-- 세션에 값이 없을때 -->
		<c:if test="${empty user }">
			<li><a href="/uglys/user/login">로그인</a></li>
		</c:if>
		<c:if test="${not empty user }">
			<li><a href="/uglys/user/userUpdateView">마이페이지</a></li>
			<li>${user.user_name } 님 환영합니다! <a href="/uglys/user/logout">로그아웃</a></li>
		</c:if>
	</ul>
</header>
