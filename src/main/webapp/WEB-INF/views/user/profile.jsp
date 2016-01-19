<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>User Profile</title>  
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"><!-- Tell the browser to be responsive to screen width -->	
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
	<!-- Own Style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/profile.css">
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
		  <a class="navbar-brand" href="#">MEMO PESS</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		  <ul class="nav navbar-nav navbar-right">
			<li><a href="#">Home</a></li>
			<li><a href="#">Notification</a></li>
			<li class="dropdown">
			  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Ky Sona <span class="caret"></span></a>
			  <ul class="dropdown-menu">
				<li><a href="#">Action</a></li>
				<li><a href="#">Another action</a></li>
				<li><a href="#">Something else here</a></li>
				<li role="separator" class="divider"></li>
				<li><a href="#">Separated link</a></li>
			  </ul>
			</li>
			<li><a href="#">About</a></li>
		  </ul>
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
	</nav>
	<!-- Body here -->
	<div class="container"> <br/><br/><br/>
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
						<div class="col-xs-12 col-md-6 col-lg-1">
						</div>
						<div class="col-xs-12 col-md-6 col-lg-6">
							<form action="#">
								<div class="form-group">
									<label for="exampleInputEmail1">Username</label>
									<input type="text" class="form-control" id="exampleInputEmail1" placeholder="username">
								</div>
								<label>Gender</label><br/>
								<label class="radio-inline">
								  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" checked> Male
								</label>
								<label class="radio-inline">
								  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> Female
								</label> 
								<br/><br/>
								<div class="form-group">
									<label for="exampleInputEmail1">Email</label>
									<input type="email" class="form-control" id="exampleInputEmail1" placeholder="email">
								</div>
								<div class="form-group">
									<label>Date of Birth</label><br/>
									<input type="date"/>
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Password</label>
									<input type="password" class="form-control" id="exampleInputEmail1" placeholder="username">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Confirm Password</label>
									<input type="password" class="form-control" id="exampleInputEmail1" placeholder="username">
								</div>
								<!-- Button -->
								<!-- Success button with label -->
								<button type="button" class="btn btn-labeled btn-success"><span class="btn-label"><i class="glyphicon glyphicon-ok"></i></span>Update</button>

								<!-- Danger button with label -->
								<button type="button" class="btn btn-labeled btn-danger"><span class="btn-label"><i class="glyphicon glyphicon-remove"></i></span>Cancel</button>
							</form>
						</div>
						<div class="col-xs-12 col-md-6 col-lg-1">
						</div>
						<!-- Change Picture -->
						<div class="col-xs-12 col-md-6 col-lg-4">
							<br/>
							<div class="fileinput fileinput-new" data-provides="fileinput">
							  <div class="fileinput-new thumbnail" style="width: 200px; height: 200px;">
								<img data-src="holder.js/100%x100%" alt="">
							  </div>
							  <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
							  <div>
								<span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input type="file" name="..."></span>
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
<!--Import jQuery before materialize.js-->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>	
</body>
</html>