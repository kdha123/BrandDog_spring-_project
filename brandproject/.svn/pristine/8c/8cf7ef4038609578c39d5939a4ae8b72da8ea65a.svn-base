<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
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
 
/* d3 예제 style */
line {
  stroke: #bfbfbf;
  stroke-opacity: 0.6;
}

.node rect {
  stroke: #fff;
  stroke-width: 3px;
}

.node text {
  font-family: Malgun Gothic;
/*   font-size: 10px; */
  color: white;
}
.reWordTable {
	margin-right: 50px; 
	margin-top: 50px; 
	overflow: auto; 
	display: block; 
	height: 400px;
	width: 100%;
	text-align: center;
}
.tableDiv {
	border: 1px dotted;
	border-color: #bfbfbf;
	height: 500px;
	float: right;
	margin-top: 5px;
	margin-right: 5px;
}
.d3chart {
	border: 1px dotted;
	border-color: #bfbfbf;
	margin-top: 5px;
	margin-left: 5px;
}
#blogBtn {
	background-color: #2DB400;
	color: #ffffff;
	border: 0;
	outline: 0;
}
#titleA {text-decoration: underline; color: #4d79ff;}
#nameA {text-decoration: none; color: #999999;}
#nameA:hover {text-decoration: underline; color: #999999;}
#linkA {text-decoration: underline; color: #2DB400;}
</style>

<script type="text/javascript">
google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'period');
    data.addColumn('number', 'ratio');

    data.addRows(${data});

    var options = {
      hAxis: {
        title: '기간'
      },
      vAxis: {
        title: '검색량'
      },
      legend: { position: 'bottom' },
      height: 700
    };

    var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

    chart.draw(data, options);
}
</script>

<title>여행</title>
</head>
<body>

