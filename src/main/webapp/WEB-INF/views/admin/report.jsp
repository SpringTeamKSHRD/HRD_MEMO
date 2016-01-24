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
			<div class="box-body">
				<div class="row">
					<div class="col-sm-12">
						<table id="tbl-user" class="table table-bordered table-striped table-hover">
							<thead>
								<tr>
									<th>#</th>
									<th>Memo</th>
									<th>Description</th>
									<th>Date</th>
									<th>Block</th>									
								</tr>
							</thead>
							<tbody> 
								<c:forEach var="listReport" items="${listReport}">
									<tr class='clickable-row' style="cursor:pointer" data-href='${listReport.id}'>
										<td>${listReport.id}</td>
										<td>${listReport.memotitle}</td>
										<td>${listReport.description}</td>
										<td>${listReport.reportdate}</td>
										<td>${listReport.isblock}</td>
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

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">Report Detail</h4>
	      </div>
	      <div class="modal-body">
		    <form role="form" id="formshow">
			<div class="box-body">
				<div class="form-group">
					<div class="col-sm-3" style="padding-left:0px">
						<label for="id">Report ID</label>
						<input type="number" class="form-control" id="reportid" readonly>
					</div>
					<div class="col-sm-9" style="padding-right:0px">
						<label for="date">Report Date</label>
						<input type="date" class="form-control" id="reportdate" readonly>
					</div>
					<div class="clearfix "></div>
				</div>		
				<div class="form-group">
					<label for="description">Report Description</label>
					<input type="text" class="form-control" id="reportdescription" readonly>
				</div>
				<div class="form-group">
					<div class="col-sm-3" style="padding-left:0px">
						<label for="id">Memo ID</label>
						<input type="number" class="form-control" id="memoid" readonly>
					</div>
					<div class="col-sm-9" style="padding-right:0px">
						<label for="title">Written On</label>
						<input type="date" class="form-control" id="memodate" readonly>				
					</div>
					<div class="clearfix "></div>
				</div>		
				<div class="form-group">
					<label for="memotitle">Memo Title</label>		
					<input type="text" class="form-control" id="memotitle" readonly>
				</div>
				<div class="form-group">
					<label for="id">Memo Content</label>
					<textarea class="form-control" style="height:150px;max-height:200px;resize:none;" id="memocontent" readonly></textarea>
				</div>
				<div class="form-group" style="margin: 0px;">
					<div class="col-sm-4" style="padding-left:0px">
						<label for="reportby">Report By</label>		
						<a id="reportbylink" href="" style="display: block;width: 100%;height: 34px;padding: 6px 12px;font-size: 14px;">
							<img id="reportbyimg" src="" alt="User Image" 
							style="float: left;width: 25px;height: 25px;border-radius: 50%;margin-right: 10px;margin-top: -2px;">N/A
						</a>
					</div>
					<div class="col-sm-4">
						<label for="owner">Owner</label>		
						<a id="ownerlink" href="" style="display: block;width: 100%;height: 34px;padding: 6px 12px;font-size: 14px;">
							<img id="ownerimg" src="" alt="User Image" 
							style="float: left;width: 25px;height: 25px;border-radius: 50%;margin-right: 10px;margin-top: -2px;">N/A
						</a>
					</div>
					<div class="col-sm-4" style="padding-right:0px">
						<label for="owner">Block</label>		
						<div style="display: block;width: 100%;height: 34px;padding: 6px 12px;font-size: 14px;">
							<input type="checkbox"> True/False
						</div>				
					</div>			
					<div class="clearfix "></div>
				</div>
			</div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>	
	<%@ include file="_footer.jsp"%>
	<%@ include file="_defaultJS.jsp"%>
<script>
var path="${pageContext.request.contextPath}";
var imagepath=path+"/resources/admin/imgs/";
jQuery(document).ready(function($) {
    $(".clickable-row").click(function() {
		$.ajax({
			url: path+"/admin/report/"+$(this).data("href"),
			type: "get",
			success: function (response) {
				var data = response['DATA'];
				$("#reportid").val(data.id);
				$("#reportdate").val(data.reportdate);
				$("#reportdescription").val(data.description);
				$("#memoid").val(data.memoid);
				$("#memodate").val(data.memodate);
				$("#memotitle").val(data.memotitle);
				$("#memocontent").val(data.memocontent);
				$("#reportbylink").attr('href', path+"/admin/user/"+data.reporterid);
				$("#reportbylink").html("<img id='ownerimg' src='"+imagepath+data.reporterimage+"' alt='User Image' style='float: left;width: 25px;height: 25px;border-radius: 50%;margin-right: 10px;margin-top: -2px;'>"+data.reportername);
				$("#ownerlink").attr('href', path+"/admin/user/"+data.ownermemoid);
				$("#ownerlink").html("<img id='ownerimg' src='"+imagepath+data.ownermemoimage+"' alt='User Image' style='float: left;width: 25px;height: 25px;border-radius: 50%;margin-right: 10px;margin-top: -2px;'>"+data.ownermemoname);
			}
		});    	
    	$('#myModal').modal('show');
    });
    $('#myModal').on('hidden.bs.modal', function () {
    	$("#formshow")[0].reset();
    })
});
</script>	
</body>
</html>