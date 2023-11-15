<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.study.nbnb.dto.BuserDto"%>
<%
BuserDto login = (BuserDto)session.getAttribute("login");
int M_NUMBER = login.getM_NUMBER();
String password = login.getPASSWORD();
%>

<html>
<head>
   <title>Hello, world!</title>
     <meta charset="UTF-8">
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0b38572f5de0a09cbaa96703ebb627d1&libraries=services"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
	<script>
	
	$(function selectedControl(){
		const el = document.getElementById('phone1');
		const len = el.options.length;
		const str = ${fn:substring(user.PHONENUMBER, 1, 3)};
		for (let i=0; i<len; i++){  
			if(el.options[i].value == str){
				el.options[i].selected = true;
			}
		}  
	})
	
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = data.address;
				document.getElementById("ADDRESS").value = addr;
			}
		}).open();
	}
	
	function form_check() {
		
		if ($('#ID').val().length == 0) {
			alert("아이디는 5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
			$('#ID').focus();
			return;
		}
		if ($('#ID').val().length < 4) {
			alert("아이디는 5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
			$('#ID').focus();
			return;
		}
		if ($('#ID').val().length > 20) {
			alert("아이디는 5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
			$('#ID').focus();
			return;
		}
		if ($('#PASSWORD').val().length == 0) {
			alert("비밀번호는 8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요");
			$('#PASSWORD').focus();
			return;
		}
		if ($('#PASSWORD').val().length < 8) {
			alert("비밀번호는 8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요");
			$('#PASSWORD').focus();
			return;
		}
		if ($('#PASSWORD').val() != $('#pw_check').val()) {
			alert("비밀번호는 비밀번호가 일치하지 않습니다.");
			$('#PASSWORD').focus();
			return;
		}
		if ($('#NAME').val().length == 0) {
			alert("이름은 필수사항입니다.");
			$('#NAME').focus();
			return;
		}
		if ($('#EMAIL').val().length == 0) {
			alert("이메일은 필수사항입니다.");
			$('#EMAIL').focus();
			return;
		}
		if ($('#NICKNAME').val().length == 0) {
			alert("닉네임은 필수사항입니다.");
			$('#NICKNAME').focus();
			return;
		}
		if ($('#NICKNAME').val().length < 2) {
			alert("닉네임은 2글자 이상이어야 합니다.");
			$('#NICKNAME').focus();
			return;
		}
		if ($('#phone2').val().length == 0) {
			alert("전화번호는 필수사항입니다.");
			$('#phone2').focus();
			return;
		}
		if ($('#phone3').val().length == 0) {
			alert("전화번호는 필수사항입니다.");
			$('#phone3').focus();
			return;
		}
		
		var form = document.modify;
	    form.submit();
	    
	}
	
	</script>
	<style>
   .test1 {
   
    }
    .carousel-inner > .carousel-item > img {
      /* width: 640px;
      height: 720px; */
    }
    * {
       padding:0;
       margin:0;
    }
   ul,ol {
      list-style:none
   }
   a {
      text-decoration:none;color:#000;font-size:15px;
   }
 nav {
	 width:1520px;overflow:hidden;height:80px;margin:10px 10px 10px 210px;
 }
   div img.absolute { 
        position: absolute;
        left: 50px;
        top: 500px;
      }
   #nav2>a {
      display: block; 
      float: left;
      font-size: 20px;
      font-weight: 900;
      line-height: 80px;
      padding: 0 30px;
   }
   #nav2>ul {
      float: right;
   }
   #nav2>ul li {
      float: left;
      padding: 0 30px;
      line-height: 80px;
   }
   #nav2>img .absolute { 
      position: absolute;
      left: 50px;
    }
    #topbox{
    	padding: 40px 300px 40px 300px;
    	display: flex;
  		align-items: center;
    }
    #iconbox{
    	padding: 0px 0px 0px 100px;
    	height: 150px;
    	display: flex;
  		justify-content: space-between;
    }
    
    #icon{
    	margin: 20px 50px 20px 50px;
    	font-size:  110px;
    }
    .icons{
    	margin: 0px 50px 0px 50px;
    	width:120px; height:125px;
    	float: left;
    	text-align:center;
    	flex-direction: column;
 		align-items: center;
    }
	  .icon-wrapper {
	  display: flex;
	  flex-direction: column;
	  align-items: center;
	}
    .box {
	    width: 150px;
	    height: 150px; 
	    border-radius: 30%;
	    overflow: hidden;
	}
	.profile {
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	}
	.user-nickname {
    font-size: 15px; 
    color: #ffffff; 
    text-align: left;

	}
	#probox {
  display: flex;
  flex-direction: column; 
  align-items: center;
  text-align: center; 
}
.user-info {
  display: flex;
  flex-direction: column;
  justify-content: center;
}

</style>  

</head>
<body>

   <nav id="nav2">
       <img src= "/img/nblogo.png" style="width:190px; height:80px;float: left; margin-right: 10px;">
