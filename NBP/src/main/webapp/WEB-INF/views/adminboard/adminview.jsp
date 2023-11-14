<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <style>

        .image {
            text-align: center;
        }

        .image img {
            width: 200px;
            height: 200px;
            margin-bottom: 20px;
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
   .empty-space {
    margin-top: 10px; 
    background-color:#FFC1B5;
    height: 30px;
    left: 200px;
    overflow:hidden;
    text-align: center;
	}
	
	.admintabs {
	    position: fixed;
	    top: 120px;
	    left: 200px;
	    width: 200px;
	    display: flex;
	    flex-direction: column;
	    background-color: #e3dde1; 
	    margin-top: 10px;
	}
	
	.admintab {
	    text-decoration: none;
	    color: #000;
	    font-size: 15px;
	    padding: 10px;
	    border-bottom: 1px solid #ccc; /* 탭 사이의 구분선을 추가할 수 있습니다. */
	    transition: background-color 0.3s;
	}
	
	.admintabs:hover {
	    background-color: #eee;
	}
	.content {
        margin-left: 200px; /* 세로 탭 너비에 맞게 여백 조절 */
        padding: 20px;
    }

    .tabname {
        text-decoration: none;
        color: #000;
        font-size: 15px;
        padding: 10px;
        border-bottom: 1px solid #ccc;
    }

    .subtab:hover {
        background-color: #eee;
    }
    .content {
        margin-left: 200px;
        padding: 20px;
        position: absolute;
        top: 150px; /* 상단 여백 조절 */
        left: 20%; /* 왼쪽 여백 조절 */
        width: 60%;
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
         <li><a href="#">랭킹빵</a></li>
         <li><a href="/playpage?page=1">놀이빵</a></li>
         <li><a href="#">로그인</a></li>
         <li><a href="/mypage">MYPAGE</a></li>
         <li><a href="#">로그아웃</a></li>
         <% if (session.getAttribute("Admin") != null) { %>
         <li><a href="#">관리빵 페이지</a></li>
         <% } %>			
       </ul>
    </nav>
  <div class="admintabs">
            <a href="#" class="tabname">회원관리</a>
            <a href="/adminbd" class="admintab">회원조회</a>
            <a href="#" class="admintab">회원정지</a>
            <a href="#" class="admintab">회원정지해제</a>
            <a href="#" class="tabname">게시글관리</a>
            <a href="#" class="admintab">게시글조회</a>
            <a href="#" class="admintab">게시글삭제</a>
            <a href="#" class="tabname">결제관리</a>
            <a href="#" class="admintab">결제조회</a>
            <a href="#" class="tabname">문의접수</a>
            <a href="#" class="admintab">문의조회</a>
        </div>
     <div class="empty-space"></div>
     <div class="content">
	    <h2>B1 Board</h2>
	    <table border="1">
	        <tr>
	            <th>ID</th>
	            <th>Title</th>
	            <th>Content</th>
	            <th>Writer</th>
	            <th>Action</th>
	        </tr>
	        <tr th:each="post : ${b1Posts}">
	            <td th:text="${post.b1_number}"></td>
	            <td th:text="${post.title}"></td>
	            <td th:text="${post.content}"></td>
	            <td th:text="${post.writer}"></td>
	            <td>
	                <form th:action="@{/admin/delete}" method="post">
	                    <input type="hidden" name="b1_number" th:value="${post.b1_number}"/>
	                    <button type="submit">Delete</button>
	                </form>
	            </td>
	        </tr>
	    </table>
	
	    <div th:each="post : ${b1Posts}" th:id="'b1Details' + ${post.b1_number}" style="display: none;">
	        <h3 th:text="${post.title}"></h3>
	        <p th:text="${post.content}"></p>
	        <p th:text="'Writer: ' + ${post.writer}"></p>
	        <!-- 추가 정보들을 표시 -->
	        <button type="button" onclick="toggleDetails('b1Details${post.b1_number}')">Close</button>
	    </div>
	
	    <!-- 다른 테이블에 대한 내용도 추가 -->
	
	      <script>
        document.querySelectorAll('.content table tr').forEach(row => {
            row.addEventListener('click', () => {
                const detailsId = 'b1Details' + row.children[0].textContent;
                const details = document.getElementById(detailsId);
                
                if (details.style.display === 'none') {
                    details.style.display = 'block';
                } else {
                    details.style.display = 'none';
                }
            });
        });
    </script>
	    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>