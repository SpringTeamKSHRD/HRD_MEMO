<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>User Password</title>  
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"><!-- Tell the browser to be responsive to screen width -->	
	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<!-- bootstrap -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script>
	<!-- Jasny Bootstrp -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/jasny-bootstrap/css/jasny-bootstrap.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/jasny-bootstrap/js/jasny-bootstrap.js"></script>
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	<!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- Sweet Alert --> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert-master/dist/sweetalert.css"/>
	<!-- Own Style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/password.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/profile.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/user_report.css">
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-default"> <!-- navbar-fixed-top -->
	<div class="container-fluid">
		<div class="navbar-header">
		  <a href="#!" class="brand-logo">&nbsp;&nbsp;<i class="fa fa-file-text" style="font-size: 20px;"></i></a>
		</div>	
		<!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	    </div>
    	<!-- close brand toggle -->    	   
		<!-- Collect the nav links, forms, and other content for toggling -->
		<!-- <div class="collapse navbar-collapse navbar-ex1-collapse"> -->
		 <div class="collapse navbar-collapse"  id="bs-example-navbar-collapse-1">
		  <ul class="nav navbar-nav navbar-right">		  	
			<li><a href="${pageContext.request.contextPath}/user/user" class="text">Home</a></li>
			<li><a href="${pageContext.request.contextPath}/user/userreport" class="text"><i class="fa fa-envelope-o" style="font-weight:bolder; font-size: 20px;"><span class="numnotify"></span></i></a></li>
			<li>
	      		<img src="${pageContext.request.contextPath}/resources/user/image/${sessionScope['USER'].image}" class="img-circle" style="margin-top:5px;" width="35px;" height="35px;"/>
	      	</li>
			<li class="dropdown">
			  <a href="#!" class="dropdown-toggle text" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Hi,&nbsp;${sessionScope['USER'].username}<span class="caret"></span></a>
			  <ul class="dropdown-menu">
				<li><a href="${pageContext.request.contextPath}/user/userprofile">Account</a></li>
				<li role="separator" class="divider"></li>
				<li><a href="${pageContext.request.contextPath}/logout">Log out</a></li>
			  </ul>
			</li>
			<li><a href="#!" class="text">About</a></li>
		  </ul>
		</div>
		<!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
	</nav>
	
	<!-- Body here -->
	<div class="container">
		<input type="text" id="password" value="${sessionScope['USER'].password}" hidden="true"/>
		<input type="text" id="userid" value="${sessionScope['USER'].userid}" hidden="true"/>
		<div class="row">
			<div class="col-xs-12 col-md-12">
				<div class="panel" style="border-radius:0px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
				  <div class="panel-heading" style="background-color:#41BC37;">
					<span><i class="fa fa-pencil-square fa-2x"></i><span>
					<span class="panel-title">Change Password</span>
				  </div>
				  <!-- Body Form -->
				  <div class="panel-body">
					<div class="row">
						<div class="col-xs-12 col-md-12 col-lg-12">
							<div class="form-group">
							    <label for="exampleInputPassword1">Old Password</label>
							    <input type="password" class="form-control" id="old_pwd" onfocusout="checkOldPwd()" placeholder="Password">
							    <span ><small id="v_op" class="msg-err"></small></span>
							</div>
							<div class="form-group">
							    <label for="exampleInputPassword1">New Password</label>
							    <input type="password" class="form-control" id="new_pwd" onfocusout="checkNewPwd()" placeholder="Password">
							    <span ><small id="v_np" class="msg-err"></small></span>
							</div>
							<div class="form-group">
							    <label for="exampleInputPassword1">Confirm Password</label>
							    <input type="password" class="form-control" id="con_pwd" onfocusout="checkConPwd()" placeholder="Password">
							    <span ><small id="v_cp" class="msg-err"></small></span>
							</div>
						</div>						
					</div>	
				  </div>
				  <div class="panel-footer"> 
				  	<button type="button" class="btn btn-success" onclick="updateUserPwd()">Update</button>
			        <button type="button" class="btn btn-warning" onclick="clearText()">Clear</button>
				  </div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/user_password.js"></script>
	<!-- Sweet Alert -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/sweetalert-master/dist/sweetalert.min.js"></script>
	
	<!-- User report nitification -->
	  <script type="text/javascript">
		  function getNumberMesage(){
				var uid=parseInt($("#userid").val());
				$.ajax({
					type : "GET",
					url : "http://localhost:8080/HRD_MEMO/user/numbermessage/"+uid,
					success : function(data) {
						if(data.DATA>0){
							$(".numnotify").css('display',"inline");
							$(".numnotify").text(data.DATA);
						}else{
							$(".numnotify").css('display',"none");
						}
					},
					error : function(data) {
					}
				});
			}
		  getNumberMesage();
		  var url="ws://localhost:8080/HRD_MEMO/memo/usernotification";
		  var websocket=new WebSocket(url);
		  websocket.onopen=function(message){
		  }
		  websocket.onclose=function(message){
		 	 websocket.close();
		  }
		  websocket.onmessage=function(message){
		 	 if(message.data==="response"){
		 		 getNumberMesage();
		 	 }
		  }
	  </script>
	  <style>
	  	.form-control{
	  		border-radius:0px;
	  	}
	  </style>
</body>
</html>