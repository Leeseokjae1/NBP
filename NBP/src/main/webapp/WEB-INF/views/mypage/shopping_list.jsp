<%@page import="com.study.nbnb.dto.BuserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
 <%
 BuserDto a = (BuserDto)session.getAttribute("login");
 int m_number = a.getM_NUMBER();
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

<title>Insert title here</title>
<style>
 
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
</style>
</head>
<body>
   <nav id="nav2">
       <img src= "/img/nblogo.png" style="width:190px; height:80px;float: left; margin-right: 10px;">
<!-- <a href="#" style="float: right; margin-top: 10px;margin-right: 10px;">로그인</a> -->       
       <ul>
         <li><a href="/main">HOME</a></li>
         <li><a href="/list">니빵이</a></li>
         <li><a href="/b2list">내빵이</a></li>
         <li><a href="#">랭킹빵</a></li>
         <li><a href="/playlist">놀이빵</a></li>
         <li><a href="#">로그인</a></li>
         <li><a href="/mypage">MYPAGE</a></li>
         <li><a href="#">로그아웃</a></li>
       </ul>
    </nav>


<div class="container mt-5">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th scope="col">결제번호</th>
                <th scope="col">채팅권 개수</th>
                <th scope="col">가격</th>
                <th scopte="col">결제날짜</th>
                <th scope="col">결제취소</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${shoplist}" var="list">
                <tr>
                    <th scope="row">${list.buy_number}</th>
                    <td>${list.t_count}</td>
                    <td>${list.t_price}</td>
                    <td>${list.b_date}</td>
                    <td>
                    
					    <c:choose>
					        <c:when test="${list.t_cancel eq 'cancel'}">
					            취소 접수
					        </c:when>
					        <c:when test="${list.t_cancel eq 'approve'}">
					            취소 완료
					        </c:when>
					         <c:when test="${list.t_cancel eq 'refuse'}">
					            취소 거부
					        </c:when>
					        <c:otherwise>
					                <button type="button"  onclick="cancelBtn(${list.buy_number})" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" >
        취소</button>
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
                <a class="page-link" href="/playpage?page=1" aria-label="처음">
                    <span aria-hidden="true">처음</span>
                </a>
            </li>
            <li class="page-item">
                <a class="page-link" href="/playpage?page=${page - 1}" aria-label="이전">
                    <span aria-hidden="true">이전</span>
                </a>
            </li>
        </c:if>

        <c:forEach var="i" begin="1" end="${totalPage}">
            <li class="page-item <c:if test='${i eq page}'>active</c:if>">
                <a class="page-link" href="/playpage?page=${i}">${i}</a>
            </li>
        </c:forEach>

        <c:if test="${page < totalPage}">
            <li class="page-item">
                <a class="page-link" href="/playpage?page=${page + 1}" aria-label="다음">
                    <span aria-hidden="true">다음</span>
                </a>
            </li>
            <li class="page-item">
                <a class="page-link" href="/playpage?page=${totalPage}" aria-label="마지막">
                    <span aria-hidden="true">마지막</span>
                </a>
            </li>
        </c:if>
    </ul>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">취소 확인</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                취소하시겠습니까?
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-primary" onclick="confirmCancelBtn()">확인</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
             
             
            </div>
        </div>
    </div>
</div>


<script>

var buyNumber;

function cancelBtn(a){
	buyNumber=a;
}
 
 // 모달 내에서 확인 버튼 클릭 시 취소 링크로 이동
function confirmCancelBtn() {
  var mNumber = <%= m_number%>
  window.location.href = "../cancelPurchase?buy_number=" + buyNumber + "&m_number=" + mNumber;

}
</script>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>