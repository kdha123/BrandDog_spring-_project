const canvas = d3.select(".canvas");

const svg = canvas
	.append("svg")
	.attr("height", 600)
	.attr("width", 600);

svg.append("circle")
	.attr("cx", 300)
	.attr("cy", 70)
	.attr("fill", "purple")