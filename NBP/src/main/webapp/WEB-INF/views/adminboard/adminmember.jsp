<%@page import="com.study.nbnb.dto.BuserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
	BuserDto a = (BuserDto)session.getAttribute("login");
	int m_number = a.getM_NUMBER();
%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
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
         <li><a href="/adminbd">랭킹빵</a></li>
         <li><a href="/playpage?page=1">놀이빵</a></li>
         <%if(session.getAttribute("login") == null) {%>
         <li><a href="/loginView">로그인</a></li>
         <%}else { %>
         <li>${login.NICKNAME} 님</li>
         <li><a href="/mypage">MYPAGE</a></li>
         <li><a href="/logout">로그아웃</a></li>
         <%} %>
         <% if (session.getAttribute("Admin") != null) { %>
         <li><a href="#">관리빵 페이지</a></li>
         <li><a href="/logout">로그아웃</a></li>
         <% } %>
       </ul>
    </nav>
  <div class="empty-space"></div>
    <div class="admintabs">
            <a href="../admin/member?page=1" class="tabname">회원관리</a>
            <a href="#" class="admintab">회원조회</a>
            <a href="#" class="admintab">회원정지</a>
            <a href="#" class="admintab">회원정지해제</a>
            <a href="/adminbd" class="admintab">게시글관리</a>
            <a href="#" class="admintab">게시글조회</a>
            <a href="#" class="admintab">게시글삭제</a>
            <a href="/adminshop" class="admintab">결제관리</a>
            <a href="#" class="admintab">결제조회</a>
            <a href="#" class="tabname">문의접수</a>
            <a href="#" class="admintab">문의조회</a>
        </div>
    
     <div class="content">
		    <table border="1">
		        <tr>
		            <th>no</th>
			        <th>NAME</th>
			        <th>ID</th>
			        <th>ADDR</th>
			        <th>EMAIL</th>
			        <th>PH</th>
			        <th>NN</th>
			        <th>TC</th>
			        <th>BB</th>
			        <th>S_C</th>
			        <th>S_D</th>
		        </tr>
		        <c:forEach items="${userList}" var="list">
		                <tr>
		                
						    <td><a href="../admin/member_profile?m_number=${list.m_NUMBER}">${list.m_NUMBER}</a></td>
					        <td>${list.NAME}</td>
					        <td>${list.ID}</td>
					        <td>${list.ADDRESS}</td>
					        <td>${list.EMAIL}</td>
					        <td>${list.PHONENUMBER}</td>
					        <td>${list.NICKNAME}</td>
					        <td>${list.TICKET}</td>
					        <td>${list.BBANG}</td>
					        <td>${list.s_COMMENT}</td>
					        <td>${list.s_DATE}</td>
						
						</tr>
			    </c:forEach>
			    
			    <tr>
			     <ul class="pagination justify-content-center">
			        <c:if test="${page > 1}">
			            <li class="page-item">
			                <a class="page-link" href="/admin/member?page=1" aria-label="처음">
			                    <span aria-hidden="true">처음</span>
			                </a>
			            </li>
			            <li class="page-item">
			                <a class="page-link" href="/admin/member?page=${page - 1}" aria-label="이전">
			                    <span aria-hidden="true">이전</span>
			                </a>
			            </li>
			        </c:if>
			
			        <c:forEach var="i" begin="1" end="${totalPage}">
			            <li class="page-item <c:if test='${i eq page}'>active</c:if>">
			                <a class="page-link" href="/admin/member?page=${i}">${i}</a>
			            </li>
			        </c:forEach>
			
			        <c:if test="${page < totalPage}">
			            <li class="page-item">
			                <a class="page-link" href="/admin/member?page=${page + 1}" aria-label="다음">
			                    <span aria-hidden="true">다음</span>
			                </a>
			            </li>
			            <li class="page-item">
			                <a class="page-link" href="/admin/member?page=${totalPage}" aria-label="마지막">
			                    <span aria-hidden="true">마지막</span>
			                </a>
			            </li>
			        </c:if>
			    </ul>
			    </tr>
			</table>
	    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>