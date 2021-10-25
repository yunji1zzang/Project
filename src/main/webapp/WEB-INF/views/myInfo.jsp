<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/join.css" />

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">

<!-- fontawesome -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	crossorigin="anonymous" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>회원정보 변경</title>
</head>



<body>

	<div class="wrapper">
		<jsp:include page="module/header.jsp" />



		<!-- 탈퇴 모달 -->
		<div class="modal fade" id="leaveModal" tabindex="-1"
			aria-labelledby="leaveModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title " id="leaveModalLabel">탈퇴 하기</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body text-center" id="leaveModalContent">
						못난이들을 탈퇴하시겠습니까?</div>
					<form action="userDelete" method="post">
						<input type="text" name="user_id" value="${user.user_id }"><br>
						<input type="password" name="user_password">

						<div class="modal-footer">
							<button type="button" class="btn btn-dark"
								data-bs-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-green">탈퇴하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>


		<h2 class="sr-only">회원정보 변경 페이지</h2>
		<div class="inner">
			<h3>회원정보 변경</h3>

			<button type="button" class="btn btn-sm btn-green"
				data-bs-toggle="modal" data-bs-target="#leaveModal" id="leaveBtn">회원
				탈퇴</button>
			<c:if test="${fail == false }">
				<p style="color: red;">비밀 번호를 확인해 주세요.</p>
			</c:if>
			<form action="userUpdate.do" method="post"
				enctype="multipart/form-data" onsubmit='submitAction()'>
				<!-- PC ver START -->
				<table class="pc">
					<tr>
						<th>타입<b>*</b></th>
						<td><c:if test="${user.user_admin eq '관리자' }">
								<div class="form-group">
									<label class="control-label col-md-offset-7 col-md-2">
										<input type="radio" name="user_admin" value="관리자" checked>
										<b>관리자</b>
									</label> <label class="control-label col-md-2"> <input
										type="radio" name="user_admin" value="일반" disabled="disabled">
										<b>사용자</b>
									</label>
								</div>
							</c:if> <c:if test="${user.user_admin eq '일반' }">
								<div class="form-group">
									<label class="control-label col-md-offset-7 col-md-2">
										<input type="radio" name="user_admin" value="관리자"
										disabled="disabled"> <b>관리자</b>
									</label> <label class="control-label col-md-2"> <input
										type="radio" name="user_admin" value="일반" checked> <b>사용자</b>
									</label>
								</div>
							</c:if></td>
					</tr>
					<tr>
						<th>아이디<b>*</b></th>
						<td class="input-group-sm"><input type="text" id="id"
							class="form-control" value="${user.user_id}" name="user_id"
							readonly="readonly"></td>
					</tr>
					<tr>
						<th>비밀번호<b>*</b></th>
						<td class="input-group-sm"><input type="password"
							id="password" name="user_password" class="form-control"
							value="${user.user_password }"></td>
					</tr>
					<tr>
						<th>이메일<b>*</b></th>
						<td class="input-group-sm"><input type="email" id="email"
							name="user_email" class="form-control" value="${user.user_email}"></td>
					</tr>
					<tr>
						<th>이름<b>*</b></th>
						<td class="input-group-sm"><input type="text" id="name"
							name="user_name" class="form-control" value="${user.user_name}"></td>
					</tr>
					<tr>
						<th>생년월일<b>*</b></th>
						<td class="input-group-sm"><input type="text" id="birthday"
							name="user_birth" class="form-control" value="${user.user_birth}"></td>
					</tr>
					<tr>
						<th>휴대폰 번호<b>*</b></th>
						<td class="input-group-sm"><input type="tel" id="phoneNum"
							name="user_phone" class="form-control" value="${user.user_phone}"></td>
					</tr>
					<tr>
						<th>주소<b>*</b></th>
						<td>
							<!-- <div class="input-group-sm d-flex mb-2">
                                <input type="text" id="address" class="form-control me-1"
                                    value="${user.user_basic_address}">
                                <button type="button" class="btn-search btn btn-sm btn-green">검색</button>
                            </div>
                            <div class="input-group-sm">
                                <input type="text" id="address2" class="form-control">
                            </div> -->

							<div class="input-group mb-2">
								<input class="form-control" type="text" id="user_Basic_Address"
									name="user_basic_address" readonly="readonly"
									value="${user.user_basic_address}" />
								<button type="button" class="btn btn-sm btn-dark"
									data-bs-toggle="modal" data-bs-target="#searchPost"
									onclick="execDaumPostcode()">
									<b>주소검색</b>
								</button>
							</div>
							<div class="input-group">
								<input type="text" id="user_Detail_Address"
									name="user_detail_address" class="form-control">
							</div>
						</td>
					</tr>
					<tr>
						<th>프로필 사진</th>
						<td>
							<div class="form-group">
								<div class="select_img img">
									<img src="${user.user_img }" width="100">
								</div>
								<input class="form-control" type="file" id="userImg" name="file">
								<script>
									$("#userImg")
											.change(
													function() {
														if (this.files
																&& this.files[0]) {
															var reader = new FileReader;
															reader.onload = function(
																	data) {
																$(
																		".select_img img")
																		.attr(
																				"src",
																				data.target.result)
																		.width(
																				100);
															}
															reader
																	.readAsDataURL(this.files[0]);
														}
													});
								</script>
							</div>

						</td>
					</tr>
					<caption>
						<b>*</b> 표시는 필수 항목 입니다.
					</caption>

				</table>
				<!-- PC ver End -->

				<!-- Mobile ver START-->
				<div class="mb">
					<c:if test="${user.user_admin eq '관리자' }">
						<div class="form-group">
							<label class="control-label col-md-offset-7 col-md-2"> <input
								type="radio" name="m_user_admin" value="관리자" checked> <b>관리자</b>
							</label> <label class="control-label col-md-2"> <input
								type="radio" name="m_user_admin" value="일반" disabled="disabled">
								<b>사용자</b>
							</label>
						</div>
					</c:if>
					<c:if test="${user.user_admin eq '일반' }">
						<div class="form-group">
							<label class="control-label col-md-offset-7 col-md-2"> <input
								type="radio" name="m_user_admin" value="관리자" disabled="disabled">
								<b>관리자</b>
							</label> <label class="control-label col-md-2"> <input
								type="radio" name="m_user_admin" value="일반" checked> <b>사용자</b>
							</label>
						</div>
					</c:if>
					<div class="form-floating mb-3">
						<input type="text" id="idMb" class="form-control" name="m_user_id"
							value="${user.user_id}" readonly="readonly"> <label
							for="idMb">아이디</label>
					</div>
					<div class="form-floating mb-3">
						<input type="password" id="passwordMb" class="form-control"
							placeholder="비밀번호" name="m_user_password"> <label
							for="passwordMb">비밀번호</label>
					</div>
					<div class="form-floating mb-3">
						<input type="email" id="emailMb" class="form-control"
							value="${user.user_email}" name="m_user_email"> <label
							for="emailMb">이메일</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" id="nameMb" class="form-control"
							value="${user.user_name}" name="m_user_name"> <label
							for="nameMb">이름</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" id="birthdayMb" class="form-control"
							value="${user.user_birth}" name="m_user_birth"> <label
							for="birthdayMb">생년월일</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" id="phoneNumMb" class="form-control"
							value="${user.user_phone}" name="m_user_phone"> <label
							for="phoneNumMb">휴대폰 번호</label>
					</div>
					<div class="mb-3">
						<div class="input-group mb-2">
							<input type="text" id="addressMb" class="form-control p-3"
								name="m_user_basic_address" value="${user.user_basic_address}">
							<label for="addressMb" class="sr-only">주소</label>
							<button type="button" class="btn btn-green">검색</button>
						</div>
						<div class="input-group">
							<input type="text" id="address2Mb" class="form-control p-3"
								name="m_user_detail_address" value="${user.user_detail_address}">
							<label for="address2Mb" class="sr-only">상세주소</label>
						</div>
					</div>
					<div class="form-floating mb-3">
						<div class="form-group">
							<div class="select_img img">
								<img src="">
							</div>
							<input class="form-control" type="file" id="userImgMb"
								name="m_user_img">
						</div>
					</div>
				</div>
				<!-- Mobile ver END-->
		
				<div class="text-center">
					<button type="submit" class="btn-save btn btn-lg btn-green"
						id="saveBtn">저장</button>
					<a class="btn-cancel btn btn-lg btn-light" id="cancelBtn"
						href="/uglys">취소</a>
				</div>
			</form>
		</div>
		<jsp:include page="module/footer.jsp" />
	</div>
	
	<script>
		function submitAction(event) {
			if (window.matchMedia('(min-width: 768px)').matches) {
				// pc 
				var userId = document.getElementById('user_id');
				var userPassword = document.getElementById('user_password');
				var userEmail = document.getElementById('user_email');
				var userName = document.getElementById('user_name');
				var userBirth = document.getElementById('user_birth');
				var userPhone = document.getElementById('user_phone');
				var userBAddress = document
						.getElementById('user_basic_address');
				var userDAddress = document
						.getElementById('user_detail_address');

				if (userId != null) {
					alert('아이디를입력하세요');
					userId.focus();
					return false;
				}
			} else {
				// mobile

			}
		}
	</script>
	
	<script src="/uglys/resources/js/myPage.js"></script>
</body>

</html>