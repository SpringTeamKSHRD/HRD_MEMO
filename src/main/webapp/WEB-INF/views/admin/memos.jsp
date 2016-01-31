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
<form class="form-inline" role="form">
  <div class="form-group col-sm-7">    
    <div class="input-group col-sm-12">    
      <input type="text" class=" form-control" placeholder="Search Memo"> 
      <span class="" style="
		    position: relative;
		    font-size: 0;
		    white-space: nowrap;
		    width: 1%;
		    white-space: nowrap;
		    vertical-align: middle;
		    display: table-cell;
			">
        <button type="submit" name="search" id="search-btn" class="btn btn-flat">
          <i class="fa fa-search"></i>
        </button>
      </span>
    </div>
  </div>  
  <div class="form-group" style="margin-right: 15px;">    
    <div class="btn-group">
      <button type="button" class="btn btn-default" style="background-color: white;">10 Rows</button>
      <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
        <span class="caret"></span> <span class="sr-only">Toggle
        Dropdown</span>
      </button>
      <ul class="dropdown-menu" role="menu">
        <li><a href="#">Action</a></li>
        <li><a href="#">Another action</a></li>
        <li><a href="#">Something else here</a></li>
      </ul>
    </div>
  </div>
  <div class="form-group">    
    <div class="btn-group">
      <button type="button" class="btn btn-default" style="background-color: white;">10 Rows</button>
      <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
        <span class="caret"></span> <span class="sr-only">Toggle
        Dropdown</span>
      </button>
      <ul class="dropdown-menu" role="menu">
        <li><a href="#">Action</a></li>
        <li><a href="#">Another action</a></li>
        <li><a href="#">Something else here</a></li>
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
									<th>Content</th>
									<th>Domain</th>
									<th>Url</th>
									<th>Date</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="listMemo" items="${listMemo}">							
									<tr class='clickable-row' style="cursor:pointer"data-href='${pageContext.request.contextPath}/admin/user/${listMemo.id}'>										
										<td>${listMemo.id}</td>
										<td>
		                    				<img src="${pageContext.request.contextPath}/resources/admin/imgs/${listMemo.userimage}" alt="User Image" style ="float: left;width: 25px;height: 25px;border-radius: 50%; margin-right: 10px;margin-top: -2px;">
			                   				${listMemo.username}     
										</td>
										<td>${listMemo.title}</td>
										<td>${listMemo.content}</td>
										<td>${listMemo.domain}</td>
										<td>${listMemo.url}</td>
										<td>${listMemo.date}</td>										
									</tr>									  
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="form-group pull-right"> <input type="checkbox"  id="checkEnable" value="Bike"> View Disable<br></div>
			</div>
		</div>
		<!-- /.box-body -->
	</div>
	<!-- /.box -->
</div>
<!-- /.col -->
<%@ include file="_footer.jsp" %>
<%@ include file="_defaultJS.jsp" %>
<script>
if(ParamToJson().isenabled){
	$("#checkEnable").prop( "checked", true);
}
jQuery(document).ready(function($) {
    $(".clickable-row").click(function() {
        window.document.location = $(this).data("href");
    });
    $("#checkEnable").click(function(){
    	if(this.checked)  window.location.href=window.location.href+"?isenabled=false";
    	else window.location.href=window.location.origin+window.location.pathname;
    });
});
</script>
</body>
</html>
