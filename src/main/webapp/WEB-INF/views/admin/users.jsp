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
<%@ include file="_footer.jsp"%>
<%@ include file="_defaultJS.jsp"%>
<script>
var totalrow = 0;
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
		"<tr class=clickable-row style=cursor:pointer "+
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
function listOrSearch(){
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
	$("body").on("click",".btn-delete",function(){
		toggleUser($(this));
	}); 
    $("#viewEnabled").click(function(){
    	listOrSearch();
    });
    $(".form-inline").submit(function(e){
    	e.preventDefault();
    	listOrSearch();
    })
    $("#searchBy .dropdown-menu li a").click(function(){
		$("#searchByValue").text($(this).text());
		$("#searchByValue").attr('data',$(this).attr('data'));
    });
    $("#limitBy .dropdown-menu li a").click(function(){
		$("#limitByValue").text($(this).text());
		$("#limitByValue").attr('data',$(this).attr('data'));
		listOrSearch();
    });
    $("#listAllUser").click(function(){
		$(".box-body").css("height","auto");
		$("#error").hide();
    	$("#inputSearch").val("");
    	listOrSearch();
    });
    listOrSearch();
});
</script>
</body>
</html>
