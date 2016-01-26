var domain=window.location.origin+"/HRD_MEMO";

listOldReport();
listNewReport();

function listReport(){
	
}
function displayReport(data){
	var contents = "<ul class='collection'>";
	for(var i=0;i<data.DATA.length;i++){
		contents+="<li class='collection-item avatar'>"
				 +"<img src='"+domain+"/resources/user/image/wuyifan.jpg' alt='' class='circle'>"
				 +"<b><span class='title'>"
				 	/*+data.DATA[i].id */
				 	+"Admin"
				 +"</span></b>"
				 +"<p>"
				 	+data.DATA[i].message
				 +"</p>"
				 +"</li>";
	}
	contents+="</ul>";
	return contents;
}
function listNewReport(){
	var uid=parseInt($("#userid").val());
	$.ajax({
		type : "GET",
		url : domain+"/user/newreport/"+uid,
		dataType : 'json',
		data : null,
		success : function(data) {
			$("#list_new_report").html(displayReport(data));
		},
		error : function(data) {
			console.log("ERROR..." + data);
		}
	});
}
function listOldReport(){
	var uid=parseInt($("#userid").val());
	$.ajax({
		type : "GET",
		url : domain+"/user/oldreport/"+uid,
		dataType : 'json',
		data : null,
		success : function(data) {
			$("#list_old_report").html(displayReport(data));
		},
		error : function(data) {
			console.log("ERROR..." + data);
		}
	});
}


function clearReport(){
	/*var uid=parseInt($("#userid").val());
	
	$.ajax({
		type : "GET",
		url : domain+"/user/changereport/"+uid,
		dataType : 'json',
		data : null,
		success : function(data) {
			//alert(data.MESSAGE);
			$("#total_report").text("");
			$("#list_report_area").html("");
		},
		error : function(data) {
			sweetAlert("Oops...", "Report is not found!", "error");
			//alert("Unsuccess: " + data.MESSAGE);
			console.log("ERROR..." + data);
		}
	});*/
}
