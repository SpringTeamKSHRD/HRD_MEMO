 var domain=window.location.origin+"/HRD_MEMO";
function listAllMemo(page,recNum){
	getSearchValue();
	var json={
			userid:parseInt($("#userid").val()),
			limit:recNum,
			page:page,
			search:search,
			column:$("#searchopt").val()
	};
	$.ajax({
				type : "POST",
				url : domain+"/user/getallmemo",
				dataType : 'json',
				contentType: 'application/json',
				data : JSON.stringify(json),
				success : function(data) {
					displayData(data);
				},
				error : function(data) {
					sweetAlert("Opp...", "No memo!", "error");
				}
			});
} 
function displayData(data) {
	var contents = "<table class='bordered responsive-table'>" +
					"<thead style='color:white; background:#009688;'>" +
						"<tr>" +
							"<th>No.</th>" +
							"<th>Title</th>" +
							"<th>Domain</th>" +
							"<th>Status</th>" +
							"<th>Date</th>" +
							"<th style='text-align:center;'>Action</th>" +
						" </tr>" +
					"</thead>" +
					"<tbody>";
	for (var i = 0; i < data.DATA.length; i++) {
		 contents+="<tr>" +
			 		"<td>"+data.DATA[i].id+"</td>" +
			 		"<td>"+generateText(data.DATA[i].title)+"</td>" +
			 		"<td>"+generateText(data.DATA[i].domain)+"</td>";
			 		if(data.DATA[i].ispublic===false){
			 			contents+="<td>Private</td>";
			 		}else if(data.DATA[i].ispublic===true){
			 			contents+="<td>Public</td>";
			 		}
			 		contents+="<td>"+data.DATA[i].date+"</td>" +
			 		"<td style='text-align:center;'>" +
			 		"<a class='btn waves-effect waves-purple' onclick=getViewMemo("+data.DATA[i].id+") style='background:#fff; color:black; padding:0px 10px 10px 10px;'><i class='small material-icons'>" +
			 		"visibility</i></a>" +
			 		"&nbsp;&nbsp;<a class='btn waves-effect waves-green' onclick=toEdit("+data.DATA[i].id+") style='background:#fff; color:blue; padding:0px 10px 10px 10px;'><i class='small material-icons'>mode_edit</i></a>" +
			 		"&nbsp;&nbsp;<a class='btn waves-effect waves-red' onclick=deletememo("+data.DATA[i].id+") style='background:#fff; color:red; padding:0px 10px 10px 10px;'><i class='small material-icons'>delete</i></a></td>" +
		 		" </tr>";
	}			
	contents += " </tbody></table>";
	$("#listmemo").html(contents);
}

