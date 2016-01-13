var domain=window.location.origin+"/HRD_MEMO";
loadPage();

function loadPage(){
	//alert("load page");
	$
			.ajax({
				type : "GET",
				url : domain+"/user/list/"+20,
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
}

function displayData(data) {
	var contents = "<ul class='collection highlight'>";

	for (var i = 0; i < data.DATA.length; i++) {
		contents += "<li class='collection-item avatar' onclick='editmemo("+data.DATA[i].id+")'>"
					+ "<span class='title'>"
					+ data.DATA[i].id
					+ "</span>"
					+ "<a><i class='material-icons'>room</i></a>"
					+ "<span class='title'>"
						+ data.DATA[i].titlememo
					+ "</span>"
					+ "<p>"
						+ data.DATA[i].content
					+ "</p>"
					+ "</li>";
			
	}			

	contents += "</ul>";
	$("#listmemo").html(contents);
	//${pageContext.request.contextPath}/resources/upload/profile/
}

//
function editmemo(id) {
	//alert("detail memo id "+id);
	 var data = CKEDITOR.instances.editor1.getData(); //alert(data);
	 
	 	$.ajax({
		type : "GET",
		url : domain+"/user/"+ id,
		success : function(data) {
			//alert(data.DATA.content);
			CKEDITOR.instances.editor1.setData(data.DATA.content);
		},
		error : function(data) {
			alert("Unsuccess:" + data.MESSAGE);
			console.log("ERROR..." + data);
		}
	});
}

function saveMemo(){
	
	/*var data = CKEDITOR.instances.editor1.getData(); //data which get from ckeditor
	alert("data : "+$('#userid').val()+$('.titlememo').val()+$("select[name='privacy'] option:selected").val()+data);*/
	
	/*json = {
			userid : $('#userid').val(),
			titlememo : $('.titlememo').val(),
			content : data,
			titleurl : "Memo Dashboard",
			domain : "www.khmeracademy.org.kh",
			url : "http://khmeracademy.org.kh",
			isenable : true,
			ispublic : true //$('select[name="privacy"] option:selected').val()
			//enable : $('input:radio[name=enable]:checked').val(),
			//image : $("#image").val().split("\\").pop(), //"default.jpg" 
		};*/
	/*alert("after data json.");
	$.ajax({
		type : "POST",
		url : domain + "/user/",
		data : JSON.stringify(json),
		contentType: 'application/json',
		success : function(data) {
			alert("Success :" + data.MESSAGE);
			//uploadImage();
		},
		error : function(data) {
			alert("Unsuccess: " + data.MESSAGE);
			console.log("ERROR..." + data);
		}
	});*/
}





/*function edituser(id) {
	location.href = "${pageContext.request.contextPath}/user/" + "editmemo/"+ id;
}*/

/*function deleteuser(id) {
	alert("delete memo id "+id);
	$.ajax({
		type : "DELETE",
		url : "${pageContext.request.contextPath}/user/" + id,
		success : function(data) {
			alert("Success: " + data.MESSAGE);
			loadPage();
		},
		error : function(data) {
			alert("Unsuccess:" + data.MESSAGE);
			console.log("ERROR..." + data);
		}
	});
}*/