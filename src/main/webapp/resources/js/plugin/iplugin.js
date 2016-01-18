//################js for embed inside the iframe with plugin.jsp
//function convert url parameter to json
function ParamToJson() {            
    var pairs = location.search.slice(1).split('&');    
    var result = {};
    pairs.forEach(function(pair) {
        pair = pair.split('=');
        result[pair[0]] = decodeURIComponent(pair[1] || '');
    });
    return JSON.parse(JSON.stringify(result));
}
//####################LOGIC
//check if user is login
$.ajax({
    url: "http://localhost:8080/HRD_MEMO/plugin/user/status",
    type: "get",
    success: function (response) {
    	//if not login redirect to /login with url parameter
        if(response["isLogin"] == false)
        window.location = "http://localhost:8080/HRD_MEMO/plugin/login"+location.search;
    }
});
$(document).ready(function(){
	//get a memo if avaiable
	$.ajax({
	    url: "http://localhost:8080/HRD_MEMO/plugin/memo"+location.search,
	    type: "get",
	    success: function (response) {
	    		$('#memoid').val(response['MESSAGE']['id']);
	            $('#note').val(response['MESSAGE']['content']);
	            $('#ispublic')[0].checked=response['MESSAGE']['ispublic']
	            $('#btnsubmit').html("Save");
	    }
	});
	//on submit form
    $("#frmMemo").submit(function(e) {
		e.preventDefault();
		//convert url paramenter to json
		var obj = ParamToJson();
		//add content from textarea
		obj.content = $('#note').val();
		obj.ispublic = $('#ispublic').prop('checked');
		//add new memo
		if($('#btnsubmit').text()=='Add'){
			$.ajax({
			    url: "http://localhost:8080/HRD_MEMO/plugin/memo",
			    type: "post",
			    data: JSON.stringify(obj),
			    contentType: 'application/json;charset=utf-8',	          
			    success: function (response) {
			    	alert(response['MESSAGE']);
			    }
			});
		}
		//update memo
		if($('#btnsubmit').text()=='Save'){
			//add id from input hidden
			obj.id = $('#memoid').val();
			$.ajax({
			    url: "http://localhost:8080/HRD_MEMO/plugin/memo",
			    type: "put",
			    data: JSON.stringify(obj),
			    contentType: 'application/json;charset=utf-8',	          
			    success: function (response) {
			    	alert(response['MESSAGE']);
			    }
			});
		}
    });
});
//####################UI LOGIC
$(document).ready(function(){
	//on focus textarea add new border style
    $("body").on("focus", "textarea#note", function(e) {    	
    	$("textarea#note").css({"border": "2px solid #009688"});
    });
	//on lost focus textarea add default border style
    $("body").on("focusout", "textarea#note", function(e) {    	
    	$("textarea#note").css({"border": "1px solid #ddd"});
    });     
    //on keyup textarea auto increase height
    $("#note").keyup(function(){
    	$(this).css('height','80px')  
        $(this).css('height',($(this).prop('scrollHeight'))+"px");
    });
});