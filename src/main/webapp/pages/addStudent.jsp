<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Add Student</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Enter Student Details</div>
				<div class="panel-body">
				<form role="form" method="POST" enctype="multipart/form-data" id="fileUploadForm">
					<div class="row">
						<div class="col-lg-3">
							
								<div class="form-group">
									<label>Name</label> <input type="text" class="form-control" 
										name="ip_name" id="ip_name"  placeholder="Enter Full Name"
										required />
								</div>
								<div class="form-group">
									<label>Roll</label> <input type="text" class="form-control"
										name="ip_roll" id="ip_roll" placeholder="Enter Roll Name"
										required>
								</div>
								<div class="form-group">
									<label>Physics Mark</label> <input type="text"
										class="form-control" name="ip_pm" id="ip_pm"
										placeholder="Enter Physics Marks" required>
								</div>

						
						</div>
						<!-- /.col-lg-6 (nested) -->
						<div class="col-lg-3">
							<div class="form-group">
								<label>Math Mark</label> <input type="text" class="form-control"
									name="ip_mm" id="ip_mm" placeholder="Enter Math Marks" required>
							</div>
							<div class="form-group">
								<label>Chemistry Mark</label> <input type="text"
									class="form-control" name="ip_cm" id="ip_cm"
									placeholder="Enter Chemistry Marks" required>
							</div>
							<div class="form-group">
								<label>Password</label> <input type="password"
									class="form-control" id="pass" name="pass" required>
							</div>
						</div>
							<div class="col-lg-3">
							<div class="form-group">
								<label>Upload Image</label> <input type="file"
									class="form-control" id="file" name="file" required>
							</div>
							</div>



						<!-- /.row (nested) -->
					</div>
					<div class="row">
						<div class="col-lg-6">
									<button type="submit" class="btn btn-default" id="btnSubmit">Submit</button>
									<button type="reset" class="btn btn-default">Reset
										Button</button>
										</div>
						</div>
						<div class="row">
							<p id="result" style="color: red;"></p>
						</div>
					<!-- /.panel-body -->
					</form>
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
$(document).ready(function () {

    $("#btnSubmit").click(function (event) {

        //stop submit the form, we will post it manually.
        event.preventDefault();

        // Get form
        var form = $('#fileUploadForm')[0];

		// Create an FormData object 
        var data = new FormData(form);
        console.log("DATA : ", data);
		// If you want to add an extra field for the FormData
       // data.append("CustomField", "This is some extra data, testing");

		// disabled the submit button
        $("#btnSubmit").prop("disabled", true);

        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "http://localhost:8080/student/webapi/stud/addStudent",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (data) {

                $("#result").text(data.statusMsg);
                console.log("SUCCESS : ", data);
                $("#btnSubmit").prop("disabled", false);

            },
            error: function (e) {

                $("#result").text(e.responseText);
                console.log("ERROR : ", e);
                $("#btnSubmit").prop("disabled", false);

            }
        });

    });

});

</script>
</body>

</html>