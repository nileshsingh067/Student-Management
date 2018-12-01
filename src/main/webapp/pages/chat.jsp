<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<% String WsUrl = getServletContext().getInitParameter("WsUrl"); %>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Online Chat</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">chat</div>
			<div class="panel-body">
			<div id="container">
	<div id="loginPanel">
		<div id="infoLabel">Type a name to join the room</div>
		<div style="padding: 10px;">
			<input id="txtLogin" type="text" class="loginInput"
				onkeyup="proxy.login_keyup(event)" />
			<button type="button" class="loginInput" onclick="proxy.login()">Login</button>
		</div>
	</div>
	<div id="msgPanel" style="display: none">
		<div id="msgContainer" style="overflow: auto;"></div>
		<div id="msgController">
			<textarea id="txtMsg" 
				title="Enter to send message"
				onkeyup="proxy.sendMessage_keyup(event)"
				style="height: 20px; width: 100%"></textarea>
			<button style="height: 30px; width: 100px" type="button"
				onclick="proxy.logout()">Logout</button>
		</div>
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
<link rel="stylesheet" type="text/css" href="content/styles/site.css">
<script type="text/javascript" src="../scripts/chatroom.js"></script>
<script type="text/javascript">
var wsUri = '<%=WsUrl%>';
var proxy = CreateProxy(wsUri);

document.addEventListener("DOMContentLoaded", function(event) {
	console.log(document.getElementById('loginPanel'));
	proxy.initiate({
		loginPanel: document.getElementById('loginPanel'),
		msgPanel: document.getElementById('msgPanel'),
		txtMsg: document.getElementById('txtMsg'),
		txtLogin: document.getElementById('txtLogin'),
		msgContainer: document.getElementById('msgContainer')
	});
});

</script>
</body>

</html>