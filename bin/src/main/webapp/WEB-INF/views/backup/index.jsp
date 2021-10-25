<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
 <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>UGLYS</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet"/>
        <!--fontawesome-->
    <script src="https://kit.fontawesome.com/0cf3ae4e8a.js" crossorigin="anonymous"></script>
    </head>
    <body id="page-top">
    <jsp:include page="head.jsp"></jsp:include>
       
         <!-- Header-->
    <header>
        <div class="container" id="header">
            <img src="resources/img/main2-1.jpg" alt="main" class="img-responsive" width="100%">
        </div>
    </header>


    <section class="bg-gradient text-black" id="info1">
        <div class="container px-2 text-center">
            <h1 class="fw-bolder">전체 생산량의 30% 전체 생산액중 5조원</h1>
            <p class="lead">조금 작거나 상처가 있다는 이유로 폐기되는 농산물이 전체생산량의 30%에 이릅니다.</p>
            <p class="lead">못난이들은 중량이나 모양등을 이유로 판매되지 못하는 농산물들의 제가치를 찾아 환경에 기여합니다.</p>
            <a class="btn btn-lg btn-success" href="#info">다음</a>
        </div>
    </section>

    <section>
        <div class="container">
            <div class="row gx-2 justify-content-center" id="infoimg1">
                <img src="resources/img/aa1.jpg" alt="aa1" style="width: 500px;">

            </div>
        </div>
    </section>

    <section>
        <div class="container">
            <div class="row gx-2 justify-content-center" id="infoimg2">
                <img src="resources/img/aa2.jpg" alt="aa1">
            </div>
        </div>
    </section>

    <section>
        <div class="container px-2" id="info">
            <div class="row gx-2 justify-content-center">
                <div class="col-lg-12">
                    <img src="resources/img/info2-1.jpg" alt="info1" style="width: 100%; "class="img-responsive">
                </div>
            </div>
        </div>
    </section>


    <section>
        <div class="container px-2">
            <div class="row gx-2 justify-content-center">
                <div class="col-lg-12">
                    
                    <h2 style="text-align: center;">구독박스 구성 예시</h2>
                    <div class="row justify-content-center">
                        <img src="resources/img/main1.jpg" alt="main1" style="width: 500px">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="row gx-2 gx-lg-3" id="epilogue">
        <div class="col-md-4 mb-5">
            <div class="card h-100">
                <div class="card-body">
                    <h2 class="card-title">테스트아이디1님</h2>
                    <hr>
                    <img src="resources/img/after3.jpg" alt="1" class="img-responsive" style="width: 100%;">
                    <br>
                    <p class="card-text">신선한 야채덕에 주말 저녁 호다닥 야채 볶아서 맥주 한잔 합니다!! 이런게 행복이죠! 청경채,가지,양파 넣어서 볶으니 웬만한 중식 부럽지 않은
                        요리가 되었어요!. 집밥 먹게 해주셔서 감사합니다!</p>
                    <hr>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-5">
            <div class="card h-100">
                <div class="card-body">
                    <h2 class="card-title">테스트아이디2님</h2>
                    <hr>
                    <img src="resources/img/after4.jpg" alt="2" class="img-responsive" style="width: 100%;">
                    <br>
                    <p class="card-text">3인가족에 맞는 소량의 다양한 품목들이 가장 맘에 들며 레시피로 새로운 메뉴를 알려주셔서 좋습니다. 신선하고 유기농이어서 믿고 먹을 수 있어
                        가장 좋습니다.</p>
                    <hr>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-5">
            <div class="card h-100">
                <div class="card-body">
                    <h2 class="card-title">테스트아이디3님</h2>
                    <hr>
                    <img src="resources/img/after5.jpg" alt="3" class="img-responsive" style="width: 100%;">
                    <br>
                    <p class="card-text">제가 여태껏 먹었던 방울토마토 중에 젤루 맛있었구 같이 왔던 야채들도 너무 신선하고 맛있어서 놀랐어요! 모양도 엄청 못생기지도않고 못생기면
                        어때요. 맛있으면 장땡..</p>
                    <hr>
                </div>
                <div class="card-footer"><a class="btn btn-outline-success" href="#">리뷰 전체 보기 →</a></div>
            </div>
        </div>
    </div>



    <section class="bg-white" id="slogan">
        <div class="container px-2">
            <div class="row gx-4 justify-content-center"
                style="background-image: url(resources//img/last12.jpg); background-size:cover; opacity:0.8; ">
                <div class="row-cols-lg-8 text-center" style="color: white; ">
                    <br>
                    <h2><span style="color: #E0E2B0; opacity:1;">UGLYS SAVE THE PLANET</span></h2>
                    <br><br><br>
                    <p class="" style="opacity: 1;font-size: 18px;">농산물의 폐기 문제는 지구 온난화의 원인이 되고 물과 비료, 노동 에너지의 낭비로 이어집니다.
                    </p>
                    <p class="" style="opacity: 1;font-size: 18px;">잘자란 농산물들의 제 가치를 찾아, 음식물 폐기는 줄이고 친환경 땅을 늘림으로써</p>
                    <p class="" style="opacity: 1;font-size: 18px;">소비자의 건강한 식탁과 미래를 위한 환경이 지속가능하게 합니다.</p>
                    <br>

                    <br><br><br>
                </div>
            </div>
        </div>
    </section>


    <section id="contact" class="bg-light" id="contact">
        <div class="container px-2">
            <div class="row gx-4 justify-content-center">
                <div class="col-lg-8 text-center">
                    <img src="resources/img/packege.jpg" alt="pac" class="resources/img-responsive justify-content-center">
                    <a class="btn btn-lg btn-success" href="#">못난이들과 함께 하기</a>
                </div>
            </div>
        </div>
    </section>

   
        
        <jsp:include page="foot.jsp"></jsp:include>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>