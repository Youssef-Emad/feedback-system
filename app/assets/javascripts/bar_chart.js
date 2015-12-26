//google.load("visualization", "1.1", {packages:["bar"]});
google.charts.load("43", {packages:["bar"]});
google.charts.setOnLoadCallback(drawChart);
var length= $("#datalength").data("len");
var course_string = $("#course_chart").data("course");
var course_feedback = course_string.split(",")
var doc_string = $("#doc_chart").data("doc");
var type = $("#doc_chart").data("doc-type");
var doc_feedback = doc_string.split(",")
var ta_data = []
var ta_charts = []
function drawChart() {

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

	if (type == 'ta')
	{
		title = 'TA'
	}else{
		title = 'Professor'
	}

	var options2 = {
		chart: { title: title + ' Evaluation',
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

	var data1 = new google.visualization.arrayToDataTable([
			['Question Value', 'Very poor', 'Poor', 'Fair', 'Good', 'Very good', 'Excellent'],
			['Major relevance', course_feedback[0], course_feedback[1], course_feedback[2], course_feedback[3], course_feedback[4], course_feedback[5]],
			['Course richness', course_feedback[6], course_feedback[7], course_feedback[8], course_feedback[9], course_feedback[10], course_feedback[11]],
			['Sufficient time', course_feedback[12], course_feedback[13], course_feedback[14], course_feedback[15], course_feedback[16], course_feedback[17]],
			['Career relevance', course_feedback[18], course_feedback[19], course_feedback[20], course_feedback[21], course_feedback[22], course_feedback[23]],
			['Sufficient material', course_feedback[24], course_feedback[25], course_feedback[26], course_feedback[27], course_feedback[28], course_feedback[29]]
			]);

	var data2 = new google.visualization.arrayToDataTable([
			['Question Value', 'Very poor', 'Poor', 'Fair', 'Good', 'Very good', 'Excellent'],
			['Commitment', doc_feedback[0], doc_feedback[1], doc_feedback[2], doc_feedback[3], doc_feedback[4], doc_feedback[5]],
			['Delivery', doc_feedback[6], doc_feedback[7], doc_feedback[8], doc_feedback[9], doc_feedback[10], doc_feedback[11]],
			['Exams', doc_feedback[12], doc_feedback[13], doc_feedback[14], doc_feedback[15], doc_feedback[16], doc_feedback[17]],
			['Motivation', doc_feedback[18], doc_feedback[19], doc_feedback[20], doc_feedback[21], doc_feedback[22], doc_feedback[23]],
			['Organization', doc_feedback[24], doc_feedback[25], doc_feedback[26], doc_feedback[27], doc_feedback[28], doc_feedback[29]]
			]);
	
	for (var i = 0; i < length; i++) 
    {
    	var ta_string = $("#ta_chart"+(i+3)).data("ta");
		var ta_feedback = ta_string.split(",")
		ta_data[i] = new google.visualization.arrayToDataTable([
				['Question Value', 'Very poor', 'Poor', 'Fair', 'Good', 'Very good', 'Excellent'],
				['Commitment', ta_feedback[30*i + 0], ta_feedback[30*i + 1], ta_feedback[30*i + 2], ta_feedback[30*i + 3], ta_feedback[30*i + 4], ta_feedback[30*i + 5]],
				['Delivery', ta_feedback[30*i + 6], ta_feedback[30*i + 7], ta_feedback[30*i + 8], ta_feedback[30*i + 9], ta_feedback[30*i + 10], ta_feedback[30*i + 11]],
				['Exams', ta_feedback[30*i + 12], ta_feedback[30*i + 13], ta_feedback[30*i + 14], ta_feedback[30*i + 15], ta_feedback[30*i + 16], ta_feedback[30*i + 17]],
				['Motivation', ta_feedback[30*i + 18], ta_feedback[30*i + 19], ta_feedback[30*i + 20], ta_feedback[30*i + 21], ta_feedback[30*i + 22], ta_feedback[30*i + 23]],
				['Organization', ta_feedback[30*i + 24], ta_feedback[30*i + 25], ta_feedback[30*i + 26], ta_feedback[30*i + 27], ta_feedback[30*i + 28], ta_feedback[30*i + 29]]
				]);
	}

	var chart1 = new google.charts.Bar(document.getElementById('course_chart'));
	chart1.draw(data1, google.charts.Bar.convertOptions(options1));

	var chart2 = new google.charts.Bar(document.getElementById('doc_chart'));
	chart2.draw(data2, google.charts.Bar.convertOptions(options2));

	for (var i = 0 ; i< length ;i++)
	{
		ta_charts[i] = new google.charts.Bar(document.getElementById('ta_chart'+(i+3)));
		ta_charts[i].draw(ta_data[i], google.charts.Bar.convertOptions(options3));
	}

	function resizeHandler () {
		chart1.draw(data1, google.charts.Bar.convertOptions(options1));
		chart2.draw(data2, google.charts.Bar.convertOptions(options2));
		for (var i = 0 ; i<length ;i++)
		{
			ta_charts[i].draw(ta_data[i], google.charts.Bar.convertOptions(options3));
		}
	}
	if (window.addEventListener) {
		window.addEventListener('resize', resizeHandler, false);
	}
	else if (window.attachEvent) {
		window.attachEvent('onresize', resizeHandler);
	}
}

