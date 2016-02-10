<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>MEMO | Guideline</title>
<!-- <link rel="shortcut icon"
	href="http://cdn.sabay.com/cdn/news.sabay.com.kh/wp-content/themes/sabaynews_v1.0.6/images/favicon.ico?ebb82d"
	type="image/x-icon"> -->

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.5 -->
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/skins/skin-green.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/admin/css/style.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="hold-transition skin-green layout-top-nav sidebar-collapse">
	<div class="wrapper">

		<!-- Main Header -->
		<header class="main-header">

			<!-- Logo -->
			<a href="${pageContext.request.contextPath}/user" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>A</b>LT</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg">KHMERACADEMY<b> MEMO</b></span>
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
							<a href="${pageContext.request.contextPath}/user" style="margin: 0px;">Sign In</a>
						</li>
					</ul>
				</div>
			</nav>
		</header>


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					KHMERACADEMY MEMO PLUGIN<small>Guideline</small>
				</h1>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="content-body">
					<section id="introduction">
						<h2 class="page-header">
							<a href="#introduction">Introduction</a>
						</h2>
						<p class="lead">
							<b>KHMERACADEMY MEMO PLUGIN</b> is one of the potential service
							of <b><a href="http://www.khmeracademy.org" target="_blank">KHMERACADEMY</a></b>
							which provide user to take memo, share memo,...etc on 
							websites easily . This documentation will guide you through
							installing the plugin and exploring the various components that
							are bundled with the plugin.
						</p>
					</section>
					<section id="twooption">
						<h2 class="page-header">
							<a href="#twooption">Two types of plugin</a>
						</h2>
						<p class="lead">
							In order to satisfy user, We provide two type of plugin :
						</p>
						<div class="row">
							<div class="col-md-6">
								<div class="box">
									<div class="box-body">
										<div class="text-center"><h1>#1</h1></div>
										<div class="timeline-item">
											<div class="timeline-body">
												<img class="margin" src="${pageContext.request.contextPath }/resources/admin/imgs/startup.png" width="200px" height="200px"/>
												<img class="margin" src="${pageContext.request.contextPath }/resources/admin/imgs/login_memo.png" width="200px" height="200px"/>
												<img class="margin" src="${pageContext.request.contextPath }/resources/admin/imgs/register_memo.PNG" width="200px" height="200px"/>
												<img class="margin" src="${pageContext.request.contextPath }/resources/admin/imgs/logged_memo.png" width="200px" height="200px"/>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="box">
									<div class="box-body">
										<div class="text-center"><h1>#2</h1></div>
										<div class="timeline-item">
											<div class="timeline-body">
												<img class="margin" src="${pageContext.request.contextPath }/resources/admin/imgs/pl_startup.png" width="200px" height="200px"/>
												<img class="margin" src="${pageContext.request.contextPath }/resources/admin/imgs/pl_login_memo.png" width="200px" height="200px"/>
												<img class="margin" src="${pageContext.request.contextPath }/resources/admin/imgs/pl_register_memo.png" width="200px" height="200px"/>
												<img class="margin" src="${pageContext.request.contextPath }/resources/admin/imgs/pl_logged_memo.png" width="200px" height="200px"/>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
					<section id="usage">
						<h2 class="page-header">
							<a href="#usage">Usage</a>
						</h2>
						<p class="lead">
							How to use khmeracademy memo plugin
						</p>
						<div class="row">
							<div class="col-md-6">
								<div class="box">
									<div class="box-body">
										<p class="lead">
											Append below script to HTML body tag
										</p>
										<pre class="hierarchy bring-up text-center" ><code class="language-bash" data-lang="bash">&lt;script src=&quot;http://memo.khmeracademy.org/resources/admin/js/memo.min.js&quot; defer&gt;&lt;&frasl;script&gt;</code></pre>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="box">
									<div class="box-body">
										<p class="lead">
											Append below script to HTML body tag (required jQuery library)
										</p>
										<pre class="hierarchy bring-up text-center" ><code class="language-bash" data-lang="bash">&lt;script src=&quot;http://memo.khmeracademy.org/resources/js/hrdmemoplugin.js&quot;&gt;&lt;&frasl;script&gt;</code></pre>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
			</section>
			
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		 <footer class="main-footer">
			<div class="pull-right hidden-xs">KHMERACADEMY MEMO PLUGIN</div>
			<strong>Copyright &copy; 2016 <a href="http://www.khmeracademy.org">KHMERACADEMY</a>.
			</strong> All rights reserved.
		</footer> 


		<!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED JS SCRIPTS -->

	<!-- jQuery 2.1.4 -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/jquery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.5 -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/app.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/select2.full.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/moment.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/user/js/newlistmemo.js"></script>


	
	<!-- Optionally, you can add Slimscroll and FastClick plugins.
         Both of these plugins are recommended to enhance the
         user experience. Slimscroll is required when using the
         fixed layout. -->
</body>
</html>
