<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>User Dashboard</title>  
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/userdashboard.css">
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
			<li><a href="${pageContext.request.contextPath}/user/user">Home</a></li>
			<li><a href="#">Notification</a></li>
			<li>
	      		<img src="${pageContext.request.contextPath}/resources/user/image/${sessionScope['USER'].image}" class="img-circle" style="margin-top:5px;" width="40px;" height="40px;"/>
	      	</li>
			<li class="dropdown">
			  <a href="#!" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Ky Sona <span class="caret"></span></a>
			  <ul class="dropdown-menu">
				<li><a href="#!" data-toggle="modal" data-target="#myModal">Change password</a></li>
				<li role="separator" class="divider"></li>
				<li><a href="#">Separated link</a></li>
			  </ul>
			</li>
			<li><a href="#!">About</a></li>
		  </ul>
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
	</nav>
	<!-- Body here -->
	<div class="container-fluid"> <br/><br/><br/>
		<div class="row">
		  <!-- Left Section -->
		  <div class="col-xs-12 col-sm-6 col-md-3">
		  	<!-- Amount of rows -->
		  	<div class="row">
			  <div class="col-xs-12 col-sm-12 col-md-12">
			  	<label>Amount of Rows</label>
			  	<select class="form-control" id="limit_row" onchange="limitRow()">
				  <option value="5">5</option>
				  <option value="10">10</option>
				  <option value="20">20</option>
				  <option value="30">30</option>
				  <option value="50">50</option>
				</select>
			  </div>			  
			</div>
			<br/>
			<!-- List data -->
			<div class="row">
			  <div class="col-xs-12 col-sm-12 col-md-12">
			  	<p class="bg-primary">List Memo</p>
			  	<div id="listmemo" style="max-height:670px; overflow-y:scroll">
						
				</div>
			  </div>			  
			</div>
		  </div>
		   <!-- Close Left Section -->
		  <!-- Right Section -->
		  <div class="col-xs-12 col-sm-6 col-md-9">
		  	<!-- Filter Area -->
			<div class="row">
			  <div class="col-xs-12 col-sm-12 col-md-6">
			  	<label>Search</label>
			  	<select class="form-control" id="searching">
				  <option value="1">Title</option>
				  <option value="2">Website</option>
				  <option value="3">Privacy</option>
				  <option value="4">Date</option>
				</select>
			  </div>
			  <div class="col-xs-12 col-sm-12 col-md-6">
			  	<div id="searcharea">
					
				</div>
			  </div>			  
			</div>
			<br/>
			<!-- Input data -->
			<div class="row">
			  <div class="col-xs-12 col-sm-12 col-md-10">
			  	<input type="text" id="userid" value="${sessionScope['USER'].userid}" hidden="true"/>
			  	<div class="form-group">
				    <label>Title</label>
				    <input type="text" class="form-control" id="titlememo" placeholder="tile memo">
				</div>
			  </div>
			  <div class="col-xs-12 col-sm-12 col-md-2">
			  	<label>Privacy</label>
			  	<select class="form-control" id="privacy">
				  <option value="0">Private</option>
				  <option value="1">Public</option>
				</select>
			  </div>			  
			</div>
			<br/><br/>
			<!-- Text Area -->
			<div class="row">
			  <div class="col-xs-12 col-sm-12 col-md-12">
			  	<textarea class="z-depth-1" id="cont_memo" style="width:100%; height:300px;">
							
				</textarea>
			  </div>			  
			</div>
			<br/>
			<!-- Current URL -->
			<div class="row">
			  <div class="col-xs-12 col-sm-12 col-md-12">
			  	<label>Current URL</label>
			  	<input class="form-control" id="disabledInput" type="text" placeholder="www.khmeracademy.org.kh" disabled>
			  </div>			  
			</div>
			<br/>
			<!-- Buttons -->
			<div class="row">
			  <div class="col-xs-12 col-sm-12 col-md-12">
			  	<button type="button" class="btn btn-primary" id="btnsave" onclick="saveMemo()">Save</button>
			  	&nbsp;&nbsp;
			  	<button type="button" class="btn btn-warning" id="btncancel" onclick="cancelMemo()">Cancel</button>
			  </div>			  
			</div>
			<br/><br/>
		  </div>
		  <!--Close Right Section -->
		</div>
	</div>
	<!-- close container -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/materialize/js/materialize.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/init.js"></script>
	<!-- User Dashboard Script -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/delete_memo1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/update_memo1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/add_memo1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/edit_memo1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/search_memo1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/user_dashboard1.js"></script> 
	<!-- Personal Information -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/user_profile.js"></script>
	<!-- Sweet Alert -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/sweetalert-master/dist/sweetalert.min.js"></script>
</body>
</html>