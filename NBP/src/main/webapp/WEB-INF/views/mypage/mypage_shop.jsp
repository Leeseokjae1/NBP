<%@page import="com.study.nbnb.dto.BuserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
    <%
    BuserDto a = (BuserDto)session.getAttribute("login");
    int m_number = a.getM_NUMBER();
    
     
   %>
<html>
<head>
   <title>마이페이지 - 상점</title>
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" >
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
   <script src="https://js.tosspayments.com/v1/payment-widget"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<style>
     #nav2 > a,
	#nav2 > ul > li,
	#nav2 > ul > li > a {
	  color: #000; 
	  font-size: 18px; 
	  font-weight: bold;
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
    #topbox{
       padding: 40px 300px 40px 300px;
       display: flex;
        align-items: center;
        height:250px;
    }
    #iconbox{
       padding: 0px 0px 0px 100px;
       height: 150px;
       display: flex;
        justify-content: space-between;
    }
    
    #icon{
       margin: 20px 50px 20px 50px;
       font-size:  110px;
    }
    .icons{
       margin: 0px 50px 0px 50px;
       width:120px; height:125px;
       float: left;
       text-align:center;
       flex-direction: column;
       align-items: center;
    }
     .icon-wrapper {
     display: flex;
     flex-direction: column;
     align-items: center;
   }
    .box {
       width: 150px;
       height: 150px; 
       border-radius: 30%;
       overflow: hidden;
   }
   .profile {
       width: 100%;
       height: 100%;
       object-fit: cover;
   }
   .user-nickname {
    font-size: 15px; 
    color: #ffffff; 
    text-align: left;

   }
   #probox {
  display: flex;
  flex-direction: column; 
  align-items: center;
  text-align: center; 
}
.user-info {
  display: flex;
  flex-direction: column;
  justify-content: center;
}
*{
  padding:0;
  margin:0;
  box-sizing: border-box;
}
#topbox h3 {
    font-weight: bold;
}

.table th{
    font-weight: bold;
}
.btn.btn-primary {
    font-weight: normal;
}

      .menu-toggle {
       position: absolute;
       right: 0;
       top: 0;
       cursor: pointer;
     }
@media screen and (max-width: 1400px) {
  nav {
      width:100%;
      margin:10px 0px 10px 0px;
  }
  #nav2 img {
    position: absolute;
    left: 0;
    top: 0; 
  }
  #nav2 ul {
    flex-direction: column;
    display: none;
    position: absolute;
    top: 90px;
    left: 0; 
    width: 100%;  
    background: linear-gradient(to right, #ffffff, #e3dde1);
    border-radius: 0 0 10px 10px;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
  }
  #nav2 ul::before { 
    content: "";
    position: absolute;
    top: 0px;
    left: 30px;
    border-left: 10px solid transparent;
    border-right: 10px solid transparent;
    border-bottom: 10px solid #ffffff;
  }
  #nav2 ul li a {
    color: #000000;
  }
  #nav2 ul li ul {
    display: none;
  }
   #iconbox {
    flex-wrap: wrap;
    justify-content: space-around;
    padding: 0px 0px 0px 0px;
  }
  .icons{
   margin: 50px 50px 50px 50px; 
  }
  #topbox {
    display: block;
    flex-direction: column;
    height: 500px;
    padding: 40px 0px 40px 0px;
  }
  #probox, #iconbox {
     align-self: flex-start;
   }
   @media screen and (max-width: 880px) {
    #iconbox {
       flex-wrap: wrap;
       justify-content: space-around;
       padding: 0px 0px 0px 0px;
     }
     .icons{
      margin: 30px 30px 30px 30px; 
     }
     #topbox {
       display: block;
       flex-direction: column;
       height: 660px;
       padding: 40px 0px 40px 0px;
     }
   }
}
   </style>  
   <script type="text/javascript">
      function openPopup(a,b) {
          window.open("/mypage_popup?t_count="+a+"&t_price="+b, "Popup", "width=500,height=500");      
      }
      

      function reloadParent() {
          window.location.reload();
      }
  </script> 
</head>
<body>
   <nav id="nav2">
   <a href="/main">
      <img src= "/img/nblogo.png" style="width:190px; height:80px;float: left; margin-right: 10px;"></a>
