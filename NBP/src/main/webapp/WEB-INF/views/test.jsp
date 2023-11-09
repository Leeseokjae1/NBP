<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>
<head>
   <title>Hello, world!</title>
     <meta charset="UTF-8">
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
   <script src="https://code.jquery.com/jquery-3.3.1.slim.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style>

   .test1{
   
    }
    .carousel-inner > .carousel-item > img{
      /* width: 640px;
      height: 720px; */
    }
    *{padding:0;margin:0}
   ul,ol{list-style:none}
   a{text-decoration:none;color:#000;font-size:15px}
   nav{width:80%;overflow:hidden;height:80px;margin:10px auto}
   #nav2>a {
     display: block; /* a태그는 글자성격 = inline */
     float: left;
     font-size: 30px;
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
   
   #cc{
   position:static;
   float:right;
   }
   
   #gear{
   font-size:100px;
   text-align:center;
   }
   #gears{
   text-align:center;
   }
   #gearset{
   width:200px;
   height:200px;
   postion:absolute;
   left:300px;
   }


</style>  

</head>
<body>

 <nav id="nav2">
    <a href="#">니빵내빵🥐</a>
    <ul>
      <li><a href="#">HOME</a></li>
      <li><a href="#">니빵이</a></li>
      <li><a href="#">내빵이</a></li>
      <li><a href="#">랭킹빵</a></li>
      <li><a href="#">놀이빵</a></li>
      <li><a href="#">MYPAGE</a></li>
    </ul>
  </nav>
  <div id="gearset">
  <a href="#"><i class="bi bi-gear" id="gear"></i></a><br />
  <h3 id="gears">회원정보수정</h3>
  </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>