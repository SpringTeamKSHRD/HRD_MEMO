var domain=window.location.origin+"/HRD_MEMO";
loadPage();

function loadPage(){
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
					+ "<b><span class='title'>"
						+ data.DATA[i].title
					+ "</span></b><br/><br/>"
					+ "<p>"
						+ data.DATA[i].content.substring(0, 30)
					+ "</p>"
					+"<small><p>"
						+data.DATA[i].date
						+"&nbsp;&nbsp;&nbsp;"
						+privacy
					+"</p></small>"
					+ "</li>";
			
	}			

	contents += "</ul>";
	$("#listmemo").html(contents);
}
	/*When user select on combobox to change amount of rows to display.*/
	$("#limit_row").change(function(){
		var limit=$("#limit_row").val(); //alert(limit);
		
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
	});
	
	function clearMemo(){
		CKEDITOR.instances.editor1.setData("");
		$(".titlememo").val("");
	}
	
	function cancelMemo(){
		loadPage();
	}
