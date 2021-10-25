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
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- import JS -->
<!-- 에러로 주석처리함 -->
<%-- <script src="${pageContext.request.contextPath}/resources/js/form.js"></script> --%>

<title>UGLYS</title>
</head>

<body>
	<div class="wrapper">
		<jsp:include page="module/header.jsp" />



		<h2 class="sr-only">회원가입 페이지</h2>
		<div class="inner">
			<h3>회원가입</h3>
			<form name="fr" action="insertUser" method="post" enctype="multipart/form-data" onsubmit="return check()">
				<!-- PC ver START -->
				<table class="pc">
					<tr>
						<th>타입<b>*</b></th>
						<td>
                            <div class="form-check-inline">
                                <input type="radio" id="user" class="form-check-input"
                                    name="user_admin" value="일반" checked> <label
                                    for="user" class="form-check-label"> 사용자 </label>
                            </div>
                            <div class="form-check-inline">
                                <input type="radio" id="admin" class="form-check-input"
                                    name="user_admin" value="관리자"> <label for="admin"
                                    class="form-check-label"> 관리자 </label>
                            </div>
                        </td>
					</tr>
					<tr>
						<th>아이디<b>*</b></th>
						<td class="input-group-sm"><input type="text" id="id"
							class="form-control" name="user_id">
							<c:if test="${already eq false}">
								<p>중복된 아이디입니다.</p>
							</c:if>
							</td>
					</tr>
					<tr>
						<th>비밀번호<b>*</b></th>
						<td class="input-group-sm"><input type="password"
							id="password" class="form-control" name="user_password">
						</td>
					</tr>
					<tr>
						<th>이메일<b>*</b></th>
						<td class="input-group-sm"><input type="email" id="email"
							name="user_email" class="form-control"
							placeholder="name@example.com"></td>
					</tr>
					<tr>
						<th>이름<b>*</b></th>
						<td class="input-group-sm"><input type="text" id="name"
							class="form-control" name="user_name"></td>
					</tr>
					<tr>
						<th>생년월일<b>*</b></th>
						<td class="input-group-sm"><input type="text" id="birthday"
							class="form-control" placeholder="생년월일6자리" name="user_birth">
						</td>
					</tr>
					<tr>
						<th>휴대폰 번호<b>*</b></th>
						<td class="input-group-sm"><input type="tel" id="phoneNum"
							class="form-control" placeholder="- 를 빼고 입력해주세요"
							name="user_phone"></td>
					</tr>
					<tr>
						<th>주소<b>*</b></th>
						<td>
							<div class="input-group mb-2">
								<input class="form-control" type="text" id="user_Basic_Address"
									name="user_basic_address" readonly />
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
		                    <label class="control-label col-md-2"><b>사진</b></label>
		                    <div class="select_img img" ><img src=""></div>
		                        <input class="form-control" type="file" id="userImg" name="file">
		                    <div class="col-md-6">
		                       <!--  <input type="hidden" id="userImage" name="userImage" required> -->
		                    </div>
               				</div>
        					<script>
								  $("#userImg").change(function(){
								   if(this.files && this.files[0]) {
								    var reader = new FileReader;
								    reader.onload = function(data) {
								     $(".select_img img").attr("src", data.target.result).width(100);        
								    }
								    reader.readAsDataURL(this.files[0]);
								   }
								  });
					 		</script>
                		</td>
					</tr>
					<caption id="test">
						<b>*</b> 표시는 필수 항목 입니다.
					</caption>
				</table>
		
				<!-- PC ver START -->

				<!-- Mobile ver START-->
				   <div class="mb">
				   <div class="mb-3">
				   <div class="form-check-inline">
                                <input type="radio" id="userMb" class="form-check-input"
                                    name="m_user_admin" value="일반" checked> <label
                                    for="user" class="form-check-label"> 사용자 </label>
                    </div>
                    <div class="form-check-inline">
                                <input type="radio" id="adminMb" class="form-check-input"
                                    name="m_user_admin" value="관리자"> <label for="admin"
                                    class="form-check-label"> 관리자 </label>
                            </div>
				   </div>
                    <div class="form-floating mb-3">
                        <input type="text" id="idMb" name="m_user_id" class="form-control" placeholder="아이디">
                        <c:if test="${already eq false}">
							<p>중복된 아이디입니다.</p>
						</c:if>
                        <label for="idMb">아이디</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="password" id="passwordMb" name="m_user_password" class="form-control" placeholder="비밀번호">
                        <label for="passwordMb">비밀번호</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="email" id="emailMb" name="m_user_email" class="form-control" placeholder="이메일">
                        <label for="emailMb">이메일</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" id="nameMb" name="m_user_name" class="form-control" placeholder="이름">
                        <label for="nameMb">이름</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" id="birthdayMb"  name="m_user_birth" class="form-control" placeholder="생년월일">
                        <label for="birthdayMb">생년월일</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" id="phoneNumMb" name="m_user_phone" class="form-control" placeholder="-를 제외하고 입력해주세요">
                        <label for="phoneNumMb" >휴대폰 번호</label>
                    </div>
                    <div class="mb-3">
                        <div class="input-group mb-2">
                            <input type="text" id="user_Basic_Address-mb" name="m_user_basic_address" class="form-control p-3" placeholder="주소"
                                readonly="readonly">
                            <label for="addressMb" class="sr-only">주소</label>
                            <button type="button" class="btn btn-sm btn-dark" data-bs-toggle="modal"
                                data-bs-target="#searchPost" onclick="execDaumPostcode()"><b>검색</b></button>
                        </div>
                        <div class="input-group">
                            <input type="text" id="user_Detail_Address-mb" name="m_user_detail_address" class="form-control p-3" placeholder="상세주소">
                            <label for="address2Mb" class="sr-only">상세주소</label>
                        </div>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="file" id="m_file" name="file" >
                        <label>프로필사진</label>
                    </div>
                </div> 
				<!-- Mobile ver END-->

				<!-- 주소검색 모달 -->
				<div class="modal fade" id="searchPost" tabindex="-1"
					aria-labelledby="searchPostLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="searchPostLabel">주소검색</h5>
								<button type="button" id="modalClose" class="btn-close" data-bs-dismiss="modal"
									aria-label="close"></button>
							</div>
							<div class="form-group" id="wrap"></div>
							<%-- <div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal" >닫기</button>
							</div> --%>
						</div>
					</div>
				</div>
				<!-- 모달 ends -->

				<div class="text-center">
					<button type="submit" class="btn-join btn btn-lg btn-secondary">가입하기</button>
				</div>
			</form>
		</div>
		
		<jsp:include page="module/footer.jsp" />
	</div>

	 <script>
	 function check() {
		  if(fr.id.value == "") {
		    alert("값을 입력해 주세요.");
		    fr.id.focus();
		    return false;
		  }
		  else if(fr.password.value == "") {
		    alert("값을 입력해 주세요.");
		    fr.password.focus();
		    return false;
		  }
		  else if(fr.email.value == "") {
		    alert("값을 입력해 주세요.");
		    fr.email.focus();
		    return false;
		  }
		  else if(fr.name.value == "") {
		    alert("값을 입력해 주세요.");
		    fr.name.focus();
		    return false;
		  }
		  else if(fr.birthday.value == "") {
		    alert("값을 입력해 주세요.");
		    fr.name.focus();
		    return false;
		  }
		  else if(fr.phoneNum.value == "") {
		    alert("값을 입력해 주세요.");
		    fr.name.focus();
		    return false;
		  }
		  else if(fr.address.value == "") {
		    alert("값을 입력해 주세요.");
		    fr.name.focus();
		    return false;
		  }
		  else if(fr.address2.value == "") {
		    alert("값을 입력해 주세요.");
		    fr.name.focus();
		    return false;
		  }
		  else return true;
		}
	 </script> 
	 <script type="text/javascript">
	 
	 
	 

        // 우편번호 찾기 찾기 화면을 넣을 element
        var element_wrap = document.getElementById("wrap");

        function foldDaumPostcode() {
            // iframe을 넣은 element를 안보이게 한다.
            element_wrap.style.display = "none";
        }

        function execDaumPostcode() {
            // 현재 scroll 위치를 저장해놓는다.
            var currentScroll = Math.max(
                document.body.scrollTop,
                document.documentElement.scrollTop
            );
            new daum.Postcode({
                oncomplete: function (data) {
                    // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ""; // 주소 변수
                    var extraAddr = ""; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === "R") {
                        // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else {
                        // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if (data.userSelectedType === "R") {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== "" && data.apartment === "Y") {
                            extraAddr +=
                                extraAddr !== ""
                                    ? ", " + data.buildingName
                                    : data.buildingName;
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== "") {
                            extraAddr = " (" + extraAddr + ")";
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("user_Detail_Address").value =
                            extraAddr;
                    } else {
                        document.getElementById("user_Basic_Address").value = "";
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById("user_Basic_Address").value =
                        data.zonecode + " " + addr;
                    document.getElementById("user_Basic_Address-mb").value =
                        data.zonecode + " " + addr;
                    // 커서를 상세주소 필드로 이동한다.

                    document.getElementById("user_Detail_Address").focus();
                    // iframe을 넣은 element를 안보이게 한다.
                    // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                    element_wrap.style.display = "none";

                    // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                    document.body.scrollTop = currentScroll;
                    document.getElementById("modalClose").click();
                },
                // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
                onresize: function (size) {
                    element_wrap.style.height = size.height + "px";
                },
                width: "100%",
                height: "100%",
            }).embed(element_wrap);

            // iframe을 넣은 element를 보이게 한다.
            element_wrap.style.display = "block";
        }
    </script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
		crossorigin="anonymous"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<!-- 에러로 주석처리 -->
	 <script src="${pageContext.request.contextPath}/resources/js/myPage.js"></script>
</body>

</html>