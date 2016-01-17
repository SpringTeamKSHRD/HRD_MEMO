var domain=window.location.origin+"/HRD_MEMO";
loadPage();

function loadPage(){
	//alert("load page");
	clearMemo();
	$.ajax({
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
	//change button to update
	$("#btnsave").text("Save");
	$("#btnsave").attr("onclick","saveMemo()");
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
						+ data.DATA[i].title
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

function saveMemo(){
	
	var data = CKEDITOR.instances.editor1.getData(); //data which get from ckeditor
	var ispublic;
	
	if($("#privacy").val()==0) ispublic=false;
	else ispublic=true;
	//alert("data : "+$('#userid').val()+$('.titlememo').val()+$("select[name='privacy'] option:selected").val()+data);
	
	json = {userid : parseInt($('#userid').val()),
			title : $('.titlememo').val(),
			content : data,
			titleurl : "Memo Dashboard",
			domain : "www.khmeracademy.org.kh",
			url : "http://khmeracademy.org.kh",
			isenable : true,
			ispublic : ispublic
		};
	
	//alert("after data json.")
	$.ajax({
		type : "POST",
		url : domain + "/user/",
		data : JSON.stringify(json),
		contentType: 'application/json',
		success : function(data) {
			alert("Success :" + data.MESSAGE);
			loadPage();
			//uploadImage();
		},
		error : function(data) {
			alert("Unsuccess: " + data.MESSAGE);
			console.log("ERROR..." + data);
		}
	});
}

//edit or detail memo
function editmemo(id) {
	//alert("detail memo id "+id);
	var value1="Private";
	var value2="Public";
	var data = CKEDITOR.instances.editor1.getData(); //alert(data);
	 
	 	$.ajax({
		type : "GET",
		url : domain+"/user/"+ id,
		success : function(data) {
			//alert(data.DATA.ispublic);
			$("#userid").val(data.DATA.userid);
			$(".titlememo").val(data.DATA.title);
			
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
			
			CKEDITOR.instances.editor1.setData(data.DATA.content);
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

function updateMemo(id){
	//alert("id for update."+id);
	var data = CKEDITOR.instances.editor1.getData(); //data which get from ckeditor
	var ispublic;
	
	if($("#privacy").val()==0) ispublic=false;
	else ispublic=true;
	
	json = {userid : parseInt($('#userid').val()),
			title : $('.titlememo').val(),
			content : data,
			/*titleurl : "Memo Dashboard",
			domain : "www.khmeracademy.org.kh",
			url : "http://khmeracademy.org.kh",
			isenable : true,*/
			ispublic : ispublic,
			id : id
		};
	
	$.ajax({
		type : "PUT",
		url : domain + "/user/"+id,
		data : JSON.stringify(json),
		contentType: 'application/json',
		success : function(data) {
			alert("Success :" + data.MESSAGE);
			loadPage();
			//uploadImage();
		},
		error : function(data) {
			alert("Unsuccess: " + data.MESSAGE);
			console.log("ERROR..." + data);
		}
	});
	
}
function clearMemo(){
	CKEDITOR.instances.editor1.setData("");
	$(".titlememo").val("");
}
function cancelMemo(){
	// jong do ey do tov ot kvol ! proz ot jes :'(
	loadPage();
}

//Searching methods
var s_title="<div class='row'>"
				+"<div class='input-field col s12'>"
					+"<input placeholder='type name' id='first_name' type='text' class='validate'>"
				+"</div>"
			+"</div>";
var s_website="<div class='row'>"
				+"<div class='input-field col s12'>"
					+"<input placeholder='type website name' id='first_name' type='text' class='validate'>"
				+"</div>"
			 +"</div>";
var s_public="&nbsp;&nbsp;<br/><br/>"
			+"<div class='switch'>"
    			+"<label>"
    				+"Public"
    					+"<input type='checkbox'>"
    					+"<span class='lever'></span>"
    				+"</label>"
    		+"</div>";
var s_date="<br/><div class='row'>"
				+"<div class='col s12 m4 l6'>"
					+"<input type='date'>"
				+"</div>"
				+"<div class='col s12 m4 l6'>"
					+"<input type='date'>"
				+"</div>"
			+"</div>";

$("#searching").change(function(){
	$("#searcharea").html("");
    
	var value = $("#searching").val(); //alert(value);
	if(value==1){
		$("#searcharea").html(s_title);
	}else if(value==2){
		$("#searcharea").html(s_website);
	}else if(value==3){
		$("#searcharea").html(s_public);
	}else if(value==4){
		$("#searcharea").html(s_date);
		/*$('.datepicker').pickadate({
		    //selectMonths: true, // Creates a dropdown to control month
		    //selectYears: 15 // Creates a dropdown of 15 years to control year
		  });*/
	}
	
});














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