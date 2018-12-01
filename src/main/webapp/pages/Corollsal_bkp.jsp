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
			<div class="panel-heading">Find Multiple Student's Details</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-6">
						<!--  form role="form"-->
						<div class="form-group">
							<label>From Roll</label> <input class="form-control"
								id="from_roll" placeholder="Enter From Roll No">
						</div>
						<div class="form-group">
							<label>To Roll</label> <input class="form-control" id="to_roll"
								placeholder="Enter To Roll No">
						</div>
						<button type="submit" onclick="searchSortedCorosal()"
							class="btn btn-default">Find</button>
						<!--  /form-->
						<%
							
						%>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6"></div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">Students Details</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<!--div class="table-responsive" id="tbl">
									<p id="msg"></p>
								</div-->
								<!-- /.table-responsive -->
								<!-- Carousel Start Here  -->
								
										<div class="table-responsive" id="tbl">
											<div id="msg"></div>
										</div>
										





									<!--  div class="item active">
										<div class="col-xs-6 col-md-4">
											<img src="../img/06.jpg" height="100px" width="100px" />
											<div class="carousel-caption">
												<h3>Pankaj</h3>
											</div>
										</div>
										<div class="col-xs-6 col-md-4">
											<img src="../img/20181104_022202.jpg" height="100px"
												width="100px" />
											<div class="carousel-caption">
												<h3>Karuna Nidhan</h3>
											</div>
										</div>
										<div class="col-xs-6 col-md-4">
											<img src="../img/20181104_022453.jpg" height="100px"
												width="100px" />
											<div class="carousel-caption">
												<h3>Saurab</h3>
												
											</div>
										</div>
									</div>
									<div class="item">
										<div class="col-xs-6 col-md-4">
											<img src="../img/prashant.png" height="100px" width="100px" />
											<div class="carousel-caption">
												<h3>Prashant</h3>
											</div>
										</div>
										<div class="col-xs-6 col-md-4">
											<img src="../img/prashant.png" height="100px" width="100px" />
											<div class="carousel-caption">
												<h3>Prashant</h3>
											</div>
										</div>
										<div class="col-xs-6 col-md-4">
											<img src="../img/prashant.png" height="100px" width="100px" />
											<div class="carousel-caption">
												<h3>Prashant</h3>
											</div>
										</div>
									</div-->

										
										






									<!--div class="item">
										<div class="col-xs-6 col-md-4">
											<img src="http://via.placeholder.com/300x300?text=1" alt="Los Angeles"/>
											</div>
											<div class="col-xs-6 col-md-4">
											<img src="http://via.placeholder.com/300x300?text=1" alt="Los Angeles"/>
											</div>
											<div class="col-xs-6 col-md-4">
											<img src="http://via.placeholder.com/300x300?text=1" alt="Los Angeles"/>
											</div>
										</div>

										<div class="item">
										<div class="col-xs-6 col-md-4">
											<img src="http://via.placeholder.com/300x300?text=3" alt="Chicago"/>
											</div>
											<div class="col-xs-6 col-md-4">
											<img src="http://via.placeholder.com/300x300?text=3" alt="Chicago"/>
											</div>
											<div class="col-xs-6 col-md-4">
											<img src="http://via.placeholder.com/300x300?text=3" alt="Chicago"/>
											</div>
										</div>

										<div class="item">
										<div class="col-xs-6 col-md-4">
											<img src="http://via.placeholder.com/300x300" alt="New York"/>
											</div>
											<div class="col-xs-6 col-md-4">
											<img src="http://via.placeholder.com/300x300" alt="New York"/>
											</div>
											<div class="col-xs-6 col-md-4">
											<img src="http://via.placeholder.com/300x300" alt="New York"/>
											</div>
										</div>
									</div  -->

									<!-- Left and right controls -->
									
								<!--/div-->
								<!-- Carousel End Here  -->
							<!--/div-->
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