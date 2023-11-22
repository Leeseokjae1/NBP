<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<% 
   session.removeAttribute("Searchdata");
   session.removeAttribute("Searchfield");
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
   <script src="http://code.jquery.com/jquery.js"></script>
   <script>
   function changeSearchOptions() {
      var boardSelection = document.getElementById("BoardSelection").value;
      var searchField = document.getElementById("Searchfield");
      
      switch (boardSelection) {
         case "B1board":
            searchField.innerHTML = `
            <option id="Title" value="b1Title">제목</option>
            <option id="Content" value="b1Content">내용</option>
            <option id="Writer" value="b1Writer">작성자</option>
            `;
            break;
         case "B2board":
            searchField.innerHTML = `
            <option id="Title" value="b2Title">제목</option>
            <option id="Content" value="b2Content">내용</option>
            <option id="Writer" value="b2Writer">작성자</option>
            `;
            break;
         case "playboard":
            searchField.innerHTML = `
            <option id="Title" value="pTitle">제목</option>
            <option id="Content" value="pContent">내용</option>
            <option id="Writer" value="pWriter">작성자</option>
            `;
            break;
         default:
             searchField.innerHTML += `
             <option id="Default" value="Default">기본 옵션</option>
             `;
             break;
         break;
      }
   }
   function search_check() {
      var searchField = document.getElementById("Searchfield");
      var searchdata = document.getElementById("Searchdata").value;

      if (searchdata.length === 0) {
         alert("검색어를 입력해주세요.");
         document.getElementById("Searchdata").focus();
         return;
      }
    
      switch (searchField.value) {
         case "b1Title":
            document.Searchform.action = "/b1title";
            break;
         case "b1Content":
            document.Searchform.action = "/b1content";
            break;
         case "b1Writer":
            document.Searchform.action = "/b1writer";
            break;
         case "b2Title":
            document.Searchform.action = "/b2title";
            break;
         case "b2Content":
            document.Searchform.action = "/b2content";
            break;
         case "b2Writer":
            document.Searchform.action = "/b2writer";
            break;
         case "pTitle":
            document.Searchform.action = "/playtitle";
            break;
         case "pContent":
            document.Searchform.action = "/playcontent";
            break;
         case "pWriter":
            document.Searchform.action = "/playwriter";
            break;
         default:
            break;
      }
      document.Searchform.submit();
   }
   changeSearchOptions();
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
      .content {
          display: flex;
      }
      .left-content {
         flex: 1;
         box-sizing: border-box;
         text-align: center;
         position: relative;
      }
      .left-content img {
         max-width: 100%;
         height: auto;
       }
      .search-container {
         position: absolute;
         bottom: 10px;
         left: 50%;
         transform: translateX(-50%);
          display: flex;
         background: rgba(255, 255, 255, 0.7);
         padding: 10px;
         border-radius: 5px;
         box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
      }
      .search-container input {
         flex: 1; 
         border: none;
         padding: 5px;
         border-radius: 5px;
      }
      .search-container button {
         background: none;
         border: none;
         padding: 5px;
      }
      .right-content {
         flex: 1;   
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
   <div class="content">
      <div class="left-content"style="display: flex; align-items: center;">
         <img src="/img/hhhhh.png" style="max-width: 100%; height: auto; margin: 0 auto;">
         <div class="search-container">
            <form id="Searchform" name="Searchform" method="post">
                    <div class="row">
                        <div class="col-md-6">
                            <select id="BoardSelection" name="BoardSelection" onchange="changeSearchOptions()" class="form-select">
                                <option value="default">게시판 선택</option>
                                <option value="B1board">니빵이게시판</option>
                                <option value="B2board">내빵이게시판</option>
                                <option value="playboard">놀이빵게시판</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <select id="Searchfield" name="Searchfield" class="form-select">
                                <option id="Title" value="b1Title">제목</option>
                                <option id="Content" value="b1Content">내용</option>
                                <option id="Writer" value="b1Writer">작성자</option>
                            </select>
                        </div>
                     </div>
                     <div class="row">
                   <div class="col-md-8"> 
                       <input type="text" id="Searchdata" name="Searchdata" placeholder="게시판 검색" class="form-control">
                   </div>
                   <div class="col-md-2"> 
                       <button type="button" onclick="search_check()" class="btn btn-primary mt-2">검색</button>
                   </div>
               </div>
                </form>
         </div>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
      </div>
      <div class="right-content" >
         <div class="slideshow-container">
            <div class="mySlides">
               <img src="/img/iiiii.png" style="width:70vw; height:88vh;   float: right;">
            </div>
            <div class="mySlides">
               <img src="/img/jjjjj.png" style="width:70vw; height:88vh;   float: right;">
            </div>
            <div class="mySlides">
               <img src="/img/kkkkk.png" style="width:70vw; height:88vh;   float: right;">
            </div>
            <div class="mySlides">
               <img src="/img/lllll.png" style="width:70vw; height:88vh;   float: right;">
            </div>
         </div>
      </div>
   </div>
   <script>
      var slideIndex = 0;
      showSlides();
      
      function showSlides() {
          var i;
          var slides = document.getElementsByClassName("mySlides");
          for (i = 0; i < slides.length; i++) {
              slides[i].style.display = "none";
          }
          slideIndex++;
          if (slideIndex > slides.length) {
              slideIndex = 1;
          }
          slides[slideIndex - 1].style.display = "block";
          setTimeout(showSlides, 3000); 
      }
   </script>
    <!-- Optional JavaScript -->
   <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>