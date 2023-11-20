<%@page import="com.study.nbnb.dto.BuserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
   <title>회원정보수정</title>
     <meta charset="UTF-8">
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0b38572f5de0a09cbaa96703ebb627d1&libraries=services"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
    <script>
    $(function selectedControl(){
		const el = document.getElementById('phone1');
		const len = el.options.length;
		const str = ${fn:substring(user.PHONENUMBER, 1, 3)};
		for (let i=0; i<len; i++){  
			if(el.options[i].value == str){
				el.options[i].selected = true;
			}
		}  
		
		const bbang = document.getElementById("test").value;
		var radio0 = document.getElementById("ROLE_0");
		var radio1 = document.getElementById("ROLE_1");
		var radio2 = document.getElementById("ROLE_2");
		var radio3 = document.getElementById("ROLE_3");
		
		if (bbang === "ROLE_0") {
			radio0.checked = true;
		} else if (bbang === "ROLE_1") {
			radio1.checked = true;
		} else if (bbang === "ROLE_2") {
			radio2.checked = true;
		} else {
			radio3.checked = true;
		} 
		
	})
	
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = data.address;
				document.getElementById("ADDRESS").value = addr;
			}
		}).open();
	}
    
    
	function form_check() {
		
		var form = document.modify;
	    form.submit();
	    
	}
	
	
    </script>
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
            <a href="#" class="admintab">  ㄴ회원조회</a>
            <a href="#" class="admintab">  ㄴ회원정지</a>
            <a href="#" class="admintab">  ㄴ회원정지해제</a>
            <a href="/admin/adminbd" class="admintab">게시글관리</a>
            <a href="#" class="admintab">  ㄴ게시글조회</a>
            <a href="#" class="admintab">  ㄴ게시글삭제</a>
         	<a href="/admin/adminshop" class="admintab">결제관리</a>
            <a href="#" class="tabname">문의접수</a>
            <a href="#" class="admintab">문의조회</a>
        </div>
    
     <div class="content">
  		<form id="modify" name="modify" action="/admin/member_modify" method="post">
  			<input type="hidden" id="M_NUMBER" name="M_NUMBER" value="${user.m_NUMBER}">
  			<input type="hidden" id="pw2" name="pw2" value="${user.PASSWORD}">
  			<input type="hidden" id="test" name="test" value="${user.BBANG}">
			<div class="form-group">
				<input type="radio" name="BBANG" id ="ROLE_0" value="ROLE_0">&nbsp;<label class="form-control-label">빵아저씨</label>&nbsp;
				<input type="radio" name="BBANG" id ="ROLE_1" value="ROLE_1">&nbsp;<label class="form-control-label">니빵이</label>&nbsp;
				<input type="radio" name="BBANG" id ="ROLE_2" value="ROLE_2">&nbsp;<label class="form-control-label">내빵이</label>&nbsp;
				<input type="radio" name="BBANG" id ="ROLE_3" value="ROLE_3">&nbsp;<label class="form-control-label">소셜빵</label>
				
			</div>
			<div class="form-group">
				<label class="form-control-label">아이디</label>
				<input type="text" id="ID" name="ID" class="form-control" value="${user.ID}">
			</div>
			<div class="form-group">
				<label class="form-control-label">비밀번호</label>
				<input type="password" id="PASSWORD" name="PASSWORD" class="form-control" value="${user.PASSWORD}">
			</div>
            <div class="form-group">
                <label class="form-control-label">이름</label>
                <input type="text" id="NAME" name="NAME" size="20" class="form-control" value="${user.NAME}">
            </div>
            <div class="form-group">
                <label class="form-control-label">닉네임</label>
                <input type="text" id="NICKNAME" name="NICKNAME" size="20" class="form-control" value="${user.NICKNAME}">
            </div>
							
            <div class="form-group">
                <select id="phone1" name="phone1" class="form-control" style="width:20%; display: inline-block; padding: 0px 10px;">
                    <option value="010">010</option>
                    <option value="016">016</option>
                    <option value="017">017</option>
                    <option value="018">018</option>
                    <option value="019">019</option>
                    <option value="011">011</option>
                   </select>
                   -
                   <input type="text" style="width:35%; display: inline-block;" class="form-control" id="phone2" name="phone2" size="5" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="${fn:substring(user.PHONENUMBER, 4, 8)}">
                   - 
                   <input type="text" style="width:35%; display: inline-block;" class="form-control" id="phone3" name="phone3" size="5" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="${fn:substring(user.PHONENUMBER, 9, 13)}">
            </div>
            <div class="form-group">
                <label class="form-control-label">이메일</label>
                <input type="text" id="EMAIL" name="EMAIL" class="form-control" value="${user.EMAIL}">
            </div>
            <div class="form-group">
                <label class="form-control-label">주소</label>
                <input type="text" class="form-control" id="ADDRESS" name="ADDRESS" size="50" value="${user.ADDRESS}"> 
                <input type="button" class="btn btn-outline-primary" onclick="execDaumPostcode()" value="주소 검색">
            </div>
            <div class="form-group">
                <label class="form-control-label">정지사유</label>
                <input type="text" id="S_COMMENT" name="S_COMMENT" size="20" class="form-control" value="${user.s_COMMENT}">
            </div>
            <div class="form-group">
                <label class="form-control-label">정지기간</label>
                <input type="text" id="S_DATE" name="S_DATE" size="20" class="form-control" value="${user.s_DATE}">
            </div>
            
                   
               <div class="col-lg-12 loginbttm">
				<div class="col-lg-6 login-btm login-text">
					
				</div>
				<div class="col-lg-6 login-btm login-button">
					<input type="button" class="btn btn-outline-primary" value="수정" id="modify" onclick="form_check()">
				</div>
			</div>      
		</form>
  	</div>
</body>
</html>