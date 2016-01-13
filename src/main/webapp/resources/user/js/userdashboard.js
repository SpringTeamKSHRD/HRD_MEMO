var domain=window.location.origin+"/HRD_MEMO";
loadPage();

function loadPage(){
	//alert("load page");
	$
			.ajax({
				type : "GET",
				url : domain+"/user/list/"+10,
				dataType : 'json',
				data : null,
				success : function(data) {
					alert("Success :" + data);
					displayData(data);
				},
				error : function(data) {
					alert("Unsuccess: " + data.MESSAGE);
					console.log("ERROR..." + data);
				}
			});
}

function displayData(data) {
	var contents = "<ul class='collection'>";

	for (var i = 0; i < data.DATA.length; i++) {
		contents += "<li class='collection-item avatar'>"
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

/*function detailmemo(id) {
	//alert("detail memo id "+id);
	var str = "";
	$.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/user/"+ id,
		success : function(data) {
			//alert("Success detail:" + data.MESSAGE);
			//alert(data.RESPONSE_DATA.name);
			$("#image").attr(
					"src",
					domainname + "/resources/upload/profile/"
							+ data.RESPONSE_DATA.image);
			str = "Title: " + data.RESPONSE_DATA.titlememo + "<br/>"
					+ "Category: " + data.DATA.categoryid + "<br/>"
					+ "Date: " + data.DATA.date + "<br/>"
					+ "Public: " + data.DATA.ispublic + "<br/>"
					+ "Title URL: " + data.DATA.titleurl + "<br/>"
					+ "Domain: " + data.DATA.domain + "<br/>"
					+ "URL: " + data.DATA.url+ "<br/>"
					+ "<br/>" 
					+ "Content: "+data.DATA.content;
			$("#detailmemo").html(str);
		},
		error : function(data) {
			alert("Unsuccess:" + data.MESSAGE);
			console.log("ERROR..." + data);
		}
	});
}
*/
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