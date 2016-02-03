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
<title>AdminLTE 2 | Starter</title>
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
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- Notifications Menu -->
						<li class="dropdown notifications-menu">
							<!-- Menu toggle button --> <a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <span
								class="label label-warning">10</span>
						</a>
							<ul class="dropdown-menu">
								<li class="header">You have 10 notifications</li>
								<li>
									<!-- Inner Menu: contains the notifications -->
									<ul class="menu">
										<li>
											<!-- start notification --> <a href="#"> <i
												class="fa fa-users text-aqua"></i> 5 new members joined
												today
										</a>
										</li>
										<!-- end notification -->
									</ul>
								</li>
								<li class="footer"><a href="#">View all</a></li>
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
									<div class="col-xs-4 text-center">
										<a href="#">Followers</a>
									</div>
									<div class="col-xs-4 text-center">
										<a href="#">Sales</a>
									</div>
									<div class="col-xs-4 text-center">
										<a href="#">Friends</a>
									</div>
								</li>
								<!-- Menu Footer-->
								<li class="user-footer">
									<div class="pull-left">
										<a href="#" class="btn btn-default btn-flat">Profile</a>
									</div>
									<div class="pull-right">
										<a href="#" class="btn btn-default btn-flat">Sign out</a>
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
			<section class="content-header">
				<h1>
					HRD MEMO <small>All memo information</small>
				</h1>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- DASHBOARD HEADER -->
				<div class="row">
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box">
							<span class="info-box-icon bg-aqua"><i
								class="fa fa-envelope-o"></i></span>
							<div class="info-box-content">
								<span class="info-box-text">Messages</span> <span
									class="info-box-number">1,410</span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box">
							<span class="info-box-icon bg-green"><i
								class="fa fa-flag-o"></i></span>
							<div class="info-box-content">
								<span class="info-box-text">Bookmarks</span> <span
									class="info-box-number">410</span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box">
							<span class="info-box-icon bg-yellow"><i
								class="fa fa-files-o"></i></span>
							<div class="info-box-content">
								<span class="info-box-text">Uploads</span> <span
									class="info-box-number">13,648</span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box">
							<span class="info-box-icon bg-red"><i class="fa fa-star-o"></i></span>
							<div class="info-box-content">
								<span class="info-box-text">Likes</span> <span
									class="info-box-number">93,139</span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- DASHBOARD HEADER -->
				<div class="row">
					<div class="col-md-4">
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">Inbox</h3>
								<div class="box-tools pull-right">
									<div class="has-feedback">
										<input type="text" class="form-control input-sm"
											placeholder="Search Mail"> <span
											class="glyphicon glyphicon-search form-control-feedback"></span>
									</div>
								</div>
								<!-- /.box-tools -->
							</div>
							<!-- /.box-header -->
							<div class="box-body no-padding">
								<div class="mailbox-controls">
									<!-- Check all button -->
									<button class="btn btn-default btn-sm checkbox-toggle">
										<i class="fa fa-square-o"></i>
									</button>
									<div class="btn-group">
										<button class="btn btn-default btn-sm">
											<i class="fa fa-trash-o"></i>
										</button>
										<button class="btn btn-default btn-sm">
											<i class="fa fa-reply"></i>
										</button>
										<button class="btn btn-default btn-sm">
											<i class="fa fa-share"></i>
										</button>
									</div>
									<!-- /.btn-group -->
									<button class="btn btn-default btn-sm">
										<i class="fa fa-refresh"></i>
									</button>
									<div class="pull-right">
										1-50/200
										<div class="btn-group">
											<button class="btn btn-default btn-sm">
												<i class="fa fa-chevron-left"></i>
											</button>
											<button class="btn btn-default btn-sm">
												<i class="fa fa-chevron-right"></i>
											</button>
										</div>
										<!-- /.btn-group -->
									</div>
									<!-- /.pull-right -->
								</div>
								<div class="table-responsive mailbox-messages">
									<table class="table table-hover table-striped" >
										<tbody>
											<tr>
												<td><div class="icheckbox_flat-blue"
														aria-checked="false" aria-disabled="false"
														style="position: relative;">
														<input type="checkbox"
															style="position: absolute; opacity: 0;">
														<ins class="iCheck-helper"
															style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
													</div></td>
												<td class="mailbox-star"><a href="#"><i
														class="fa fa-star text-yellow"></i></a></td>
												<td class="mailbox-name"><a href="read-mail.html">Alexander
														Pierce</a></td>
												<td class="mailbox-subject"><b>AdminLTE 2.0 Issue</b><br />
													Trying to find a solution to this problem...</td>
												<td class="mailbox-attachment">
														<div class="tools">
															<i class="fa fa-edit"></i> <i class="fa fa-trash-o"></i>
														</div>
												</td>
												<td class="mailbox-date">01-26-2016 21:33:52 </td>
											</tr>
											<tr>
												<td><div class="icheckbox_flat-blue"
														aria-checked="false" aria-disabled="false"
														style="position: relative;">
														<input type="checkbox"
															style="position: absolute; opacity: 0;">
														<ins class="iCheck-helper"
															style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
													</div></td>
												<td class="mailbox-star"><a href="#"><i
														class="fa fa-star text-yellow"></i></a></td>
												<td class="mailbox-name"><a href="read-mail.html">Alexander
														Pierce</a></td>
												<td class="mailbox-subject"><b>AdminLTE 2.0 Issue</b><br />
													Trying to find a solution to this problem...</td>
												<td class="mailbox-attachment">
														<div class="tools">
															<i class="fa fa-edit"></i> <i class="fa fa-trash-o"></i>
														</div>
												</td>
												<td class="mailbox-date">01-26-2016 21:33:52 </td>
											</tr>

										</tbody>
									</table>
									<!-- /.table -->
								</div>
								<!-- /.mail-box-messages -->
							</div>
							<!-- /.box-body -->
							<div class="box-footer no-padding">
								<div class="mailbox-controls">
									<!-- Check all button -->
									<button class="btn btn-default btn-sm checkbox-toggle">
										<i class="fa fa-square-o"></i>
									</button>
									<div class="btn-group">
										<button class="btn btn-default btn-sm">
											<i class="fa fa-trash-o"></i>
										</button>
										<button class="btn btn-default btn-sm">
											<i class="fa fa-reply"></i>
										</button>
										<button class="btn btn-default btn-sm">
											<i class="fa fa-share"></i>
										</button>
									</div>
									<!-- /.btn-group -->
									<button class="btn btn-default btn-sm">
										<i class="fa fa-refresh"></i>
									</button>
									<div class="pull-right">
										1-50/200
										<div class="btn-group">
											<button class="btn btn-default btn-sm">
												<i class="fa fa-chevron-left"></i>
											</button>
											<button class="btn btn-default btn-sm">
												<i class="fa fa-chevron-right"></i>
											</button>
										</div>
										<!-- /.btn-group -->
									</div>
									<!-- /.pull-right -->
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-8">
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">Compose New Memo</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="form-group">
									<input class="form-control" placeholder="Title" type="text"
										id="txtTitle" style="font-weight: bolder;">
								</div>
								<!-- 								<div class="form-group">
									<input class="form-control" placeholder="Subject:">
								</div> -->
								<div class="form-group">
									<textarea class="form-control" id="content_memo" row="50"
										placeholder="Your memo here..."
										style="min-height: 320px; resize: none"></textarea>
								</div>

								<div class="form-group">
									<div class="row">
										<div class="col-md-2">
											<label>Privacy</label> <select class="form-control "
												id="isPublic">
												<option selected="selected" value="false">Private</option>
												<option value="true">Public</option>
											</select>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label>URL</label> <input type="text" class="form-control"
										readonly="readonly" name="txtUrl" id="txtUrl" />
								</div>
								<input type="hidden" id="userid"
									value="${sessionScope['USER'].userid}" />
							</div>
							<!-- /.box-body -->
							<div class="box-footer">
								<div class="pull-right">
									<button class="btn btn-default" id="btn-reset">
										<i class="fa fa-refresh"></i> Reset
									</button>
									<button type="submit" class="btn btn-primary" id="btn-save">
										<i class="fa fa-save"></i> Save
									</button>
								</div>
							</div>
							<!-- /.box-footer -->
						</div>
					</div>
				</div>

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<footer class="main-footer">
			<!-- To the right -->
			<div class="pull-right hidden-xs">Anything you want</div>
			<!-- Default to the left -->
			<strong>Copyright &copy; 2015 <a href="#">Company</a>.
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
		src="${pageContext.request.contextPath}/resources/user/js/newlistmemo.js"></script>

	<script>
	var path="${pageContext.request.contextPath}";
		$(function() {
			getRecordeNumber();
			$('#txtTitle').focus();
			/* ADD SLIM SCROLL */
			$('.table-responsive').slimScroll({
				height : '526px'
			});

			/* ADD BOOTSTRAP EDITOR */
			/* 			$('#content_memo').wysihtml5();
			 $('#content_memo').height("262"); */

			/* HOVER ON EACH MEMO */
			$('tr').hover(function() {
				$(this).find('.tools i').show();
			}, function() {
				$(this).find('.tools i').hide();
			});

			/* PASS URL PATH TO URL TEXTBOX */
			$('#txtUrl').val(window.location.href);

			/* ADD NEW MEMO */
			function saveMemo() {
				var domainName = window.location.protocol
						+ '//'
						+ window.location.hostname
						+ (window.location.port ? ':' + window.location.port
								: '');
				var url = window.location.href.replace(domainName, "");

				json = {
					userid : $('#userid').val(),
					title : $('#txtTitle').val(),
					content : $("#content_memo").val(),
					domain : domainName,
					url : url,
					isenable : true,
					ispublic : $('#isPublic').val()
				};

				$
						.ajax({
							type : "POST",
							url : "${pageContext.request.contextPath}"
									+ "/user/",
							data : JSON.stringify(json),
							contentType : 'application/json',
							success : function(data) {
								$('#txtTitle').val("");
								$('#content_memo').val("");
								$('#isPublic').val("false");
								$('#txtTitle').focus();
								alert("Success", "Your memo has been saved.",
										"success");
							},
							error : function(data) {
								alert("Fail", "Fail with create memo!", "error");
							}
						});
			}
			/* SAVE MEMO ACTION */
			$('#btn-save').click(
					function() {
						if ($("#content_memo").val() != ""
								&& $("#txtTitle").val() != "") {
							saveMemo();
						} else {
							alert('Title or Memo content can not be empty!');
						}
					});

			/* RESET CONTENT */
			$('#btn-reset').click(function() {
				$('#txtTitle').val("");
				$('#content_memo').val("");
				$('#isPublic').val("false");
				$('#txtTitle').focus();
			});
			
			
			/* LIST MEMO LIMIT 10 */
			

		});
	</script>
	<!-- Optionally, you can add Slimscroll and FastClick plugins.
         Both of these plugins are recommended to enhance the
         user experience. Slimscroll is required when using the
         fixed layout. -->
</body>
</html>
