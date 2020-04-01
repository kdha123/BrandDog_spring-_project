<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first d3.js</title>
<script src="https://d3js.org/d3.v5.min.js"></script>
</head>
<body>
<h1>test</h1>
<div class="canvas" style="background-color: white;">
	<h3 class="title">SVG</h3>
</div>
<script type="text/javascript">
var data = {"node":[100,200,300]}
;
const svgElement= d3.select(".canvas")
const svg = svgElement.append("svg")
	.attr("viewBox", [0, 0, 500,600]);

var node = data.node;

var nodes = svgElement.selectAll(".node")
.data(node)
.enter()
.append("g")
.attr("class", "node")

var circle = nodes.append("g")
// .attr("r", 50)
.attr("fill", "Red")
.attr("width", 100)
.attr("height", 200)
.attr("x", 50)
.attr("y", 200);

//Start the force layout calculation
force.start();
</script>
</body>
</html>