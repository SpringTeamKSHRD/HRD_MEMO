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

<%@ include file="_header.jsp" %>
<%@ include file="_sideBarMenu.jsp" %>
	<div class="search" style="margin: 10px 50px 25px 50px;">
		<form class="form-inline">
		  <div class="form-group col-sm-7">    
		    <div class="input-group col-sm-12">    
		      <input type="text" class="form-control" placeholder="Search Memo" id="inputSearch" required> 
		      <span class="input-group-btn">
		        <button type="submit" id="search-btn" class="btn btn-flat">
		          <i class="fa fa-search"></i>
		        </button>
		      </span>
		    </div>
		  </div>  
		  <div class="form-group" style="margin-right: 15px;">    
		    <div class="btn-group" id="searchBy">
		      <button type="button" id="searchByValue" class="btn btn-default" data="title" style="background-color: white;">Title</button>
		      <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
		        <span class="caret"></span> <span class="sr-only">Toggle Dropdown</span>
		      </button>
		      <ul class="dropdown-menu" role="menu">
		        <li><a href="#" data="title">Title</a></li>
		        <li><a href="#" data="domain">Domain</a></li>
		        <li><a href="#" data="username">Username</a></li>
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
						<table id="tbl-user" class="table table-bordered table-striped table-hover">
							<thead>
								<tr>
									<th>#</th>
									<th>Owner</th>
									<th>Title</th>
									<th>Domain</th>
									<th>Date</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody id="content">

							</tbody>
						</table>
						<div id="error" class="center-block" style="display:none;width:400px;margin-top: 25px;">
							<div class="alert alert-danger" style="text-align: center;margin: 15px;">
								Memos Not Found
								<a href="#" id="listAllMemo">List All Memos</a>
							</div>
						</div>
						<div id="page-selection" style="padding:15px 15px 0 15px">
							<div class="form-group pull-right"> 
								<input type="checkbox"  id="viewEnabled" checked> View Enabled Memos<br>
							</div>
							<div class="form-group pull-right" style="margin-right: 20px;"> 
								<input type="checkbox"  id="viewPublic" checked> View Public Memos<br>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="_footer.jsp" %>
<%@ include file="_defaultJS.jsp" %>
<script>
var totalrow = 0;
function contructTable(data){
	$("#content").html("");
	$.each(data, function() {
		$("#content").append(
			"<tr class=clickable-row data-href="+this.id+">"+
				"<td>"+this.id+"</td>"+
				"<td style='padding:0px'><a href='"+path+"/admin/users?id="+this.userid+"' class='modal-link' target='_blank'>"+this.username+
					"<img src="+imagepath+this.userimage+" class=img-avatar></a></td>"+
				"<td style='padding:0px'><a href='"+this.url+"' class='modal-link' target='_blank'>"+this.title+"</a></td>"+
				"<td>"+this.domain+"</td>"+
				"<td>"+this.date+"</td>"+
				"<td><div class='btn-group'><button type='button' class='btn btn-block btn-primary btn-xs btn-delete'"+
					"data="+this.userid+">Detail <i class='fa fa-info'></i></button></div></td>"+
			"</tr>");
	});	
}
function listContent(page){
	$.ajax({
		url: path+"/api/admin/memos"+
			"?page="+page+
			"&limit="+$("#limitByValue").attr('data')+
			"&isenabled="+$("#viewEnabled").prop("checked")+
			"&ispublic="+$("#viewPublic").prop("checked"),
		async: false,
		type: "get",
		success: function (response) {	
			totalrow = response['DATA'][0].count;
			contructTable(response['DATA']);				
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
function searchMemo(page){
	$.ajax({
		url: path+"/api/admin/memos/search"+
				"?page="+page+
				"&limit="+$("#limitByValue").attr('data')+
				"&isenabled="+$("#viewEnabled").prop("checked")+
				"&ispublic="+$("#viewPublic").prop("checked")+
				"&keyword="+$("#inputSearch").val()+
				"&column="+$("#searchByValue").attr('data'),
		async: false,
		type: "get",
		success: function (response) {
			$(".box-body").css("height","auto");
			$("#error").hide();
			totalrow = response['DATA'][0].count;			
			contructTable(response['DATA']);		
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
function listOrSearchMemos(){
	$(".box-body").css("height","auto");
	$("#error").hide();
	if($("#inputSearch").val()==""){
		listContent(1);
		createPagination(1,totalrow,listContent);	
	}else{
		searchMemo(1);
		createPagination(1,totalrow,searchMemo);			
	}
}
jQuery(document).ready(function($) {
/*     $(".clickable-row").click(function() {
        window.document.location = $(this).data("href");
    }); */
    $("#viewEnabled").click(function(){
    	listOrSearchMemos();
    });
    $("#viewPublic").click(function(){
    	listOrSearchMemos();
    });
    $(".form-inline").submit(function(e){
    	e.preventDefault();
    	listOrSearchMemos();
    })
    $("#searchBy .dropdown-menu li a").click(function(){
		$("#searchByValue").text($(this).text());
		$("#searchByValue").attr('data',$(this).attr('data'));
    });
    $("#limitBy .dropdown-menu li a").click(function(){
		$("#limitByValue").text($(this).text());
		$("#limitByValue").attr('data',$(this).attr('data'));
		listOrSearchMemos();
    });
    $("#listAllMemo").click(function(){
    	$("#inputSearch").val("");
    	listOrSearchMemos();
    });
    listOrSearchMemos();
});
</script>
</body>
</html>
