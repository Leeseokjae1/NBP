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
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

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
   .empty-space {
    margin-top: 10px;
    background-color: #FFC1B5;
    height: 30px;
    margin-left: 200px; 
    margin-right: 200px;
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
         <li><a href="/adminview">랭킹빵이었던관리자빵</a></li>
         <li><a href="/playpage?page=1">놀이빵</a></li>
         <li><a href="#">로그인</a></li>
         <li><a href="/mypage">MYPAGE</a></li>
         <li><a href="#">로그아웃</a></li>
         <% if (session.getAttribute("Admin") != null) { %>
         <li><a href="/adminview">관리빵 페이지</a></li>
         <% } %>			
       </ul>
    </nav>
     <div class="empty-space"></div>
  <div class="admintabs">
            <a href="#" class="tabname">회원관리</a>
            <a href="#" class="admintab">  회원조회</a>
            <a href="#" class="admintab">  회원정지</a>
            <a href="#" class="admintab">  회원정지해제</a>
            <a href="/adminbd" class="admintab">게시글관리</a>
            <a href="#" class="admintab">  게시글조회</a>
            <a href="#" class="admintab">  게시글삭제</a>
            <a href="#" class="tabname">결제관리</a>
            <a href="#" class="admintab">  결제조회</a>
            <a href="#" class="tabname">문의접수</a>
            <a href="#" class="admintab">문의조회</a>
        </div>
    
     <div class="content">
    <table border="1">
        <tr>
            <th>ID</th>
            <th>게시판</th>
            <th>제목</th>
            <th>내용</th>
            <th>작성자</th>
            <th>좋아요</th>
            <th>싫어요</th>
            <th>작성일</th>
            <th>삭제</th>
        </tr>
        <c:forEach items="${allBoards}" var="post">
            <tr>
			    <td>
			            ${post.NO}
			    </td>
			    <td>${post.BOARDNAME}</td>
			    <td>${post.TITLE}</td>
			    <td>
			        <div class="content-preview" onclick="toggleDetails('Details${post.NO}')">
			            ${post.CONTENT.substring(0, post.CONTENT.length() > 15 ? 15 : post.CONTENT.length())}${post.CONTENT.length() > 15 ? '...' : ''}
			        </div>
			    </td>
			    <td>${post.WRITER}</td>
			    <td>${post.GOOD}</td>
			    <td>${post.BAD}</td>
			    <td>${post.TIME}</td>
			    <td class="no-click">
			       <a href="/bddelete?boardname=${post.BOARDNAME}&boardno=${post.NO}">삭제</a>
				</td>
			</tr>
	        <tr>
	            <td colspan="8"style=" background-color:#e3dde1">
	                <div id="Details${post.NO}" style="display: none; background-color:#e3dde1">
	                    <p>${post.CONTENT}</p>
	                    <span class="arrow" style="cursor: pointer;"></span>
	                </div>
	            </td>
	            
	        </tr>
	    </c:forEach>
	</table>
	<script>
	    document.querySelectorAll('.content table tr').forEach(row => {
	    	row.addEventListener('click', event => {
	            if (event.target.closest('.no-click')) {
	                // 삭제 버튼이 있는 셀을 클릭한 경우 이벤트를 무시합니다.
	                return;
	            }

	            const detailsId = row.nextElementSibling.querySelector('div').id;
	            toggleDetails(detailsId);
	        });
	    });
	
	    function toggleDetails(detailsId) {
	        const details = document.getElementById(detailsId);
	        const arrow = details.querySelector('.arrow');
	
	        if (details.style.display === 'none' || details.style.display === '') {
	            details.style.display = 'block';
	        } else {
	            details.style.display = 'none';
	        }
	    }
	   
	    
	</script>
	    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>