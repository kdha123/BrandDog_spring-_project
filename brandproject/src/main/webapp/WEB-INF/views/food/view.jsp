<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
<!--로딩  -->
<style>
#loading {
 width: 100%;  
 height: 100%;  
 top: 0px;
 left: 0px;
 position: fixed;  
 display: block;  
 opacity: 0.7;  
 background-color: #fff;  
 z-index: 99;  
 text-align: center; } 
  
#loading-image {  
 position: absolute;  
 top: 50%;  
 left: 50%; 
 z-index: 100; }
</style>
<script type="text/javascript">
$(window).on('load',function() {    

    $('#loading').hide(); 
    });
</script>





<!--쇼핑 리스트 점 없애기  -->
<style>
ul{
   list-style:none;
   padding-left:0px;
   }
</style>

<!-- 카카오맵 스타일  -->
        <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
       function drawChart() {
    	  	
    	  var data = google.visualization.arrayToDataTable([
    		     ["Element", "counte", { role: "style" } ],
    	         [${dto.word1 } ,'#ffd700'],            // RGB value
    	         [${dto.word2 }, '#bfbfbf'],            // English color name
    	         [${dto.word3 }, '#664d00'],            // English color name
    	         [${dto.word4 }, '#0000ff'],            // English color name
    	         [${dto.word5 }, '#0000ff'],            // English color name
    	         [${dto.word6 }, '#0000ff'],            // English color name
    	         [${dto.word7 }, '#0000ff'],            // English color name
    	         [${dto.word8 }, '#0000ff'],            // English color name
    	         [${dto.word9 }, '#0000ff'],            // English color name
    	         [${dto.word10 }, '#0000ff'],            // English color name
    	         

    	        
    	      ]);

        var options = {
          title: '순위 그래프'
        , legend: 'none'
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
    google.charts.load('current', {packages: ['corechart', 'line']});
    google.charts.setOnLoadCallback(drawBasic);

    function drawBasic() {

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Date');
        data.addColumn('number', '검색량');

        data.addRows(${dtod.data});

        var options = {
          hAxis: {
            title: '날짜'
          },
          vAxis: {
            title: '검색량(%)'
          }
          , legend: 'none'
        };

        var chart = new google.visualization.LineChart(document.getElementById('chart_div1'));

        chart.draw(data, options);
      }

    </script>


<script type="text/javascript">
$(function(){	


	var url = "https://www.10000recipe.com/recipe/list.html?q=" 
	var url1 = "${dto.title}"
	var url2 = url+url1
	
	$("#link").attr({"src":url2})



	// 글자르기
	var word = "${dto.word1 }"
	
	word = word.replace("\'","");
	word = word.replace("\'","");	 
	word = word.split(','); 	
	$('#a1').text(word[0])
	$('#a2').text(word[1])
	var word = "${dto.word2 }"
	
	word = word.replace("\'","");
	word = word.replace("\'","");	 
	word = word.split(','); 	
	$('#b1').text(word[0])
	$('#b2').text(word[1])
	var word = "${dto.word3 }"
	
	word = word.replace("\'","");
	word = word.replace("\'","");	 
	word = word.split(','); 	
	$('#c1').text(word[0])
	$('#c2').text(word[1])
	var word = "${dto.word4 }"

	word = word.replace("\'","");
	word = word.replace("\'","");	 
	word = word.split(','); 	
	$('#d1').text(word[0])
	$('#d2').text(word[1])
	var word = "${dto.word5 }"

	word = word.replace("\'","");
	word = word.replace("\'","");	 
	word = word.split(','); 	
	$('#e1').text(word[0])
	$('#e2').text(word[1])
	var word = "${dto.word6 }"

	word = word.replace("\'","");
	word = word.replace("\'","");	 
	word = word.split(','); 	
	$('#f1').text(word[0])
	$('#f2').text(word[1])
	var word = "${dto.word7 }"
	
	word = word.replace("\'","");
	word = word.replace("\'","");	 
	word = word.split(','); 	
	$('#g1').text(word[0])
	$('#g2').text(word[1])
	var word = "${dto.word8 }"

	word = word.replace("\'","");
	word = word.replace("\'","");	 
	word = word.split(','); 	
	$('#h1').text(word[0])
	$('#h2').text(word[1])
	var word = "${dto.word9 }"

	word = word.replace("\'","");
	word = word.replace("\'","");	 
	word = word.split(','); 	
	$('#i1').text(word[0])
	$('#i2').text(word[1])
	var word = "${dto.word10 }"
	
	word = word.replace("\'","");
	word = word.replace("\'","");	 
	word = word.split(','); 	
	$('#j1').text(word[0])
	$('#j2').text(word[1])
});
</script>
<meta charset="UTF-8">
<title>음식 분석</title>
</head>
<body>
<h1 style="text-align: center;">${dto.title}</h1>
<div class="container">
<h3>오늘 검색된 횟수${count.count }</h3>
<div>
  <h2>연관 키워드 순위</h2>
  <div>
  <div style="float:left;height: 400px; width: 75%" id="chart_div">
  </div>

  <table  class="table table-striped" style="width: 25%; height: 400px;background-color: white; " >
    
    <thead>
      <tr>
        <th>순위</th>
        <th>연관어</th>
        <th>건수</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td id= a1></td>      
        <td id= a2></td>
      </tr>
      <tr>
        <td>2</td>
        <td id= b1></td>
        <td id= b2></td>
      </tr>
      <tr>
        <td>3</td>
        <td id= c1></td>
        <td id= c2></td>
      </tr>
      <tr>
        <td>4</td>
        <td id= d1></td>
        <td id= d2></td>
      </tr>
      <tr>
        <td>5</td>
        <td id= e1></td>
        <td id= e2></td>
      </tr>
      <tr>
        <td>6</td>
        <td id= f1></td>
        <td id= f2></td>
      </tr>
      <tr>
        <td>7</td>
        <td id= g1></td>
        <td id= g2></td>
      </tr>
      <tr>
        <td>8</td>
        <td id= h1></td>
        <td id= h2><td>
      </tr>
      <tr>
        <td >9</td>
        <td id= i1></td>
        <td id= i2></td>
      </tr>
      <tr>
        <td>10</td>
        <td id= j1></td>
        <td id= j2></td>
      </tr>
    </tbody>
  
  </table>
  </div>

  </div>
  <h2>날자별 검색량 비율</h2>
  <div style="float:left;height: 400px; width: 100%; " id="chart_div1">
  </div>
 <div style="height: 400px;"></div>
 <div>
  
  <h2>레시피</h2><span><a target="_blnk" href = "https://www.10000recipe.com/recipe/list.html"> 바로가기 </a></span>
</div>
<div>

    <iframe id=link src = "https://www.10000recipe.com/recipe/list.html?q=라면" frameborder="0" style="width: 100%; height: 450px; "></iframe>
</div>


<div>
<h2>음식집 </h2>
</div>
<!-- 카카오 맵 -->
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
       
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e094cfb409f72f44375324a7e1c33ca&libraries=services"></script>

<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = '구로'+"${dto.title}"

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        /* alert('음식점이 없습니다'); */
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        /* alert('검색 결과 중 오류가 발생했습니다.'); */      
     return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>
<div>
<h2>쇼핑 </h2>
</div>
<div style="background-color: white;">
<ul>
<li>
<a target="_blnk" href="${a3 }">
<img style="height:140px;width: 140; " alt="이미지가 없읍니다" src="${a4}">
${a1}
&nbsp;&nbsp; ${a2}원
</a>
</li>
<li>
<a target="_blnk" href="${b3 }">
<img style="height:140px;width: 140; " alt="이미지가 없읍니다" src="${b4}">
${b1}
&nbsp;&nbsp; ${b2}원
</a>
</li>
<li>
<a target="_blnk" href="${c3 }">
<img style="height:140px;width: 140; " alt="이미지가 없읍니다" src="${c4}">
${c1}
&nbsp;&nbsp; ${c2}원
</a>
</li>
<li>
<a target="_blnk" href="${d3 }">
<img style="height:140px;width: 140; " alt="이미지가 없읍니다" src="${d4}">
${d1}
&nbsp;&nbsp; ${d2}원
</a>
</li>
<li>
<a href="${e3 }">
<img style="height:140px;width: 140; " alt="이미지가 없읍니다" src="${e4}">
${e1}
&nbsp;&nbsp; ${e2}원
</a>
</li>
</ul>
</div>


</div>

<div id="loading">
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<h2 style="color: #1abc9c">로딩중입니다</h2>
</div> 



</body>
</html>