<!-- <a href="#" style="float: right; margin-top: 10px;margin-right: 10px;">로그인</a> --> 
<div class="menu-toggle">☰</div>            
<ul>
		<%if(session.getAttribute("login") == null) {%>
         <li><a href="/member/b1page?page=1&Searchdata=&Searchfield=">니빵이</a></li>
         <li><a href="/member/b2page?page=1&Searchdata=&Searchfield=">내빵이</a></li>
         <li><a href="/rpage">랭킹빵</a></li>
         <li><a href="/member/playpage?page=1&Searchdata=&Searchfield=">놀이빵</a></li>
         <li><a href="/loginView">로그인</a></li>
         <%}else { %>
         <li>${login.NICKNAME} 님</li>
         <li><a href="/member/b1page?page=1&Searchdata=&Searchfield=">니빵이</a></li>
         <li><a href="/member/b2page?page=1&Searchdata=&Searchfield=">내빵이</a></li>
         <li><a href="/rpage">랭킹빵</a></li>
         <li><a href="/member/playpage?page=1&Searchdata=&Searchfield=">놀이빵</a></li>
         <li><a href="/mypage">MYPAGE</a></li>
         <li><a href="/logout">로그아웃</a></li>
         <%} %>
         <% if (session.getAttribute("admin") != null) { %> 
         <li><a href="/admin/adminbd">관리빵 페이지</a></li>
             <%}%>
       </ul>
   </nav>
   <div id="topbox" style="background: #ffdcb8;">
         <div id="probox" style="display: flex; flex-direction: column; align-items: center; text-align: center;">
        <div class="box" style="background: #fcecde;">
          <img class="profile" src="/img/yb.png" id="profile">
        </div>
         <div class="user-info">
             <span class="user-nickname" style="font-size: 22px; color: #000000;">${login.NICKNAME} 님</span>
        </div>
      </div>
         <div id="iconbox" >
            <div class="icons">
               <div class="icon-wrapper">
                  <a href="/goodpost"><i class="bi bi-suit-heart-fill" id="icon" style="color: #ff5c5c;"></i></a><br />
                  <span class="icon-name">좋아요 게시글</span>
              </div>
            </div>
            <div class="icons">
                <div class="icon-wrapper">
                  <a href="/mpchat"><i class="bi bi-wechat" id="icon" style="color: #ffffff;"></i></a><br />
                  <span class="icon-name">1:1대화</span>
              </div>
            </div>
            <div class="icons">
               <div class="icon-wrapper">
                  <a href="#"><i class="bi bi-coin" id="icon" style="color: #e5b06c;"></i></a><br />
                  <span class="icon-name">채팅권</span>
              </div>    
            </div>
            <div class="icons">
              <div class="icon-wrapper">
                  <a href="/1/profile"><i class="bi bi-gear" id="icon" style="color: #aaa5a2;"></i></a><br />
                  <span class="icon-name">회원정보수정</span>
              </div>
            </div>
        </div>
     </div>
   <div class="container">
      <br /><br /><br />
        <table class="table table-bordered">
            <tr>
                <th class="text-center">보유개수</td>   
                <th rowspan="2" class="text-center align-middle">
                <a href="shopping_list?m_number=<%=m_number%>">구매내역</a></td>
            </tr>
            <tr>
                <td class="text-center">${user.TICKET} 개</td>
            </tr>
          </table>
          
          <br /><h3>결제하기</h3><br />
          <table class="table table-hover">
            <tr>
                <td scope="col" class="text-center">채팅권 1개</td>
                <td class="text-center"><button class="btn btn-outline-warning" onclick="openPopup(1,1000)">1000원</button></td>
            </tr>
            <tr>
                <td scope="col" class="text-center">채팅권 2개</td>
                <td class="text-center"><button class="btn btn-outline-warning" onclick="openPopup(2,2000)">2000원</button></td>
            </tr>
            <tr>
                <td scope="col" class="text-center">채팅권 3개</td>
                <td class="text-center"><button class="btn btn-outline-warning" onclick="openPopup(3,3000)">3000원</button></td>
            </tr>
            <tr>
                <td scope="col" class="text-center">채팅권 5개</td>
                <td class="text-center"><button class="btn btn-outline-warning" onclick="openPopup(5,4500)">4500원</button></td>
            </tr>
            <tr>
                <td scope="col" class="text-center">채팅권 10개</td>
                <td class="text-center"><button class="btn btn-outline-warning" onclick="openPopup(10,8000)">8000원</button></td>
            </tr>
        </table>
    </div>
<script>
    $(document).ready(function () {
       console.log("aaaa");
        $.ajax({
            type: "GET",
            url: "/api/mshop",
            success: function (data) {
                console.log(data);
               //var newWindow = window.open("", "_blank");
               //newWindow.document.write("<html><head><title>Response Body</title></head><body><pre>" + JSON.stringify(data, null, 2) + "</pre></body></html>");
            },
            error: function (error) {
                console.error('Error during AJAX request:', error);
            }
        });
    });

</script>
<script>
   document.querySelector('.menu-toggle').addEventListener('click', function() {
        var nav = document.querySelector('#nav2 ul');
        if (nav.style.display === 'none') {
          nav.style.display = 'block';
        } else {
          nav.style.display = 'none';
        }
      });

      document.querySelector('#nav2 ul li.board').addEventListener('click', function() {
        var submenu = document.querySelector('#nav2 ul li ul');
        if (submenu.style.display === 'none') {
          submenu.style.display = 'block';
        } else {
          submenu.style.display = 'none';
        }
      });
   </script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" ></script>
</body>
</html>