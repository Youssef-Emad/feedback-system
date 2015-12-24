//google.load("visualization", "1.1", {packages:["bar"]});
google.charts.load("43", {packages:["bar"]});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
	var data1 = new google.visualization.arrayToDataTable([
			['Question Value', 'Very poor', 'Poor', 'Fair', 'Good', 'Very good', 'Excellent'],
			['Major relevance', 25, 20, 10, 22, 15, 8],
			['Course richness', 40, 10, 5, 7, 13, 25],
			['Sufficient time', 5, 7, 3, 15, 20, 50],
			['Career relevance', 10, 10, 20, 10, 30, 20],
			['Sufficient material', 20, 2, 3, 28, 35, 12]
			]);

	var data2 = new google.visualization.arrayToDataTable([
			['Question Value', 'Very poor', 'Poor', 'Fair', 'Good', 'Very good', 'Excellent'],
			['Commitment', 25, 10, 20, 22, 15, 8],
			['Delivery', 40, 10, 5, 7, 23, 15],
			['Exams', 5, 7, 3, 15, 30, 40],
			['Motivation', 10, 10, 20, 25, 15, 20],
			['Organization', 10, 2, 3, 28, 45, 12]
			]);

	var data3 = new google.visualization.arrayToDataTable([
			['Question Value', 'Very poor', 'Poor', 'Fair', 'Good', 'Very good', 'Excellent'],
			['Commitment', 25, 10, 20, 22, 15, 8],
			['Delivery', 40, 10, 5, 7, 23, 15],
			['Support', 5, 7, 3, 15, 30, 40],
			['Communication', 10, 10, 20, 25, 15, 20],
			['Organization', 10, 2, 3, 28, 45, 12]
			]);

	var options1 = {
		chart: { title: 'Course Evaluation',
						 subtitle: 'Average score for each question'},
		fontName: 'Roboto',
		fontSize: 16,
		axisTitlesPoistion: 'none',
		titleTextStyle: { color: 'white', fontSize: 20 }, 
		hAxis:  { title: '', textStyle: { color: 'white' } }, 
		vAxis:  { textStyle: { color: 'white' } },
		legend: { textStyle: { color: 'white' } },
		colors: ['#1b9e77', '#d95f02', '#7570b3'],
		backgroundColor: 'transparent'
	};

	var options2 = {
		chart: { title: 'PHD Evaluation',
						 subtitle: 'Average score for each question'},
		fontName: 'Roboto',
		fontSize: 16,
		axisTitlesPoistion: 'none',
		titleTextStyle: { color: 'white', fontSize: 20 }, 
		hAxis:  { title: '', textStyle: { color: 'white', fontSize: '70%' } }, 
		vAxis:  { textStyle: { color: 'white' } },
		legend: { textStyle: { color: 'white' } },
		colors: ['#1b9e77', '#d95f02', '#7570b3'],
		backgroundColor: 'transparent'
	};

	var options3 = {
		chart: { title: 'TA Evaluation',
						 subtitle: 'Average score for each question'},
		fontName: 'Roboto',
		fontSize: 16,
		axisTitlesPoistion: 'none',
		titleTextStyle: { color: 'white', fontSize: 20 }, 
		hAxis:  { title: '', textStyle: { color: 'white', fontSize: '70%' } }, 
		vAxis:  { textStyle: { color: 'white' } },
		legend: { textStyle: { color: 'white' } },
		colors: ['#1b9e77', '#d95f02', '#7570b3'],
		backgroundColor: 'transparent'
	};

	var chart1 = new google.charts.Bar(document.getElementById('bar_chart1'));
	chart1.draw(data1, google.charts.Bar.convertOptions(options1));

	var chart2 = new google.charts.Bar(document.getElementById('bar_chart2'));
	chart2.draw(data2, google.charts.Bar.convertOptions(options2));

	var chart3 = new google.charts.Bar(document.getElementById('bar_chart3'));
	chart3.draw(data3, google.charts.Bar.convertOptions(options3));

	function resizeHandler () {
		chart1.draw(data1, google.charts.Bar.convertOptions(options1));
		chart2.draw(data2, google.charts.Bar.convertOptions(options2));
		chart2.draw(data3, google.charts.Bar.convertOptions(options3));
	}
	if (window.addEventListener) {
		window.addEventListener('resize', resizeHandler, false);
	}
	else if (window.attachEvent) {
		window.attachEvent('onresize', resizeHandler);
	}
}

