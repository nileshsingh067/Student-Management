<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Students Information Center</title>

<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!-- MetisMenu CSS -->
<link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="../vendor/morrisjs/morris.css" rel="stylesheet">
<style type="text/css">
/* carousel */
#quote-carousel 
{
  padding: 0 10px 30px 10px;
  margin-top: 30px;
}

/* Control buttons  */
#quote-carousel .carousel-control
{
  background: none;
  color: #222;
  font-size: 2.3em;
  text-shadow: none;
  margin-top: 30px;
}
/* Previous button  */
#quote-carousel .carousel-control.left 
{
  left: -12px;
}
/* Next button  */
#quote-carousel .carousel-control.right 
{
  right: -12px !important;
}
/* Changes the position of the indicators */
#quote-carousel .carousel-indicators 
{
  right: 50%;
  top: auto;
  bottom: 0px;
  margin-right: -19px;
}
/* Changes the color of the indicators */
#quote-carousel .carousel-indicators li 
{
  background: #c0c0c0;
}
#quote-carousel .carousel-indicators .active 
{
  background: #333333;
}
#quote-carousel img
{
  width: 250px;
  height: 100px
}
/* End carousel */

.item blockquote {
    border-left: none; 
    margin: 0;
}

.item blockquote img {
    margin-bottom: 10px;
}

.item blockquote p:before {
    content: "\f10d";
    font-family: 'Fontawesome';
    float: left;
    margin-right: 10px;
}



/**
  MEDIA QUERIES
*/

/* Small devices (tablets, 768px and up) */
@media (min-width: 768px) { 
    #quote-carousel 
    {
      margin-bottom: 0;
      padding: 0 40px 30px 40px;
    }
    
}

/* Small devices (tablets, up to 768px) */
@media (max-width: 768px) { 
    
    /* Make the indicators larger for easier clicking with fingers/thumb on mobile */
    
    #quote-carousel .carousel-indicators {
        bottom: -20px !important;  
    }
    #quote-carousel .carousel-indicators li {
        display: inline-block;
        margin: 0px 5px;
        width: 15px;
        height: 15px;
    }
    #quote-carousel .carousel-indicators li.active {
        margin: 0px 5px;
        width: 20px;
        height: 20px;
    }
}
</style>
<!--  script>
$(document).ready(function(){
  //Set the carousel options
  $('#quote-carousel').carousel({
    pause: true,
    interval: 500,
  });
});
</script-->
<!-- Custom Fonts -->
<link href="../vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  <script>
	function searchSortedCorosal() {
		var from_roll = document.getElementById("from_roll").value;
		var to_roll = document.getElementById("to_roll").value;

		//http://localhost:8080/student/webapi/stud/findByRoll?roll=MT2018069
		var URI = "http://localhost:" + location.port
				+ "/student/webapi/stud/findMultiple?from_roll=" + from_roll+"&to_roll="+to_roll;
		//{"DOB":"2018-10-29 13:20:21.0",
	//"avg_marks":75.0,"c_marks":74.0,"course":"M Tech(CSE)","id":1,"m_marks":76.0,"name":"Nilesh Kumar",
	//"p_marks":75.0,"percentage":0.0,"roll":"MT2018069","status":1,"statusMsg":"Done..."};
		$.ajax({
			type : 'GET',
			url : URI,
			//data: { get_param: 'value' }, 
			dataType : 'json',
			success : function(data) {
				var names = data
				//$('#name').html(data);
				var cnt=0;
				var tableData='<div id="myCarousel" class="carousel slide" data-ride="carousel"><ol class="carousel-indicators"><li data-target="#myCarousel" data-slide-to="0" class="active"></li><li data-target="#myCarousel" data-slide-to="1"></li><li data-target="#myCarousel" data-slide-to="2"></li></ol><div class="carousel-inner">';
				if(cnt==0){
				tableData = '<div class="item active">';
				}else {
					tableData = '<div class="item">';	
				}
				$.each(data, function(index, data) {//src="'+$pic+'"
				tableData += '<div class="col-xs-6 col-md-4"><img src="'+data.imgPath+'" height="100px" width="100px"/><br</br><div class="carousel-caption"><h3>'
				+ data.name + '</h3></div></div>';
				cnt=cnt+1;
				if(cnt%3==0){
					tableData+='</div><div class="item">';
				}
					});
				tableData += '</div></div><a class="left carousel-control" href="#myCarousel"data-slide="prev"> <spanclass="glyphicon glyphicon-chevron-left"></span> <spanclass="sr-only">Previous</span></a> <a class="right carousel-control" href="#myCarousel"data-slide="next"> <spanclass="glyphicon glyphicon-chevron-right"></span> <spanclass="sr-only">Next</span></a></div>';
				 console.log(tableData);
				$('tbl2').html(tableData);
				document.getElementById("msg").innerHTML = tableData;
			//	$('msg').innerHTML = tableData;

			}
		});

	}
