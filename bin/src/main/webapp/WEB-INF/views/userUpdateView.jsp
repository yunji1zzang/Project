<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<!-- 공통부분 제거 필요 -->
<!-- css, js 분리 -->
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>수정</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!-- 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <!-- 제이쿼리 ui -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <style>
        #wrap {
            display: none;
            border:1px solid;
            width:500px;
            height:300px;
            float: none;
            left: 4%;
        }
    </style>
    <script>
        document.cookie = "crossCookie=bar; SameSite=None; Secure";

        // 데이트피커
        $(function () {
            //모든 datepicker에 대한 공통 옵션 설정
            $("#user_Birth").datepicker({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                , showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                , showMonthAfterYear: true //년도 먼저 나오고, 뒤에 월 표시
                , changeYear: true //콤보박스에서 년 선택 가능
                , changeMonth: true //콤보박스에서 월 선택 가능                
                , showOn: "focus" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                , buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                , buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                , buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                , yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                , monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'] //달력의 월 부분 텍스트
                , monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip 텍스트
                , dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] //달력의 요일 부분 텍스트
                , dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'] //달력의 요일 부분 Tooltip 텍스트
                , minDate: "-100Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                , maxDate: "-18Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
            });

            //From의 초기값을 오늘 날짜로 설정
            $('#user_Birth').datepicker('setDate', '-30Y'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
            });
    </script>
</head>

	<body>
		<section id="container">
			<form action="user/userUpdate" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="user_id">아이디</label>
					<input class="form-control" type="text" id="user_id" name="user_id" value="${user.user_id}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="user_email">이메일</label>
					<input class="form-control" type="email" id="user_email" name="user_email" value="${user.user_email}"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="user_name">성명</label>
					<input class="form-control" type="text" id="user_name" name="user_name" value="${user.user_name}"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="user_birth">생년월일</label>
					<input class="form-control" type="text" id="user_birth" name="user_birth" value="${user.user_birth}"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="user_phone">번호</label>
					<input class="form-control" type="text" id="user_phone" name="user_phone" value="${user.user_phone}"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="user_basic_address">주소</label>
					<input class="form-control" type="text" id="user_basic_address" name="user_basic_address" value="${user.user_basic_address}"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="user_detail_address">주소</label>
					<input class="form-control" type="text" id="user_detail_address" name="user_detail_address" value="${user.user_detail_address}"/>
				</div>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</section>
		
	</body>
	
</html>