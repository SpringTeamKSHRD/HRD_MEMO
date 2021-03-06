
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>MEMO | User Profile</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.5 -->
<script
		src="${pageContext.request.contextPath}/resources/admin/js/jquery-2.1.4.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/AdminLTE.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/select2.min.css">
<!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
 <!-- Own Style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/password.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/profile.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/skins/skin-green.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/jasny-bootstrap/css/jasny-bootstrap.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/jasny-bootstrap/js/jasny-bootstrap.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<style>
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td, .table>thead>tr>th {
	vertical-align: middle;
}

.tools {
	position: relative;
	cursor: pointer;
	color: #dd4b39;

	top:-6px;
}
.tools i{
	position: absolute;
	
}
.tools i.fa.fa-trash-o{
	position: absolute;
	right:6px;
	top:-1px;
}
</style>
</head>
<!--
  BODY TAG OPTIONS:
  =================
  Apply one or more of the following classes to get the
  desired effect
  |---------------------------------------------------------|
  | SKINS         | skin-blue                               |
  |               | skin-black                              |
  |               | skin-purple                             |
  |               | skin-yellow                             |
  |               | skin-red                                |
  |               | skin-green                              |
  |---------------------------------------------------------|
  |LAYOUT OPTIONS | fixed                                   |
  |               | layout-boxed                            |
  |               | layout-top-nav                          |
  |               | sidebar-collapse                        |
  |               | sidebar-mini                            |
  |---------------------------------------------------------|
  -->
