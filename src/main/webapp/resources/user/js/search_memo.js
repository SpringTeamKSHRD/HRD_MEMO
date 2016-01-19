var domain=window.location.origin+"/HRD_MEMO";

	var s_title="<div class='row'>"
					+"<div class='input-field col s12'>"
						+"<input placeholder='type title memo' id='search_title' onkeyup='filterByTitle()' type='text' class='validate'>"
					+"</div>"
				 +"</div>";
	var s_website="<div class='row'>"
					+"<div class='input-field col s12'>"
						+"<input placeholder='type website name' id='search_website' onkeyup='filterByWebsite()' type='text' class='validate'>"
					+"</div>"
				 +"</div>";
	var s_public="&nbsp;&nbsp;<br/><br/>"
				+"<div class='switch'>"
					+"<label>"
						+"Public"
							+"<input type='checkbox' id='ispublic' onchange='filterByPublic()'>"
							+"<span class='lever'></span>"
						+"</label>"
				+"</div>";
	var s_date="<br/><div class='row'>"
				+"<div class='col s12 m4 l6'>"
					+"<input type='date' id='s_date' onchange='filterByDate()'>"
				+"</div>"
				+"<div class='col s12 m4 l6'>"
					+"<input type='date' id='e_date' onchange='filterByDate()'>"
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
			filterByPublic();
		}else if(value==4){
			$("#searcharea").html(s_date);
		}

	});
	
	var ispublic=false;
	function filterByPublic(){
			$.ajax({
				type : "GET",
				url : domain+"/user/privacy/"+ispublic,
				success : function(data) {
					//alert("Success :" + data);
					displayData(data);
				},
				error : function(data) {
					//alert("Unsuccess: " + data.MESSAGE);
					console.log("ERROR..." + data);
				}
			});	
			if(ispublic==false) ispublic=true;
			else ispublic=false;
	}
	
	function filterByTitle(){
		//alert("hello");
		var title=$("#search_title").val();
		$.ajax({
			type : "GET",
			url : domain+"/user/filter/title/"+title,
			success : function(data) {
				//alert("Success :" + data);
				displayData(data);
			},
			error : function(data) {
				//alert("Unsuccess: " + data.MESSAGE);
				console.log("ERROR..." + data);
			}
		});
	}
	
	function filterByWebsite(){
		//alert(website);
		var website=$("#search_website").val(); 
		$.ajax({
			type : "GET",
			url : domain+"/user/filter/domain/"+website,
			success : function(data) {
				//alert("Success :" + data);
				displayData(data);
			},
			error : function(data) {
				//alert("Unsuccess: " + data.MESSAGE);
				console.log("ERROR..." + data);
			}
		});
	}
	
	function filterByDate(){
		//alert("start date :"+$("#s_date").val()+" And end date: "+$("#e_date").val()); alert(typeof($("#s_date")));
		var sd=$("#s_date").val();
		var ed=$("#e_date").val();
		//alert("start date :"+sd+" And end date: "+ed);
		if(sd!=null || ed!=null){
			//alert("send to server.")
			$.ajax({
				type : "GET",
				url : domain+"/user/filterdate/"+sd+"/"+ed,
				dataType : 'json',
				data : null,
				success : function(data) {
					//alert("Success :" + data);
					displayData(data);
				},
				error : function(data) {
					//alert("Unsuccess: " + data.MESSAGE);
					console.log("ERROR..." + data);
				}
			});
		}
	}
