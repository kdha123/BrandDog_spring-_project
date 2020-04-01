<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#chartdiv {
  width: 100%;
  max-width: 100%;
height:550px;
}
</style>
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/plugins/forceDirected.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/frozen.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<!-- Chart code -->
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_frozen);
am4core.useTheme(am4themes_animated);
// Themes end



var chart = am4core.create("chartdiv", am4plugins_forceDirected.ForceDirectedTree);
chart.legend = new am4charts.Legend();

var networkSeries = chart.series.push(new am4plugins_forceDirected.ForceDirectedSeries())

networkSeries.data = [{
	  name: 'Flora',
	  children: [
	    {
	      name: 'Black Tea',
	      value: 2
	    },
	    {
	      name: 'Floral',
	      value: 2
	    },
	    {
	      name: 'Chamomile',
	      value: 2
	    },
	    {
	      name: 'Rose',
	      value: 2
	    },
	    {
	      name: 'Jasmine',
	      value: 2
	    }
	  ]
	}, {
  name: 'Fruity',
  children: [{
    name: 'Berry',
    children: [{
      name: 'Blackberry', value: 1
    }, {
      name: 'Raspberry', value: 1
    }, {
      name: 'Blueberry', value: 1
    }, {
      name: 'Strawberry', value: 1
    }]
  }, {
    name: 'Dried Fruit',
    children: [{
      name: 'Raisin', value: 1
    }, {
      name: 'Prune', value: 1
    }]
  }, {
    name: 'Other Fruit',
    children: [{
      name: 'Coconut', value: 1
    }, {
      name: 'Cherry', value: 1
    }, {
      name: 'Pomegranate', value: 1
    }, {
      name: 'Pineapple', value: 1
    }, {
      name: 'Grape', value: 1
    }, {
      name: 'Apple', value: 1
    }, {
      name: 'Peach', value: 1
    }, {
      name: 'Pear', value: 1
    }]
  }, {
    name: 'Citrus Fruit',
    children: [{
      name: 'Grapefruit', value: 1
    }, {
      name: 'Orange', value: 1
    }, {
      name: 'Lemon', value: 1
    }, {
      name: 'Lime', value: 1
    }]
  }]
}, {
  name: 'Sour/Fermented',
  children: [{
    name: 'Sour',
    children: [{
      name: 'Sour Aromatics', value: 1
    }, {
      name: 'Acetic Acid', value: 1
    }, {
      name: 'Butyric Acid', value: 1
    }, {
      name: 'Isovaleric Acid', value: 1
    }, {
      name: 'Citric Acid', value: 1
    }, {
      name: 'Malic Acid', value: 1
    }]
  }, {
    name: 'Alcohol/Fremented',
    children: [{
      name: 'Winey', value: 1
    }, {
      name: 'Whiskey', value: 1
    }, {
      name: 'Fremented', value: 1
    }, {
      name: 'Overripe', value: 1
    }]
  }]
}, {
  name: 'Green/Vegetative',
  children: [{
    name: 'Olive Oil', value: 1
  }, {
    name: 'Raw', value: 1
  }, {
    name: 'Green/Vegetative',
    children: [{
      name: 'Under-ripe', value: 1
    }, {
      name: 'Peapod', value: 1
    }, {
      name: 'Fresh', value: 1
    }, {
      name: 'Dark Green', value: 1
    }, {
      name: 'Vegetative', value: 1
    }, {
      name: 'Hay-like', value: 1
    }, {
      name: 'Herb-like', value: 1
    }]
  }, {
    name: 'Beany', value: 1
  }]
}, {
  name: 'Other',
  children: [{
    name: 'Papery/Musty',
    children: [{
      name: 'Stale', value: 1
    }, {
      name: 'Cardboard', value: 1
    }, {
      name: 'Papery', value: 1
    }, {
      name: 'Woody', value: 1
    }, {
      name: 'Moldy/Damp', value: 1
    }, {
      name: 'Musty/Dusty', value: 1
    }, {
      name: 'Musty/Earthy', value: 1
    }, {
      name: 'Animalic', value: 1
    }, {
      name: 'Meaty Brothy', value: 1
    }, {
      name: 'Phenolic', value: 1
    }]
  }, {
    name: 'Chemical',
    children: [{
      name: 'Bitter', value: 1
    }, {
      name: 'Salty', value: 1
    }, {
      name: 'Medicinal', value: 1
    }, {
      name: 'Petroleum', value: 1
    }, {
      name: 'Skunky', value: 1
    }, {
      name: 'Rubber', value: 1
    }]
  }]
}, {
  name: 'Roasted',
  children: [{
    name: 'Pipe Tobacco', value: 1
  }, {
    name: 'Tobacco', value: 1
  }, {
    name: 'Burnt',
    children: [{
      name: 'Acrid', value: 1
    }, {
      name: 'Ashy', value: 1
    }, {
      name: 'Smoky', value: 1
    }, {
      name: 'Brown, Roast', value: 1
    }]
  }, {
    name: 'Cereal',
    children: [{
      name: 'Grain', value: 1
    }, {
      name: 'Malt', value: 1
    }]
  }]
}, {
  name: 'Spices',
  children: [{
    name: 'Pungent', value: 1
  }, {
    name: 'Pepper', value: 1
  }, {
    name: 'Brown Spice',
    children: [{
      name: 'Anise', value: 1
    }, {
      name: 'Nutmeg', value: 1
    }, {
      name: 'Cinnamon', value: 1
    }, {
      name: 'Clove', value: 1
    }]
  }]
}, {
  name: 'Nutty/Cocoa',
  children: [{
    name: 'Nutty',
    children: [{
      name: 'Peanuts', value: 1
    }, {
      name: 'Hazelnut', value: 1
    }, {
      name: 'Almond', value: 1
    }]
  }, {
    name: 'Cocoa',
    children: [{
      name: 'Chocolate', value: 1
    }, {
      name: 'Dark Chocolate', value: 1
    }]
  }]
}, {
  name: 'Sweet',
  children: [{
    name: 'Brown Sugar',
    children: [{
      name: 'Molasses', value: 1
    }, {
      name: 'Maple Syrup', value: 1
    }, {
      name: 'Caramelized', value: 1
    }, {
      name: 'Honey', value: 1
    }]
  }, {
    name: 'Vanilla', value: 1
  }, {
    name: 'Vanillin', value: 1
  }, {
    name: 'Overall Sweet', value: 1
  }, {
    name: 'Sweet Aromatics', value: 1
  }]
}];

networkSeries.dataFields.linkWith = "linkWith";
networkSeries.dataFields.name = "name";
networkSeries.dataFields.id = "name";
networkSeries.dataFields.value = "value";
networkSeries.dataFields.children = "children";

networkSeries.nodes.template.tooltipText = "{name}";
networkSeries.nodes.template.fillOpacity = 1;

networkSeries.nodes.template.label.text = "{name}"
networkSeries.fontSize = 8;
networkSeries.maxLevels = 2;
networkSeries.maxRadius = am4core.percent(6);
networkSeries.manyBodyStrength = -16;
networkSeries.nodes.template.label.hideOversized = true;
networkSeries.nodes.template.label.truncate = true;

}); // end am4core.ready()
</script>
</head>
<body>

<div id="chartdiv"></div>

</body>
</html>