<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>UGLYS</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
    <script src="js/jquery-1.12.3.js"></script>
    <!--fontawesome-->
    <script src="https://kit.fontawesome.com/0cf3ae4e8a.js" crossorigin="anonymous"></script>
  
</head>

<body id="page-top">

    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top" id="mainNav">
        <div class="container px-2">
            <a class="navbar-brand" href="#page-top" style="color: #80A45F; font-size: 25px;">못난이들</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span
                    class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="#contact" style="color: #80A45F;">구독 하기</a></li>
                    <li class="nav-item"><a class="nav-link" href="#" style="color: #80A45F;">구매 후기</a></li>
                    <li class="nav-item"><a class="nav-link" href="#" style="color: #80A45F;">마이페이지</a></li>
                    <li class="nav-item"><a class="btn btn-outline-success" href="#">로그인/회원가입</a></li>
                </ul>
            </div>
        </div>

    </nav>

    <main class="form-signin text-center">
        <form class="">
            <img class="mb-4" src="/docs/5.0/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
            <h1 class="h3 mb-3 fw-normal">회원 로그인</h1>

            <div class="form-floating">
                <input type="text" class="form-control" id="idInput" placeholder="아이디 입력">
                <label for="floatingInput">ID</label>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" id="password" placeholder="비밀번호 입력">
                <label for="floatingPassword">Password</label>
            </div>

            <div class="checkbox mb-3">
            </div>
            <br>
            <button class="w-50 btn btn-lg btn-outline-success" type="submit">로그인</button>
            <br><br>
            <button class="w-50 btn btn-lg btn-outline-dark" type="submit">회원 가입</button>
            <br><br><br>
            <div id="sns_login" class="container">
                <br>
                <div class="sns-wrap justify-content-center">
                    <div class="p-1 m-1" style="background-color: #03c75a; width: 30%;">
                        <a href="https://nid.naver.com/nidlogin.login?mode=form&url=https%3A%2F%2Fwww.naver.com"
                            class="social_link " title="네이버" style="text-decoration: none;">
                            <img src="img/sns_naver_s.png" alt="">
                            <span class="text-white">네이버 로그인</span>
                        </a>
                    </div>
                    <div class="p-1 m-1" style="background-color: #ffeb00; width: 30%;">
                        <a href="http://g5shop.returnway.com/plugin/social/popup.php?provider=kakao&amp;url=%2Fbbs%2Flogin.php%3Fversion%3Dbasic-signin-alt"
                            class="social_link" title="카카오" style="text-decoration: none;">
                            <img src="img/sns_kakao_s.png" alt="">
                            <span class="text-black">카카오 로그인</span>
                        </a>
                    </div>

                    <script>
                        jQuery(document).ready(function () {
                            $(".sns-wrap").on("click", "a.social_link", function (e) {
                                e.preventDefault();

                                var pop_url = $(this).attr("href");
                                var newWin = window.open(
                                    pop_url,
                                    "social_sing_on",
                                    "location=0,status=0,scrollbars=1,width=600,height=500"
                                );

                                if (!newWin || newWin.closed || typeof newWin.closed == 'undefined')
                                    alert('브라우저에서 팝업이 차단되어 있습니다. 팝업 활성화 후 다시 시도해 주세요.');

                                return false;
                            });
                        });
                    </script>

                </div>

        </form>
    </main>

    <footer class="py-5 bg-dark">
        <div class="container px-4">
            <div class="text-white" style="font-size: 20px; text-align: center; letter-spacing: 10px;">
                <i class="fab fa-instagram"></i>
                <i class="fas fa-headset"></i>
                <i class="far fa-envelope"></i>
                <i class="fas fa-phone"></i>
            </div>
            <br>
            <p class="text-center text-white">상호: (주)못난이들 | 대표: 김준기 | 개인정보관리책임자: 김담인 | 전화: 000-1111-1111 | 이메일:
                testmail@gmail.com</p>
            <p class="text-center text-white">주소: 서울특별시 금천구 가산동 426-5 310호 | 사업자등록번호: 123-45-67890 |</p>

            <div id="footerMenuNavi" class="text-center">
                <a class="menu-name" href="/policy">이용약관</a>
                <a class="menu-name" href="/privacy">개인정보처리방침</a>
                <a class="menu-name" href="/company">사업자정보확인</a>
            </div>

            <p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p>

        </div>
    </footer>

    <!-- Bootstrap core JS-->
    <!-- Core theme JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/scripts.js"></script>

</body>

</html>