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
			</div>
		</div>
	</div>
</div>
<%@ include file="_footer.jsp" %>
<%@ include file="_defaultJS.jsp" %>
<script>
jQuery(document).ready(function($) {
    $(".clickable-row").click(function() {
        window.document.location = $(this).data("href");
    });
});
</script>
</body>
</html>
