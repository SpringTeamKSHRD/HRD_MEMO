var domain=window.location.origin+"/HRD_MEMO";

function editmemo(id) {
	var value1="Private";
	var value2="Public";
	var data=$("#cont_memo").val("");
	 
	 	$.ajax({
		type : "GET",
		url : domain+"/user/"+ id,
		success : function(data) {
			$("#userid").val(data.DATA.userid);
			$(".titlememo").val(data.DATA.title);
			$("#cont_memo").val(data.DATA.content);
			
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
		
			//change button to update
			$("#btnsave").text("Update");
			$("#btnsave").attr("onclick","updateMemo("+id+")");
			
		},
		error : function(data) {
			alert("Unsuccess:" + data.MESSAGE);
			console.log("ERROR..." + data);
		}
	});
}

$('select').on('contentChanged', function() {
    // re-initialize (update)
    $(this).material_select();
  });