var domain=window.location.origin+"/HRD_MEMO";
//alert("user report");
listnotification();

function listnotification(){
	$.ajax({
		type : "GET",
		url : domain+"/user/notification",
		dataType : 'json',
		data : null,
		success : function(data) {
			//alert(data);
			/*for(var i=0;i<data.DATA.length;i++){
				alert(data.DATA[i].id);
			}*/
		},
		error : function(data) {
			alert("Unsuccess: " + data.MESSAGE);
			console.log("ERROR..." + data);
		}
	});
	/*$.ajax({
		url: domain+"/admin/notification",
		type: "GET",
		success: function (response) {
			for(var i=0;i<response.DATA.length; i++){
				alert(response.DATA[i].id);
			}*/
			/*$("#notifcationcount").html(response['DATA'].length);
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
	});*/
}

/* notification socket*/
 /*var url="ws://localhost:8080/HRD_MEMO/memo/usernotification";
 var websocket=new WebSocket(url);	     
 websocket.onmessage=function(message){	    	  
	 if(message.data==="report"){  
			alert("New Report");
		 listnotification();			
	 }
 }  */