<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>


<%@page import="com.nilesh.DAO.StudentDAO"%>
<%@page import="com.nilesh.model.Student"%>
<%@page import="java.util.*"%>
<%
	List<Student> studentList = null;
	long roll1 = strToLong(request.getParameter("roll1"), 0L);
	long roll2 = strToLong(request.getParameter("roll2"), 0L);
	try {
		StudentDAO stDAO = new StudentDAO();
		studentList = stDAO.getStudentsBetween(roll1, roll2);
	} catch (Exception e) {
		System.out.println("Exception :: " + e);
	}
%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

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
					<div class="col-lg-3">
						<form role="form">
						<div class="form-group">
							<label>From Roll</label> <input class="form-control"
								id="from_roll" name="roll1" placeholder="Enter From Roll No" autocomplete="off">
						</div>
						<div class="form-group">
							<label>To Roll</label> <input class="form-control" id="to_roll"
								name="roll2" placeholder="Enter To Roll No" autocomplete="off">
						</div>
						<button type="submit" 
							class="btn btn-default">Find</button>
						</form>
						<%
							
						%>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-3"></div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">Students Details</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<!--div class="table-responsive" id="tbl">
											<div id="msg"></div>
										</div-->
								<!-- Corosal Starts Here -->

									<div class="row">
										<div class='col-lg-12 text-center'>
											<h2>Student Details</h2>
										</div>
									</div>
										<div class='col-lg-12'>
											<div class="carousel slide" data-ride="carousel"
												id="quote-carousel">
												<!-- Bottom Carousel Indicators -->
												<ol class="carousel-indicators">
													<li data-target="#quote-carousel" data-slide-to="0"
														class="active"></li>
													<li data-target="#quote-carousel" data-slide-to="1"></li>
													<li data-target="#quote-carousel" data-slide-to="2"></li>
												</ol>

												<!-- The slideshow -->
												<div class="carousel-inner">
													<%
														boolean flag = false;
														for (Student s : studentList) {

															if (!flag) {
																flag = true;
													%>
													<div class="item active">
														<blockquote>
															<div class="row">
																<div class="col-lg-6 text-center ">
																	<img class="img-circle" src="<%=s.getImgPath()%>"
																		style="width: 100px; height: 100px;">
																	<!--<img class="img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/kolage/128.jpg" style="width: 100px;height:100px;">-->
																</div>
																<div class="col-lg-6">
																	<table>
																	<tr><td>Name : </td><td><%=s.getName()%></td></tr>
																	<tr><td>Roll : </td><td><%=s.getRoll()%></td></tr>
																	<tr><td>Grade : </td><td><%=s.getGrade()%></td></tr>
																	</table>
																	<!--small><%=s.getName()%></small  -->
																</div>
															</div>
														</blockquote>
													</div>
													<%
														} else {
													%>
													<div class="item">
														<blockquote>
															<div class="row">
																<div class="col-lg-6 text-center">
																	<img class="img-circle" src="<%=s.getImgPath()%>"
																		style="width: 100px; height: 100px;">
																</div>
																<div class="col-lg-6">
																	<table>
																	<tr><td>Name : </td><td><%=s.getName()%></td></tr>
																	<tr><td>Roll : </td><td><%=s.getRoll()%></td></tr>
																	<tr><td>Grade : </td><td><%=s.getGrade()%></td></tr>
																	</table>
																	<!--small><%=s.getName()%></small  -->
																</div>
															</div>
														</blockquote>
													</div>
													<%
														}
														}
													%>


												</div>

												<!-- Carousel Buttons Next/Prev -->
												<a data-slide="prev" href="#quote-carousel"
													class="left carousel-control"><i
													class="fa fa-chevron-left"></i></a> <a data-slide="next"
													href="#quote-carousel" class="right carousel-control"><i
													class="fa fa-chevron-right"></i></a>
											</div>
										</div>

								<!-- Corosal Ends Here  -->
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
<%!public long strToLong(String str, long defaultVal) {
		long retVal = defaultVal;
		try {
			retVal = Long.parseLong(str);
		} catch (Exception e) {
			retVal = defaultVal;
		}
		return retVal;
	}%>