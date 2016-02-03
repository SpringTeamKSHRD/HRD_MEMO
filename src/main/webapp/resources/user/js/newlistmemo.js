var pageNumber=0;
var displayRecord=0;
var current=1;
function generatePageNumber(data,displayrec){
	displayRecord=displayrec;
	     if(data>0){
	    	 if(data % displayrec !=0){
	    		 pageNumber=Math.floor(data/displayrec)+1;
	    	 }else{
	    		 pageNumber=data/displayrec;
	    	 }
	     }
}
function getRecordeNumber(){
	json = {
			userid:$("#userid").val(),
			title:$("#searchtitle").val(),
			domain:$("#searchdomain").val(),
			date:$("#searchdate").val(),
			ispublic:$("#searchprivacy").val()
		};
  $.ajax({
		type : "POST",
		url : path+"/user/getmemonumber",
		data : JSON.stringify(json),
		contentType: 'application/json',
		success : function(data) {
					generatePageNumber(data.DATA,10);
					getMemoDisplay(1);
		},
		error : function(data) {
		  $("#listmemo").html("<div>No Recorde Has Been Found</div>");
		  $("#pagination").html("");
		  $("#rowwrapper").css("display","none");
		}
	});  
}
function getMemoDisplay(page){
	json = {
			userid:$("#userid").val(),
			title:$("#searchtitle").val(),
			domain:$("#searchdomain").val(),
			date:$("#searchdate").val(),
			ispublic:$("#searchprivacy").val(),
			page:page,
			limit:displayRecord
		};
  $.ajax({
		type : "POST",
		url : path+"/user/getmemonumber",
		data : JSON.stringify(json),
		contentType: 'application/json',
		success : function(data) {
		
		},
		error : function(data) {
			$("#listmemo").html("<div>No Recorde Has Been Found</div>");
		  $("#pagination").html("");
		  $("#rowwrapper").css("display","none");
		}
	});  	
}
$("#next").click(function(){
	if(current<pageNumber){
		current++;
		getMemoDisplay(current);
	}
});
$("#prev").click(function(){
	if(current>1){
		current--;
		getMemoDisplay(current);
	}
});