</script>
     <script>
	function searchSorted() {
		var from_roll = document.getElementById("from_roll").value;
		var to_roll = document.getElementById("to_roll").value;
		var sort_by=document.getElementById("sort_by").value;

		//http://localhost:8080/student/webapi/stud/findByRoll?roll=MT2018069
		var URI = "http://localhost:" + location.port
				+ "/student/webapi/stud/findMultipleSorted?from_roll=" + from_roll+"&to_roll="+to_roll+"&sortby="+sort_by;
		//{"DOB":"2018-10-29 13:20:21.0",
	//"avg_marks":75.0,"c_marks":74.0,"course":"M Tech(CSE)","id":1,"m_marks":76.0,"name":"Nilesh Kumar",
	//"p_marks":75.0,"percentage":0.0,"roll":"MT2018069","status":1,"statusMsg":"Done..."};
		$.ajax({
			type : 'GET',
			url : URI,
			//data: { get_param: 'value' }, 
			dataType : 'json',
			success : function(data) {
				var names = data
				//$('#name').html(data);

				var tableData = '<table class="table"><thead><tr><th>Image </th><th>Name </th><th>Roll</th><th>Physics Mark</th><th>Chemistry Mark</th><th>Math Mark</th><th>Grade</th></tr></thead><tbody>';
				$.each(data, function(index, data) {//src="'+$pic+'"
				$pic= "http://localhost:8080/student/"+ data.photo;
				tableData += '<tr class="success"><td><img src="'+data.imgPath+'" height="100px" width="100px"/></td><td>'
				+ data.name + '</td><td>' + data.roll
				+ '</td> <td>' + data.p_marks + '</td><td>'
				+ data.c_marks + '</td><td>' + data.m_marks
				+ '</td> <td>' + data.grade
				+ '</td></tr>';
				});
				tableData += '</tbody></table>';
				 console.log(tableData);
				$('tbl2').html(tableData);
				document.getElementById("msg").innerHTML = tableData;

			}
		});

	}
</script>
<script>
	function searchDetailsByMarks() {
		var from_roll = document.getElementById("from_marks").value;
		var to_roll = document.getElementById("to_marks").value;
		var sort_by=document.getElementById("find_by").value;

		//http://localhost:8080/student/webapi/stud/findByRoll?roll=MT2018069
		var URI = "http://localhost:" + location.port
				+ "/student/webapi/stud/findMultipleByMarks?from_marks=" + from_roll+"&to_marks="+to_roll+"&find_by="+sort_by;
		//{"DOB":"2018-10-29 13:20:21.0",
	//"avg_marks":75.0,"c_marks":74.0,"course":"M Tech(CSE)","id":1,"m_marks":76.0,"name":"Nilesh Kumar",
	//"p_marks":75.0,"percentage":0.0,"roll":"MT2018069","status":1,"statusMsg":"Done..."};
		$.ajax({
			type : 'GET',
			url : URI,
			//data: { get_param: 'value' }, 
			dataType : 'json',
			success : function(data) {
				var names = data
				//$('#name').html(data);

				var tableData = '<table class="table"><thead><tr><th>Image </th><th>Name </th><th>Roll</th><th>Physics Mark</th><th>Chemistry Mark</th><th>Math Mark</th><th>Grade</th></tr></thead><tbody>';
				$.each(data, function(index, data) {//src="'+$pic+'"
				$pic= "http://localhost:8080/student/"+ data.photo;
				tableData += '<tr class="success"><td><img src="'+data.imgPath+'" height="100px" width="100px"/></td><td>'
				+ data.name + '</td><td>' + data.roll
				+ '</td> <td>' + data.p_marks + '</td><td>'
				+ data.c_marks + '</td><td>' + data.m_marks
				+ '</td> <td>' + data.grade
				+ '</td></tr>';
				});
				tableData += '</tbody></table>';
				 console.log(tableData);
				$('tbl2').html(tableData);
				document.getElementById("msg").innerHTML = tableData;

			}
		});

	}
