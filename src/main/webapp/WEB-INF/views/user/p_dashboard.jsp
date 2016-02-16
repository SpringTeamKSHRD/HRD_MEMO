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
<title>MEMO | Dashboard</title>
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
	top: -6px;
}

.tools i {
	position: absolute;
	display:none;
}

.tools i.fa.fa-trash-o {
	position: absolute;
	right: 6px;
	top: -1px;
}

input[name=privacy] {
	display: none
}

td.mailbox-subject {
	white-space: nowrap;
	max-width: 330px;
	overflow: hidden;
	text-overflow: ellipsis;
}
td.mailbox-attachment{
	min-width:50px;
}
.table-responsive.mailbox-messages > table > tbody > tr >td:nth-child(2):hover {
	cursor: pointer;
}
.loading{
	display:none;
	z-index:9999;	
	position: absolute;
    top: 50%;
    left: 50%;
    margin-top: -50px;
    margin-left: -50px;
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
	<div class="loading"><img src="${pageContext.request.contextPath}/resources/admin/imgs/loading.gif" /></div>
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
							<a href="${pageContext.request.contextPath}/user/user" style="margin: 0px;">Home</a>
						</li>
						<li class="dropdown notifications-menu">
							<!-- Menu toggle button --> <a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <span
								class="label label-warning" id="numnotify"></span>
						</a>
							<ul class="dropdown-menu" style="width: 200px; float: right;">
								<li style="height: 40px;" id="newmsg">
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
			<section class="content-header">
				<h1>
					KHMERACADEMY MEMO <small>All memo information</small>
				</h1>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- DASHBOARD HEADER -->
				<div class="row">
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box">
							<span class="info-box-icon bg-default"><i
								class="fa fa-comments-o"></i></span>
							<div class="info-box-content">
								<span class="info-box-text">Total</span> <span
									class="info-box-number" id="total-memo"></span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box">
							<span class="info-box-icon bg-aqua"><i
								class="fa fa-globe"></i></span>
							<div class="info-box-content">
								<span class="info-box-text">Public</span> <span
									class="info-box-number" id="public-memo"></span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box">
							<span class="info-box-icon bg-red"><i
								class="fa fa-lock"></i></span>
							<div class="info-box-content">
								<span class="info-box-text">Private</span> <span
									class="info-box-number" id="private-memo"></span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box">
							<span class="info-box-icon bg-yellow"><i class="fa fa-html5"></i></span>
							<div class="info-box-content">
								<span class="info-box-text">Website</span> <span
									class="info-box-number" id="total-website"></span>
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
								<h3 class="box-title">Memo List</h3>
								<div class="box-tools pull-right">
									<div class="has-feedback">
										<input type="text" class="form-control input-sm"
											placeholder="Search By Title" name="searchtitle"
											id="searchtitle"> <span
											class="glyphicon glyphicon-search form-control-feedback"></span>
									</div>
								</div>
								<!-- /.box-tools -->
							</div>
							<!-- /.box-header -->
							<div class="box-body no-padding">
								<div class="mailbox-controls">
									<div class="row">
										<div class="col-md-8">
											<label class="btn btn-default btn-sm"><input
												type="radio" name="privacy" value="" id="all-memo" checked>All
												Memo</label> <label class="btn btn-info btn-sm"><input
												type="radio" name="privacy" value="true" id="public-memo">Public</label>
											<label class="btn btn-danger btn-sm"><input
												type="radio" name="privacy" value="false" id="private-memo">Private</label>
										</div>
										<div class="col-md-4" >
											<select class="form-control" name="searchdomain"
												id="searchdomain">

											</select>
										</div>
									</div>
									<!-- /.pull-right -->
								</div>
								<div class="table-responsive mailbox-messages" style="height:522px;overflow-y:hidden">
									<table class="table table-hover table-striped">
										<tbody>

										</tbody>
									</table>
									<!-- /.table -->
								</div>
								<!-- /.mail-box-messages -->
							</div>
							<!-- /.box-body -->
							<div class="box-footer " style="padding:0 !important;padding-bottom:6px !important">
								<div class="mailbox-controls">
									<!-- Check all button -->
									<!-- <button class="btn btn-default btn-sm checkbox-toggle">
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
									</div> -->
									<!-- /.btn-group -->
									<!-- <button class="btn btn-default btn-sm">
										<i class="fa fa-refresh"></i>
									</button> -->
									<div class="pull-right">
										<span id="currentPage">1</span>-<span id="totalPage">50</span>/<span id="totalRecord">200</span>
										<div class="btn-group">
											<button class="btn btn-default btn-sm" id="btnPrevious">
												<i class="fa fa-chevron-left"></i>
											</button>
											<button class="btn btn-default btn-sm" id="btnNext">
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
									<button class="btn btn-success" id="btn-addnew" style="display:none">
										 +Add New
									</button>
									<button class="btn btn-default" id="btn-reset">
										<i class="fa fa-refresh"></i> Reset
									</button>
									<button class="btn btn-primary" id="btn-save">
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
		<!-- <footer class="main-footer">
			To the right
			<div class="pull-right hidden-xs">Anything you want</div>
			Default to the left
			<strong>Copyright &copy; 2015 <a href="#">Company</a>.
			</strong> All rights reserved.
		</footer> -->


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


	<script>
		var path = "${pageContext.request.contextPath}";
		var memoid='';
		$(function() {

			init();

			$('#txtTitle').focus();
			/* ADD SLIM SCROLL */
			/* $('.table-responsive').slimScroll({
				height : '526px'
			}); */

			/* ADD BOOTSTRAP EDITOR */
			/* 			$('#content_memo').wysihtml5();
			 $('#content_memo').height("262"); */

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
								$('.loading').hide();
								$('#txtTitle').val("");
								$('#content_memo').val("");
								$('#isPublic').val("false");
								$('#txtTitle').focus();
								init();
							},
							error : function(data) {
								alert("Fail", "Fail with create memo!", "error");
							}
						});
			}
			/* SAVE MEMO ACTION */
			$('.box-footer').on("click","#btn-save", function() {
						if ($("#content_memo").val() != ""
								&& $("#txtTitle").val() != "") {
							$('.loading').show();
							saveMemo();
						} else {
							alert('Title or Memo content can not be empty!');
						}
					});
			
			/* UPDATE MEMO ACTION */
			$('.box-footer').on("click","#btn-update", function() {
						if ($("#content_memo").val() != ""
								&& $("#txtTitle").val() != "") {
							$('.loading').show();
							updateMemo(memoid, $("#content_memo").val(), $("#txtTitle").val(),$('#isPublic').val());
						} else {
							alert('Title or Memo content can not be empty!');
						}
					});
			/* ADD NEW BUTTON CLICK */
			$('.box-footer').on("click","#btn-addnew", function() {
				$('#txtTitle').val("");
				$('#content_memo').val("");
				$('#isPublic').val("false");
				$('#txtTitle').focus();
				$('#btn-update').html('<i class="fa fa-save"></i>Save').attr("id","btn-save");
				$('div.col-md-8 > div > div.box-header.with-border > h3').text("Compose New Memo");
				$('#btn-reset').show();
				$('#btn-addnew').hide();
					});
			
			/* RESET CONTENT */
			$('#btn-reset').click(function() {
				$('#txtTitle').val("");
				$('#content_memo').val("");
				$('#isPublic').val("false");
				$('#txtTitle').focus();
				$('#btn-update').html('<i class="fa fa-save"></i>Save').attr("id","btn-save");
				$('div.col-md-8 > div > div.box-header.with-border > h3').text("Compose New Memo");
				
			});
			/* LIST MEMO LIMIT 10 */
			$('.mailbox-controls input[type="radio"]').click(function() {
				$('.loading').show();
				listMemo();
			});


			/*SEARCH ON TEXT BOX*/
			jQuery('#searchtitle').on('input', function() {
				$('.loading').show();
				listMemo();
			});
			
			/* SEARCH ON SELECT CHANGE */
			$('#searchdomain').on('change', function() {
				$('.loading').show();
				  listMemo();
				});

			/* EDIT ICON CLICK*/
			/* $('table.table').on("click",".fa.fa-edit", function() {
				var id = $(this).attr('id');
				alert(id);
			}); */
			
			
			/* VIEW EACH MEMO */
			$('table.table').on("click","td:nth-child(2)", function() {
				var title=$(this).find('b').html();
				var memo_content=$(this).find('.memo-content').html();
				var ispublic =$(this).find('small').html()=="Private" ? "false":"true";
				memoid=$(this).parent().attr('id');
				var url=$(this).prev().find('a').attr('href');
			
				
				$('#txtTitle').val(title);
				$('#content_memo').val(memo_content);
				$('#isPublic').val(ispublic);
				$('#txtUrl').val(url);
				$('#btn-save').text('Update').attr("id","btn-update");
				$('div.col-md-8 > div > div.box-header.with-border > h3').text("Update Memo");
				$('#btn-addnew').show();
				$('#btn-reset').hide();
			});
		});
		function getNumberMesage(){
			var uid=parseInt($("#userid").val());
			$.ajax({
				type : "GET",
				url : path+"/user/numbermessage/"+uid,
				success : function(data) {
						$("#newmsg").css('display',"inline");
						$("#numnotify").css('display',"inline");
						$("#numnotify").text(data.DATA);
						$("#newnumnotify").css('display',"inline");
						$("#newnumnotify").text("     You have "+data.DATA+" messages");
				},
				error : function(data) {
					$("#numnotify").css('display',"none");
					$("#newnumnotify").css('display',"none");
					$("#newmsg").css('display',"none");
				}
			});
		}
		getNumberMesage();
		var url="ws://"+location.hostname+":80/memo/usernotification";
		var websocket=new WebSocket(url);
		websocket.onopen=function(message){
		}
		websocket.onclose=function(message){
			 websocket.close();
		}
		websocket.onmessage=function(message){
			 if(message.data==="response"){
				 getNumberMesage();
				 audio.play();
			 }
		}
		var audio = new Audio(path+'/resources/audio/notifysouand.mp3');
	</script>
	<!-- Optionally, you can add Slimscroll and FastClick plugins.
         Both of these plugins are recommended to enhance the
         user experience. Slimscroll is required when using the
         fixed layout. -->
</body>
</html>