<body class="hold-transition skin-green layout-top-nav sidebar-collapse">
	<div class="wrapper">

		<!-- Main Header -->
		<header class="main-header">

			<!-- Logo -->
			<a href="${pageContext.request.contextPath}/user" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>A</b>LT</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg">KHMERACADEMY<b>MEMO</b></span>
			</a>

			<!-- Header Navbar -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<!--  <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a> -->
				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- Notifications Menu -->
						<li class="dropdown user user-menu" style="margin: 0px; padding: 0px;">
							<a href="${pageContext.request.contextPath}/user/user" style="margin: 0px;">Home</a>
						</li>
						<li class="dropdown notifications-menu">
							<!-- Menu toggle button --> <a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <span
								class="label label-warning" id="numnotify"></span>
						</a>
							<ul class="dropdown-menu" style="width: 200px; float: right;">
								<li id="newmsg">
									<ul class="menu">
										<li style="text-align: center;">
											<a href="${pageContext.request.contextPath}/user/newmessage"> <i
											class="fa fa-envelope-o text-aqua" id="newnumnotify"></i>
										</a>
										</li>
										<!-- end notification -->
									</ul>
									
								</li>
								<li class="footer"><a href="${pageContext.request.contextPath}/user/message">View all</a></li>
							</ul>
						</li>
						<!-- User Account Menu -->

						<li class="dropdown user user-menu">
							<!-- Menu Toggle Button --> <a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <!-- The user image in the navbar-->
								<img
								src="${pageContext.request.contextPath}/resources/user/image/${sessionScope['USER'].image}"
								class="user-image" alt="User Image"> <!-- hidden-xs hides the username on small devices so only the image appears. -->
								<span class="hidden-xs">${sessionScope['USER'].username}</span>
						</a>
							<ul class="dropdown-menu">
								<!-- The user image in the menu -->
								<li class="user-header"><img
									src="${pageContext.request.contextPath}/resources/user/image/${sessionScope['USER'].image}"
									class="img-circle" alt="User Image">
									<p>
										${sessionScope['USER'].username} <small>Member since
											Nov. 2012</small>
									</p></li>
								<!-- Menu Body -->
								<li class="user-body">
								</li>
								<!-- Menu Footer-->
								<li class="user-footer">
									<div class="text-center">
										<a href="${pageContext.request.contextPath}/user/home" class="btn btn-default btn-flat">Profile</a>
										<a href="${pageContext.request.contextPath}/user/userpassword" class="btn btn-default btn-flat">Account</a>
										<a href="${pageContext.request.contextPath}/logout" class="btn btn-default btn-flat">Sign out</a>
									</div>
								</li>
							</ul>
						</li>

					</ul>
				</div>
			</nav>
		</header>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<!-- Main content -->
			<section class="content">
				<!-- DASHBOARD HEADER -->
				<div class="row">
				<div class="col-md-3 col-sm-2 col-xs-12">
				</div>
					<div class="col-md-6 col-sm-8 col-xs-12">
					<div class="box box-success">
			            <div class="box-header with-border">
			              <h3 class="box-title">User Profile</h3>
			            </div>
			            <!-- /.box-header -->
			            <div class="box-body no-padding" style="display: block;">
			            <form class="form-horizontal" style="padding: 5px;">
					                <div class="form-group" style="margin-left: 10px;">
										<br/>
										<div class="fileinput fileinput-new" data-provides="fileinput">
											<input type="text" id="origin_img" value="${sessionScope['USER'].image}" hidden="true"/>
											<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 140px; height: 160px;">
												<img src="${pageContext.request.contextPath}/resources/user/image/${sessionScope['USER'].image}" style="width: 100%; height: 100%;"/>
											</div>
											  <div>
											    <span class="btn btn-default btn-file"><span class="fileinput-new">Select Image</i></span>
											    <span class="fileinput-exists" style="width:47px;" title="change image"><i class="fa fa-pencil-square fa-1x" style="color:green;" ></i></span>
											    <input type="file" id="image"></span> <!-- file image is here -->
											    <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput" style="width:47px;"><i class="fa fa-remove" style="color:red;"></i></a>
											  </div>
										</div>
									</div>
				                <div class="form-group">
				                  <label for="username" class="col-sm-3 control-label">User Name</label>
				                  <div class="col-sm-9">
				                    <input type="text" class="form-control" id="username" value="${sessionScope['USER'].username}">
				                  </div>
				                </div>
				                <div class="form-group">
				                  <c:choose>
								    <c:when test="${sessionScope['USER'].gender =='female'}">								    
								        <label for="gender" class="col-sm-3 control-label">Gender</label>		
								         <div class="col-sm-9">			
										<label class="radio-inline">
										  <input type="radio" name="gender" value="male" > Male
										</label>
										<label class="radio-inline">
										  <input type="radio" name="gender" value="female" checked> Female
										</label> 
										</div>
								    </c:when>    
								    <c:otherwise>
								         <label for="gender" class="col-sm-3 control-label">Gender</label>		
								         <div class="col-sm-9">			
										<label class="radio-inline">
										  <input type="radio" name="gender" value="male" checked> Male
										</label>
										<label class="radio-inline">
										  <input type="radio" name="gender" value="female" > Female
										</label> 
										</div>
								    </c:otherwise>
								</c:choose>
				                </div>
				                <div class="form-group">
									 <label for="email" class="col-sm-3 control-label">Email</label>	
									 <div class="col-sm-9">	
									<input type="email" class="form-control" id="email" value="${sessionScope['USER'].email}">
									</div>
								</div>
								<input type="text" id="userid" value="${sessionScope['USER'].userid}" hidden="true"/>
								<div class="form-group">
									 <label for="phone" class="col-sm-3 control-label">Phone Number</label>		
									 <div class="col-sm-9">
									<input type="text" class="form-control" id="phone" value="${sessionScope['USER'].phone}">
									</div>
								</div>
								<div class="form-group">
									 <label for="dob" class="col-sm-3 control-label">Date of Birth</label>		
									 <div class="col-sm-9">
									<input type="date" id="dob" value="${sessionScope['USER'].dob}"/>
									</div>
								</div>
				              <!-- /.box-body -->
				              <div class="box-footer">
				                <button type="button" class="btn btn-danger pull-right" onclick="cancelUser()">Cancel</button>
				                <button type="button" class="btn btn-success pull-right" style="margin-right: 10px;" onclick="updateUser()">Update</button>
				              </div>
				              <!-- /.box-footer -->
				            </form>
			            </div>
			            <!-- /.box-body -->
         			 </div>
						<!-- /.info-box -->
					</div>
					<div class="col-md-3 col-sm-2 col-xs-12">
				</div>
				<!--End Row1  -->
				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED JS SCRIPTS -->
	

	<!-- jQuery 2.1.4 -->
	<!-- Bootstrap 3.3.5 -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/app.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/select2.full.min.js"></script>
		<style>
			.fileinput-preview img{
			width: 100%;
			height: 100%;
			}
		</style>
		<script type="text/javascript">
		  var path="${pageContext.request.contextPath}";
		</script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/user_profile.js"></script>
		
</body>
</html>