</script>
     <script>
	function searchMultipleStudentSorted(sortby) {
		var from_roll = document.getElementById("from_roll").value;
		var to_roll = document.getElementById("to_roll").value;

		//http://localhost:8080/student/webapi/stud/findByRoll?roll=MT2018069
		var URI = "http://localhost:" + location.port
				+ "/student/webapi/stud/findMultipleSorted?from_roll=" + from_roll+"&to_roll="+to_roll+"&sortby="+sortby;
		//{"DOB":"2018-10-29 13:20:21.0",
	//"avg_marks":75.0,"c_marks":74.0,"course":"M Tech(CSE)","id":1,"m_marks":76.0,"name":"Nilesh Kumar",
	//"p_marks":75.0,"percentage":0.0,"roll":"MT2018069","status":1,"statusMsg":"Done..."};
		$.ajax({
			type : 'GET',
			url : URI,
			//data: { get_param: 'value' }, 
			dataType : 'json',
			success : function(data) {
				var names = data
				//$('#name').html(data);

				var tableData = '<table class="table"><thead><tr><th>Image </th><th>Name </th><th>Roll</th><th>Physics Mark</th><th>Chemistry Mark</th><th>Math Mark</th><th>Grade</th></tr></thead><tbody>';
				$.each(data, function(index, data) {//src="'+$pic+'"
				$pic= "http://localhost:8080/student/"+ data.photo;
				tableData += '<tr class="success"><td><img src="'+data.imgPath+'" height="100px" width="100px"/></td><td>'
				+ data.name + '</td><td>' + data.roll
				+ '</td> <td>' + data.p_marks + '</td><td>'
				+ data.c_marks + '</td><td>' + data.m_marks
				+ '</td> <td>' + data.grade
				+ '</td></tr>';
				});
				tableData += '</tbody></table>';
				 console.log(tableData);
				$('tbl2').html(tableData);
				document.getElementById("msg").innerHTML = tableData;

			}
		});

	}
</script>
    <script>
	function searchMultipleStudent() {
		var from_roll = document.getElementById("from_roll").value;
		var to_roll = document.getElementById("to_roll").value;

		//http://localhost:8080/student/webapi/stud/findByRoll?roll=MT2018069
		var URI = "http://localhost:" + location.port
				+ "/student/webapi/stud/findMultiple?from_roll=" + from_roll+"&to_roll="+to_roll;
		//{"DOB":"2018-10-29 13:20:21.0",
	//"avg_marks":75.0,"c_marks":74.0,"course":"M Tech(CSE)","id":1,"m_marks":76.0,"name":"Nilesh Kumar",
	//"p_marks":75.0,"percentage":0.0,"roll":"MT2018069","status":1,"statusMsg":"Done..."};
		$.ajax({
			type : 'GET',
			url : URI,
			//data: { get_param: 'value' }, 
			dataType : 'json',
			success : function(data) {
				var names = data
				//$('#name').html(data);

				var tableData = '<table class="table"><thead><tr><th>Image </th><th>Name </th><th>Roll</th><th>Physics Mark</th><th>Chemistry Mark</th><th>Math Mark</th><th>Grade</th></tr></thead><tbody>';
				$.each(data, function(index, data) {//src="'+$pic+'"
				$pic= "http://localhost:8080/student/"+ data.photo;
				tableData += '<tr class="success"><td><img src="'+data.imgPath+'" height="100px" width="100px"/></td><td>'
				+ data.name + '</td><td>' + data.roll
				+ '</td> <td>' + data.p_marks + '</td><td>'
				+ data.c_marks + '</td><td>' + data.m_marks
				+ '</td> <td>' + data.grade
				+ '</td></tr>';
				});
				tableData += '</tbody></table>';
				 console.log(tableData);
				$('tbl2').html(tableData);
				document.getElementById("msg").innerHTML = tableData;

			}
		});

	}
