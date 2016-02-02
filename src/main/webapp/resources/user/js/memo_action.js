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
function getViewMemo(id){
	$.ajax({
		type : "GET",
		url : path+"/user/"+id,
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
	window.location.href=path+"/user/user";
});
function generateText(text){
	if(text!=null){
	if(text.length>30){
		return text=text.substring(0,30)+"...";
	}else{
		return text;
	}
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
			url : path+"/user/"+id,
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
	swal({   title: "Are you sure?",
		 text: "You will not be able to recover this memo file!",
		 type: "warning",   showCancelButton: true,   confirmButtonColor: "#DD6B55",
		 confirmButtonText: "Yes, edit it!",
		 closeOnConfirm: false },
		 function(){					 
			 $.ajax({
					type : "PUT",
					url : path+"/user/"+id,
					data : JSON.stringify(json),
					contentType: 'application/json',
					success : function(data) {
						swal("Success","Your memo has been updated.","success");
					  getMemoNumber();
					},
					error : function(data) {
						alert("Unsuccess: " + data.MESSAGE);
					}
				});  
		});
	$('#modal2').closeModal();
	
}