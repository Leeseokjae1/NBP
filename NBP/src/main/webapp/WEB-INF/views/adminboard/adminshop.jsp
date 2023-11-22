<%@page import="com.study.nbnb.dto.BuserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<% 
   session.removeAttribute("Searchdata");
   session.removeAttribute("Searchfield");   
   BuserDto login=(BuserDto)session.getAttribute("login");
   int m_number=login.getM_NUMBER();
%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

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
        margin-left: 200px;
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
    .container {
    text-align: center;
    margin-right: 3px;
    margin-left: 25%;
   }
   
   .table {
       margin: 0 auto;
   }
   
   .search-container {
       margin-top: 20px;
   }
   
   .form-select,
   .form-control,
   .btn {
       display: inline-block;
       vertical-align: middle;
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
   <script>
   function changeSearchOptions() {
     var boardSelection = document.getElementById("BoardSelection").value;
      var searchField = document.getElementById("Searchfield");
      
      // 선택된 게시판에 따라 검색 조건 옵션을 변경
      switch (boardSelection) {
         case "adminshop":
            searchField.innerHTML = `
            <option id="buy_number" value="buy_number">결제번호</option>
            <option id="m_number" value="m_number">회원번호</option>
            `;
            break;
         default:
             searchField.innerHTML += `
             <option id="Default" value="Default">기본 옵션</option>
             `;
             break;
      }
   }
   function search_check(){
    if($('#Searchdata').val().length == 0) {
         alert("검색어를 입력해주세요.");
         $('#Searchdata').focus();
         return;
   
      }
       if($('#Searchfield').val() == "buy_number") {
            document.Searchform.action = "/buysearch";
        }
       if($('#Searchfield').val() == "m_number") {
            document.Searchform.action = "/membersearch";       
        }
         document.Searchform.submit();
   }

       
   changeSearchOptions();
   </script>


<div class="content">
    <div class="row justify-content-center">
        <div class="col-md-2" style="text-align:center">
            <select id="Searchfield" name="Searchfield" class="form-select">
                <option id="buy_number" value="buy_number" style="margin:5px">결제번호</option>
                <option id="m_number" value="m_number">회원번호</option>
            </select>
        </div>
        <div class="col-md-8">
            <input type="text" id="Searchdata" name="Searchdata" placeholder="게시판 검색" class="form-control">
        </div>
        <div class="col-md-2">
            <button type="button" onclick="search_check()" class="btn btn-primary">검색</button>
        </div>
    </div>
    <br /><br /><br />
            <table class="table table-bordered">
              <thead>
               <tr>
                <th scope="col">결제번호</th>
                <th scope="col">회원번호</th>                
              <th scope="col">보유 채팅권 개수</th>
                <th scope="col">구매 채팅권 개수</th>
                <th scope="col">가격</th>
                <th scope="col">결제날짜</th>
                <th scope="col">결제상태</th>
                <th scope="col">결제취소 승인</th>
            </tr>
        </thead>
        <tbody>
         <c:forEach items="${list}" var="item" varStatus="status">
          <tr>
              <th scope="row">${item.buy_number}</th>
              <td>${item.m_number}</td>
              <td>${shoplist[(status.index)+(page-1)*8].ticket}</td>
              <td>${item.t_count}</td>
              <td>${item.t_price}</td>
              <td>${item.b_date}</td>
              <td>${item.t_cancel}</td>
              <td>
                  <c:choose>
                          <c:when test="${item.t_cancel eq 'approve'}">
                              취소 완료
                          </c:when>
                          <c:when test="${item.t_cancel eq 'refuse'}">
                              취소 거절
                          </c:when>
                          <c:otherwise>
                              <a href="approveCancel?buy_number=${item.buy_number}&m_number=${item.m_number}&t_count=${item.t_count}">취소 </a>
                               <a href="refuseCancel?buy_number=${item.buy_number}&m_number=${item.m_number}">취소 거부</a>
                          </c:otherwise>
                      </c:choose>
                  </td>
              </tr>
          </c:forEach>
        </tbody>
    </table>
    <ul class="pagination justify-content-center">
    <c:if test="${page > 1}">
        <li class="page-item">
            <a class="page-link" href="adminshop?page=1&Searchfield=${param.Searchfield}&Searchdata=${param.Searchdata}" aria-label="처음">
                <span aria-hidden="true">처음</span>
            </a>
        </li>
        <li class="page-item">
            <a class="page-link" href="adminshop?page=${page - 1}&Searchfield=${param.Searchfield}&Searchdata=${param.Searchdata}" aria-label="이전">
                <span aria-hidden="true">이전</span>
            </a>
        </li>
    </c:if>

    <c:forEach var="i" begin="1" end="${totalPage}">
        <li class="page-item <c:if test='${i eq page}'>active</c:if>">
            <a class="page-link" href="adminshop?page=${i}&Searchfield=${param.Searchfield}&Searchdata=${param.Searchdata}">${i}</a>
        </li>
    </c:forEach>

    <c:if test="${page <totalPage}">
        <li class="page-item">
            <a class="page-link" href="adminshop?page=${page + 1}&Searchfield=${param.Searchfield}&Searchdata=${param.Searchdata}" aria-label="다음">
                <span aria-hidden="true">다음</span>
            </a>
        </li>
        <li class="page-item">
            <a class="page-link" href="adminshop?page=${totalPage}&Searchfield=${param.Searchfield}&Searchdata=${param.Searchdata}" aria-label="마지막">
                <span aria-hidden="true">마지막</span>
            </a>
        </li>
    </c:if>
</ul>
</div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>

</body>
</html>