</script>
 <script>
	function searchMultipleStudentD2() {
		var from_roll = document.getElementById("from_roll").value;
		var to_roll = document.getElementById("to_roll").value;

		//http://localhost:8080/student/webapi/stud/findByRoll?roll=MT2018069
		var URI = "http://localhost:" + location.port
				+ "/student/webapi/stud/findMultiple?from_roll=" + from_roll+"&to_roll="+to_roll;
		//{"DOB":"2018-10-29 13:20:21.0",
	//"avg_marks":75.0,"c_marks":74.0,"course":"M Tech(CSE)","id":1,"m_marks":76.0,"name":"Nilesh Kumar",
	//"p_marks":75.0,"percentage":0.0,"roll":"MT2018069","status":1,"statusMsg":"Done..."};
		$.ajax({
			type : 'GET',
			url : URI,
			//data: { get_param: 'value' }, 
			dataType : 'json',
			success : function(data) {
				var names = data
				//$('#name').html(data);
//	 <div class="col-xs-6 col-md-4">.col-xs-6 .col-md-4</div>
				var tableData = '';
				$.each(data, function(index, data) {//src="'+$pic+'"
				$pic= "http://localhost:8080/student/"+ data.photo;
				tableData += '<div class="col-xs-6 col-md-4"><table><tr><td><img src="'+data.imgPath+'" height="100px" width="100px"/></td></tr><tr><td>Name : '
				+ data.name + '</td></tr><tr><td>Roll : ' + data.roll
				+ '</td> </tr><tr> <td>Grade : ' + data.grade
				+ '</td></tr></table></div>';
				});
				tableData += '';
				 console.log(tableData);
				$('tbl2').html(tableData);
				document.getElementById("msg").innerHTML = tableData;

			}
		});

	}
</script>
<script>
	function searchMultipleStudent1() {
		var from_roll = document.getElementById("from_roll").value;
		var to_roll = document.getElementById("to_roll").value;

		//http://localhost:8080/student/webapi/stud/findByRoll?roll=MT2018069
		var URI = "http://localhost:" + location.port
				+ "/student/webapi/stud/findMultiple?from_roll=" + from_roll+"&to_roll="+to_roll;
		//{"DOB":"2018-10-29 13:20:21.0",
	//"avg_marks":75.0,"c_marks":74.0,"course":"M Tech(CSE)","id":1,"m_marks":76.0,"name":"Nilesh Kumar",
	//"p_marks":75.0,"percentage":0.0,"roll":"MT2018069","status":1,"statusMsg":"Done..."};
		$.ajax({
			type : 'GET',
			url : URI,
			//data: { get_param: 'value' }, 
			dataType : 'json',
			success : function(data) {
				var names = data
				//$('#name').html(data);

				var tableData = '<table class="table"><thead><tr><th>Name </th><th>Roll</th><th>Physics Mark</th><th>Chemistry Mark</th><th>Math Mark</th><th>Grade</th></tr></thead><tbody>';
				$.each(data, function(index, data) {//src="'+$pic+'"
				$pic= "http://localhost:8080/student/"+ data.photo;
				tableData += '<tr class="success"><td>'
				+ data.name + '</td><td>' + data.roll
				+ '</td> <td>' + data.p_marks + '</td><td>'
				+ data.c_marks + '</td><td>' + data.m_marks
				+ '</td> <td>' + data.grade
				+ '</td></tr>';
				});
				tableData += '</tbody></table>';
				 console.log(tableData);
				$('tbl2').html(tableData);
				document.getElementById("msg").innerHTML = tableData;

			}
		});

	}
