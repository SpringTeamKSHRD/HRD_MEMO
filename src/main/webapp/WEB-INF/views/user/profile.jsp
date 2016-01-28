<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>User Profile</title>  
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/profile.css">
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
		  <a class="navbar-brand text" href="#">MEMO PESS</a>
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
			<li><a href="${pageContext.request.contextPath}/user/userreport" class="text"><i class="fa fa-envelope fa-2x"></i></a></li>
			<li>
	      		<img src="${pageContext.request.contextPath}/resources/user/image/${sessionScope['USER'].image}" class="img-circle" style="margin-top:5px;" width="40px;" height="40px;"/>
	      	</li>
			<li class="dropdown">
			  <a href="#!" class="dropdown-toggle text" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope['USER'].username}<span class="caret"></span></a>
			  <ul class="dropdown-menu">
			  	<li role="separator" class="divider"></li>
				<li><a href="${pageContext.request.contextPath}/user/userpassword">Change password</a></li> <!-- href="#!" data-toggle="modal" data-target="#myModal" -->
				<li role="separator" class="divider"></li>
				<li><a href="${pageContext.request.contextPath}/login?logout">Log out</a></li>
			  </ul>
			</li>
			<li><a href="#!" class="text">About</a></li>
		  </ul>
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
	</nav>
	<!-- Body here -->
	<div class="container"> 
		<div class="row">
			<div class="col-xs-12 col-md-12">
				<div class="panel" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
				  <div class="panel-heading" >
					<span><i class="fa fa-pencil-square fa-2x"></i><span>
					<span class="panel-title">User Memo Information</span>
				  </div>
				  <!-- Body Form -->
				  <div class="panel-body">
					<div class="row">
						<div class="col-xs-6 col-md-2 col-lg-1">
						</div>
						<div class="col-xs-12 col-md-3 col-lg-6">
							<form action="#" method="POST" enctype="multipart/form-data">
								<input type="text" id="userid" value="${sessionScope['USER'].userid}" hidden="true"/>
								<div class="form-group">
									<label>Username</label>
									<input type="text" class="form-control" id="username" value="${sessionScope['USER'].username}">
								</div>
								<c:choose>
								    <c:when test="${sessionScope['USER'].gender =='female'}">								    
								        <label>Gender</label><br/>						
										<label class="radio-inline">
										  <input type="radio" name="gender" value="male" > Male
										</label>
										<label class="radio-inline">
										  <input type="radio" name="gender" value="female" checked> Female
										</label> 
								    </c:when>    
								    <c:otherwise>
								        <label>Gender</label><br/>								       
										<label class="radio-inline">
										  <input type="radio" name="gender" value="male" checked> Male
										</label>
										<label class="radio-inline">
										  <input type="radio" name="gender" value="female"> Female
										</label> 
								    </c:otherwise>
								</c:choose>
								
								<br/><br/>
								<div class="form-group">
									<label>Email</label>
									<input type="email" class="form-control" id="email" value="${sessionScope['USER'].email}">
								</div>
								<input type="text" id="userid" value="${sessionScope['USER'].userid}" hidden="true"/>
								<div class="form-group">
									<label>Phone Number</label>
									<input type="text" class="form-control" id="phone" value="${sessionScope['USER'].phone}">
								</div>
								<div class="form-group">
									<label>Date of Birth</label><br/>
									<input type="date" id="dob" value="${sessionScope['USER'].dob}"/>
								</div>
								<button type="button" class="btn btn-labeled btn-success" onclick="updateUser()">
									<span class="btn-label"><i class="glyphicon glyphicon-ok"></i></span>Update
								</button>

								<!-- Danger button with label -->
								<button type="button" class="btn btn-labeled btn-danger" onclick="cancelUser()">
									<span class="btn-label"><i class="glyphicon glyphicon-remove"></i></span>Cancel
								</button>
							</form>
						</div>
						<div class="col-xs-6 col-md-2 col-lg-1">
						</div>
						<!-- Change Picture -->
						<div class="col-xs-12 col-md-3 col-lg-4">
							<br/>
							<div class="fileinput fileinput-new" data-provides="fileinput">
								<input type="text" id="origin_img" value="${sessionScope['USER'].image}" hidden="true"/>
								<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 200px;">
									<img src="${pageContext.request.contextPath}/resources/user/image/${sessionScope['USER'].image}"/>
								</div>
								  <div>
								    <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span>
								    <span class="fileinput-exists">Change</span>
								    <input type="file" id="image"></span> <!-- file image is here -->
								    <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
								  </div>
							</div>
						</div>
					</div>	
				  </div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/user_profile.js"></script>
	<!-- Sweet Alert -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/sweetalert-master/dist/sweetalert.min.js"></script>
</body>
</html>