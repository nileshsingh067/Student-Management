<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Find Student</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Search Student Details</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-6">
						<!--  form role="form"-->
							<div class="form-group">
								<label>Roll</label> <input class="form-control" id="update_roll"
									placeholder="Enter Roll No">
							</div>
							<div class="form-group">
								<label>Name</label> <input class="form-control" id="update_name"
									placeholder="Enter Name To Be Update">
							</div>
							<button type="submit" onclick="updateStudentName()" class="btn btn-default">Update</button>
						<!--  /form-->
					</div>
				</div>
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

</body>

</html>