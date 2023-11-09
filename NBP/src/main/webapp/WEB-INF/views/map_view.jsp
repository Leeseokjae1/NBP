<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>
<head>
   <title>Hello, world!</title>
     <meta charset="UTF-8">
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
   <script src="https://code.jquery.com/jquery-3.3.1.slim.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

<style>
	#mapwrap{position:relative;overflow:hidden;}
	.category, .category *{margin:0;padding:0;color:#000;}   
	.category {position:absolute;overflow:hidden;top:10px;bottom:10px;left:10px;width:150px;height:50px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
	.category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
	.category li{list-style:none;float:left;width:50px;height:45px;padding-top:5px;cursor:pointer;} 
	.category img {display:block;margin:0 auto 2px;width:22px;height:26px;} 
	#myMenu img {background: url('img/nb.png') no-repeat;background-position:-10px 0;}  
	#youMenu img {background: url('img/yb.png') no-repeat;background-position:-10px -36px;} 
	 .bg-mycategory {
    width: 150px; height: 166px;
    background: url('css_sprites.png') -4px -4px;
}

.bg-youcategory {
    width: 159px; height: 166px;
    background: url('css_sprites.png') -162px -4px;
}
	  .test1 {
   
    }
    .carousel-inner > .carousel-item > img {
      /* width: 640px;
      height: 720px; */
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
         <li><a href="/map">로그아웃</a></li>
       </ul>
    </nav>
   <div id="mapwrap"> 
    <!-- 지도가 표시될 div -->
    <div id="map" style="width:100%;height:800px;"></div>
    <!-- 지도 위에 표시될 마커 카테고리 -->
    <div class="category">
        <ul>
            <li id="myMenu" onclick="changeMarker('my')">
                <img src="/img/nb.png" alt="내빵이 아이콘">
                내빵이
            </li>
            <li id="youMenu" onclick="changeMarker('you')">
                <img src="/img/yb.png" alt="니빵이 아이콘">
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

// 내빵이 마커가 표시될 좌표 배열입니다
var myPositions = [ 
    new kakao.maps.LatLng(37.499590490909185, 127.0263723554437),
    new kakao.maps.LatLng(37.499427948430814, 127.02794423197847),
    new kakao.maps.LatLng(37.498553760499505, 127.02882598822454),
    new kakao.maps.LatLng(37.497625593121384, 127.02935713582038),
    new kakao.maps.LatLng(37.49646391248451, 127.02675574250912),
    new kakao.maps.LatLng(37.49629291770947, 127.02587362608637),
    new kakao.maps.LatLng(37.49754540521486, 127.02546694890695),
    new kakao.maps.LatLng(37.49640072567703, 127.02726459882308),
    new kakao.maps.LatLng(37.49640098874988, 127.02609983175294),
    new kakao.maps.LatLng(37.49932849491523, 127.02935780247945),
    new kakao.maps.LatLng(37.49996818951873, 127.02943721562295)
];

// 니빵이 마커가 표시될 좌표 배열입니다
var youPositions = [
	new kakao.maps.LatLng(37.497535461505684, 127.02948149502778),
    new kakao.maps.LatLng(37.49671536281186, 127.03020491448352),
    new kakao.maps.LatLng(37.496201943633714, 127.02959405469642),
    new kakao.maps.LatLng(37.49966168796031, 127.03007039430118),
    new kakao.maps.LatLng(37.499463762912974, 127.0288828824399),
    new kakao.maps.LatLng(37.49896834100913, 127.02833986892401),
    new kakao.maps.LatLng(37.49893267508434, 127.02673400572665),
    new kakao.maps.LatLng(37.49872543597439, 127.02676785815386),
    new kakao.maps.LatLng(37.49813096097184, 127.02591949495914),
    new kakao.maps.LatLng(37.497680616783086, 127.02518427952202)                       
];    

var markerImageSrc = 'https://i.ibb.co/qxwSdfF/mycategory.png';  // 스프라이트 이미지의 주소입니다
myMarkers = [], // 내빵이 마커 객체를 가지고 있을 배열입니다
var ymarkerImageSrc = 'https://i.ibb.co/wgYwyvd/youcategory.png';
youMarkers = []; // 니빵이 마커 객체를 가지고 있을 배열입니다
    
createmyMarkers(); // 내빵이 마커를 생성하고 내빵이 마커 배열에 추가합니다
createyouMarkers(); // 니빵이 마커를 생성하고 니빵이 마커 배열에 추가합니다

changeMarker('my'); // 지도에 내빵이 마커가 보이도록 설정합니다    


// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
function createMarkerImage(src, size, options) {
    var markerImage = new kakao.maps.MarkerImage(src, size, options);
    return markerImage;            
}

// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
function createMarker(position, image) {
    var marker = new kakao.maps.Marker({
        position: position,
        image: image
    });
    
    return marker;  
}   
   
//내빵이 마커를 생성하고 내빵이 마커 배열에 추가하는 함수입니다
function createmyMarkers() {
    for (var i = 0; i < myPositions.length; i++) {  
    	var imageSize = new kakao.maps.Size(150, 166),
        imageOptions = {  
            spriteOrigin: new kakao.maps.Point(4, 4),    
            spriteSize: new kakao.maps.Size(150, 166)  
        };         

    // 마커이미지와 마커를 생성합니다
    var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
            marker = createMarker(myPositions[i], markerImage);  
        
        // 생성된 마커를 내빵이 마커 배열에 추가합니다
        myMarkers.push(marker);
    }     
}

// 내빵이 마커들의 지도 표시 여부를 설정하는 함수입니다
function setmyMarkers(map) {        
    for (var i = 0; i < myMarkers.length; i++) {  
        myMarkers[i].setMap(map);
    }        
}

//니빵이 마커를 생성하고 니빵이 마커 배열에 추가하는 함수입니다
function createyouMarkers() {
    for (var i = 0; i < youPositions.length; i++) {  
    	var imageSize = new kakao.maps.Size(159, 166),
        imageOptions = {  
            spriteOrigin: new kakao.maps.Point(162, 4),    
            spriteSize: new kakao.maps.Size(159, 166)  
        };     

    // 마커이미지와 마커를 생성합니다
    var markerImage = createMarkerImage(ymarkerImageSrc, imageSize, imageOptions),    
            marker = createMarker(youPositions[i], markerImage);  
        
        // 생성된 마커를 니빵이 마커 배열에 추가합니다
        youMarkers.push(marker);
    }     
}

// 니빵이 마커들의 지도 표시 여부를 설정하는 함수입니다
function setyouMarkers(map) {        
    for (var i = 0; i < youMarkers.length; i++) {  
        youMarkers[i].setMap(map);
    }        
}

// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
function changeMarker(type){
    
    var myMenu = document.getElementById('myMenu');
    var youMenu = document.getElementById('youMenu');
    
    // 내빵이 카테고리가 클릭됐을 때
    if (type === 'my') {
    
        // 내빵이 카테고리를 선택된 스타일로 변경하고
        myMenu.className = 'menu_selected';
        youMenu.className = '';
        
        // 내빵이 마커들만 지도에 표시하도록 설정합니다
        setmyMarkers(map);
        setyouMarkers(null);
        
    } else if (type === 'you') { // 니빵이 카테고리가 클릭됐을 때
     
        // 니빵이 카테고리를 선택된 스타일로 변경하고
        myMenu.className = '';
        youMenu.className = 'menu_selected';
        
        // 니빵이 마커들만 지도에 표시하도록 설정합니다
        setmyMarkers(null);
        setyouMarkers(map);  
    }    
} 
   </script>
      </script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>