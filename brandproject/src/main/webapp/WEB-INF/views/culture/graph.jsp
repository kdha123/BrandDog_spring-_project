<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Culture Trend</title>
<script src="/js/bluebird.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
<!-- google charts -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/plugins/forceDirected.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- // 라인 그래프 -->
<script type="text/javascript">
    google.charts.load('current', {packages: ['corechart', 'line']});
    google.charts.setOnLoadCallback(drawChart2);

    function drawChart2() {

          var data = new google.visualization.DataTable();
          data.addColumn('string', 'priod');
          data.addColumn('number', '검색량');

          data.addRows(${dto});

          var options = {
        	title: '${word.title} 검색량  비율',
            hAxis: {
              title: 'Date'
            },
            vAxis: {
              title: '검색량',
              ticks: [0, 25, 50, 75, 100]
            },
            width : 1130,
            height : 500,
            series: {
                0: { color: '#1abc9c' }
          	},
          	 animation: { startup: true, duration: 2000, easing: 'in' }
          };
          var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

          chart.draw(data, options);
        }
    </script>
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end


var chart = am4core.create("chartdiv", am4plugins_forceDirected.ForceDirectedTree);
var networkSeries = chart.series.push(new am4plugins_forceDirected.ForceDirectedSeries())

chart.data = [
  {
    name: "${word.title}",
    children: [
        {
        name: [${word.word2}][0],
        children: [
          { name: [${word.word10}][0], value: [${word.word10}][1] },
          { name: [${word.word11}][0], value: [${word.word11}][1] },
          { name: [${word.word12}][0], value: [${word.word12}][1] }
        ]
      },
        {
        name: [${word.word3}][0],
        children: [
          { name: [${word.word13}][0], value: [${word.word13}][1] },
          { name: [${word.word14}][0], value: [${word.word14}][1] },
          { name: [${word.word15}][0], value: [${word.word15}][1] }
        ]
      },
        {
        name: [${word.word4}][0],
        children: [
          { name: [${word.word16}][0], value: [${word.word16}][1] },
          { name: [${word.word17}][0], value: [${word.word17}][1] },
          { name: [${word.word18}][0], value: [${word.word18}][1] }
        ]
      },
        {
        name: [${word.word5}][0],
        children: [
          { name: [${word.word19}][0], value: [${word.word19}][1] },
          { name: [${word.word20}][0], value: [${word.word20}][1] },
          { name: [${word.word21}][0], value: [${word.word21}][1] }
        ]
      },
        {
        name: [${word.word6}][0],
        children: [
          { name: [${word.word22}][0], value: [${word.word22}][1] },
          { name: [${word.word23}][0], value: [${word.word23}][1] },
          { name: [${word.word24}][0], value: [${word.word24}][1] }
        ]
      },
        {
        name: [${word.word7}][0],
        children: [
          { name: [${word.word25}][0], value: [${word.word25}][1] },
          { name: [${word.word26}][0], value: [${word.word26}][1] },
          { name: [${word.word27}][0], value: [${word.word27}][1] }
        ]
      },
        {
        name: [${word.word8}][0],
        children: [
          { name: [${word.word28}][0], value: [${word.word28}][1] },
          { name: [${word.word29}][0], value: [${word.word29}][1] },
          { name: [${word.word30}][0], value: [${word.word30}][1] }
        ]
      },

    ]
  }
];

networkSeries.dataFields.value = "value";
networkSeries.dataFields.name = "name";
networkSeries.dataFields.children = "children";
networkSeries.nodes.template.tooltipText = "{name}:{value}";
networkSeries.nodes.template.fillOpacity = 1;

networkSeries.nodes.template.label.text = "{name}"
networkSeries.fontSize = 25;
networkSeries.minRadius = 25;
networkSeries.maxRadius = 65;

networkSeries.links.template.strokeWidth = 1;

var hoverState = networkSeries.links.template.states.create("hover");
hoverState.properties.strokeWidth = 3;
hoverState.properties.strokeOpacity = 1;

networkSeries.nodes.template.events.on("over", function(event) {
  event.target.dataItem.childLinks.each(function(link) {
    link.isHover = true;
  })
  if (event.target.dataItem.parentLink) {
    event.target.dataItem.parentLink.isHover = true;
  }

})

