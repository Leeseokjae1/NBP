<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>이메일 인증</title>
    <script src="http://code.jquery.com/jquery.js"></script>
	<script>
		function check() {
			form_submit();
		}
		function form_submit() {
			var email = document.getElementById("email").value;
			console.log("email:", email);
			$.ajax({
			    type: "POST",
			    contentType: "application/json",
			    url: "/api/emailCheck",
			    data: JSON.stringify({"mail": email}), // 보낼 데이터
			    dataType: 'json',
			    success: function (response) {
			        console.log("Success:", response);
			        document.getElementById("text").value = response.authCode;
			    },
			    error: function (error) {
			        console.error("Error:", error);
			    }
			});
		}
	</script>

</head>
<body>
    <form action="emailCheck">
        이메일 주소: <input type="text" id="email" name="email"><br>
        <input type="button" value="입력" onclick="check()">
        <input type="text" id="text" name="text">
        
    </form>

    
</body>
</html>