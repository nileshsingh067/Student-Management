<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

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
                        <div class="panel-heading">
                            Enter Student Details
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" method="POST" enctype="multipart/form-data" id="fileUploadForm">
                                        <div class="form-group">
                                            <label>Name</label>
                                            <input type="text" class="form-control" name="ip_name" id="ip_name" placeholder="Enter Full Name" required="true"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Roll</label>
                                            <input type="text" class="form-control" name="ip_roll" id="ip_roll" placeholder="Enter Roll Name" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Selects Course</label>
                                            <select class="form-control" name="ip_course" id="ip_course">
                                                <option>M.Tech(CSE)</option>
                                                <option>M.Tech(ECE)</option>
                                                <option>iM.Tech</option>
                                                <option>MS.Digisoc</option>
                                                <option>M.Tech(IT)</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Physics Mark</label>
                                            <input type="text" class="form-control" name="ip_pm" id="ip_pm" placeholder="Enter Physics Marks" required>
                                        </div>
                                         <div class="form-group">
                                            <label>Math Mark</label>
                                            <input type="text" class="form-control" name="ip_mm" id="ip_mm" placeholder="Enter Math Marks" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Chemistry Mark</label>
                                            <input type="text" class="form-control" name="ip_cm" id="ip_cm" placeholder="Enter Chemistry Marks" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Upload Image</label>
                                            <input type="file" class="form-control" id="file" name="file" required>
                                        </div>
                                        <button type="submit" class="btn btn-default" id="btnSubmit">Submit</button>
                                        <button type="reset" class="btn btn-default">Reset Button</button>
                                    </form>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-6">
                                <div class="row">
										<p id="result" style="color:red;"></p>
									</div>
									
                                  <!--  <h1>Disabled Form States</h1>
                                    <form role="form">
                                        <fieldset disabled>
                                            <div class="form-group">
                                                <label for="disabledSelect">Disabled input</label>
                                                <input class="form-control" id="disabledInput" type="text" placeholder="Disabled input" disabled>
                                            </div>
                                            <div class="form-group">
                                                <label for="disabledSelect">Disabled select menu</label>
                                                <select id="disabledSelect" class="form-control">
                                                    <option>Disabled select</option>
                                                </select>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox">Disabled Checkbox
                                                </label>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Disabled Button</button>
                                        </fieldset>
                                    </form>
                                    <h1>Form Validation States</h1>
                                    <form role="form">
                                        <div class="form-group has-success">
                                            <label class="control-label" for="inputSuccess">Input with success</label>
                                            <input type="text" class="form-control" id="inputSuccess">
                                        </div>
                                        <div class="form-group has-warning">
                                            <label class="control-label" for="inputWarning">Input with warning</label>
                                            <input type="text" class="form-control" id="inputWarning">
                                        </div>
                                        <div class="form-group has-error">
                                            <label class="control-label" for="inputError">Input with error</label>
                                            <input type="text" class="form-control" id="inputError">
                                        </div>
                                    </form>
                                    <h1>Input Groups</h1>
                                    <form role="form">
                                        <div class="form-group input-group">
                                            <span class="input-group-addon">@</span>
                                            <input type="text" class="form-control" placeholder="Username">
                                        </div>
                                        <div class="form-group input-group">
                                            <input type="text" class="form-control">
                                            <span class="input-group-addon">.00</span>
                                        </div>
                                        <div class="form-group input-group">
                                            <span class="input-group-addon"><i class="fa fa-eur"></i>
                                            </span>
                                            <input type="text" class="form-control" placeholder="Font Awesome Icon">
                                        </div>
                                        <div class="form-group input-group">
                                            <span class="input-group-addon">$</span>
                                            <input type="text" class="form-control">
                                            <span class="input-group-addon">.00</span>
                                        </div>
                                        <div class="form-group input-group">
                                            <input type="text" class="form-control">
                                            <span class="input-group-btn">
                                                <button class="btn btn-default" type="button"><i class="fa fa-search"></i>
                                                </button>
                                            </span>
                                        </div>
                                    </form>
                                </div>-->
                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
$(document).ready(function () {

    $("#btnSubmit").click(function (event) {

        //stop submit the form, we will post it manually.
        event.preventDefault();

        // Get form
        var form = $('#fileUploadForm')[0];

		// Create an FormData object 
        var data = new FormData(form);

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