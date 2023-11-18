<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

<head>
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
</style>
</head>
<script>

function form_check(){
	
	submit_ajax();
}
function submit_ajax(){
   	document.getElementById("playmodify").submit();
}

</script>

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
        <!-- if (session.getAttribute("Admin") != null) { %> --> 
         <li><a href="/adminbd">관리빵 페이지</a></li>
        <!-- <li><a href="/logout">로그아웃</a></li>
         } %>-->
       </ul>
    </nav>
	<div class="container mt-5">
		<form action="playmodify" id="playmodify" method="post" enctype="multipart/form-data">
			<table class="table table-bordered">
			<input type="hidden" name="f_number" id="f_number" value="${playmodify.f_number}">
				<input type="hidden" name="writer" id="writer" value="${playmodify.writer}">
			<tr>
				<td>번호</td>
				<td>${playmodify.f_number}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${playmodify.writer}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" class="form-control"value="${playmodify.title}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" rows="5" cols="100" class="form-control">${playmodify.content}</textarea>
				</td>
			</tr>
			<tr>
				<td>사진 업로드</td>
				<td><input type="file" name="file" class="form-control-file"><br></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" class="btn btn-secondary" value="수정"
					onclick="form_check()">&nbsp;&nbsp;
					<a href="playpage?page=1" class="btn btn-primary">목록보기</a>
					<a href="/member/playview?f_number=${playmodify.f_number}&check_b=3" class="btn btn-danger">취소</a>&nbsp;&nbsp;

				</td>
			</tr>
		</table>
	</form>
</div>



    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>