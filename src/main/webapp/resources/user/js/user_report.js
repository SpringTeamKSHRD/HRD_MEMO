var domain=window.location.origin+"/HRD_MEMO";
//alert("user report");
listReport();

function listReport(){
	var uid=parseInt($("#userid").val());
	//alert(uid);
	$.ajax({
		type : "GET",
		url : domain+"/user/report/"+uid,
		dataType : 'json',
		data : null,
		success : function(data) {
			//alert(data.MESSAGE);
			displayReport(data);
		},
		error : function(data) {
			sweetAlert("Oops...", "Report is not found!", "error");
			//alert("Unsuccess: " + data.MESSAGE);
			console.log("ERROR..." + data);
		}
	});
}

function displayReport(data){
	var contents = "<ul class='collection'>";
	for(var i=0;i<data.DATA.length;i++){
		contents+="<li class='collection-item avatar'>"
				 +"<img src='${pageContext.request.contextPath}/resources/user/image/avatar.jpg' alt='' class='circle'>"
				 +"<span class='title'>"
				 	/*+data.DATA[i].id */
				 +"Admin"
				 +"</span>"
				 +"<p>"
				 	+data.DATA[i].message
				 +"</p>"
				 +"</li>";
	}
	contents+="</ul>";
	$("#list_report_area").html(contents);
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