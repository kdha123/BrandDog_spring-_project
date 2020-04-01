<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://d3js.org/d3.v3.min.js"></script>
<style>
body{ font: Arial 12px; text-align: center;}
.link {
  stroke: #000;
}
.node text {
  pointer-events: none;
  font: sans-serif;
}
</style>
</head>
<body>
<div class="canvas" style="background-color: white;">
	<h1 class="title">SVG</h1>
</div>
<script type="text/javascript">

	var margin = {
		top: 20,
		bottom: 50,
		right: 30,
		left: 50
		};

	var c10 = d3.scale.category10();
	
	
	var width = 960 - margin.left - margin.right;
	var height = 600 - margin.top - margin.bottom;
// linkdata에 나와 있는 숫자는 nodedata에 들어있는 배열 순서이다 ex) source: 1 => {"name": "test02", "value":1, "zone": 2}
//                                                source: 3 => {"name": "test04", "value":1, "zone": 4}
	var linkdata = [
		{"source":0,"target":1},
		{"source":0,"target":2},
		{"source":0,"target":3},
		{"source":1,"target":4},
		{"source":2,"target":5},
		{"source":2,"target":6}
		];

	var nodedata = [
		{"name": "test01", "value":30, "zone": 1},
		{"name": "test02", "value":1, "zone": 2},
		{"name": "test03", "value":1, "zone": 3},
		{"name": "test04", "value":1, "zone": 4},
		{"name": "test02-1", "value":1, "zone": 5},
		{"name": "test03-1", "value":1, "zone": 6},
		{"name": "test03-2", "value":1, "zone": 7}
		];
	
	var canvas = d3.select(".canvas").append("svg")
		.attr("width", width+margin.left+margin.right)
		.attr("height", height+margin.top+margin.bottom)
		.append("g")
		.attr("transform", "translate("+margin.left+","+margin.top+")");

	var force = d3.layout.force()
		.size([width, height])
		.nodes(nodedata)
		.links(linkdata)
		.gravity(0.05)
		.charge(-200)
		.linkDistance(200);
	
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
	
	var circle = node.append("circle")
		.attr("stroke", "yellow")  // 원의 테투리 색
		.attr("stroke-width", "3px")  // 원의 테투리 두께
		.attr("r", function(d){ return d.value>29 ? d.value : 20; })  // value가 29가 아니라면 20으로 value = r(원의 반지름)
		.attr("fill", function(d){ return c10(d.zone*10); });  // 원의 색(nodedate에서 zone으로 구분!!)

	var label = node.append("text")
		.attr("dx", "-15px")  // 글씨의 위치(x축, 원의 중심 기준)
		.attr("dy", "0.35em")  // 글씨의 위치(y축, 원의 중심 기준)
		.attr("font-size", "30px")  // 글씨의 크기
		.text(function(d){ return d.name; });

	force.on("tick", function(){
		//Set X and Y of node
		node.attr("r", function(d){ return d.value; })
			.attr("cx", function(d){ return d.x; })
			.attr("cy", function(d){ return d.y; });
		//Set X, Y of link
		link.attr("x1", function(d){ return d.source.x; })
		link.attr("y1", function(d){ return d.source.y; })
		link.attr("x2", function(d){ return d.target.x; })
		link.attr("y2", function(d){ return d.target.y; });
		//Shift node a little
		node.attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });
		});

		//Start the force layout calculation
		force.start();

</script>
</body>
</html>