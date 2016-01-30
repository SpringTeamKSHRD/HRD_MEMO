function listAllMemo(){
	$.ajax({
				type : "GET",
				url : "http://localhost:8080/HRD_MEMO/user/list/"+$("#userid").val(),
				dataType : 'json',
				data : null,
				success : function(data) {
					displayData(data);
				},
				error : function(data) {
					sweetAlert("Opp...", "No memo!", "error");
				}
			});
}
function displayData(data) {
	var contents = "<table class='bordered responsive-table'>" +
					"<thead style='color:white; background:#009688;'>" +
						"<tr>" +
							"<th>No.</th>" +
							"<th>Title</th>" +
							"<th>Domain</th>" +
							"<th>Status</th>" +
							"<th>Date</th>" +
							"<th style='text-align:center;'>Action</th>" +
						" </tr>" +
					"</thead>" +
					"<tbody>";
	for (var i = 0; i < data.DATA.length; i++) {
		 contents+="<tr>" +
			 		"<td>"+data.DATA[i].id+"</td>" +
			 		"<td>"+generateText(data.DATA[i].title)+"</td>" +
			 		"<td>"+generateText(data.DATA[i].domain)+"</td>";
			 		if(data.DATA[i].ispublic===false){
			 			contents+="<td>Private</td>";
			 		}else if(data.DATA[i].ispublic===true){
			 			contents+="<td>Public</td>";
			 		}
			 		contents+="<td>"+data.DATA[i].date+"</td>" +
			 		"<td style='text-align:center;'>" +
			 		"<a class='btn waves-effect waves-purple' onclick=getViewMemo("+data.DATA[i].id+") style='background:#fff; color:green; padding:0px 10px 10px 10px;'><i class='small material-icons'>" +
			 		"visibility</i></a>" +
			 		"&nbsp;&nbsp;<a class='btn waves-effect waves-green' onclick=toEdit("+data.DATA[i].id+") style='background:#fff; color:black; padding:0px 10px 10px 10px;'><i class='small material-icons'>mode_edit</i></a>" +
			 		"&nbsp;&nbsp;<a class='btn waves-effect waves-red' onclick=deletememo("+data.DATA[i].id+") style='background:#fff; color:red; padding:0px 10px 10px 10px;'><i class='small material-icons'>delete</i></a></td>" +
		 		" </tr>";
	}			
	contents += " </tbody></table>";
	$("#listmemo").html(contents);
}
listAllMemo();
	function deletememo(id){
		swal({   title: "Are you sure?",
				 text: "You will not be able to recover this memo file!",
				 type: "warning",   showCancelButton: true,   confirmButtonColor: "#DD6B55",
				 confirmButtonText: "Yes, delete it!",
				 closeOnConfirm: false },
				 function(){					 
					 $.ajax({
							type : "DELETE",
							url : "http://localhost:8080/HRD_MEMO/user/"+id,
							success : function(data) {
								swal("Deleted!", "Your memo file has been deleted.", "success");
								listAllMemo();
							},
							error : function(data) {
								sweetAlert("Fail", "Fail with deleted memo!", "error");
							}
						});	    
		});
	}
function getViewMemo(id){
	$.ajax({
		type : "GET",
		url : "http://localhost:8080/HRD_MEMO/user/"+id,
		success : function(data) {
		       $("#memo_title").text("Title: "+generateText(data.DATA.title));
		       $("#website").text("Website: "+data.DATA.domain);
		       $("#memo_content").text(data.DATA.content);
		       $("#memo_date").text("Date: "+data.DATA.date);
		       $('#modal1').openModal();
		},
		error : function(data) {
			 alert("rerror");
		}
	});
}
$("#writememo").click(function(){
	window.location.href="http://localhost:8080/HRD_MEMO/user/user";
});
function generateText(text){
	if(text.length>30){
		return text=text.substring(0,30)+"...";
	}else{
		return text;
	}
}
function toEdit(id){
	var value1="Private";
	var value2="Public";
	 $("#cont_memo").val("");
	 $("#icon_prefix").focus();
	 $.ajax({
			type : "GET",
			url : "http://localhost:8080/HRD_MEMO/user/"+id,
			success : function(data) {
				if(data.DATA.ispublic==false){
					// clear contents
				    var $selectDropdown = $("#privacy") .empty()
											            .html(' ');
				    // add new value
				    $selectDropdown.append($("<option></option>").attr("value","0")
				        										 .text(value1)
				    );   
				    $selectDropdown.append($("<option></option>").attr("value","1")
						        					             .text(value2)
				    );
				    // trigger event
				    $selectDropdown.trigger('contentChanged');		    		    
				}else{
					// clear contents
				    var $selectDropdown = $("#privacy").empty().html(' ');
				    // add new value
				    $selectDropdown.append($("<option></option>").attr("value","1")
				        										 .text(value2)
				    ); 
				    $selectDropdown.append($("<option></option>").attr("value","0")
						        					             .text(value1)
				    );
				    // trigger event
				    $selectDropdown.trigger('contentChanged');
				}
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
$('select').on('contentChanged', function() {
    // re-initialize (update)
    $(this).material_select();
  });
function editProcess(id){
	var ispublic;
	if($("#privacy").val()==0) 
		ispublic=false;
	else 
		ispublic=true;
	
	json = {
			title : $('.titlememo').val(),
			content : $("#cont_memo").val(),
			ispublic : ispublic,
			id : id
		};
	swal({   title: "Are you sure?",
		 text: "You will not be able to recover this memo file!",
		 type: "warning",   showCancelButton: true,   confirmButtonColor: "#DD6B55",
		 confirmButtonText: "Yes, edit it!",
		 closeOnConfirm: false },
		 function(){					 
			 $.ajax({
					type : "PUT",
					url : "http://localhost:8080/HRD_MEMO/user/"+id,
					data : JSON.stringify(json),
					contentType: 'application/json',
					success : function(data) {
						swal("Success","Your memo has been updated.","success");
					  listAllMemo();
					},
					error : function(data) {
						alert("Unsuccess: " + data.MESSAGE);
					}
				});  
		});
	$('#modal2').closeModal();
	
}