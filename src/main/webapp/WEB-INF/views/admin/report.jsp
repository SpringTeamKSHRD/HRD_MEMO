<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>${pageTitle } | Memo</title>
	<%@ include file="_defaultCss.jsp" %>
  </head>
<body>
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
						<table id="tbl-user" class="table table-bordered table-striped table-hover">
							<thead>
								<tr>
									<th>#</th>
									<th>Username</th>
									<th>Gender</th>
									<th>Email</th>
									<th>Image</th>
								</tr>
							</thead>
							<tbody> 
								<c:forEach var="listReport" items="${listReport}">
									<tr class='clickable-row' style="cursor:pointer"data-href='${pageContext.request.contextPath}/admin/report/${listReport.id}'>
										<td>${listReport.id}</td>
										<%-- <td>${listReport.reporterid}</td> --%>
										<td>${listReport.reportername}</td>
										<td>${listReport.reporterimage}</td>
										<td>${listReport.reportdate}</td>
									</tr>
								</c:forEach>
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
	<%@ include file="_footer.jsp"%>

	<%@ include file="_defaultJS.jsp"%>
<script>
jQuery(document).ready(function($) {
    $(".clickable-row").click(function() {
        window.document.location = $(this).data("href");
    });
});
</script>	
</body>
</html>
