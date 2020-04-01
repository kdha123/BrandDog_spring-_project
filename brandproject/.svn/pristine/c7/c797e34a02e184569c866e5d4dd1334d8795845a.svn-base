<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first d3.js</title>
<script src="https://d3js.org/d3.v3.min.js"></script>
</head>
<body>


<script>
	var dataArray = [5, 40, 50, 60];
	var width = 500;
	var height = 500;

	var widthScale = d3.scale.linear()
					.domain([0, 60])
					.range([0, width]);

	var color = d3.scale.linear()
					.domain([0, 60])
					.range(["red", "blue"]);

	var axis = d3.svg.axis()
					.ticks(5)
					.scale(widthScale)
	
	var canvas = d3.select("body")
					.append("svg")
					.attr("width", width)
					.attr("height", height)
					.append("g")
					.attr("transform", "translate(20, 20)")

	var bars = canvas.selectAll("rect")
					.data(dataArray)
					.enter()
						.append("rect")
						.attr("width", function(d){return widthScale(d)})
						.attr("height", 50)
						.attr("fill", function(d){return color(d)})
						.attr("y", function(d, i){return i * 100});

	canvas.append("g")
		.attr("transform", "translate(0,400)")
		.call(axis)
	
/* 	
	원 그리기
	var circle = canvas.append("circle")
					.attr("cx", 250)
					.attr("cy", 250)
					.attr("r", 50)
					.attr("fill", "red");
	사각형 그리기
	var rect = canvas.append("rect")
					.attr("width", 100)
					.attr("height", 50);
	선 그리기
	var line = canvas.append("line")
					.attr("x1", 0)
					.attr("y1", 100)
					.attr("x2", 400)
					.attr("y2", 400)
					.attr("stroke", "green")
					.attr("stroke-width", 20); */
</script>


<p></p>

</body>
</html>