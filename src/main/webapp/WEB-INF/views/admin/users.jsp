<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>${pageTitle }| Memo</title>
<%@ include file="_defaultCss.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admin/css/dataTables.bootstrap.css"">
</head>
<%@ include file="_header.jsp"%>
<%@ include file="_sideBarMenu.jsp"%>
<div class="row">
	<div class="col-xs-12">
		<div class="box">
			<!-- <div class="box-header">
				<h3 class="box-title">Data Table With Full Features</h3>
			</div> -->
			<!-- /.box-header -->
			<div class="box-body">
				<div class="row">
						<div class="col-sm-12">
							<table id="tbl-user" class="table table-bordered table-striped" >
								<thead>
									<tr >
										<th>#</th>
										<th>Name</th>
										<th>Email</th>
										<th>Photo</th>
										<th>Memo</th>
									</tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
	</div>
	<!-- /.col -->
</div>

<%@ include file="_footer.jsp"%>
<%-- <%@ include file="_controlSideBar.jsp"%> --%>


<%@ include file="_defaultJS.jsp"%>
<script
	src="${pageContext.request.contextPath}/resources/admin/js/dataTables.bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/js/jquery.dataTables.min.js"></script>
<script>
	$(function() {
		$('#tbl-user').DataTable({
			"paging" : true,
			"lengthChange" : false,
			"searching" : false,
			"ordering" : true,
			"info" : true,
			"autoWidth" : false
		});
	});
</script>
</body>
</html>
