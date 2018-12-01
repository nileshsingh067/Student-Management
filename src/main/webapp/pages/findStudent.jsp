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
					<div class="col-lg-3">
						<!--  form role="form"-->
							<div class="form-group">
								<label>Roll</label> <input class="form-control" id="search_roll"
									placeholder="Enter Roll Number">
							</div>
							<button type="submit" onclick="searchStudent()" class="btn btn-default">Find</button>
						<!--  /form-->
					</div>
				</div>
				<div class="row">
				<div class="col-lg-6">
				<p id="msg" style="color:red;"></p>
				</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">Student Details</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
											<th>Image </th>
												<th>Name </th>
												<th>Roll</th>
												<th>Physics Mark</th>
												<th>Chemistry Mark</th>
												<th>Math Mark</th>
												<th>Grade</th>
												<th>Average</th>
												<th>Percentage(%)</th>
												
												
											</tr>
										</thead>
										<tbody>
											<tr class="success">
												<td><img id="td_img"  height="100px" width="100px"/></td>
												<td id="td_name"></td>
												<td id="td_roll"></td>
												<td id="td_phy"></td>
												<td id="td_che"></td>
												<td id="td_math"></td>
												<td id="td_grade"></td>
												<td id="td_avg"></td>
												<td id="td_per"></td>
											</tr>
										</tbody>
									</table>
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