<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reviewInsert.css">
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<!-- fontawesome -->
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" crossorigin="anonymous" />
<title>UGLYS</title>
</head>
<body>
		<!-- HEADER -->
		<jsp:include page="module/header.jsp" />
    <div class="wrapper">
        <h2 class="sr-only">사용후기 작성</h2>
        <div class="inner">
            <h3>사용후기 작성</h3>
            <form action="insertReview.do?files=multipart" method="post" enctype="multipart/form-data">
                <!-- PC ver START -->
                <table class="pc">
                    <tr>
                        <th>이름</th>
                        <td class="input-group-sm"> 
                            <input type="text" id="name" name="writer" class="form-control" value="${user.user_id}" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td class="input-group-sm">
                            <input type="text" id="title" name="title" class="form-control">
                        </td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td class="input-group-sm">
                            <%-- <input type="text" id="content" class="form-control" style="width:100%;height:200px;font-size:30px;"> --%>
                            <textarea id="content" name="content" style="width:100%;height:200px;font-size:30px"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>후기 사진</th>
                        <td>
							<div class="form-group">
							<label class="control-label col-md-2"><b></b></label>
		                    <div class="select_img img" ><img src=""></div>
		                        <input class="form-control" type="file" id="user_img" name="file">
		                    <div class="col-md-6">
		                        <input type="hidden" id="userImage" name="userImage" required="required">
		                    </div>
               				</div>
        					<script>
								  $("#user_img").change(function(){
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
                    <caption><b></b></caption>
                </table>
                <!-- PC ver START -->

                <!-- Mobile ver START-->
                <div class="mb">
                    <div class="form-floating mb-3">
                        <input type="text" id="name" name="m_writer" class="form-control" placeholder="작성자" value="${user.user_id}" readonly="readonly">
                        <label for="name">작성자</label>
                    </div>
                 
                    <div class="form-floating mb-3">
                        <input type="text" id="title" name="m_title" class="form-control" placeholder="제목">
                        <label for="title">제목</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" id="content" name="m_content" class="form-control" placeholder="내용">
                        <label for="content">내용</label>
                    </div>
                    <div class="mb-3">
                        	후기 사진<br>
                        <div class="input-group mb-2">
                            <input type="file" name="file" class="form-control" value="검색">
                        </div>
                    </div>
                </div>
                <!-- Mobile ver END-->

                <div class="text-center">
                    <button type="submit" class="btn-join btn btn-lg btn-secondary" value="등록">등록</button>
                    <button type="submit" class="btn-join btn btn-lg btn-secondary">
                    <a href="getReviewList.do" style="color:white">닫기</a></button>
               </div>
            </form>
        </div>
    </div>
	<!-- FOOTER -->
    <jsp:include page="module/footer.jsp" />
</body>
</html>
