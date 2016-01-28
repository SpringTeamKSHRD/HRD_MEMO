<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>${pageTitle }| Memo</title>
	<%@ include file="_defaultCss.jsp"%>
</head>
<body>
<%@ include file="_header.jsp"%>
<%@ include file="_sideBarMenu.jsp"%>
	<div class="search" style="margin: 10px 50px 25px 50px;">
<form class="form-inline" role="form">
  <div class="form-group col-sm-7">    
    <div class="input-group col-sm-12">    
      <input type="text" class=" form-control" placeholder="Search User"> 
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
					<div class="col-sm-12" id="content">
						<table id="tbl-user" class="table table-bordered table-striped table-hover">
							<thead>
								<tr>
									<th>#</th>
									<th>Username</th>
									<th>Gender</th>
									<th>Email</th>
									<th>Type</th>
									<th>Date</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="listUser" items="${listUser}">							
									<tr class='clickable-row' style="cursor:pointer"data-href='${pageContext.request.contextPath}/admin/user/${listUser.userid}'>										
										<td>${listUser.userid}</td>
										<td>
		                    				<img src="${pageContext.request.contextPath}/resources/admin/imgs/${listUser.image}" alt="User Image" style ="float: left;width: 25px;height: 25px;border-radius: 50%; margin-right: 10px;margin-top: -2px;">
			                   				${listUser.username}     
										</td>
										<td>${listUser.gender}</td>
										<td>${listUser.email}</td>
										<td>${listUser.type}</td>
										<td>${listUser.registerdate}</td>										
									</tr>									  
								</c:forEach>
							</tbody>
						</table>
						   <div id="page-selection">Pagination goes here</div>
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
<script src="${pageContext.request.contextPath}/resources/admin/js/jquery.bootpag.min.js"></script>
<script>
jQuery(document).ready(function($) {
    $(".clickable-row").click(function() {
        window.document.location = $(this).data("href");
    });
});
<script>
// init bootpag
$('#page-selection').bootpag({
    total: 10
}).on("page", function(event, /* page number here */ num){
     $("#content").html("Insert content"); // some ajax content loading...
});
</script>
</script>
</body>
</html>
