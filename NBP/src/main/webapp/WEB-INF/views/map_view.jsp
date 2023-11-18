<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
   <title>Hello, world!</title>
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
      }

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
        <!-- if (session.getAttribute("Admin") != null) { %> --> 
         <li><a href="/adminbd">관리빵 페이지</a></li>
        <!-- <li><a href="/logout">로그아웃</a></li>
         } %>-->
       </ul>
    </nav>
   <div id="mapwrap">
      <!-- 지도가 표시될 div -->
      <div id="map" style="width:100%;height:800px;"></div>
      <!-- 지도 위에 표시될 마커 카테고리 -->
      <div class="category">
         <ul>
            <li id="coffeeMenu" onclick="changeMarker('coffee')">
               <span class="ico_comm ico_coffee"></span>
               내빵이
            </li>
            <li id="breadMenu" onclick="changeMarker('bread')">
               <span class="ico_comm ico_bread"></span>
               니빵이
            </li>
         </ul>
      </div>
   </div>

   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3008bc264d07323c74ece29d779fde85"></script>
   <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
         mapOption = {
            center: new kakao.maps.LatLng(37.498004414546934, 127.02770621963765), // 지도의 중심좌표 
            level: 3 // 지도의 확대 레벨 
         };

      var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
      
      var geocoder = new kakao.maps.services.Geocoder();
      
      ggeocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {
    	    if (status === kakao.maps.services.Status.OK) {
    	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    	        var markerImageSrc = 'https://i.ibb.co/qRP9F05/bbsprites.png';
    	        var coffeeMarkers = [];
    	        var breadMarkers = [];

    	        var bbang = /* ROLE_1 또는 ROLE_2의 값이여야 함 */;

    	        var positions = (bbang === 'ROLE_1') ? coffeePositions : breadPositions;
    	        createMarkers(positions, bbang);

    	        changeMarker(bbang);

    	        var infowindow = new kakao.maps.InfoWindow({
    	            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
    	        });
    	        infowindow.open(map, marker);

    	        map.setCenter(coords);
    	    } 
    	});
      
      var markerImageSrc = 'https://i.ibb.co/qRP9F05/bbsprites.png',
         coffeeMarkers = [],
         breadMarkers = [];

      createMarkers(coffeePositions, 'coffee');
      createMarkers(breadPositions, 'bread');

      changeMarker('coffee');

      
      
      function createMarkerImage(src, size, options) {
         var markerImage = new kakao.maps.MarkerImage(src, size, options);
         return markerImage;
      }

      function createMarker(position, image, category, title, link) {
         var marker = new kakao.maps.Marker({
            position: position,
            image: image,
            category: category,
            title: title
         });
      
         marker.link = link;
         marker.markerTitle = title; 
         
         
         console.log(marker.link +  "111111");
         console.log(marker.markerTitle +  "2222222");
         
         kakao.maps.event.addListener(marker, 'click', function () {
            displayCustomOverlay(marker);
         });
         

         return marker;
         
      }

      function createMarkers(positions, category) {
    	    var markers = [];

    	    for (var i = 0; i < positions.length; i++) {
    	        var marker = createMarker(positions[i].position, markerImageSrc, category, positions[i].title, positions[i].link);
    	        markers.push(marker);
    	    }

    	    if (category === 'ROLE_1') {
    	        coffeeMarkers = markers;
    	    } else if (category === 'ROLE_2') {
    	        breadMarkers = markers;
    	    }
    	}
      var currentCustomOverlay = null;

      function createCustomOverlay(position, content) {
         // 클로저를 사용하여 오버레이를 클릭했을 때 해당 오버레이 정보를 참조할 수 있도록 함
         (function (customOverlayContent) {
            var customOverlay = new kakao.maps.CustomOverlay({
               position: position,
               content: customOverlayContent,
               yAnchor: 1
            });

            // 오버레이를 지도에 표시
            customOverlay.setMap(map);

            // 커스텀 오버레이를 클릭했을 때 오버레이를 지도에서 제거
            kakao.maps.event.addListener(customOverlay, 'click', function () {
               customOverlay.setMap(null);
            });

            // 현재 표시된 customoverlay 업데이트
            currentCustomOverlay = customOverlay;
         })(content);
      }

      function setMarkers(map, category) {
         var markers;
         if (category === 'coffee') {
            markers = coffeeMarkers;
         } else if (category === 'bread') {
            markers = breadMarkers;
         }

         // 이전에 표시된 customoverlay가 있다면 제거
         if (currentCustomOverlay) {
            currentCustomOverlay.setMap(null);
            currentCustomOverlay = null;
         }

         for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(map);
         }
      }
      

      function displayCustomOverlay(marker) {
         console.log(marker.link);
         console.log(marker.markerTitle);
         var content = '<div class="customoverlay">' +
            '  <a href="' + marker.link + '" target="_blank">' +
            '    <span class="title">' + marker.markerTitle + '</span>' +
            '  </a>' +
            '</div>';

         // 현재 표시된 customoverlay가 있다면 제거
         if (currentCustomOverlay) {
            currentCustomOverlay.setMap(null);
            currentCustomOverlay = null;
         }

         createCustomOverlay(marker.getPosition(), content);
      }
      

      function changeMarker(type) {
    	  var markers = (bbang === 'ROLE_1') ? coffeeMarkers : breadMarkers;

         if (type === 'coffee') {
            coffeeMenu.className = 'menu_selected';
            breadMenu.className = '';
            setMarkers(map, 'coffee');
            setMarkers(null, 'bread');
         } else if (type === 'bread') {
            coffeeMenu.className = '';
            breadMenu.className = 'menu_selected';
            setMarkers(null, 'coffee');
            setMarkers(map, 'bread');
         }
      }
   </script>
   <!-- Optional JavaScript -->
   <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>