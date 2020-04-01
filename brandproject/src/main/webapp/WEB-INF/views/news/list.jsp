<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- https://www.amcharts.com/demos/collapsible-force-directed-tree/?theme=frozen -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
<!-- Chart code -->
<script>
am4core.ready(function() {

	// Themes begin
	am4core.useTheme(am4themes_animated);
	// Themes end

	var chart = am4core.create("chartdiv02", am4charts.PieChart);
	chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

	chart.data = [
	  {country: [${dto.word1}][0], value: [${dto.word1}][1]},
	  {country: [${dto.word2}][0], value: [${dto.word2}][1]},
	  {country: [${dto.word3}][0], value: [${dto.word3}][1]},
	  {country: [${dto.word4}][0], value: [${dto.word4}][1]},
	  {country: [${dto.word5}][0], value: [${dto.word5}][1]},
	  {country: [${dto.word6}][0], value: [${dto.word6}][1]},
	  {country: [${dto.word7}][0], value: [${dto.word7}][1]},
	  {country: [${dto.word8}][0], value: [${dto.word8}][1]},
	  {country: [${dto.word9}][0], value: [${dto.word9}][1]},
	  {country: [${dto.word10}][0], value: [${dto.word10}][1]},
	];
	chart.radius = am4core.percent(70);
	chart.innerRadius = am4core.percent(40);
	chart.startAngle = 180;
	chart.endAngle = 360;  
	
	var series = chart.series.push(new am4charts.PieSeries());
	series.dataFields.value = "value";
	series.dataFields.category = "country";

	series.slices.template.cornerRadius = 20;
	series.slices.template.innerCornerRadius = 10;
	series.slices.template.draggable = true;
	series.slices.template.inert = true;
	series.alignLabels = false;

	series.hiddenState.properties.startAngle = 90;
	series.hiddenState.properties.endAngle = 90;

	chart.legend = new am4charts.Legend();

	});
// end am4core.ready()
</script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {packages: ['corechart', 'line']});
	google.charts.setOnLoadCallback(drawChart2);
	
	function drawChart2() {
		var data = new google.visualization.DataTable();
	      data.addColumn('date', 'Date');
	      data.addColumn('number', 'SearchRate');
		
	      data.addRows(
	          ${searchDTO.data}
	        );

	      var options = {
	    	        hAxis: {
	    	          title: 'Date'
	    	        },
	    	        vAxis: {
	    	          title: 'Popularity'
	    	        }
	    	      };

   	      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
   	   chart.draw(data, options);
      }
    </script>
<title>검색 결과</title>
</head>
<body>
<div align="center">
<div align="center" style="width:90%; background-color: white;">
	<br>
	<div id="chartdiv02" style="height: 600px;"></div>
	<h2 style="height: 40px;">&#60;${dto.title} 연관검색어&#62;</h2>
	<br>
	<div id="chart_div" style="height: 600px;"></div>
	<h2 style="height: 40px;">&#60;${dto.title } 검색량 비율&#62;</h2>
</div>
</div>
</body>
</html>