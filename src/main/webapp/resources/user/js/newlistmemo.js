

// path variable declare in your jsp file
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
			userid:$("#userid").val(),//for userid can text ""
			title:$("#searchtitle").val(),//for search title text can ""
			domain:$("#searchdomain").val(),//for search domain text can ""
			date:$("#searchdate").val(),//for search date format YYYY-MM-DD text can ""
			ispublic:$("#searchprivacy").val()//for privacy true or false text can ""
		};
  $.ajax({
		type : "POST",
		url : path+"/user/numbermemo",
		data : JSON.stringify(json),
		contentType: 'application/json',
		success : function(data) {
					generatePageNumber(data.DATA,10);// all recorde and display recorde
					getMemoDisplay(1);//first load 
					current=1;
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
			userid:$("#userid").val(),//for userid
			title:$("#searchtitle").val(),//for search title 
			domain:$("#searchdomain").val(),//for search domain can ""
			date:$("#searchdate").val(),//for search date format YYYY-MM-DD text can ""
			ispublic:$("#searchprivacy").val(),//for privacy true or false text can ""
			page:page,
			limit:displayRecord
		};
  $.ajax({
		type : "POST",
		url : path+"/user/usermemo",
		data : JSON.stringify(json),
		contentType: 'application/json',
		success : function(data) {
				//Extract data function here
		},
		error : function(data) {
			$("#listmemo").html("<div>No Recorde Has Been Found</div>");
		  $("#pagination").html("");
		  $("#rowwrapper").css("display","none");
		}
	});  	
}

//for next button 
$("#next").click(function(){
	if(current<pageNumber){
		current++;
		getMemoDisplay(current);
	}
});
//for prev button
$("#prev").click(function(){
	if(current>1){
		current--;
		getMemoDisplay(current);
	}
});