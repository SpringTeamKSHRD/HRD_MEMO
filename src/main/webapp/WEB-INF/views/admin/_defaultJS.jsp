   <!-- REQUIRED JS SCRIPTS -->

    <!-- jQuery 2.1.4 -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/bootstrap.min.js"></script>
    <!-- AdminLTE App -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/app.min.js"></script>
	<script>
		var url = $(location).attr('href');;
		url = url.split("/");
		var newUrl=url[5];
		/* if(typeof variable_here === 'undefined'){
			$('ul.sidebar-menu li:first-child').addClass('active');
		}else  */if(newUrl=="users"){
			$('ul.sidebar-menu li:nth-last-child(4)').addClass('active');
		}else if(newUrl=="memos"){
			$('ul.sidebar-menu li:nth-last-child(3)').addClass('active');
		}else{
			$('ul.sidebar-menu li:nth-last-child(5)').addClass('active');
		}
		
	</script>
    <!-- Optionally, you can add Slimscroll and FastClick plugins.
         Both of these plugins are recommended to enhance the
         user experience. Slimscroll is required when using the
         fixed layout. -->