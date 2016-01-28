var domain=window.location.origin+"/HRD_MEMO";

loadPage();

function loadPage(){
	clearMemo();
	$.ajax({
				type : "GET",
				url : domain+"/user/list/",
				dataType : 'json',
				data : null,
				success : function(data) {
					displayData(data);
				},
				error : function(data) {
					sweetAlert("Opp...", "No memo!", "error");
					console.log("ERROR..." + data);
				}
			});
	/*change button to update*/
	$("#btnsave").text("Save");
	$("#btnsave").attr("onclick","saveMemo()");
}

/* extract data to display */
function displayData(data) {
	var contents = "<ul class='collection'>";
				 
	var privacy;
	for (var i = 0; i < data.DATA.length; i++) {
		if(data.DATA[i].ispublic==false) privacy="Private";
		else privacy="Public";
		contents += "<li class='collection-item avatar' style='padding-left:30px;' onclick='editmemo("+data.DATA[i].id+")'>"
					+ "<a><i class='material-icons'>assignment</i></a>"
					+ "<b>&nbsp;&nbsp;<span class='title'>"
						+ data.DATA[i].title
					+ "</span></b>"
					+"<a><i class='material-icons right reddel' onclick='deletememo("+data.DATA[i].id+")'>delete</i></a>"
					+ "<p>"
						+ data.DATA[i].content.substring(0, 30)+".........."
					+ "</p>"
					+"<b><small>"
					+"<p>"
						+data.DATA[i].date
						+"&nbsp;&nbsp;&nbsp;"
						+data.DATA[i].domain.substring(0,23)
						+"&nbsp;&nbsp;&nbsp;"
						+privacy
					+"</p>"
					+"</small></b>"
					+ "</li>";
			
	}			

	contents += "</ul>";
	$("#listmemo").html(contents);
}
	/* delete memo*/
	function deletememo(id){
		swal({   title: "Are you sure?",
				 text: "You will not be able to recover this memo file!",
				 type: "warning",   showCancelButton: true,   confirmButtonColor: "#DD6B55",
				 confirmButtonText: "Yes, delete it!",
				 closeOnConfirm: false },
				 function(){					 
					 $.ajax({
							type : "DELETE",
							url : domain+"/user/"+id,
							success : function(data) {
								swal("Deleted!", "Your memo file has been deleted.", "success");
								loadPage();
							},
							error : function(data) {
								sweetAlert("Fail", "Fail with deleted memo!", "error");
								console.log("ERROR..." + data);
							}
						});	    
		});
	}
	
	function listReport(){
		alert("list report");
		$(".report").attr("display","block");
	}
	
	function clearMemo(){
		$("#cont_memo").val("");
		$(".titlememo").val("");
	}
	
	function cancelMemo(){
		clearMemo();
		loadPage();
	}
