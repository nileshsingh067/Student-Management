<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Update Student Details</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Search Student Details</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-3">
					<span style="color: Black"><strong><h4>Enter Roll No To Update :</h4></strong></span>
						<div class="form-group">
							<input type="text" class="form-control" id="rollno" name="rollno"
								placeholder="Enter Roll No" value="" required autocomplete="off" />
						</div>
					</div>
					<div class="col-md-12">
					<button type="submit" onclick="myFunction()" class="btn btn-default">Find</button>
			</div>
				</div>
				<div class="row">
				<div class="col-md-3">
					<span style="color: Black"><strong><h4>Student
								Name :</h4></strong></span>
					<div class="form-group">
						<input type="text" class="form-control" id="name" name="name"
							placeholder="Your Name" minlength="0" maxlength="20"
							autocomplete="off" required />
					</div>
					<span style="color: Black"><strong><h4>Physics
								Marks :</h4></strong></span>
					<div class="form-group">
						<input type="text" class="form-control" id="physics"
							name="physics" placeholder="Physics Marks" minlength="0"
							maxlength="3" autocomplete="off" required />
					</div>


				</div>
				<div class="col-md-3">
					<span style="color: Black"><strong><h4>Math
								Marks :</h4></strong></span>
					<div class="form-group">
						<input type="text" class="form-control" id="math" name="math"
							placeholder="Math Marks" minlength="0" maxlength="3"
							autocomplete="off" required />
					</div>
					<span style="color: Black"><strong><h4>Chemistry
								Marks :</h4></strong></span>
					<div class="form-group">
						<input type="text" class="form-control" id="chemistry"
							name="chemistry" placeholder="Chemistry Marks" minlength="0"
							maxlength="3" autocomplete="off" required />
					</div>

				</div>
				</div>
				<div class="row">
				<div class="col-md-6">
					<button type="submit" id="update-submit" class="btn btn-default">Find</button>
			</div>
				</div>
				<!--  /form-->
				<div class="row">
					<div class="col-lg-6">
				<p id="msg" style="color:red;"></p>
				</div>
				</div>
			</div>
			

		</div>
	</div>

</div>
<!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->
<!-- jQuery -->
<script src="../vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="../vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="../dist/js/sb-admin-2.js"></script>

<script>
	function myFunction() {
		var roll = document.getElementById("rollno").value;
		var URI = "http://localhost:" + location.port
				+ "/student/webapi/stud/findByRoll?roll=" + roll;
		$.ajax({
			type : 'GET',
			url : URI,
			crossDomain : true,
			dataType : 'json',
			success : function(data) {
				var names = data
				$('#name').val(data.name);
				$('#physics').val(data.p_marks);
				$('#math').val(data.m_marks);
				$('#chemistry').val(data.c_marks);
				//$('#dob').val(data.DOB);
			}
		});

	}
</script>
<script>
	$(document).ready(function() {
						$("#update-submit").click(function(event) {
											event.preventDefault();
											event.stopPropagation();
											 $("#update-submit").prop("disabled", true);
											var name1 = $("#name").val();
											var roll = $("#rollno").val();
											var phy = $("#physics").val();
											var chem = $("#chemistry").val();
											var maths = $("#math").val();
											var dob1 = $("#dob").val();
											var pic = $("#photo").val();
											var post_data = {
												"name" : name1,
												"roll" : roll,
												"p_marks" : phy,
												"m_marks" : maths,
												"c_marks" : chem
											};
											console.log("Request Data :: "+JSON.stringify(post_data));
											var URI = "http://localhost:"
													+ location.port
													+ "/student/webapi/stud/update?name="+name1+"&roll="+roll+"&m_marks="+maths+"&c_marks="+chem+"&p_marks="+phy;
											console.log("URL :: "+URI);
											$.ajax({
														type : "GET",
														url : URI,
														headers : {
															'Content-Type' : 'application/json',
														},
														//data : JSON.stringify(post_data),
														success : function(data) {
															$("#msg").text(data.statusMsg);
											                console.log("SUCCESS : ", data);
											                $("#update-submit").prop("disabled", false);

														},
														dataType : "json"
													});
										});
					});
</script>


</body>

</html>