<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script>
        function search_check() {
            if ($('#Searchdata').val().length == 0) {
                alert("검색어를 입력해주세요.");
                $('#Searchdata').focus();
                return;
            }
            if ($('#Searchfield').val() == "pTitle") {
                document.Searchform.action = " <script>
                    function search_check() {
                    if ($('#Searchdata').val().length == 0) {
                        alert("검색어를 입력해주세요.");
                        $('#Searchdata').focus();
                        return;
                    }
                    if ($('#Searchfield').val() == "pTitle") {
                        document.Searchform.action = "/playboard/playlist";
                    }
                    if ($('#Searchfield').val() == "pContent") {
                        document.Searchform.action = "/playboard/playlist";
                    }
                    if ($('#Searchfield').val() == "pWriter") {
                        document.Searchform.action = "/playboard/playlist";
                    }
                    document.Searchform.submit();
                }
            </script>";
            }
            if ($('#Searchfield').val() == "bContent") {
                document.Searchform.action = "/webproject/free_list.do";
            }
            if ($('#Searchfield').val() == "bName") {
                document.Searchform.action = "/webproject/free_list.do";
            }
            document.Searchform.submit();
        }
    </script>
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


<table width="500" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td>번호</td>
		<td>작성자</td>
		<td>제목</td>
		<td>좋아요 / 싫어요</td>
		<td>삭제</td>
	</tr>
	<c:forEach items="${playlist}" var="play">
	<tr>
		<td>${play.f_number}</td>
		<td>${play.writer}</td>
		
		<td><a href="playview?f_number=${play.f_number}&check_b=3">${play.title}</a></td>
		<td>👍🏻: ${play.b_like} / 👎 : ${play.b_dislike}</td>
		<td><a href="playdelete?f_number=${play.f_number}">X</td>
	</tr>
	</c:forEach>
</table>

<p><a href="playwriteform">글작성</a></p>
</body>
</html>