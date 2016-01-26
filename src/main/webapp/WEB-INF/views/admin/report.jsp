<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
								<th>Title</th>
								<th>Description</th>
								<th>Date</th>									
							</tr>
						</thead>
						<tbody> 
							<c:forEach var="listReport" items="${listReport}">
								<tr class='clickable-row' style="cursor:pointer" data-href='${listReport.id}'>
									<td>${listReport.id}</td>
									<td>${listReport.memotitle}</td>
									<td>${listReport.description}</td>
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

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
        <h4 class="modal-title" id="myModalLabel">Report Detail</h4>
      </div>
      <div class="modal-body">
	    <form role="form" id="formshow">
		<div class="box-body" style="padding:0px;">
			<div class="form-group">
				<div class="col-sm-3" style="padding-left:0px">
					<label for="id">Report ID</label>
					<input type="number" class="form-control" id="reportid" readonly>
				</div>
				<div class="col-sm-9" style="padding-right:0px">
					<label for="date">Report Date</label>
					<input type="text" class="form-control" id="reportdate" readonly>
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
					<label for="title">Written Date</label>
					<input type="text" class="form-control" id="memodate" readonly>				
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
				<div class="col-sm-6" style="padding-left:0px">
					<label for="reportby">Report By</label>		
					<a id="reportbylink" href="" style="display: block;width: 100%;height: 34px;padding: 6px 12px;font-size: 14px;"></a>
				</div>
				<div class="col-sm-6">
					<label for="owner">Owner</label>		
					<a id="ownerlink" href="" style="display: block;width: 100%;height: 34px;padding: 6px 12px;font-size: 14px;"></a>
				</div>			
				<div class="clearfix "></div>
			</div>
		</div>
		</form>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" id="btnblock">Block</button>
        <button type="button" class="btn btn-primary pull-left" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>	
<%@ include file="_footer.jsp"%>
<%@ include file="_defaultJS.jsp"%>
<script>
var data = {};
var path="${pageContext.request.contextPath}";
var imagepath=path+"/resources/admin/imgs/";
function showDetail(id){
	$.ajax({
		url: path+"/admin/report/"+id,
		type: "get",
		success: function (response) {			
			data = validateNullInJson(response['DATA']);
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
			if(ParamToJson().id==undefined) window.history.pushState(null,null,window.location.href+"?id="+data.id);
			console.log(JSON.stringify(data));
		}
	});    	
	$('#myModal').modal('show');
}
function ParamToJson() {            
    var pairs = location.search.slice(1).split('&');    
    var result = {};
    pairs.forEach(function(pair) {
        pair = pair.split('=');
        result[pair[0]] = decodeURIComponent(pair[1] || '');
    });
    return JSON.parse(JSON.stringify(result));
}
function validateNullInJson(data){
	for (var x in data) {
        if (data[x]==="null" || data[x]===null || data[x]==="" || typeof data[x] === "undefined") {
            data[x] = "N/A";
        }	    
	}
	return data;
}
jQuery(document).ready(function($) {
	if(!isNaN(ParamToJson().id)){
		showDetail(ParamToJson().id);
	}
    $(".clickable-row").click(function() {
    	showDetail($(this).data("href"));
    });
    $('#myModal').on('hidden.bs.modal', function () {
    	$("#reportbylink").attr('href', '');
    	$("#ownerlink").attr('href', '');
    	$("#reportbylink").html('');
    	$("#ownerlink").html('');
    	$("#formshow")[0].reset();
    	data={};
    	if(ParamToJson().id) window.history.pushState(null,null,window.location.origin+window.location.pathname);
    })
    $('#btnblock').click(function(){
    	console.log(JSON.stringify(data));
    	$.ajax({
    		url: "http://localhost:8080/HRD_MEMO/admin/report/block",
    		type: "POST",
    		dataType : 'json',
    		contentType: "application/json; charset=utf-8",
    		data:JSON.stringify(data),
    		success: function (response) {		}
    	});  
    });
});
</script>	
<script src="http://192.168.178.186:8080/HRD_MEMO/resources/admin/js/memo.min.js" defer></script>
</body>
</html>
