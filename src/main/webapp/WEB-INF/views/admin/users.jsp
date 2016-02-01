<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>${pageTitle }| Memo</title>
	<%@ include file="_defaultCss.jsp"%>
</head>
<%@ include file="_header.jsp"%>
<%@ include file="_sideBarMenu.jsp"%>
	<div class="search" style="margin: 10px 50px 25px 50px;">
		<form class="form-inline">
		  <div class="form-group col-sm-7">    
		    <div class="input-group col-sm-12">    
		      <input type="text" class="form-control" placeholder="Search User" id="inputSearch" required> 
		      <span class="input-group-btn">
		        <button type="submit" id="search-btn" class="btn btn-flat">
		          <i class="fa fa-search"></i>
		        </button>
		      </span>
		    </div>
		  </div>  
		  <div class="form-group" style="margin-right: 15px;">    
		    <div class="btn-group" id="searchBy">
		      <button type="button" id="searchByValue" class="btn btn-default" data="username" style="background-color: white;">Username</button>
		      <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
		        <span class="caret"></span> <span class="sr-only">Toggle Dropdown</span>
		      </button>
		      <ul class="dropdown-menu" role="menu">
		        <li><a href="#" data="username">Username</a></li>
		        <li><a href="#" data="email">Email</a></li>
		      </ul>
		    </div>
		  </div>
		  <div class="form-group">    
		    <div class="btn-group" id="limitBy">
		      <button type="button" id="limitByValue" class="btn btn-default" data="10" style="background-color: white;">10 Rows</button>
		      <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
		        <span class="caret"></span> <span class="sr-only">Toggle Dropdown</span>
		      </button>
		      <ul class="dropdown-menu" role="menu">
		        <li><a href="#" data="10">10 Rows</a></li>
		        <li><a href="#" data="20">20 Rows</a></li>
		        <li><a href="#" data="50">50 Rows</a></li>
		        <li><a href="#" data="100">100 Rows</a></li>
		      </ul>
		    </div>
		  </div>  
		</form>
	</div>

<div class="row">
	<div class="col-xs-12">
		<div class="box">
			<div class="box-body">
				<div class="row">
					<div class="col-sm-12">
						<table class="table table-bordered table-striped table-hover" style="margin: 0px">
							<thead>
								<tr>
									<th>#</th>
									<th>Username</th>
									<th>Gender</th>
									<th>Email</th>
									<th>Type</th>
									<th>Date</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody id="content">
							</tbody>
						</table>
						<div id="error" class="center-block" style="display:none;width:400px;margin-top: 25px;">
							<div class="alert alert-danger" style="text-align: center;margin: 15px;">
								Users Not Found
								<a href="#" id="listAllUser">List All Users</a>
							</div>
						</div>
						<div id="page-selection" style="padding:15px 15px 0 15px">
							<div class="form-group pull-right"> 
								<input type="checkbox"  id="viewEnabled" checked> View Enabled Users<br>
							</div>
						</div>
					</div>						
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
        <h4 class="modal-title" id="myModalLabel">User Detail</h4>
      </div>
      <div class="modal-body">
	    <form role="form" id="formshow">
		<div class="box-body" style="padding:0px;">
			<div class="form-group">
				<div class="col-sm-4" style="padding-left:0px">
					<label for="id">Report ID</label>
					<input type="number" class="form-control" id="reportid" readonly>
				</div>
				<div class="col-sm-8" style="padding:0px">
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
				<div class="col-sm-4" style="padding-left:0px">
					<label for="id">Memo ID</label>
					<input type="number" class="form-control" id="memoid" readonly>
				</div>
				<div class="col-sm-8" style="padding:0px">
					<label for="title">Written Date</label>
					<input type="text" class="form-control" id="memodate" readonly>				
				</div>
				<div class="clearfix "></div>
			</div>		
			<div class="form-group">
				<div class="col-sm-4" style="padding-left:0px">
					<label for="memodomain">Domain Website</label>		
					<input type="text" class="form-control" id="memodomain" readonly>
				</div>
				<div class="col-sm-8" style="padding:0px">
					<label for="memotitle">Memo Title</label>		
					<a id="memotitle" href="" class="modal-link" target="_blank"></a>
				</div>
				<div class="clearfix "></div>
			</div>
			<div class="form-group">
				<label for="id">Memo Content</label>
				<textarea class="form-control" style="height:150px;max-height:200px;resize:none;" id="memocontent" readonly></textarea>
			</div>
			<div class="form-group" style="margin: 0px;">
				<div class="col-sm-6">
					<label for="owner">Owner</label>		
					<a id="ownerlink" href="" class="modal-link" target="_blank"></a>
				</div>			
				<div class="col-sm-6">
					<label for="reportby">Report By</label>		
					<a id="reportbylink" href="" class="modal-link" target="_blank"></a>
				</div>
				<div class="clearfix "></div>
			</div>
		</div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary pull-left" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>	
