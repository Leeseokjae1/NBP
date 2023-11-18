<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.study.nbnb.dto.BuserDto" %>
<%@ page import="com.study.nbnb.dto.ChatRoomDto" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
 BuserDto a = (BuserDto)session.getAttribute("login");
 ChatRoomDto crdto = (ChatRoomDto)session.getAttribute("chat");
 
 String nickname = a.getNICKNAME();
 int m_number = a.getM_NUMBER();
 %>
<html>
<head>
   <title>Hello, world!</title>
     <meta charset="UTF-8">
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	

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
      width:1720px;overflow:hidden;height:80px;margin:10px 10px 10px 210px;
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
         <li><a href="/member/b1page?page=1">니빵이</a></li>
         <li><a href="/member/b2page?page=1">내빵이</a></li>
         <li><a href="/rpage">랭킹빵</a></li>
         <li><a href="/member/playpage?page=1">놀이빵</a></li>
         <%if(session.getAttribute("login") == null) {%>
         <li><a href="/loginView">로그인</a></li>
         <%}else { %>
         <li>${login.NICKNAME} 님</li>
         <li><a href="/mypage">MYPAGE</a></li>
         <li><a href="/logout">로그아웃</a></li>
         <%} %>
        <!-- if (session.getAttribute("Admin") != null) { %> --> 
         <li><a href="/adminbd">관리빵 페이지</a></li>
        <!-- <li><a href="/logout">로그아웃</a></li>
         } %>-->
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
		            <a href="/mypage_shop"><i class="bi bi-coin" id="icon" style="color: #e5b06c;"></i></a><br />
		            <span class="icon-name">채팅권</span>
		        </div>    
	         </div>
	         <div class="icons">
	        	<div class="icon-wrapper">
		            <a href="/1/profile"><i class="bi bi-gear" id="icon" style="color: #aaa5a2;"></i></a><br />
		            <span class="icon-name">회원정보수정</span>
		        </div>
	         </div>
        </div>
  	</div>

<div class="container mt-5">
    <!-- Chat Room Creation Form -->
    <div class="row">
        <div class="col-md-4">
            <form id="createRoomForm">
                <div class="form-group">
                    <label for="roomNumber">채팅방 입장:</label>
                    <input type="text" class="form-control" id="roomName" name="roomName" placeholder="Enter Room Number">
                    <input type="hidden" id="userName" name="userName" size="10" value="<%=nickname%>"><br />
                </div>
                <button type="button" class="btn btn-success" id="createRoomBtn">Create Chat Room</button>
            </form>
        </div>
    </div>

<div class="container mt-5">
    <div class="row">
        <!-- Room List (Left Side) -->
        <div class="col-md-4">
            <c:forEach items="${chat}" var="info">
                <div class="chat-container mb-3">
                    <div>
                        <label for="roomName">방 번호: ${info.roomid}</label>
                        <input type="hidden" id="roomName" name="roomName" size="10" value="${info.roomid}"><br />
                        <label for="userName">대화인원: ${info.m_number}, ${info.another}</label>
                        <input type="hidden" id="userName" name="userName" size="10" value="<%=nickname%>"><br />
                        <button id="enterBtn" class="btn btn-primary">Enter Room</button>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- Chat Area (Right Side) -->
        <div class="col-md-8">
            <div id="chatArea" class="border p-3">
                <div id="chatMessageArea"></div>
                <input type="text" id="message" class="form-control mb-2" placeholder="입력하세요...">
                <button id="sendBtn" class="btn btn-secondary">Send</button>
            </div>
        </div>
    </div>
</div>

<script type="module">

  import { initializeApp } from "https://www.gstatic.com/firebasejs/10.6.0/firebase-app.js";
  import { getDatabase, ref, onChildAdded, update, orderByChild , limitToLast, set, child, push } from 'https://www.gstatic.com/firebasejs/10.6.0/firebase-database.js';

  const firebaseConfig = {
    apiKey: "AIzaSyDj-FadmTsfnEWAIU4B2V0rplr4bym5Oec",
    authDomain: "nbproject-3ea90.firebaseapp.com",
    databaseURL: "https://nbproject-3ea90-default-rtdb.asia-southeast1.firebasedatabase.app",
    projectId: "nbproject-3ea90",
    storageBucket: "nbproject-3ea90.appspot.com",
    messagingSenderId: "661952931653",
    appId: "1:661952931653:web:8dd8e21b011050bfb9802c"
  };

    const app = initializeApp(firebaseConfig);
	const database = getDatabase(app);

     var roomName;
     var userName;
      
      var chatMessages = [];
      function connect() {
          roomName = $("#roomName").val();
          userName = $("#userName").val();
		  

       var dbRef = ref(database, 'chat/' + roomName);

      onChildAdded(dbRef, (data) => {
   		 var name = data.val().nickname;
   		 var msg = data.val().chat_message;

   		 console.log("[1]" + name + ":" + msg);
   		 appendMessage(name + ":" + msg);
		});


   }


function writeNewPost(roomName, name, msg) {
    var postData = {
      chat_room: roomName,
        nickname: name,
        chat_message: msg,
      chat_at: new Date().getTime()
    };


    var newPostKey = push(child(ref(database), 'chat/' + roomName)).key;
    var newRef = ref(database, 'chat/' + roomName + '/' + newPostKey);

    set(newRef, postData);
}

function send() {
    var msg = $("#message").val();
    writeNewPost(roomName, userName, msg);
}

function appendMessage(msg) {
    $("#chatMessageArea").append(msg + "<br>");
    var chatAreaHeight = $('#chatArea').height();
    var maxScroll = $('#chatMessageArea').height() - chatAreaHeight;
    $('#chatArea').scrollTop(maxScroll);
}

$(document).ready(function () {
    $('#sendBtn').click(function () { send(); });
    $('#enterBtn').click(function () { 

		$("#chatMessageArea").html("");
		connect(); });

	 $('#createRoomBtn').click(function () { 

		$("#chatMessageArea").html("");
		connect(); });
});




</script>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>