<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script src="http://code.jquery.com/jquery.js"></script>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"crossorigin="anonymous">
<script src="https://accounts.google.com/gsi/client" async defer></script>

<script>

function email_check() {
	document.getElementById("check_id").value = "재전송";
	alert('인증번호가 발송되었습니다');
	form_submit();
}

function form_submit() {
	var email = document.getElementById("EMAIL_check").value;
	var a = "";
	document.getElementById("EMAIL").value = email;
	$.ajax({
	    type: "POST",
	    contentType: "application/json",
	    url: "/api/emailCheck",
	    data: JSON.stringify({"mail": email}), // 보낼 데이터
	    dataType: 'json',
	    success: function (response) {
	        console.log("Success:", response);
	        a = response.authCode;
	    },
	    error: function (error) {
	        console.error("Error:", error);
	    }
	});
}

function check2() {
	check = document.getElementById("e_check").value;
	if(a == check){
		
		
		alert('인증되었습니다');
		
	}else{
		alert('인증번호가 잘못 입력되었습니다. 다시 입력해주세요');
	}
}

</script>

<style>
body {
    background: #222D32;
    font-family: 'Roboto', sans-serif;
}

.login-box {
    margin-top: 75px;
    height: auto;
    background: #1A2226;
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
    color: #ECF0F5;
}

.login-form {
    margin-top: 25px;
    text-align: left;
}

input[type=text] {
    background-color: #1A2226;
    border: none;
    border-bottom: 2px solid #0DB8DE;
    border-top: 0px;
    border-radius: 0px;
    font-weight: bold;
    outline: 0;
    margin-bottom: 20px;
    padding-left: 0px;
    color: #ECF0F5;
}

input[type=password] {
    background-color: #1A2226;
    border: none;
    border-bottom: 2px solid #0DB8DE;
    border-top: 0px;
    border-radius: 0px;
    font-weight: bold;
    outline: 0;
    padding-left: 0px;
    margin-bottom: 20px;
    color: #ECF0F5;
}

.form-group {
    margin-bottom: 40px;
    outline: 0px;
}

.form-control:focus {
    border-color: inherit;
    -webkit-box-shadow: none;
    box-shadow: none;
    border-bottom: 2px solid #0DB8DE;
    outline: 0;
    background-color: #1A2226;
    color: #ECF0F5;
}

input:focus {
    outline: none;
    box-shadow: 0 0 0;
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
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-2"></div>
			<div class="col-lg-6 col-md-8 login-box">
				<div class="col-lg-12 login-title">ID/PW Search</div>
				<div class="col-lg-12 login-form">
					<div class="col-lg-12 login-form">
						<form id="login_form" name="login_form" action="${loginUrl}" method="post">
							<div class="form-group">
								<label class="form-control-label">이메일</label>
								<input type="text" id="EMAIL" name="EMAIL" class="form-control">
								<input type="button" id="check_id" name="check_id" value="전송" onclick="email_check()"> 
							</div>
							
							<div class="form-group">
                                <label class="form-control-label">인증번호</label>
                                <input type="text" style="background-color: #1A2226;" id="e_check" name="e_check" class="form-control">
                                <input type="button" id="e_check2" name="e_check2" value="확인" onclick="check2()">
                            </div>
                            
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>