<!-- <a href="#" style="float: right; margin-top: 10px;margin-right: 10px;">로그인</a> -->       
       <ul>
         <li><a href="/main">HOME</a></li>
         <li><a href="/b1page?page=1">니빵이</a></li>
         <li><a href="/b2page?page=1">내빵이</a></li>
         <li><a href="/adminbd">랭킹빵</a></li>
         <li><a href="/playpage?page=1">놀이빵</a></li>
         <%if(session.getAttribute("login") == null) {%>
         <li><a href="/loginView">로그인</a></li>
         <%}else { %>
         <li>${login.NICKNAME} 님</li>
         <li><a href="/mypage">MYPAGE</a></li>
         <li><a href="/logout">로그아웃</a></li>
         <%} %>
         <% if (session.getAttribute("Admin") != null) { %>
         <li><a href="#">관리빵 페이지</a></li>
         <% } %>
       </ul>
   </nav>
   <div id="topbox" style="background: #ffdcb8; height:250px;">
	   	<div id="probox" style="display: flex; flex-direction: column; align-items: center; text-align: center;">
		  <div class="box" style="background: #fcecde;">
		    <img class="profile" src="/img/yb.png" id="profile">
		  </div>
		   <div class="user-info">
		    <span class="user-nickname" style="font-size: 15px; color: #fff;">배고픈빵빵이 페이지</span>
		  </div>
		</div>
   		<div id="iconbox" >
	         <div class="icons">
	         	<div class="icon-wrapper">
		            <a href="#"><i class="bi bi-suit-heart-fill" id="icon" style="color: #ff5c5c;"></i></a><br />
		            <span class="icon-name">좋아요 게시글</span>
		        </div>
	         </div>
	         <div class="icons">
	       		<div class="icon-wrapper">
		            <a href="#"><i class="bi bi-wechat" id="icon" style="color: #fff;"></i></a><br />
		            <span class="icon-name">1:1대화</span>
		        </div>
	         </div>
	         <div class="icons">
	         	<div class="icon-wrapper">
		            <a href="#"><i class="bi bi-coin" id="icon" style="color: #e5b06c;"></i></a><br />
		            <span class="icon-name">채팅권</span>
		        </div>    
	         </div>
	         <div class="icons">
	        	<div class="icon-wrapper">
		            <a href="#"><i class="bi bi-gear" id="icon" style="color: #aaa5a2;"></i></a><br />
		            <span class="icon-name">회원정보수정</span>
		        </div>
	         </div>
        </div>
  	</div>
  	<div class="container">
  		<div class="row">
	  		<form id="modify" name="modify" action="/1/profile/modify" method="post">
	  			<input type="hidden" id="m_number" name="m_number" value="<%= M_NUMBER %>">
	  			<input type="hidden" id="pw2" name="pw2" value="<%= password %>">
				<div class="form-group">
					<label class="form-control-label">아이디</label>
					<input type="text" id="ID" name="ID" class="form-control" value="${user.ID}">
				</div>
				<div class="form-group">
					<label class="form-control-label">비밀번호</label>
					<input type="password" id="PASSWORD" name="PASSWORD" class="form-control" value="${user.PASSWORD}">
				</div>
				<div class="form-group">
					<label class="form-control-label">비밀번호 확인</label>
					<input type="password" id ="pw_check" name="pw_check" class="form-control" value="${user.PASSWORD}">
				</div>
	            <div class="form-group">
	                <label class="form-control-label">이름</label>
	                <input type="text" id="NAME" name="NAME" size="20" class="form-control" value="${user.NAME}">
	            </div>
	            <div class="form-group">
	                <label class="form-control-label">닉네임</label>
	                <input type="text" id="NICKNAME" name="NICKNAME" size="20" class="form-control" value="${user.NICKNAME}">
	            </div>
								
	            <div class="form-group">
	                <select id="phone1" name="phone1" class="form-control" style="width:20%; display: inline-block; padding: 0px 10px;">
	                    <option value="010">010</option>
	                    <option value="016">016</option>
	                    <option value="017">017</option>
	                    <option value="018">018</option>
	                    <option value="019">019</option>
	                    <option value="011">011</option>
                    </select>
                    -
                    <input type="text" style="width:35%; display: inline-block;" class="form-control" id="phone2" name="phone2" size="5" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="${fn:substring(user.PHONENUMBER, 4, 8)}">
                    - 
                    <input type="text" style="width:35%; display: inline-block;" class="form-control" id="phone3" name="phone3" size="5" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="${fn:substring(user.PHONENUMBER, 9, 13)}">
	            </div>
	            <div class="form-group">
	                <label class="form-control-label">이메일</label>
	                <input type="text" id="EMAIL" name="EMAIL" class="form-control" value="${user.EMAIL}">
	            </div>
	            <div class="form-group">
	                <label class="form-control-label">주소</label>
	                <input type="text" class="form-control" id="ADDRESS" name="ADDRESS" size="50" value="${user.ADDRESS}"> 
	                <input type="button" class="btn btn-outline-primary" onclick="execDaumPostcode()" value="주소 검색">
	            </div>
	                   
                <div class="col-lg-12 loginbttm">
					<div class="col-lg-6 login-btm login-text">
						
					</div>
					<div class="col-lg-6 login-btm login-button">
						<input type="button" class="btn btn-outline-primary" value="수정" id="modify" onclick="form_check()">
					</div>
				</div>      
			</form>
 		</div>
  	</div>
</script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>