</script>
<script>
	function searchStudent() {
		var roll = document.getElementById("search_roll").value;

		//http://localhost:8080/student/webapi/stud/findByRoll?roll=MT2018069
		var URI = "http://localhost:" + location.port
				+ "/student/webapi/stud/findByRoll?roll=" + roll;
		//{"DOB":"2018-10-29 13:20:21.0",
	//"avg_marks":75.0,"c_marks":74.0,"course":"M Tech(CSE)","id":1,"m_marks":76.0,"name":"Nilesh Kumar",
	//"p_marks":75.0,"percentage":0.0,"roll":"MT2018069","status":1,"statusMsg":"Done..."};
		$.ajax({
			type : 'GET',
			url : URI,
			//data: { get_param: 'value' }, 
			dataType : 'json',
			success : function(data) {
				if(data.status==1){
				document.getElementById("td_name").innerHTML = data.name;
				document.getElementById("td_roll").innerHTML = data.roll;
				document.getElementById("td_phy").innerHTML = data.p_marks;
				document.getElementById("td_che").innerHTML = data.c_marks;
				document.getElementById("td_math").innerHTML = data.m_marks;
				document.getElementById("td_grade").innerHTML = data.grade;
				document.getElementById("td_avg").innerHTML = data.avg_marks;
				document.getElementById("td_per").innerHTML = data.avg_marks;
				document.getElementById("msg").innerHTML = data.statusMsg;
				document.getElementById("td_img").src=data.imgPath;
				}else{
					document.getElementById("msg").innerHTML = data.statusMsg;
				}
			}
		});

	}
</script>
<script>
	function updateStudentName() {
		var roll = document.getElementById("update_roll").value;
		var name = document.getElementById("update_name").value;

		//http://localhost:8080/student/webapi/stud/findByRoll?roll=MT2018069
		var URI = "http://localhost:" + location.port
				+ "/student/webapi/stud/updateName?roll=" + roll+"&name="+name;
		//{"DOB":"2018-10-29 13:20:21.0",
	//"avg_marks":75.0,"c_marks":74.0,"course":"M Tech(CSE)","id":1,"m_marks":76.0,"name":"Nilesh Kumar",
	//"p_marks":75.0,"percentage":0.0,"roll":"MT2018069","status":1,"statusMsg":"Done..."};
		$.ajax({
			type : 'GET',
			url : URI,
			//data: { get_param: 'value' }, 
			dataType : 'json',
			success : function(data) {
				
					document.getElementById("msg").innerHTML = data.statusMsg;
			
			}
		});

	}
</script>
<script>
	function updateStudentCourse() {
		var roll = document.getElementById("update_roll").value;
		var course = document.getElementById("update_course").value;

		//http://localhost:8080/student/webapi/stud/findByRoll?roll=MT2018069
		var URI = "http://localhost:" + location.port
				+ "/student/webapi/stud/updateCourse?roll=" + roll+"&course="+course;
		//{"DOB":"2018-10-29 13:20:21.0",
	//"avg_marks":75.0,"c_marks":74.0,"course":"M Tech(CSE)","id":1,"m_marks":76.0,"name":"Nilesh Kumar",
	//"p_marks":75.0,"percentage":0.0,"roll":"MT2018069","status":1,"statusMsg":"Done..."};
		$.ajax({
			type : 'GET',
			url : URI,
			//data: { get_param: 'value' }, 
			dataType : 'json',
			success : function(data) {
				
					document.getElementById("msg").innerHTML = data.statusMsg;
			
			}
		});

	}
