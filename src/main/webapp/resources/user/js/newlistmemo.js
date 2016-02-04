

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
//For Delete Memo
function deletememo(id){
	swal({   title: "Are you sure?",
			 text: "You will not be able to recover this memo file!",
			 type: "warning",   showCancelButton: true,   confirmButtonColor: "#DD6B55",
			 confirmButtonText: "Yes, delete it!",
			 closeOnConfirm: false },
			 function(){					 
				 $.ajax({
						type : "DELETE",
						url : path+"/user/"+id,
						success : function(data) {
							swal("Deleted!", "Your memo file has been deleted.", "success");
							getMemoNumber();
						},
						error : function(data) {
							sweetAlert("Fail", "Fail with deleted memo!", "error");
						}
					});	    
	});
}
//To Edit
function toEdit(id){
	var value1="Private";
	var value2="Public";
	 $("#cont_memo").val("");
	 $("#icon_prefix").focus();
	 $.ajax({
			type : "GET",
			url : path+"/user/"+id,
			success : function(data) {
				   // Private or public data.DATA.ispublic
			       $(".titlememo").val(data.DATA.title);
			       $("#editurl").val(data.DATA.url);
			       $("#cont_memo").val(data.DATA.content);
			       $('#modal2').openModal();
			       $("#btneditwrapper").html("<a class='waves-effect waves-light btn right' " +
			       							"onclick=editProcess("+id+") style='margin:20px;'>Edite</a>");
			},
			error : function(data) {
				 alert("rerror");
			}
		});
}
//Edit Process
function editProcess(id){
	var mypublic;
	if($("#privacy").val()==0) 
		mypublic=false;
	else 
		mypublic=true;
	json = {
			title : $('.titlememo').val(),
			content : $("#cont_memo").val(),
			ispublic : mypublic,
			id : id
		};				 
			 $.ajax({
					type : "PUT",
					url : path+"/user/"+id,
					data : JSON.stringify(json),
					contentType: 'application/json',
					success : function(data) {
						alert("Udate Success");
						getRecordeNumber();
					},
					error : function(data) {
						alert("Update Unsuccess")
					}
				});  
	
}