<div class="container" id="totalContent">
	<div>
		<h2>'${reWord.title }' 보고서</h2>
	</div>
	<br>
	<div id="content">
		<h4 style="margin-top: 10px;"><strong>${reWord.title }</strong>의 연관어</h4>
		<div class="canvas form-inline" style="background-color: white; width: 90%;">
			<div class="tableDiv form-control" style="width: 27%">
				<table class="reWordTable">
					<tr style="border-bottom: 1px solid; border-top: 1px solid;">
						<th style="width: 19%">순위&nbsp;</th><th style="text-align: center; width: 60%">연관어</th><th style="width: 19%">건수</th>
					</tr>
					<c:forEach items="${list }" var="i" varStatus="status">
					<tr>
						<td style="height: 30px;">${status.count }</td>
						<c:forEach items="${i }" var="d" begin="0" end="1">
							<td class="tData" style="height: 30px;">&nbsp;${d}</td>
						</c:forEach>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<h4 style="margin-top: 10px;"><strong>${reWord.title }</strong>에 대한 검색 트렌드 분석</h4>
		<div id="chart_div" align="center" style="width: 90%;"></div>
		<div style="overflow: hidden;">
			<h4 style="margin-top: 10px;"><strong>${reWord.title }</strong>에 대한 실시간 블로그
			<button type="button" id="blogBtn" style="float: right;">Naver</button>
			</h4>
		</div>
		<div class="panel" style="overflow: scroll; height: 500px; padding: 10px;"><!--  clear: both; -->
			<c:forEach begin="0" end="9" var="i">
				<div class="panel-heading">
					<a href="${blogdata.doclink[i] }" id="titleA">${blogdata.title[i] }</a>
				</div>
				<div class="panel-body">
					<span>${blogdata.description[i] }</span><br>
					<span><small><a href="${blogdata.link[i] }" id="nameA">${blogdata.name[i] }</a>&nbsp;&nbsp;
					<a href="${blogdata.link[i] }" id="linkA">${blogdata.link[i] }</a></small></span>
				</div>
				<hr>
			</c:forEach>
		</div>
	</div>
	<script src="https://d3js.org/d3.v3.min.js"></script>
	<script type="text/javascript">
	
		var margin = {
			top: 20,
			bottom: 50,
			right: 30,
			left: 50
			};
	
		var c10 = d3.scale.category10();
		
		var width = 600 - margin.left - margin.right;
		var height = 500 - margin.top - margin.bottom;
	// linkdata에 나와 있는 숫자는 nodedata에 들어있는 배열 순서이다 ex) source: 1 => {"name": "test02", "value":1, "zone": 2}
	//                                                source: 3 => {"name": "test04", "value":1, "zone": 4}
		var linkdata = [
			{"source":0,"target":1, "distance": 180, "name": ${reWord.word1}[0]},
			{"source":0,"target":2, "distance": 180, "name": ${reWord.word2}[0]},
			{"source":0,"target":3, "distance": 180, "name": ${reWord.word3}[0]},
			{"source":0,"target":4, "distance": 180, "name": ${reWord.word4}[0]},
			{"source":0,"target":5, "distance": 180, "name": ${reWord.word5}[0]},
			{"source":0,"target":6, "distance": 180, "name": ${reWord.word6}[0]},
			{"source":0,"target":7, "distance": 180, "name": ${reWord.word7}[0]},
			{"source":0,"target":8, "distance": 180, "name": ${reWord.word8}[0]},
			{"source":0,"target":9, "distance": 180, "name": ${reWord.word9}[0]},
			{"source":0,"target":10, "distance": 180, "name": ${reWord.word10}[0]},
			{"source":0,"target":11, "distance": 180, "name": ${reWord.word11}[0]},
			{"source":0,"target":12, "distance": 180, "name": ${reWord.word12}[0]},
			{"source":0,"target":13, "distance": 180, "name": ${reWord.word13}[0]},
			{"source":0,"target":14, "distance": 180, "name": ${reWord.word14}[0]},
			{"source":0,"target":15, "distance": 180, "name": ${reWord.word15}[0]},
			{"source":0,"target":16, "distance": 150, "name": ${reWord.word16}[0]},
			{"source":0,"target":17, "distance": 150, "name": ${reWord.word17}[0]},
			{"source":0,"target":18, "distance": 150, "name": ${reWord.word18}[0]},
			{"source":0,"target":19, "distance": 150, "name": ${reWord.word19}[0]},
			{"source":0,"target":20, "distance": 150, "name": ${reWord.word20}[0]},
			{"source":0,"target":21, "distance": 150, "name": ${reWord.word21}[0]},
			{"source":0,"target":22, "distance": 150, "name": ${reWord.word22}[0]},
			{"source":0,"target":23, "distance": 150, "name": ${reWord.word23}[0]},
			{"source":0,"target":24, "distance": 150, "name": ${reWord.word24}[0]},
			{"source":0,"target":25, "distance": 150, "name": ${reWord.word25}[0]},
			{"source":0,"target":26, "distance": 120, "name": ${reWord.word26}[0]},
			{"source":0,"target":27, "distance": 120, "name": ${reWord.word27}[0]},
			{"source":0,"target":28, "distance": 120, "name": ${reWord.word28}[0]},
			{"source":0,"target":29, "distance": 120, "name": ${reWord.word29}[0]},
			{"source":0,"target":30, "distance": 120, "name": ${reWord.word30}[0]},
			];
	
		var nodedata = [
			{"name": "${reWord.title}", "value":40, "zone": 1},
			{"name": ${reWord.word1}[0], "value":1, "zone": 2},
			{"name": ${reWord.word2}[0], "value":1, "zone": 3},
			{"name": ${reWord.word3}[0], "value":1, "zone": 4},
			{"name": ${reWord.word4}[0], "value":1, "zone": 5},
			{"name": ${reWord.word5}[0], "value":1, "zone": 6},
			{"name": ${reWord.word6}[0], "value":1, "zone": 7},
			{"name": ${reWord.word7}[0], "value":1, "zone": 8},
			{"name": ${reWord.word8}[0], "value":1, "zone": 9},
			{"name": ${reWord.word9}[0], "value":1, "zone": 10},
			{"name": ${reWord.word10}[0], "value":1, "zone": 1},
			{"name": ${reWord.word11}[0], "value":1, "zone": 2},
			{"name": ${reWord.word12}[0], "value":1, "zone": 3},
			{"name": ${reWord.word13}[0], "value":1, "zone": 4},
			{"name": ${reWord.word14}[0], "value":1, "zone": 5},
			{"name": ${reWord.word15}[0], "value":1, "zone": 6},
			{"name": ${reWord.word16}[0], "value":1, "zone": 7},
			{"name": ${reWord.word17}[0], "value":1, "zone": 8},
			{"name": ${reWord.word18}[0], "value":1, "zone": 9},
			{"name": ${reWord.word19}[0], "value":1, "zone": 10},
			{"name": ${reWord.word20}[0], "value":1, "zone": 1},
			{"name": ${reWord.word21}[0], "value":1, "zone": 2},
			{"name": ${reWord.word22}[0], "value":1, "zone": 3},
			{"name": ${reWord.word23}[0], "value":1, "zone": 4},
			{"name": ${reWord.word24}[0], "value":1, "zone": 5},
			{"name": ${reWord.word25}[0], "value":1, "zone": 6},
			{"name": ${reWord.word26}[0], "value":1, "zone": 7},
			{"name": ${reWord.word27}[0], "value":1, "zone": 8},
			{"name": ${reWord.word28}[0], "value":1, "zone": 9},
			{"name": ${reWord.word29}[0], "value":1, "zone": 10},
			{"name": ${reWord.word30}[0], "value":1, "zone": 1},
			];

		var canvas = d3.select(".canvas").append("svg")
			.attr("width", width+margin.left+margin.right)
			.attr("height", height+margin.top+margin.bottom)
			.attr('class', 'd3chart')
			.append("g")
			.attr("transform", "translate("+margin.left+","+margin.top+")");
	
		var force = d3.layout.force()
			.size([width, height])
			.nodes(nodedata)
			.links(linkdata)
			.gravity(0.05)
			.charge(-200)
			.distance(function(d){return d.distance;})

		var link = canvas.selectAll(".link")
			.data(linkdata)
			.enter()
			.append("line")
			.attr("stroke-width", "3px")  // 연결선의 두께 색깔은 style에서 지정
			.attr("class", "link");
	
		var node = canvas.selectAll(".node")
			.data(nodedata)
			.enter()
			.append("g")
			.attr("class", "node")
			.call(force.drag);
		
		var rect = node.append("rect")
			.attr("stroke", "yellow")  // 원의 테투리 색
			.attr("stroke-width", "3px")  // 원의 테투리 두께