</script>
<script>
function addStudent() {
  
  var name=document.getElementById("ip_name").value;
	  var roll=document.getElementById("ip_roll").value;
	  var course=document.getElementById("ip_course").value;
var p_m=document.getElementById("ip_pm").value;
var m_m=document.getElementById("ip_mm").value;
var c_m=document.getElementById("ip_cm").value;
//var dob=document.getElementById("d_dob").value;
	  //document.getElementById("name_1").value;
	  var URI="http://localhost:"+location.port+"/student/webapi/stud/add?name="+name+"&roll="+roll+"&course="+course+"&pm="+p_m+"&cm="+c_m+"&mm="+m_m+"&dob=na";
	  
	  $.ajax({
          type: "GET",
          url: URI,
         // data: JSON.stringify(data),// now data come in this function
          //contentType: "application/json; charset=utf-8",
          crossDomain: true,
          dataType: "json",
          success: function (data, status, jqXHR) {

             // alert("success: "+data);// write success in " "
        	  if(data.status==1){
        		 alert("success: "+data.statusMsg);
        	  }else{
        		 alert("Sorry Something went Wrong: "+data.statusMsg); 
        	  }
        	  document.getElementById("msg").innerHTML = data.statusMsg;
          },

          error: function (jqXHR, status) {
              // error handler
              console.log(jqXHR);
              alert('fail' + status.code);
          }
       });
}
</script>
</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">Academia Home</a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i
						class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-messages">
						<li><a href="#">
								<div>
									<strong>John Smith</strong> <span class="pull-right text-muted">
										<em>Yesterday</em>
									</span>
								</div>
								<div>Lorem ipsum dolor sit amet, consectetur adipiscing
									elit. Pellentesque eleifend...</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>Read
									All Messages</strong> <i class="fa fa-angle-right"></i>
						</a></li>
					</ul> <!-- /.dropdown-messages --></li>
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-tasks fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-tasks">
						<li><a href="#">
								<div>
									<p>
										<strong>Task 1</strong> <span class="pull-right text-muted">40%
											Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-success"
											role="progressbar" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100" style="width: 40%">
											<span class="sr-only">40% Complete (success)</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>

						<li><a class="text-center" href="#"> <strong>See
									All Tasks</strong> <i class="fa fa-angle-right"></i>
						</a></li>
					</ul> <!-- /.dropdown-tasks --></li>
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-alerts">
						<li><a href="#">
								<div>
									<i class="fa fa-comment fa-fw"></i> New Comment <span
										class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>

						<li><a class="text-center" href="#"> <strong>See
									All Alerts</strong> <i class="fa fa-angle-right"></i>
						</a></li>
					</ul> <!-- /.dropdown-alerts --></li>
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i> Students
								Profile</a></li>
						<li><a href="login.jsp"><i class="fa fa-gear fa-fw"></i> Logout</a>
						</li>
						<li class="divider"></li>
						<li><a href="chat.jsp"><i class="fa fa-sign-out fa-fw"></i>
								Go To Chat Box</a></li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
			<!-- /.navbar-top-links -->

			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li class="sidebar-search">
							<div class="input-group custom-search-form">
								<input type="text" class="form-control" placeholder="Search...">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div> <!-- /input-group -->
						</li>
						<li><a href="index.jsp"><i class="fa fa-dashboard fa-fw"></i>
								Dashboard</a></li>
						<li><a href="#"><i class="fa fa-table fa-fw"></i>
								Students<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="addStudent.jsp">Add Student</a></li>
								<li><a href="findStudent.jsp">Find Students</a></li>
								<li><a href="updateName.jsp">Update Name</a></li>
								<li><a href="updateAll.jsp">Update All</a></li>
								<li><a href="findMultipleD1.jsp">Find Multiple Students(D1)</a></li>
								<li><a href="findMultipleD2.jsp">Find Multiple Students(D2)</a></li>
								<li><a href="findMultipleD3.jsp">Find Multiple Students(D3)</a></li>
								<li><a href="findMultipleE1.jsp">Sort By Name(E1)</a></li>
								<li><a href="findMultipleE2.jsp">Sort By Grade(E2)</a></li>
								<li><a href="findMultipleE3.jsp">Sort By Marks(E3)</a></li>
								<li><a href="findMultipleF.jsp">Sort By Input(F)</a></li>
								<li><a href="carosuel.jsp">Slider</a></li>
								
							</ul> <!-- /.nav-second-level --></li>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>