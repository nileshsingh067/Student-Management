<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Find Multiple Student's</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Find Multiple Student's Details(Sort By Name)</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-6">
						<!--  form role="form"-->
							<div class="form-group">
								<label>From Roll</label> <input class="form-control" id="from_roll"
									placeholder="Enter From Roll No">
							</div>
							<div class="form-group">
								<label>To Roll</label> <input class="form-control" id="to_roll"
									placeholder="Enter To Roll No">
							</div>
							<button type="submit" onclick="searchMultipleStudentSorted('name')" class="btn btn-default">Find</button>
						<!--  /form-->
					</div>
				</div>
				<div class="row">
				<div class="col-lg-6">
				
				</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">Students Details</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="table-responsive" id="tbl">
									<p id="msg"></p>
								</div>
								<!-- /.table-responsive -->
							</div>
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->
					</div>
					<!-- /.col-lg-6 -->
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