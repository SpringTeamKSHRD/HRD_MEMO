
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
<title>AdminLTE 2 | Starter</title>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/skins/skin-green.min.css">
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
<body class="hold-transition skin-green layout-top-nav sidebar-collapse" onbeforeunload="updateMessageStatus()">
	<div class="wrapper">
		<!-- Main Header -->
		<header class="main-header">

			<!-- Logo -->
			<a href="index2.html" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>A</b>LT</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>Admin</b>LTE</span>
			</a>

			<!-- Header Navbar -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<!--  <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a> -->
				<!-- Navbar Right Menu -->
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
			    <div class='row'>
			    	<div class="col-md-12 col-sm-12 col-xs-12">
			    		<h3 style="padding:10px; border-bottom: 2px solid #00a65a;"><i class="fa fa-envelope-o"></i>&nbsp;&nbsp;Display New Message</h3>
			    	</div>
			    </div>
				<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="box">
				            <div class="box-header with-border">
				              <h3 class="box-title">All New Messages</h3>
				            </div>
				            <div class="box-body" id="message_diplayer">
				             
				            </div>
				            <div class="box-footer clearfix">
				              <ul class="pagination pagination-sm no-margin pull-right" 
				              id="pagination" style="cursor: pointer;">
				              </ul>
				               <ul class="no-margin pull-left" id="totalmsg" style="font-weight: bold; color:red;">
				              </ul>
				            </div>
	         		 </div>
				</div>
				<!--End Row1  -->
				</div>
			</section>
			<!-- /.content -->
		</div>
		<input type="text" id="password" value="${sessionScope['USER'].password}" hidden="true"/>
		<input type="text" id="userid" value="${sessionScope['USER'].userid}" hidden="true"/>
		<!-- /.content-wrapper -->
		<!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->
	<!-- REQUIRED JS SCRIPTS -->
          <div class="modal" id="myModal">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">View Memo</h4>
              </div>
              <div class="modal-body">
                 <p id="memotitle" style="word-break:break-all;" style="font-weight: bold;" ></p>
                <p id="memocontent" style="word-break:break-all;"></p>
                 <p>Go :&nbsp;<a id="url"><img id="urlimage"></a></p>
              </div>
              <div class="modal-footer">
                <small id="memodate" style="float: left; font-weight: bold;"></small>
                 <small id="memowebsite" style="float: right; font-weight: bold;"></small>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
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
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/newmessage.js"></script>
		
</body>
</html>
