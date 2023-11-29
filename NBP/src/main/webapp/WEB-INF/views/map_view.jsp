<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>니빵내빵 지도 뷰</title>
      <meta charset="UTF-8">
   <!-- Required meta tags -->
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
      integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
   <script src="https://code.jquery.com/jquery-3.3.1.slim.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"></script>

   <style>
      #mapwrap {
         position: relative;
         overflow: hidden;
         z-index:1;
      }
      #map{
      z-index:0;}

      .category,
      .category * {
         margin: 0;
         padding: 0;
         color: #000;
      }

      .category {
         position: absolute;
         overflow: hidden;
         top: 10px;
         left: 10px;
         width: 151px;
         height: 75px;
         z-index: 10;
         border: 1px solid black;
         font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
         font-size: 18px;
         text-align: center;
         background-color: #fff;
      }

      .category .menu_selected {
         background: #FF5F4A;
         color: #fff;
         border-left: 1px solid #915B2F;
         border-right: 1px solid #915B2F;
         margin: 0 -1px;
      }

      .category li {
         list-style: none;
         float: left;
         width: 75px;
         height: 75px;
         padding-top: 5px;
         cursor: pointer;
      }

      .category .ico_comm {
         display: block;
         margin: 0 auto 2px;
         width: 44px;
         height: 41px;
         background: url('https://i.ibb.co/qRP9F05/bbsprites.png') no-repeat;
      }

      .category .ico_coffee {
         background-position: -15px 0;
      }

      .category .ico_bread {
         background-position: -15px -41px;
      }

      .test1 {}

      .carousel-inner>.carousel-item>img {}

      * {
         padding: 0;
         margin: 0;
      }

      ul,
      ol {
         list-style: none
      }

      a {
         text-decoration: none;
         color: #000;
         font-size: 15px;
      }

      nav {
         width: 80%;
         overflow: hidden;
         height: 80px;
         margin: 10px auto;
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

      .customoverlay {
         position: relative;
         bottom: 85px;
         border-radius: 6px;
         border: 1px solid #ccc;
         border-bottom: 2px solid #ddd;
         float: left;
      }

      .customoverlay:nth-of-type(n) {
         border: 0;
         box-shadow: 0px 1px 2px #888;
      }

      .customoverlay a {
         display: block;
         text-decoration: none;
         color: #000;
         text-align: center;
         border-radius: 6px;
         font-size: 14px;
         font-weight: bold;
         overflow: hidden;
         background: #d95050;
         background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;
      }

      .customoverlay .title {
         display: block;
         text-align: center;
         background: #fff;
         margin-right: 35px;
         padding: 10px 15px;
         font-size: 14px;
         font-weight: bold;
      }

      .customoverlay:after {
         content: '';
         position: absolute;
         margin-left: -12px;
         left: 50%;
         bottom: -12px;
         width: 22px;
         height: 12px;
         background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png');
      }
            .menu-toggle {
       position: absolute;
       right: 0;
       top: 0;
       cursor: pointer;
     }
          #nav2 > a,
	#nav2 > ul > li,
	#nav2 > ul > li > a {
	  color: #000; 
	  font-size: 18px; 
	  font-weight: bold;
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
    z-index:10;
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
   <div id="mapwrap">
      <div id="map" style="width:100%;height:800px;"></div>
      <div class="category">
         <ul>
            <li id="coffeeMenu" onclick="changeMarker('ROLE_2')">
               <span class="ico_comm ico_coffee"></span>
               내빵이
            </li>
            <li id="breadMenu" onclick="changeMarker('ROLE_1')">
               <span class="ico_comm ico_bread"></span>
               니빵이
            </li>
         </ul>
      </div>
   </div>
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3008bc264d07323c74ece29d779fde85&libraries=services"></script>

<script>
    var mapOptions = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567),
        level: 3
    };
    var map = new kakao.maps.Map(document.getElementById('map'), mapOptions);
    var coffeeMarkers = [], breadMarkers = [];

    <c:forEach var="member" items="${members}">
        var geocoder = new kakao.maps.services.Geocoder();
        geocoder.addressSearch('<c:out value="${member.ADDRESS}"/>', function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                var imageSize = new kakao.maps.Size(33, 41),
                    imageOptions = {
                        spriteOrigin: new kakao.maps.Point(15, 0),
                        spriteSize: new kakao.maps.Size(53, 39)
                    };
                var markerImageSrc;
                var nickname = '<c:out value="${member.NICKNAME}"/>';
                var role = '<c:out value="${member.BBANG}"/>';
                
                if ('<c:out value="${member.BBANG}"/>' === 'ROLE_2') {
                    markerImageSrc = 'https://i.ibb.co/vmWtnCc/MYBBANG.png';
                    coffeeMarkers.push(createMarker(coords, markerImageSrc, nickname, role));
                } else if ('<c:out value="${member.BBANG}"/>' === 'ROLE_1') {
                    markerImageSrc = 'https://i.ibb.co/MRCwrWK/YOUBBANG.png';
                    breadMarkers.push(createMarker(coords, markerImageSrc, nickname, role));
                }
            }
        });
    </c:forEach>

    function createMarker(position, markerImageSrc, nickname, role) {
        var imageSize = new kakao.maps.Size(33, 41),
            imageOptions = {
                spriteOrigin: new kakao.maps.Point(15, 0),
                spriteSize: new kakao.maps.Size(53, 39)
            };
        var markerImage = new kakao.maps.MarkerImage(markerImageSrc, imageSize, imageOptions);
        var marker = new kakao.maps.Marker({
            map: map,
            position: position,
            image: markerImage
        });
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+ nickname + '</div>'
        });
        kakao.maps.event.addListener(marker, 'click', function () {
           displayCustomOverlay(marker, nickname);
        });

        marker.role = role;
        
        
        return marker;
    }
    var currentCustomOverlay = null;

    function createCustomOverlay(position, content) {
       (function (customOverlayContent) {
          var customOverlay = new kakao.maps.CustomOverlay({
             position: position,
             content: customOverlayContent,
             yAnchor: 1
          });

          customOverlay.setMap(map);

          kakao.maps.event.addListener(customOverlay, 'click', function () {
             customOverlay.setMap(null);
          });

          currentCustomOverlay = customOverlay;
       })(content);
    }


    function setMarkers(map, category) {
        var markers;
        if (category === 'ROLE_2') {
            markers = coffeeMarkers;
        } else if (category === 'ROLE_1') {
            markers = breadMarkers;
        }
        if (currentCustomOverlay) {
            currentCustomOverlay.setMap(null);
            currentCustomOverlay = null;
         }

        
        for (var i = 0; i < coffeeMarkers.length; i++) {
            coffeeMarkers[i].setMap(null);
        }

        for (var j = 0; j < breadMarkers.length; j++) {
            breadMarkers[j].setMap(null);
        }

        for (var k = 0; k < markers.length; k++) {
            markers[k].setMap(map);
        }
    }
    
    function displayCustomOverlay(marker, nickname) {
        console.log(marker.link);
        console.log(marker.markerTitle);
        var content = '<div class="customoverlay">' +
           '  <a href="#">' +
           '    <span class="title">' + nickname + '</span>' +
           '  </a>' +
           '</div>';

        if (currentCustomOverlay) {
           currentCustomOverlay.setMap(null);
           currentCustomOverlay = null;
        }

        createCustomOverlay(marker.getPosition(), content);
     }

    function changeMarker(role) {
        var coffeeMenu = document.getElementById('coffeeMenu');
        var breadMenu = document.getElementById('breadMenu');

        if (role === 'ROLE_2') {
            coffeeMenu.classList.add('menu_selected');
            breadMenu.classList.remove('menu_selected');
            setMarkers(map, 'ROLE_2');
        } else if (role === 'ROLE_1') {
            coffeeMenu.classList.remove('menu_selected');
            breadMenu.classList.add('menu_selected');
            setMarkers(map, 'ROLE_1');
        }
    }
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
</body>

</html>