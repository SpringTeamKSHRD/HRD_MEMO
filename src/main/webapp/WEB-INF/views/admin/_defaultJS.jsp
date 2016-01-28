   <!-- REQUIRED JS SCRIPTS -->

    <!-- jQuery 2.1.4 -->
    <script	src='${pageContext.request.contextPath}/resources/js/alertify.min.js'></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/jquery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/bootstrap.min.js"></script>
    <!-- AdminLTE App -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/app.min.js"></script>
	<script>
		var path="${pageContext.request.contextPath}";
		var imagepath=path+"/resources/admin/imgs/";
		/* ADD ACTIVE CLASS TO MENU */
		var url = $(location).attr('href');;
		url = url.split("/");
		var newUrl=url[5];
		/* if(typeof variable_here === 'undefined'){
			$('ul.sidebar-menu li:first-child').addClass('active');
		}else  */if(newUrl=="users"){
			$('ul.sidebar-menu li:nth-last-child(3)').addClass('active');
		}else if(newUrl=="memos"){
			$('ul.sidebar-menu li:nth-last-child(2)').addClass('active');
		}else if(newUrl=="reports"){
			$('ul.sidebar-menu li:nth-last-child(1)').addClass('active');
		}else{
			$('ul.sidebar-menu li:nth-last-child(4)').addClass('active');
		}
		
		/* sideBarMenu and header NOTIFICATION*/
		/*	var result = ${dashboard};
	  		if(result.unreportedlist==0){
	  			$("#unreported-list").hide();
	  			$(".label-warning").hide();
	  		}
	 	  	$("#unreported-list").html(result.unreportedlist);
		  	$(".label-warning").html(result.unreportedlist);
		  	$("#notification-text").html("&nbsp;&nbsp;"+result.unreportedlist+"&nbsp;&nbsp;memos reported."); 
		 */
		 function ParamToJson() {            
			    var pairs = location.search.slice(1).split('&');    
			    var result = {};
			    pairs.forEach(function(pair) {
			        pair = pair.split('=');
			        result[pair[0]] = decodeURIComponent(pair[1] || '');
			    });
			    return JSON.parse(JSON.stringify(result));
		}
		/* list notification from api*/
		function listnotification(){
			$.ajax({
				url: path+"/api/admin/notification",
				type: "get",
				success: function (response) {
					$("#notifcationcount").html(response['DATA'].length);
					$(".menu").html("");
					jQuery.each(response['DATA'], function() {
						$(".menu").append(
							"<li><a href='${pageContext.request.contextPath}/admin/reports?id="+this.id+"'>"+
							"<img src='/HRD_MEMO/resources/admin/imgs/"+this.reporterimage+"' alt='User Image'"+
							"style ='float: left;width: 25px;height: 25px;border-radius: 50%;margin-right: 10px;margin-top: -2px;'>"+
							this.reportername+" reports a memo.<span class='label pull-right' style='color:#444444;'>"+this.reportdate+"</span>"+
							"</a></li>"
						);
					});
				}
			});
		}
		listnotification();
		/* notification socket*/
	     var url="ws://localhost:8080/HRD_MEMO/memo/usernotification";
	     var websocket=new WebSocket(url);	     
	     websocket.onmessage=function(message){	    	  
	    	 if(message.data==="report"){  
	    		 alertify.success("New Report");
	    		 listnotification();
	    	 }
	     }  
	    $(".dropdown-toggle").click(function(){
    		 $("#notifcationcount").html("");
    	});
	</script>
    <!-- Optionally, you can add Slimscroll and FastClick plugins.
         Both of these plugins are recommended to enhance the
         user experience. Slimscroll is required when using the
         fixed layout. -->