<%@ include file="_footer.jsp"%>
<%@ include file="_defaultJS.jsp"%>
<script>
var data = {};
var totalrow = 0;
function showDetail(id){
	$.ajax({
		url: path+"/api/admin/user/"+id,
		type: "get",
		success: function (response) {			
			data = validateNullInJson(response['DATA']);
			
			$('#myModal').modal('show');
		}
	});    	
}
function contructTable(data,ismemoenabled){
	$("#content").html("");
	var btn,text,icon="";
	if(ismemoenabled){		
		btn="btn-danger";
		text="Disable";
		icon="fa-ban";
	}else{
		btn="btn-primary";
		text="Enable";
		icon="fa-unlock";		
	}
	$.each(data, function() {
		$("#content").append(
		"<tr class=clickable-row "+
		"data-href="+path+"/admin/user?id="+this.userid+">"+
			"<td>"+this.userid+"</td>"+
			"<td><img src="+imagepath+this.image+" class=img-avatar>"+
				this.username+"</td>"+
			"<td>"+this.gender+"</td>"+
			"<td>"+this.email+"</td>"+
			"<td>"+this.type+"</td>"+
			"<td>"+this.registerdate+"</td>"+
			"<td><div class='btn-group'><button type='button' class='btn btn-block "+ btn +" btn-xs btn-delete'"+
				"data="+this.userid+">"+text+" <i class='fa "+icon+"'></i></button></div></td>"+
		"</tr>");
	});	
}
function listContent(page){
	$.ajax({
		url: path+"/api/admin/users"+
			"?page="+page+
			"&limit="+$("#limitByValue").attr('data')+
			"&ismemoenabled="+$("#viewEnabled").prop("checked"),
		async: false,
		type: "get",
		success: function (response) {	
			totalrow = response['DATA'][0].count;
			contructTable(response['DATA'],$("#viewEnabled").prop("checked"));				
		},
		statusCode: {
	    	404: function() {
	    		$("#content").html("");
				$(".box-body").css("height","205px");
				$("#error").show(500);
		    }
		}
	});		
}
function searchUser(page){
	$.ajax({
		url: path+"/api/admin/users/search"+
				"?page="+page+
				"&limit="+$("#limitByValue").attr('data')+
				"&ismemoenabled="+$("#viewEnabled").prop("checked")+
				"&keyword="+$("#inputSearch").val()+
				"&column="+$("#searchByValue").attr('data'),
		async: false,
		type: "get",
		success: function (response) {
			$(".box-body").css("height","auto");
			$("#error").hide();
			totalrow = response['DATA'][0].count;			
			contructTable(response['DATA'],$("#viewEnabled").prop("checked"));		
		},
		statusCode: {
	    	404: function() {
	    		$("#content").html("");
				$(".box-body").css("height","205px");
				$("#error").show(500);
		    }
		}
	});	
}
function createPagination(page,totalrow,listFunction){
	var totalpage = 0;
	var limitrow = $("#limitByValue").attr('data');
	if(totalrow % limitrow != 0)	totalpage = totalrow / limitrow + 1;
	else							totalpage = totalrow / limitrow;	
	$('#page-selection').bootpag({
	    total: totalpage,
	    maxVisible : 5,
	    page:page,
	    nextClass: 'next',
	    prevClass: 'prev',
	    lastClass: 'last',
	    firstClass: 'first',
	    leaps: true,
	}).on("page", function(event, page){
		listFunction(page);
	});
}
function listOrSearchUsers(){
	$(".box-body").css("height","auto");
	$("#error").hide();
	if($("#inputSearch").val()==""){
		listContent(1);
		createPagination(1,totalrow,listContent);	
	}else{
		searchUser(1);
		createPagination(1,totalrow,searchUser);			
	}
}
function toggleUser(row){
	if(confirm("Are you sure?")) {
		$.ajax({
			url: path+"/api/admin/user/"+row.attr('data'),
			type: "delete",
			async: false,
			success: function (response) {
				row.parents('tr').remove();		
			}
		});
	}
}
$(document).ready(function($) {
	if(ParamToJson().id)	showDetail(ParamToJson().id);
	$("body").on("click",".btn-delete",function(){
		toggleUser($(this));
	}); 
    $("#viewEnabled").click(function(){
    	listOrSearchUsers();
    });
    $(".form-inline").submit(function(e){
    	e.preventDefault();
    	listOrSearchUsers();
    })
    $("#searchBy .dropdown-menu li a").click(function(){
		$("#searchByValue").text($(this).text());
		$("#searchByValue").attr('data',$(this).attr('data'));
    });
    $("#limitBy .dropdown-menu li a").click(function(){
		$("#limitByValue").text($(this).text());
		$("#limitByValue").attr('data',$(this).attr('data'));
		listOrSearchUsers();
    });
    $("#listAllUser").click(function(){
    	$("#inputSearch").val("");
    	listOrSearchUsers();
    });
    listOrSearchUsers();
});
</script>
</body>
</html>
