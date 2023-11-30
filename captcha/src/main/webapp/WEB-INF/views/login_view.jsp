<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://www.google.com/recaptcha/api.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" >
<script src="https://accounts.google.com/gsi/client"></script>

<script>

function recaptchaCallback() {
    document.getElementById("capok").disabled = false;
}
	function form_check() {
		if ($('#id').val().length == 0) {
			alert("아이디를 작성하세요");
			$('#id').focus();
			return;
		}

		if ($('#password').val().length == 0) {
			alert("비밀번호를 작성하세요");
			$('#password').focus();
			return;
		}

		var form = document.login_form;
	    form.submit();
	}
	
   
	
</script>

<style>
body {
     background-image:url('/image/lb.png');
     background-size: cover;
     font-family: 'Roboto', sans-serif;
}

.login-box {
    margin-top: 60px;
    height: auto;
    background: #ededed;
    text-align: center;
    box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
}

.login-key {
    height: 100px;
    font-size: 80px;
    line-height: 100px;
    background: -webkit-linear-gradient(#27EF9F, #0DB8DE);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

.login-title {
    margin-top: 15px;
    text-align: center;
    font-size: 30px;
    letter-spacing: 2px;
    margin-top: 15px;
    font-weight: bold;
    color: #000000;
}

.login-form {
    margin-top: 25px;
    text-align: left;
}

input[type=text] {
    background-color: #dbdbdb;
    border: none;
    border-bottom: 2px solid #7c7c7c;
    border-top: 0px;
    border-radius: 0px;
    font-weight: bold;
    outline: 0;
    margin-bottom: 20px;
    padding-left: 0px;
    color: #000000;
}

input[type=password] {
    background-color: #dbdbdb;
    border: none;
    border-bottom: 2px solid #7c7c7c;
    border-top: 0px;
    border-radius: 0px;
    font-weight: bold;
    outline: 0;
    padding-left: 0px;
    margin-bottom: 20px;
    color: #000000;
}

.form-group {
    margin-bottom: 40px;
    outline: 0px;
}



label {
    margin-bottom: 0px;
}

.form-control-label {
    font-size: 10px;
    color: #6C6C6C;
    font-weight: bold;
    letter-spacing: 1px;
}

.btn-outline-primary {
    border-color: #0DB8DE;
    color: #0DB8DE;
    border-radius: 0px;
    font-weight: bold;
    letter-spacing: 1px;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
}

.btn-outline-primary:hover {
    background-color: #0DB8DE;
    right: 0px;
}

.login-btm {
    float: left;
}

.login-button {
    padding-right: 0px;
    text-align: right;
    margin-bottom: 25px;
}

.login-text {
    text-align: left;
    padding-left: 0px;
    color: #A2A4A4;
}

.loginbttm {
    padding: 0px;
}
.yws {
    padding: 10px;
    font-size:15px;
    font-weight:5px bold;
    color:#000000;
}
</style>
</head>


<body>

<div>
	<input type = "text" id="loginId" name="memberId" placeholder="a@b.c" style="width:250px; height:30px;">
</div>
<div>
	<input type = "password" id="loginPw" name="memberPw" placeholder="비밀번호" style="width:250px; height:30px;">
</div>

<!-- reCAPTCHA 등록 -->
<div id="g-recaptcha"></div>
<br>

<div>
	<input type="button" class="disabled-btn" id="loginBtn" value="로그인" disabled>
</div>

</body>
</html>