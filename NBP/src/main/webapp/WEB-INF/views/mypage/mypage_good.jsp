<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
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

      body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .liked-posts-container {
            width: 1520px;
            margin: 20px auto;
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
            padding: 20px 80px 20px 80px; 
        }

        .liked-post-box {
             width: 260px;
            box-sizing: border-box;
            background-color: #f0f0f0;
            padding: 10px;
            border-radius: 10px;
            overflow: hidden;
            text-align: center;
            margin-bottom: 30px;
        }

        .post-info {
            margin-top: 10px;
        }

        .post-image {
            width: 150px;
            height: 150px;
            object-fit: cover;
            margin-bottom: 10px;
        }

        .board-name {
            font-weight: bold;
            font-size: 14px;
        }

        .post-title {
            font-size: 12px;
        }

        .post-content {
            font-size: 10px;
            color: #555;
        }

        .post-writer {
            font-size: 10px;
            color: #777;
        }
        .post-separator {
          border-top: 1px solid #ccc; /* 선의 스타일 정의 */
          margin: 10px 0; /* 필요에 따라 여백을 조절하세요 */
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
         <% if (session.getAttribute("admin") != null) { %> 
         <li><a href="/admin/adminbd">관리빵 페이지</a></li>
             <%}%>
       </ul>
      
   </nav>
   <div id="topbox" style="background: #ffdcb8; height:250px;">
         <div id="probox" style="display: flex; flex-direction: column; align-items: center; text-align: center;">
        <div class="box" style="background: #fcecde;">
          <img class="profile" src="/img/yb.png" id="profile">
        </div>
         <div class="user-info">
          <span class="user-nickname" style="font-size: 22px; color: #000000;">${login.NICKNAME} 님</span>
        </div>
      </div>
         <div id="iconbox" >
            <div class="icons">
               <div class="icon-wrapper">
                  <a href="/goodpost"><i class="bi bi-suit-heart-fill" id="icon" style="color: #ff5c5c;"></i></a><br />
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
     <div class="liked-posts-container">
      

            <c:forEach items="${getgoodpost}" var="post" varStatus="loop">
                <div class="liked-post-box">
                <img src="${post.image}" alt="Post Image" class="post-image">
                  <div class="post-info">
                    <div class="board-name">${post.boardname}</div>
                    <div class="post-title">${post.title}</div>
                    <div class="post-content">${post.content}</div>
                </div>
               </div>
 
            <c:if test="${not loop.last}">
            <hr class="post-separator">
        </c:if>
    </c:forEach>

    </div>
</script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>