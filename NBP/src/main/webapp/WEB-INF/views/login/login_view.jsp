<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script src="http://code.jquery.com/jquery.js"></script>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" >
<script src="https://accounts.google.com/gsi/client" async defer></script>

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
.yws {
    padding: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-2"></div>
			<div class="col-lg-6 col-md-8 login-box">
				<div class="col-lg-12 login-title">Login</div>

				<div class="col-lg-12 login-form">
					<div class="col-lg-12 login-form">
						<c:url value="j_spring_security_check" var="loginUrl"/>
						<form id="login_form" name="login_form" action="${loginUrl}" method="post">
							<div class="form-group">
								<c:if test="${param.error!=null}">
									<p style="color:#FFF">
										Login Error! <br/>
										${error_message}
									</p>
								</c:if>
							</div>
							<div class="form-group">
								<label class="form-control-label">ID</label> 
								<input type="text" class="form-control" id="id" name="id" value="${username}">
							</div>
							<div class="form-group">
								<label class="form-control-label">PASSWORD</label> 
								<input type="password" class="form-control" id="password" name="password">
							</div>
							<div class="col-lg-12" style="margin-bottom:40px;">
							<div class="g-recaptcha" id="gcap" data-sitekey="6LeXk5gnAAAAAJeHIAAbgifA4BtinsAOpitvUKra" data-callback="recaptchaCallback"></div>
							</div>
							<div class="col-lg-12 loginbutton">
								<div class="col-lg-6 login-btm login-text">
									<a href="/oauth2/authorization/google">Google Login</a>
								</div>
								<div class="col-lg-6 login-btm login-button">
									<input type="button" class="btn btn-outline-primary" value="로그인" id="capok" onclick="form_check()" />
								</div>
							</div>
						</form>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-2"></div>
			</div>
		</div>
	</div>
	<div class="col-lg-12" style="text-align: center; margin: 10px auto">
		<a href="../joinView"><label class="form-control-label yws" >회원가입</label></a> &nbsp;
		<a href="../search_id"><label class="form-control-label yws">아이디 찾기</label></a> &nbsp;
		<a href="../search_pw"><label class="form-control-label yws">패스워드 찾기</label></a>
	</div>
</body>
</html>