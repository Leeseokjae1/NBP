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
      body {
           background-color: #f8f9fa;
       }
       .ranking-container {
           margin: 20px;
       }
         .ranking-item {
            background-color: #ffffff;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            margin-bottom: 50px; 
            padding: 50px; 
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
       .ranking-item h3 {
           color: #007bff;
       }
       .like-button {
           background-color: #007bff;
           color: #fff;
           margin-top: 10px;
       }
       .like-count {
           color: #007bff;
           margin-left: 5px;
       }
       .ranking-button {
          background-color: #007bff;  
          color: #fff;  /
          padding: 10px;
          cursor: pointer;
          border: none;
          border-radius: 5px; 
          margin-right: 10px;  
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
      <div class="container">
         <div class="ranking-types">
            <button class="ranking-button" onclick="showRanking(1)">니빵글 좋아요 랭킹 </button>
            <button class="ranking-button" onclick="showRanking(2)">내빵글 게시글 랭킹</button>
            <button class="ranking-button" onclick="showRanking(3)">놀빵글 게시글 랭킹</button>
            <button class="ranking-button" onclick="showRanking(4)">니빵이 랭킹</button>
            <button class="ranking-button" onclick="showRanking(5)">내빵이 랭킹</button>
            <button class="ranking-button" onclick="showRanking(6)">놀빵이 랭킹</button>
            <button class="ranking-button" onclick="showRanking(7)">전체 좋아요 랭킹</button>
        </div>


        <div class="ranking-container">
            <table class="ranking-table page1">
                <c:forEach items="${b1rankingList}" var="b1rank" varStatus="loop">
                    <tbody>
                        <tr style="height: 10px;"></tr>
                          <tr class="ranking-item">
                              <td style="height: 100px;">${b1rank.rank}</td>
                                <td style="height: 100px;">${b1rank.title}</td>
                                <td style="height: 100px;"><img src="${b1rank.imageurl1}" style="width:50px; max-height:50px; height:auto;"></td>
                                <td style="height: 100px;">닉네임 &nbsp;:&nbsp;${b1rank.writer}</td>
                                <td style="height: 100px;">&nbsp;Score&nbsp;:&nbsp;${b1rank.score}</td>
                           </tr>
                        <tr style="height: 10px;"></tr>
                    </tbody>
                </c:forEach>
            </table>
              <table class="ranking-table page2">
                <c:forEach items="${b2rankingList}" var="b2rank" varStatus="loop">
                    <tbody>
                        <tr style="height: 10px;"></tr>
                          <tr class="ranking-item">
                              <td style="height: 100px;">${b2rank.rank}</td>
                                <td style="height: 100px;">${b2rank.title}</td>
                                <td style="height: 100px;"><img src="${b2rank.imageurl1}" style="width:50px; max-height:50px; height:auto;"></td>
                                <td style="height: 100px;">닉네임 &nbsp;:&nbsp;${b2rank.writer}</td>
                                <td style="height: 100px;">&nbsp;Score&nbsp;:&nbsp;${b2rank.score}</td>
                           </tr>
                        <tr style="height: 10px;"></tr>
                    </tbody>
                </c:forEach>
            </table>
            <table class="ranking-table page3">
                <c:forEach items="${plrankingList}" var="plrank" varStatus="loop">
                    <tbody>
                        <tr style="height: 10px;"></tr>
                          <tr class="ranking-item">
                              <td style="height: 100px;">${plrank.rank}</td>
                                <td style="height: 100px;">${plrank.title}</td>
                                <td style="height: 100px;"><img src="${plrank.imageurl}" style="width:50px; max-height:50px; height:auto;"></td>
                                <td style="height: 100px;">닉네임 &nbsp;:&nbsp;${plrank.writer}</td>
                                <td style="height: 100px;">&nbsp;Score&nbsp;:&nbsp;${plrank.score}</td>
                           </tr>
                        <tr style="height: 10px;"></tr>
                    </tbody>
                </c:forEach>
            </table>
            
            <table class="ranking-table page4">           
                 <c:forEach items="${userb1RankingList}" var="b1userRank" varStatus="loop">
                    <tbody>
                        <tr style="height: 10px;"></tr>
                          <tr class="ranking-item">
                              <td style="height: 100px;">${loop.index + 1}등 &nbsp;</td>
                              <td style="height: 100px;">회원닉네임&nbsp;:&nbsp;${b1userRank.writer}&nbsp;</td>
                              <td style="height: 100px;">스코어&nbsp;:&nbsp;${b1userRank.userScore}</td>
                           </tr>
                        <tr style="height: 10px;"></tr>
                    </tbody>
                </c:forEach>
            </table>
            <table class="ranking-table page5">           
                 <c:forEach items="${userb2RankingList}" var="b2userRank" varStatus="loop">
                    <tbody>
                        <tr style="height: 10px;"></tr>
                          <tr class="ranking-item">
                              <td style="height: 100px;">${loop.index + 1}등 &nbsp;</td>
                              <td style="height: 100px;">회원닉네임&nbsp;:&nbsp;${b2userRank.writer}&nbsp;</td>
                              <td style="height: 100px;">${b2userRank.userScore}</td>
                           </tr>
                        <tr style="height: 10px;"></tr>
                    </tbody>
                </c:forEach>
            </table>
            <table class="ranking-table page6">           
                 <c:forEach items="${userplRankingList}" var="pluserRank" varStatus="loop">
                    <tbody>
                        <tr style="height: 10px;"></tr>
                          <tr class="ranking-item">
                              <td style="height: 100px;">${loop.index + 1}등 &nbsp;</td>
                              <td style="height: 100px;">회원닉네임&nbsp;:&nbsp;${pluserRank.writer}&nbsp;</td>
                              <td style="height: 100px;">${pluserRank.userScore}</td>
                           </tr>
                        <tr style="height: 10px;"></tr>
                    </tbody>
                </c:forEach>
            </table>
         <table class="ranking-table page7">           
                 <c:forEach items="${userRankingList}" var="userRank" varStatus="loop">
                    <tbody>
                        <tr style="height: 10px;"></tr>
                          <tr class="ranking-item">
                              <td style="height: 100px;">${loop.index + 1}등 </td> 
                              <td style="height: 100px;">회원닉네임&nbsp;:&nbsp;${userRank.writer}&nbsp;</td>
                              <!-- <td style="height: 100px;">${userRank.userScore}</td> -->
                           </tr>
                        <tr style="height: 10px;"></tr>
                    </tbody>
                </c:forEach>
            </table>
        </div>
    </div>

    <script>
        function showRanking(page) {
            document.querySelectorAll('.ranking-table').forEach(table => {
                table.style.display = 'none';
            });

            document.querySelector('.page' + page).style.display = 'table';

            document.querySelectorAll('.ranking-button').forEach(button => {
                button.style.backgroundColor = '';
            });
        }
    </script>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>