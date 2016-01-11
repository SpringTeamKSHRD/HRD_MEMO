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
			<div class="box-header">
				<h3 class="box-title">Data Table With Full Features</h3>
			</div>
			<!-- /.box-header -->
			<div class="box-body">
				<div id="example1_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap">
					<div class="row">
						<div class="col-sm-6">
							<div class="dataTables_length" id="example1_length">
								<label>Show <select name="example1_length"
									aria-controls="example1" class="form-control input-sm"><option
											value="10">10</option>
										<option value="25">25</option>
										<option value="50">50</option>
										<option value="100">100</option></select> entries
								</label>
							</div>
						</div>
						<div class="col-sm-6">
							<div id="example1_filter" class="dataTables_filter">
								<label>Search:<input type="search"
									class="form-control input-sm" placeholder=""
									aria-controls="example1"></label>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table id="example1"
								class="table table-bordered table-striped dataTable" role="grid"
								aria-describedby="example1_info">
								<thead>
									<tr role="row">
										<th class="sorting_asc" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="Rendering engine: activate to sort column descending"
											style="width: 294px;" aria-sort="ascending">Rendering
											engine</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="Browser: activate to sort column ascending"
											style="width: 360px;">Browser</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="Platform(s): activate to sort column ascending"
											style="width: 320px;">Platform(s)</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="Engine version: activate to sort column ascending"
											style="width: 257px;">Engine version</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending"
											style="width: 191px;">CSS grade</th>
									</tr>
								</thead>
								<tbody>
									<tr role="row" class="odd">
										<td class="sorting_1">Webkit</td>
										<td>Safari 1.2</td>
										<td>OSX.3</td>
										<td>125.5</td>
										<td>A</td>
									</tr>
									<tr role="row" class="even">
										<td class="sorting_1">Webkit</td>
										<td>Safari 1.3</td>
										<td>OSX.3</td>
										<td>312.8</td>
										<td>A</td>
									</tr>
									<tr role="row" class="odd">
										<td class="sorting_1">Webkit</td>
										<td>Safari 2.0</td>
										<td>OSX.4+</td>
										<td>419.3</td>
										<td>A</td>
									</tr>
									<tr role="row" class="even">
										<td class="sorting_1">Webkit</td>
										<td>Safari 3.0</td>
										<td>OSX.4+</td>
										<td>522.1</td>
										<td>A</td>
									</tr>
									<tr role="row" class="odd">
										<td class="sorting_1">Webkit</td>
										<td>OmniWeb 5.5</td>
										<td>OSX.4+</td>
										<td>420</td>
										<td>A</td>
									</tr>
									<tr role="row" class="even">
										<td class="sorting_1">Webkit</td>
										<td>iPod Touch / iPhone</td>
										<td>iPod</td>
										<td>420.1</td>
										<td>A</td>
									</tr>
									<tr role="row" class="odd">
										<td class="sorting_1">Webkit</td>
										<td>S60</td>
										<td>S60</td>
										<td>413</td>
										<td>A</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-5">
							<div class="dataTables_info" id="example1_info" role="status"
								aria-live="polite">Showing 51 to 57 of 57 entries</div>
						</div>
						<div class="col-sm-7">
							<div class="dataTables_paginate paging_simple_numbers"
								id="example1_paginate">
								<ul class="pagination">
									<li class="paginate_button previous" id="example1_previous"><a
										href="#" aria-controls="example1" data-dt-idx="0" tabindex="0">Previous</a></li>
									<li class="paginate_button "><a href="#"
										aria-controls="example1" data-dt-idx="1" tabindex="0">1</a></li>
									<li class="paginate_button "><a href="#"
										aria-controls="example1" data-dt-idx="2" tabindex="0">2</a></li>
									<li class="paginate_button "><a href="#"
										aria-controls="example1" data-dt-idx="3" tabindex="0">3</a></li>
									<li class="paginate_button "><a href="#"
										aria-controls="example1" data-dt-idx="4" tabindex="0">4</a></li>
									<li class="paginate_button "><a href="#"
										aria-controls="example1" data-dt-idx="5" tabindex="0">5</a></li>
									<li class="paginate_button active"><a href="#"
										aria-controls="example1" data-dt-idx="6" tabindex="0">6</a></li>
									<li class="paginate_button next disabled" id="example1_next"><a
										href="#" aria-controls="example1" data-dt-idx="7" tabindex="0">Next</a></li>
								</ul>
							</div>
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
<%@ include file="_controlSideBar.jsp"%>


<%@ include file="_defaultJS.jsp"%>
<script
	src="${pageContext.request.contextPath}/resources/admin/js/dataTables.bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/admin/js/jquery.dataTables.min.js"></script>
<script>
	$(function() {
		$('#example2').DataTable({
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
