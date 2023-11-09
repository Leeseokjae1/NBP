<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
 <%
 String nickname = (String)session.getAttribute("nickname");
 %>
<html>
<head>
   <title>Hello, world!</title>
     <meta charset="UTF-8">
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

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
      width:80%;overflow:hidden;height:80px;margin:10px auto;
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
        #chat {
            width: 500px;
            height: 400px;
            border: 1px solid black;
            overflow: auto;
        }
        #message {
            width: 400px;
        }
</style>  

</head>
<body>
    
   <nav id="nav2">
       <img src= "/img/nblogo.png" style="width:190px; height:80px;float: left; margin-right: 10px;">
<!-- <a href="#" style="float: right; margin-top: 10px;margin-right: 10px;">로그인</a> -->       
       <ul>
         <li><a href="/main">HOME</a></li>
         <li><a href="#">니빵이</a></li>
         <li><a href="#">내빵이</a></li>
         <li><a href="#">랭킹빵</a></li>
         <li><a href="#">놀이빵</a></li>
         <li><a href="#">로그인</a></li>
         <li><a href="/mypage">MYPAGE</a></li>
         <li><a href="#">로그아웃</a></li>
       </ul>
   </nav>
   <div id="topbox" style="background: #ffdcb8; height:250px;">
	   	<div id="probox" style="display: flex; flex-direction: column; align-items: center; text-align: center;">
		  <div class="box" style="background: #fcecde;">
		    <img class="profile" src="/img/yb.png" id="profile">
		  </div>
		   <div class="user-info">
		    <span class="user-nickname" style="font-size: 15px; color: #ffffff;">배고픈빵빵이 페이지</span>
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
		            <a href="/mpchat"><i class="bi bi-wechat" id="icon" style="color: #ffffff;"></i></a><br />
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
  	
<div id="chat"></div>
<input type="text" id="message" placeholder="메시지를 입력하세요...">
<button onclick="sendMessage()">전송</button>

<!-- Firebase JavaScript SDK 불러오기 -->
<script src="https://www.gstatic.com/firebasejs/9.0.0/firebase-app-compat.js"></script>
<script src="https://www.gstatic.com/firebasejs/9.0.0/firebase-database-compat.js"></script>
<script>
    const firebaseConfig = {
        apiKey: "AIzaSyDj-FadmTsfnEWAIU4B2V0rplr4bym5Oec",
        authDomain: "nbproject-3ea90.firebaseapp.com",
        databaseURL: "https://nbproject-3ea90-default-rtdb.asia-southeast1.firebasedatabase.app",
        projectId: "nbproject-3ea90",
        storageBucket: "nbproject-3ea90.appspot.com",
        messagingSenderId: "661952931653",
        appId: "1:661952931653:web:8dd8e21b011050bfb9802c"
    };

    firebase.initializeApp(firebaseConfig);

    var db;
    var chat;
    var message;
    var chatRoomId;

    window.onload = function() {
        db = firebase.database();
        chat = document.getElementById('chat');
        message = document.getElementById('message');
        

        chatRoomId = new Date().getTime().toString();
        var xhr = new XMLHttpRequest();
			xhr.open("POST", "RoomSave", true);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send(chatRoomId);
			
			xhr.onreadystatechange = function () {
			    if (xhr.readyState === 4 && xhr.status === 200) {
			        console.log(xhr.responseText);
			    }
			};

        db.ref('chats/' + chatRoomId).on('value', function(snapshot) {
            var messages = snapshot.val();
            chat.innerHTML = '';

            for (var msg in messages) {
                var chatMessage = messages[msg];
                var p = document.createElement('p');

                p.textContent = chatMessage.userId + ": " + chatMessage.message;
                chat.appendChild(p);
            }

            chat.scrollTop = chat.scrollHeight;
        });
    }

    function sendMessage() {
        var userId = "<% if(session.getAttribute("nickname") != null){ out.print(nickname);} else { %> "Guest <% } %>";

        db.ref('chats/' + chatRoomId).push().set({
            'userId': userId,
            'message': message.value,
            'timestamp': firebase.database.ServerValue.TIMESTAMP
        });

        message.value = '';
    }
</script>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>