var numDisplay=0;
  var paginNum=0;
  var currentPNum=0;
  var currentPagin=1;
  var pageNum=0;
  var higthPage=0;
  var lowPage=1;
  var recordNum=0;
  var trueDisplay=0;
  function getNumPagination(data,renum,display){
	  if(data>0){
		  recordNum=renum;
		  if(data % renum != 0){
			  pageNum=Math.floor(data/renum)+1;
		  }else{
			  pageNum=data/renum;
		  }
		  if(pageNum % display != 0){
			 paginNum=Math.floor(pageNum/display)+1;
		  }else{
			  paginNum=pageNum/display;
		  }
		  if(pageNum < display){
			  trueDisplay=pageNum;
		  }else{
			  trueDisplay=display;
		  }
		  higthPage=trueDisplay;
		  $("#pagination").html(firstGeneratePagination());
	  }
  }
	  
  $(document).on('click.waves-effect', '.waves-effect .pbtn', function (e) {
		var page = parseInt($(this).text());
		addAviteClass($(this));
		listAllMemo(page,recordNum);
 });
  $(document).on('click.waves-effect', '.waves-effect #btnprev', function (e) {
		prevPage(lowPage-1);
		// disableButtNextPrev();
});
 $(document).on('click.waves-effect', '.waves-effect #btnnext', function (e) {
	 nextPage(higthPage+1);
	// disableButtNextPrev();
});
  function nextPage(click){
	  var myPagin=" <li class='waves-effect' id='parentprev'><a id='btnprev'><i class='material-icons'>chevron_left</i></a></li>";
	  if(click> pageNum){
		//  alert("noth do to do1");
	  }else if(click > higthPage){
		  listAllMemo(click,recordNum);
			  currentPagin++;
		  if(currentPagin * trueDisplay <= pageNum){
			  higthPage=currentPagin * trueDisplay;
			  lowPage=higthPage - trueDisplay + 1;
			 // alert(lowPage+"   "+higthPage);
			  for(var i=(currentPagin-1) * trueDisplay+1;i<=currentPagin*trueDisplay;i++){
				  if(i==(currentPagin-1) * trueDisplay+1){
					  myPagin+="<li class='waves-effect active'><a class='pbtn'>"+i+"</a></li>";
					  }
					  else{
						  myPagin+="<li class='waves-effect'><a class='pbtn'>"+i+"</a></li>";
					  }
			  }  
			  myPagin+="<li class='waves-effect' id='parentnext'><a id='btnnext'><i class='material-icons'>chevron_right</i></a></li>";
			  $("#pagination").html(myPagin);
		  }else{
			  lowPage=higthPage+1;
			  higthPage=pageNum;
			  //alert(lowPage+"   "+higthPage);
			  for(var i=(currentPagin-1) * trueDisplay+1;i <= pageNum;i++){
				  if(i==(currentPagin-1) * trueDisplay+1){
					  myPagin+="<li class='waves-effect active'><a class='pbtn'>"+i+"</a></li>";
					  }
					  else{
						  myPagin+="<li class='waves-effect'><a class='pbtn'>"+i+"</a></li>";
					  }
			  }
			  myPagin+="<li class='waves-effect' id='parentnext'><a id='btnnext'><i class='material-icons'>chevron_right</i></a></li>";
			  $("#pagination").html(myPagin);
		  }
	  }
  }
  
  function firstGeneratePagination(){
	  var myPagin=" <li class='waves-effect' id='parentprev'><a id='btnprev'><i class='material-icons'>chevron_left</i></a></li>";
	  if(currentPagin * trueDisplay <= pageNum){
		  higthPage=currentPagin * trueDisplay;
		  for(var i=(currentPagin-1) * trueDisplay+1;i<=currentPagin*trueDisplay;i++){
			  if(i==(currentPagin-1) * trueDisplay+1){
			  myPagin+="<li class='waves-effect active'><a class='pbtn'>"+i+"</a></li>";
			  }
			  else{
				  myPagin+="<li class='waves-effect'><a class='pbtn'>"+i+"</a></li>";
			  }
		  }  
	  }else{
		  higthPage=pageNum;
		  for(var i=(currentPagin-1) * trueDisplay+1;i <= pageNum;i++){
			  if(i==(currentPagin-1) * trueDisplay+1){
				  myPagin+="<li class='waves-effect active'><a class='pbtn'>"+i+"</a></li>";
				  }
				  else{
					  myPagin+="<li class='waves-effect'><a class='pbtn'>"+i+"</a></li>";
				  }
		  }
	  }
	 // alert(lowPage);
	  myPagin+="<li class='waves-effect' id='parentnext'><a id='btnnext'><i class='material-icons'>chevron_right</i></a></li>";
	  return myPagin;
}
  function prevPage(click){
	  //alert(click);
	  var myPagin=" <li class='waves-effect' id='parentprev'><a id='btnprev'><i class='material-icons'>chevron_left</i></a></li>";
	  if(click <= 0){
		  //alert("noth do to do1");
	  }else if(click < lowPage){
		  	  currentPagin--;
		  	  higthPage=currentPagin * trueDisplay;
		  	  lowPage=higthPage - trueDisplay + 1;
		      listAllMemo(higthPage-trueDisplay+1,recordNum);
		    //  alert(lowPage+"  "+higthPage);
			  for(var i=lowPage;i<=higthPage;i++){
				  if(i==lowPage){
					  myPagin+="<li class='waves-effect active'><a class='pbtn'>"+i+"</a></li>";
					  }
					  else{
						  myPagin+="<li class='waves-effect'><a class='pbtn'>"+i+"</a></li>";
					  }
			  }  
			  myPagin+="<li class='waves-effect' id='parentnext'><a id='btnnext'><i class='material-icons'>chevron_right</i></a></li>";
			  $("#pagination").html(myPagin);
	  }
  }
  function addAviteClass(obj){
	  $("#pagination").children().removeClass("active");
	  obj.parent().addClass('active');
  }
  function getMemoNumber(){
	  getSearchValue();
	  json = {
				userid:$("#userid").val(),
				column:$("#searchopt").val(),
				search:search
			};
	  $.ajax({
			type : "POST",
			url : domain+"/user/getmemonumber",
			data : JSON.stringify(json),
			contentType: 'application/json',
			success : function(data) {
				getNumPagination(data.DATA,$("#displayrow").val(),4);
				listAllMemo(1, recordNum);
				$("#rowwrapper").fadeIn(500);
			},
			error : function(data) {
				$("#listmemo").html("<div class='row'><div class='col s12 m12' style='text-align:center;'>" +
				  		"<div class='card-panel' style='background-color:rgba(255, 0, 0, 0.26);'>" +
				  		"<h3 class='white-text'>NO MEMO FOR DISPLAYING</h3>" +
				  		"</div></div></div>");
			  $("#pagination").html("");
			  $("#rowwrapper").css("display","none");
			}
		});  
  }
  getMemoNumber();
  var search="";
  var column="";
  $("#searchopt").change(function(){
	  if($("#searchopt").val()==="title"){
		  $("#search").focus();
		  $("#opt2").fadeOut(1,function(){
			  $("#opt1").fadeIn(200);
		  });
		  $("#opt3").fadeOut(1,function(){
			  $("#opt1").fadeIn(200);
		  });
		  $("#opt4").fadeOut(1,function(){
			  $("#opt1").fadeIn(200);
		  });
		  
	  }else if($("#searchopt").val()==="ispublic"){
		  $("#opt1").fadeOut(1,function(){
			  $("#opt2").fadeIn(200);
		  });
		  $("#opt3").fadeOut(1,function(){
			  $("#opt2").fadeIn(200);
		  });
		  $("#opt4").fadeOut(1,function(){
			  $("#opt2").fadeIn(200);
		  });
		  getMemoNumber();
	  }else if($("#searchopt").val()==="domain"){
		  $("#search1").focus();
		  $("#opt1").fadeOut(1,function(){
			  $("#opt3").fadeIn(200);
		  });
		  $("#opt2").fadeOut(1,function(){
			  $("#opt3").fadeIn(200);
		  });
		  $("#opt4").fadeOut(1,function(){
			  $("#opt3").fadeIn(200);
		  });
	  }else if($("#searchopt").val()==="date"){
		  $("#opt1").fadeOut(1,function(){
			  $("#opt4").fadeIn(200);
		  });
		  $("#opt2").fadeOut(1,function(){
			  $("#opt4").fadeIn(200);
		  });
		  $("#opt3").fadeOut(1,function(){
			  $("#opt4").fadeIn(200);
		  });
	  }else{
		  $("#opt1").fadeOut(200);
		  $("#opt2").fadeOut(200);
		  $("#opt3").fadeOut(200);
		  $("#opt4").fadeOut(200);
		  getMemoNumber();
	  }
  });
  $('.datepicker').pickadate({
		 selectMonths: true, // Creates a dropdown to control month
		 selectYears: 10, // Creates a dropdown of 15 years to control year
		 format: 'dd-mm-yyyy',
		 closeOnSelect: false,
		 onSet: function (ele) {
			   if(ele.select){
			          this.close();
			          getMemoNumber();
			   }
			}
	 });
  function getSearchValue(){
	  if($("#searchopt").val()==="title"){
		  search=$("#search").val();
		  column="title";
	  }else if($("#searchopt").val()==="ispublic"){
		  search=$("#ispublic").val();
		  column="ispublic";
	  }else if($("#searchopt").val()==="domain"){
		  search=$("#search1").val();
		  column="domain";
	  }else if($("#searchopt").val()==="date"){
		  search=dateFormat($("#sdate").val());
		  column="date";
	  }else{
		  search="";
		  column="";
	  } 
  }
  $("#btntest").click(function(){
  });
  $("#displayrow").change(function(){
	  getMemoNumber();
  });
  function dateFormat(date){
	  var format=date.split("-");
	  return format[2]+"-"+format[1]+"-"+format[0];
  }
  function handleKeyPress(){
			  getMemoNumber(); 
	} 
  $("#ispublic").change(function(){
	  getMemoNumber();
  });
  