// 			alert(d.name.length); 4글자 90px
			.attr("width", function(d){ if(d.value>30)return "80px";else return d.name.length * 17 + "px" })  // value가 29가 아니라면 20으로 value = r(원의 반지름)
			.attr("height", function(d){ return d.value>39 ? d.value : 30; })
			.attr("rx", 7)
			.attr("ry", 7)
// 			.attr("fill", function(d){ return c10(d.zone*10); });  // 원의 색(nodedate에서 zone으로 구분!!)
			.attr("fill", function(d){ return d.value > 39 ? "#000" : c10(d.zone*10); });  // 원의 색(nodedate에서 zone으로 구분!!)
	
		var label = node.append("text")
			.attr("dx", function(d){if(d.value >39) return 36 - (d.name.length * 5) + "px"; else return d.name.length + 2.5 + "px";})  // 글씨의 위치(x축, 원의 중심 기준)
			.attr("dy", function(d){if(d.value >39) return "24px"; else return "20px";})  // 글씨의 위치(y축, 원의 중심 기준)
			.attr("font-size", "12px")  // 글씨의 크기
			.attr("fill", "rgb(255, 255, 255)")
			.text(function(d){ return d.name; });
	
		force.on("tick", function(){
			//Set X and Y of node
			node.attr("r", function(d){ return d.value; })
				.attr("cx", function(d){ return d.x; })
				.attr("cy", function(d){ return d.y; });
			//Set X, Y of link
			link.attr("x1", function(d){ return d.source.x+40; })  // 선의 시작점(x축) <= source
			link.attr("y1", function(d){ return d.source.y+15; })  // 선의 시작점(y축)
			link.attr("x2", function(d){ return d.target.x+d.name.length * 8; })  // 선의 끝(x축) <= target
			link.attr("y2", function(d){ return d.target.y+20; }); // 선의 끝(y축)
			//Shift node a little
			node.attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });
			});
	
		//Start the force layout calculation
		force.start();
	</script>
	<div>
		<button type="button" id="createPDF"><span>PDF</span></button>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.2.61/jspdf.min.js"></script>
	<script src="/js/html2canvas.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/canvg/1.5/canvg.min.js"></script>
	<script type="text/javascript">
		$('#createPDF').click((e) => {
			html2canvas(document.querySelector('#totalContent')).then(canvas => {
				document.body.appendChild(canvas);
			});
		});
	</script>
</div>

</body>
</html>