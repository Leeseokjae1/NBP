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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <style>

   body {
        min-height: calc(100vh - 50px); 
        margin: 0; 
    }
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
       top: 120px;
       left: 200px;
       width: 200px;
       display: flex;
       flex-direction: column;
       background-color: #e3dde1; 
       margin-left: 200px;
       height: 100vh; 
       
   }
   
   .admintab {
       text-decoration: none;
       color: #000;
       font-size: 15px;
       padding: 10px;
       border-bottom: 1px solid #ccc;
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
        position: absolute;
        top: 150px;
        left: 20%;
        margin-left: 120px;
        padding: 20px;
        width: 1130px;
    }
     th {
        text-align: center;
        padding: 10px;
    }

    th.no,  th.board-writer, th.delete {
        width: 50px;
    }

     th.title {
        width: 100px;
    }
    th.board-writer{
       width: 100px;   
    }
    th.contents {
        width: 230px;
    }

    th.delete {
        width: 30px;
    }

    th.title {
        width: 350px;
    }

   td {
   
   text-align : center;
   }
   table {
        table-layout: fixed;
    }

    th, td {
        word-wrap: break-word;
        overflow-wrap: break-word;
    }
    
    @media (max-width: 1300px) {
       .empty-space {
           display: none;
       }
       .admintabs {
           top: 70px;
           left: 0;
           width: 100%;
           height: 45px;
           overflow: auto;
           flex-direction: row;
           justify-content: space-around;
           margin-left: 0;
           position: static; 
           z-index: 1;
           flex-wrap: wrap; 
       }
   
       .admintab {
          width: calc(20% - 20px);
          height: 45px;
           border-bottom: 1px solid #ccc;
           padding: 10px 0;
           box-sizing: border-box;
           text-align: center;
       }
   
       .content {
           position: relative;
           top: 0;
           left: 0;
           margin-left: 0;
           margin-top: 45px;
           padding: 20px;
           width: 100%;
       }
   }
   nav[aria-label="Page navigation"] {
       width: 1160px;
       margin: 10px 0;
   }
   .pagination {
       display: flex;
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
   <div class="empty-space"></div>
   <div class="admintabs">
       <a href="/admin/member?page=1" class="tabname">회원관리</a>
       <a href="/admin/adminbd" class="admintab">게시글관리</a>
       <a href="/admin/adminshop" class="admintab">결제관리</a>
       <a href="#" class="tabname">문의접수</a>
       <a href="#" class="admintab">문의조회</a>
   </div>
   <div class="content">
    <table border="1">
        <tr>
           <th class="no">NO.</th>
            <th class="board-writer">게시판</th>
            <th class="title">제목</th>
           <th class="contents">내용</th>
           <th class="board-writer">작성자</th>
           <th>좋아요</th>
           <th>싫어요</th>
           <th>작성일</th>
           <th class="delete">삭제</th>
        </tr>
        <c:forEach items="${list}" var="post">
            <tr>
             <td>
                     ${post.no}
             </td>
             <td>${post.boardname}</td>
             <td>${post.title}</td>
             <td>
                 <div class="content-preview" onclick="toggleDetails('Details${post.no}')">
                     ${post.content.substring(0, post.content.length() > 15 ? 15 : post.content.length())}${post.content.length() > 15 ? '...' : ''}
                 </div>
             </td>
             <td>${post.writer}</td>
             <td>${post.b_like}</td>
             <td>${post.b_dislike}</td>
             <td>${post.time}</td>
             <td class="no-click">
                 <a href="bddelete?boardname=${post.boardname}&boardno=${post.no}" >삭제</a>
            </td>
         </tr>
           <tr>
               <td colspan="9"style=" background-color:#e3dde1">
                   <div id="Details${post.no}" style="display: none; background-color:#e3dde1">
                       <p>${post.content}</p>
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
                  const detailsId = row.nextElementSibling.querySelector('div').id;
                   toggleDetails(detailsId);
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
   <script>
    function deletePost(boardname, no) {
       console.log('Deleting post:', boardname, no);
        $.ajax({
            url: '/bddelete',
            type: 'POST',
            data: {
                boardname: boardname,
                boardno: no
            },
            success: function(response) {
                location.reload();
            },
            error: function(error) {
                alert('게시글 삭제에 실패했습니다.');
            }
        });
    }
    </script>
   <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <c:if test="${page > 1}">
                <li class="page-item"><a class="page-link" href="adminbd?page=1">처음</a></li>
                <li class="page-item"><a class="page-link" href="adminbd?page=${page - 1}">이전</a></li>
            </c:if>
            <c:forEach var="i" begin="1" end="${totalPage}">
                <li class="page-item <c:if test='${i eq page}'>active</c:if>">
                    <a class="page-link" href="adminbd?page=${i}">${i}</a>
                </li>
            </c:forEach>
            <c:if test="${page < totalPage}">
                <li class="page-item"><a class="page-link" href="adminbd?page=${page + 1}">다음</a></li>
                <li class="page-item"><a class="page-link" href="adminbd?page=${totalPage}">마지막</a></li>
            </c:if>
        </ul>
        
    </nav>
       </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>