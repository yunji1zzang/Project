//  // 특수문자 정규식 변수(공백 미포함)
//  var replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>0-9\/.\`:\"\\,\[\]?|{}]/gi;
 
//  // 완성형 아닌 한글 정규식
//  var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;
 
//  //입력제한 테스트중
//  $(document).ready(function(){
     
//      $("#name").on("focusout", function() {
//          var x = $(this).val();
//          if (x.length > 0) {
//              if (x.match(replaceChar) || x.match(replaceNotFullKorean)) {
//                  x = x.replace(replaceChar, "").replace(replaceNotFullKorean, "");
//              }
//              $(this).val(x);
//          }
//          }).on("keyup", function() {
//              $(this).val($(this).val().replace(replaceChar, ""));

//     });

//     $('#leaveBtn').click(function () {
        
//         // alert("탈퇴 되셨습니다.");

//     });
// });  


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
        //id 입력제한 특수문자
        var replaceId  = /[<>()]/gi;
    
        $(document).ready(function(){
            
            // $("#id").on("focusout", function() {
            //     var x = $(this).val();
            //     if (x.length > 0) {
            //         if (x.match(replaceId)) {
            //            x = x.replace(replaceId, "");
            //         }
            //         $(this).val(x);
            //     }
            // }).on("keyup", function() {
            //     $(this).val($(this).val().replace(replaceId, ""));
    
            // });

            // $("#idMb").on("focusout", function() {
            //     var x = $(this).val();
            //     if (x.length > 0) {
            //         if (x.match(replaceId)) {
            //            x = x.replace(replaceId, "");
            //         }
            //         $(this).val(x);
            //     }
            // }).on("keyup", function() {
            //     $(this).val($(this).val().replace(replaceId, ""));
            // });

             // 특수문자 정규식 변수(공백 미포함)
              var replaceChar = /[~!@\#$%^&*\()\-=+'\;<>\/.\`:\"\\,\[\]?|{}]/gi;
             //메일위해 .과 @를 제외한 특수문자
              var emailChar = /[~!\#$%^&*\()\-=+'\;<>\/\`:\"\\,\[\]?|{}]/gi;
            // 완성형 아닌 한글 정규식
             var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;
            //한글
             var replaceKorean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/gi;
             //숫자
             var numTest = /[^0-9]/gi;
        


           //이메일 입력제한
           $("#emailMb").on("focusout", function() {
            var x = $(this).val();
            if (x.length > 0) {
                if (x.match(emailChar) || x.match(replaceNotFullKorean)||x.match(replaceKorean)) {
                    alert("메일을 확인해 주세요")
                    $(this).val("");
                }else{
                    $(this).val(x);
                }
                
            }

       });

           //이메일 입력제한
           $("#emailMb").on("focusout", function() {
            var x = $(this).val();
            if (x.length > 0) {
                if (x.match(emailChar) || x.match(replaceNotFullKorean)||x.match(replaceKorean)) {
                    alert("메일을 확인해 주세요")
                    $(this).val("");
                }else{
                    $(this).val(x);
                }
                
            }

       });

             //이름 입력 제한
        $("#nameMb").on("focusout", function() {
            var x = $(this).val();
            if (x.length > 0) {
                if (x.match(replaceChar) || x.match(replaceNotFullKorean)||x.match(numTest)) {
                    alert("이름을 확인해 주세요")
                    $(this).val("");
                }else{
                    $(this).val(x);
                }
                
            }

       });

            //생년월일 입력제한
            $("#birthdayMb").on("focusout", function() {
                var x = $(this).val();
                if (x.length > 0) {
                    if (!x.match(numTest)) {
                        $(this).val(x);
                    }else if(x.match(numTest)){
                        alert("생년월일 6자리를 입력해주세요.")
                        $(this).val("");
                    }
                }
            });
            //휴대폰 번호 입력제한
            $("#phoneNumMb").on("focusout", function() {
                var x = $(this).val();
                if (!x.length < 10 ){
                // if (x.length > 0) {
                    if (!x.match(numTest)) {
                        $(this).val(x);
                    }else if(x.match(numTest)){
                        alert("핸드폰 번호를 확인해 주세요(-제외)")
                        $(this).val("");
                    }
                }
            });
            
            
    
        });
        
        // 미리보기 이미지
        $("#user_img")
		.change(
				function() {
					if (this.files
							&& this.files[0]) {
						var reader = new FileReader;
						reader.onload = function(
								data) {
							$(".select_img img")
									.attr(
											"src",
											data.target.result)
									.width(100);
						}
						reader
								.readAsDataURL(this.files[0]);
					}
				});
