var doc = document;
var signUp = doc.getElementById('btnSignUp');

var func = function() {
    var userType = doc.getElementById('user').value;
    var id = doc.getElementById('id').value;
    var password = doc.getElementById('password').value;
    var email = doc.getElementById('email').value;
    var name = doc.getElementById('name').value;
    var birthday = doc.getElementById('birthday').value;
    var phone = doc.getElementById('phoneNum').value;
    var address = doc.getElementById('address').value;
    var address2 = doc.getElementById('address2').value;

    if(!id) {
        alert('아이디를 입력하세요.');
        doc.getElementById('id').focus();
        return;
    }
    if(!password) {
        alert('비밀번호를 입력하세요.');
        doc.getElementById('password').focus();
    }

    alert('회원가입이 완료되었습니다.');
}

signUp.addEventListener('click', func);