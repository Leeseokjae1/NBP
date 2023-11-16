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
        flex: 1; /* 검색창과 버튼을 나란히 배치하기 위해 확장 */
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
    .ranking-container {
           margin: 20px;
       }
       .ranking-item {
           background-color: #ffffff;
           border: 1px solid #dee2e6;
           border-radius: 5px;
           margin-bottom: 15px;
           padding: 15px;
           box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
       }
       .ranking-item h3 {
           color: #ffffcc;
       }
       .like-button {
           background-color: #ffffcc;
           color: #fff;
           margin-top: 10px;
       }
       .like-count {
           color: #ffffcc;
           margin-left: 5px;
       }
        .container {
            text-align: center;
        }

        .ranking-types {
            margin-bottom: 20px;
        }

        .ranking-button {
            background-color: #5a95f5;
            color: #fff;
            padding: 10px;
            cursor: pointer;
            border: none;
        }

        .ranking-table {
            display: none;
            border-collapse: collapse;
            width: 100%;
        }

        .ranking-table th, .ranking-table td {
            border: 1px solid #dee2e6;
            padding: 8px;
            text-align: center;
        }

        .page1 {
            background-color: #ffffcc;
        }

        .page2 {
            background-color: #ffffcc;
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
         <li><a href="/rpage">랭킹빵</a></li>
         <li><a href="/playpage?page=1">놀이빵</a></li>
         <li><a href="/map">지도</a></li>
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
     <div class="container">
       <div class="ranking-types">
           <button class="ranking-button" onclick="showRanking(1)">게시글 랭킹</button>
           <button class="ranking-button" onclick="showRanking(2)">니빵이 랭킹</button>
       </div>
       
       <table class="ranking-table page1">
           <thead>
               <tr>
                   <th>Rank</th>
                   <th>제목</th>
                   <th>이미지</th>
                   <th>작성자</th>
                   <th>Score</th>
               </tr>
           </thead>
          <c:forEach items="${rankingList}" var="rank">
             <tbody>
                <tr>
                     <td>${rank.rank}</td>
                     <td>${rank.title}</td>
                     <td> <img src="${rank.imageurl1}" style="width:50px; max-height:50px; height:auto;"> </td>
                     <td>${rank.writer}</td>
                     <td>${rank.score}</td>
                 </tr>
             </tbody>
          </c:forEach>
      </table>
      
       <table class="ranking-table page2">
           <thead>
               <tr>
                   <th>Rank</th>
                   <th>니빵이</th>
                   <th>Score</th>
               </tr>
           </thead>
        </table>
    </div>
    
    <script>
    function showRanking(page) {
        // 숨겨진 테이블 숨기기
        document.querySelectorAll('.ranking-table').forEach(table => {
            table.style.display = 'none';
        });

        // 선택한 페이지에 해당하는 테이블 보이기
        document.querySelector('.page' + page).style.display = 'table';

        // 버튼 스타일 변경
        document.querySelectorAll('.ranking-button').forEach(button => {
            button.style.backgroundColor = '';
        });
        document.querySelector('.page' + page).style.backgroundColor = '#ffffcc';
    }
</script>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>