networkSeries.nodes.template.events.on("out", function(event) {
  event.target.dataItem.childLinks.each(function(link) {
    link.isHover = false;
  })
  if (event.target.dataItem.parentLink) {
    event.target.dataItem.parentLink.isHover = false;
  }
})

}); // end am4core.ready()
</script>
<script type="text/javascript">
$(function(){
	$('#savePdfBtn').click(function() {
		html2canvas(document.body, {
			  onrendered: function(canvas) {
			 
			    // 캔버스를 이미지로 변환
			    var imgData = canvas.toDataURL('image/jpeg');
			     
			    var imgWidth = 210; // 이미지 가로 길이(mm) A4 기준
			    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
			    var imgHeight = canvas.height * imgWidth / canvas.width;
			    var heightLeft = imgHeight;
			     
			        var doc = new jsPDF('p', 'mm');
			        var position = 0;
			         
			        // 첫 페이지 출력
			        doc.addImage(imgData, 'JPEG', 0, position, imgWidth, imgHeight);
			        heightLeft -= pageHeight;
			         
			        // 한 페이지 이상일 경우 루프 돌면서 출력
			        while (heightLeft >= 20) {
			          position = heightLeft - imgHeight;
			          doc.addPage();
			          doc.addImage(imgData, 'JPEG', 0, position, imgWidth, imgHeight);
			          heightLeft -= pageHeight;
			        }
			 
			        // 파일 저장
			        doc.save('sample_A4.pdf');
			  }
			});
		});
});
</script>
<script type='text/javascript'>
  //<![CDATA[
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('1dc5b08da26cc02902574f6c6a7c5453');
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
   function sendLink() {
      Kakao.Link.sendDefault({
        objectType: 'feed',
        content: {
          title: 'BrandDog',
          description: '문화 트렌드 검색',
          imageUrl: 'http://localhost/resources/image/logo.png', 
          link: {
            mobileWebUrl: 'http://localhost/culture/search.do',
            webUrl: 'http://localhost/culture/search.do' 
          }
        },
        buttons: [
          {
            title: '웹으로 보기',
            link: {
              mobileWebUrl: 'http://localhost/culture/search.do',
              webUrl: 'http://localhost/culture/search.do'
            }
          },
          {
            title: '앱으로 보기',
            link: {
              mobileWebUrl: 'http://localhost/culture/search.do',
              webUrl: 'http://localhost/culture/search.do' 
            }
          }
        ]
      });
    }
  //]]>
</script>
<style type="text/css">
.panel-heading {
	background: #bcf6ea;
}

body {
	background: #1abc9c
}

#chartdiv {
	width: 100%;
	height: 550px;
	max-width: 100%;
}
</style>
</head>
<body>
	<!-- 데이터 표시하는 부분 : Bootstrap 쉽게 표시 : 라이브러리 필요 -> sitemesh에서 처리 -->
	<div class="container" style="background: #1abc9c" id="testpdf">
		<!-- 제목 -->
		<h1 style="color: #f5f6f7">문화트렌드 검색</h1>
		<h3 style="color: #f5f6f7">"${word.title }"에 대한 연관검색어</h3>
		<div id="chartdiv"></div>
		<h3 style="color: #f5f6f7">"${word.title }"에 대한 검색량</h3>
		<div id="chart_div"></div>
		<br>
		<h3 style="color: #f5f6f7">"${word.title }"에 대한 실시간 블로그</h3>
		<div class="panel"
			style="overflow: scroll; height: 500px; padding: 10px;">
			<c:forEach begin="0" end="9" var="i">
				<div class="panel-heading">
					<a href="${bloggerlink[i] }">${title[i] }
						&nbsp;&nbsp;|&nbsp;&nbsp; ${bloggername[i] }</a>
				</div>
				<div class="panel-body">${description[i] }</div>
			</c:forEach>
		</div>
		<div class="p-3 mb-4">
			<div class="text-center" style="margin: 50px">
			<h3 style="color: #f5f6f7">분석 결과를 다운로드하거나 SNS에 공유해보세요.</h3>
			<h5 style="color: #f5f6f7">BrandDog의 분석을 통해 인사이트를 찾으셨다면 분석결과를 저장해 보세요.</h5>
			<h5 style="color: #f5f6f7">인사이트를 찾지 못했다면 다른 주제나 관련어로 검색해주세요.</h5><br><br>
		<a id="kakao-link-btn" href="javascript:sendLink()"><button
				class="btn btn-lg" style="background: #bcf6ea">
				카카오톡 공유하기<span class="glyphicon glyphicon glyphicon-share"></span>
			</button></a>&nbsp;&nbsp; 
		<a id="savePdfBtn" class="btn btn-lg"
			style="background: #bcf6ea">
			PDF로 다운로드하기<span class="glyphicon glyphicon-download-alt"></span>
		</a>&nbsp;&nbsp; 
				<a href="search.do" class="btn btn-lg" role="button" style="background: #bcf6ea">다시 검색하기</a>
				&nbsp;&nbsp; 
				<a href="/" class="btn btn-lg" role="button" style="background: #bcf6ea">메인으로 가기</a>
			</div>
		</div>
	</div>
</body>
</html>