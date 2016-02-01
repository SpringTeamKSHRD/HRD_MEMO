<!-- REQUIRED JS SCRIPTS -->
   <!-- jQuery 2.1.4 -->    
   <script src="${pageContext.request.contextPath}/resources/admin/js/jquery-2.1.4.min.js"></script>
   <!-- Bootstrap 3.3.5 -->
   <script src="${pageContext.request.contextPath}/resources/admin/js/bootstrap.min.js"></script>
   <!-- Alertify -->
   <script	src='${pageContext.request.contextPath}/resources/js/alertify.min.js'></script>
   <!-- Bootpag -->
   <script src="${pageContext.request.contextPath}/resources/admin/js/jquery.bootpag.min.js"></script>
   <!-- AdminLTE App -->
   <script src="${pageContext.request.contextPath}/resources/admin/js/app.min.js"></script>    
<script>
	/* default path and image path */
	var path="${pageContext.request.contextPath}";
	var imagepath=path+"/resources/user/image/";
	/* add active class to side memu */
	var url = $(location).attr('href').split("/")[5];
	if(url==undefined){
		$('ul.sidebar-menu li:nth-last-child(4)').addClass('active');
	}else if(url.search("users") > -1){
		$('ul.sidebar-menu li:nth-last-child(3)').addClass('active');
	}else if(url.search("memos") > -1){
		$('ul.sidebar-menu li:nth-last-child(2)').addClass('active');
	}else if(url.search("reports") > -1){
		$('ul.sidebar-menu li:nth-last-child(1)').addClass('active');
	}
	/*websocket for receiving notification report*/
	var websocket=new WebSocket("ws://192.168.178.186:8080/HRD_MEMO/memo/usernotification");	     
	websocket.onmessage=function(message){	    	  
		if(message.data==="report"){  
			alertify.success("New Report");
			listnotification();
			if(totalrow<10) listOrSearchReports();
		}
	}
	/* clear number on notification */
	$(".notifications-menu").click(function(){
		$("#notifcationcount").html("");
	});
	listnotification();
	/* get param from url as json object */
	function ParamToJson() {            
	    var pairs = location.search.slice(1).split('&');    
	    var result = {};
	    pairs.forEach(function(pair) {
	        pair = pair.split('=');
	        result[pair[0]] = decodeURIComponent(pair[1] || '');
	    });
	    return JSON.parse(JSON.stringify(result));
	}
	/* list report notification from api*/
	function listnotification(){
		$(".menu").html("");
		$("#notifcationcount").html("");
		$.ajax({
			url: path+"/api/admin/notification",
			type: "get",
			success: function (response) {
				$("#notifcationcount").html(response['DATA'].length);				
				jQuery.each(response['DATA'], function() {
					$(".menu").append(
						"<li><a data-href="+this.id+" href='${pageContext.request.contextPath}/admin/reports?id="+this.id+"'>"+
						"<img src='/HRD_MEMO/resources/admin/imgs/"+this.reporterimage+"' alt='User Image'"+
						"style ='float: left;width: 25px;height: 25px;border-radius: 50%;margin-right: 10px;margin-top: -2px;'>"+
						this.reportername+" reports a memo.<span class='label pull-right' style='color:#444444;'>"+this.reportdate+"</span>"+
						"</a></li>"
					);
				});
			}
		});
	}
	/* replace null value with "N/A" */
	function validateNullInJson(data){
		for (var x in data) {
	        if (data[x]==="null" || data[x]===null || data[x]==="" || typeof data[x] === "undefined") {
	            data[x] = "N/A";
	        }	    
		}
		return data;
	}
</script>