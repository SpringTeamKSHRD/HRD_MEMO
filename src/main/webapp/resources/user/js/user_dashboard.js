var domain=window.location.origin+"/HRD_MEMO";
loadPage();

function loadPage(){
	//alert("loadpage.");
	clearMemo();
	$.ajax({
				type : "GET",
				url : domain+"/user/list/"+5,
				dataType : 'json',
				data : null,
				success : function(data) {
					//alert("Success :" + data);
					displayData(data);
				},
				error : function(data) {
					alert("Unsuccess: " + data.MESSAGE);
					console.log("ERROR..." + data);
				}
			});
	/*change button to update*/
	$("#btnsave").text("Save");
	$("#btnsave").attr("onclick","saveMemo()");
}

/* list data */
function displayData(data) {
	//alert("display data.");
	var contents = "<ul class='collection highlight'>";
	var privacy;

	for (var i = 0; i < data.DATA.length; i++) {
		if(data.DATA[i].ispublic==false) privacy="Private";
		else privacy="Public";
		contents += "<li class='collection-item avatar' onclick='editmemo("+data.DATA[i].id+")'>"
					+ "<a><i class='material-icons'>room</i></a>"
					+ "<b><span class='title'>"
						+ data.DATA[i].id
					+ "</span>"
					+ "<span class='title'>"
						+ data.DATA[i].title
					+ "</span>"
					+"<a><i class='material-icons right reddel' onclick='deletememo("+data.DATA[i].id+")'>delete</i></a>"
					+ "<p>"
						+ data.DATA[i].content.substring(0, 30)+".........."
					+ "</p>"
					+"<small>"
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
		//alert("delete memo function.");
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
								//alert("Success :" + data.MESSAGE);
								loadPage();
							},
							error : function(data) {
								alert("Unsuccess: " + data.MESSAGE);
								console.log("ERROR..." + data);
							}
						});	    
		});
	}
	
	/*When user select on combobox to change amount of rows to display.*/
	function limitRow(){
		var limit=$("#limit_row").val();
		//alert(limit);
		
		clearMemo();
		$.ajax({
					type : "GET",
					url : domain+"/user/list/"+limit,
					dataType : 'json',
					data : null,
					success : function(data) {
						//alert("Success :" + data);
						displayData(data);
					},
					error : function(data) {
						alert("Unsuccess: " + data.MESSAGE);
						console.log("ERROR..." + data);
					}
				});
		/*change button to update*/
		$("#btnsave").text("Save");
		$("#btnsave").attr("onclick","saveMemo()");
	}
	
	function clearMemo(){
		$("#cont_memo").val("");
		$(".titlememo").val("");
	}
	
	function cancelMemo(){
		loadPage();
	}
