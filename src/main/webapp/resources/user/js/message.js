function listAllMessage(page,limit){
	var uid=parseInt($("#userid").val());
	var date="NO";
	$.ajax({
		type : "GET",
		url : path+"/user/oldmessage/"+uid+"/"+page+"/"+limit+"/"+date,
		success : function(data) {
		       $("#message_diplayer").html(extractData(data));
		},
		error : function(data) {
			  alert("No Message");
		}
	});
}
function extractData(data){
	var str="<table class='table table-bordered'>" +
			"<tbody>" +
				"<tr>" +
					"<th style='width: 15px'>#</th>" +
					"<th style='width: 60px'>Sender</th>" +
					"<th>Descript</th>" +
					"<th style='width: 100px'>Date</th>" +
					"<th style='width: 60px'>Memo</th>" +
					"</tr></tbody>";
	for(var i=0;i<data.DATA.length;i++){
		str+=" <tr>"+
				"<td>"+(i+1)+".</td>" +
				"<td>Admin</td>" +
				"<td>"+data.DATA[i].message+"</td>" +
				"<td>"+data.DATA[i].date+"</td>" +
				"<td><button type='button' class='btn btn-success' " +
				"onclick=getBlockedMemo("+data.DATA[i].memoid+")><i class='fa fa-eye'></i></button>" +
				"</td>" +
				"</tr>";
	}
	str+=" </tbody></table>";
	return str;
}
function getBlockedMemo(id){
	$.ajax({
		type : "GET",
		url : path+"/user/"+id,
		success : function(data) {
			alert(data.DATA);
		      /* $("#memo_title").text("Title: "+generateTitle(data.DATA.title));
		       $("#website").text("Website: "+data.DATA.domain);
		       $("#memo_content").text(data.DATA.content);
		       $("#memo_date").text("Date: "+data.DATA.date);
		       $('#modal1').openModal();*/
		},
		error : function(data) {
			 alert("rerror");
		}
	});
}
function generateTitle(title){
	 var tl=title.length;
	 if(tl>50){
		 return title.substring(0, 50)+"...";
	 }else{
		 return title;
	 }
}
var url="ws://"+location.hostname+":"+location.port+path+"/memo/usernotification";
  var websocket=new WebSocket(url);
  websocket.onopen=function(message){
  }
  websocket.onclose=function(message){
 	 websocket.close();
  }
  websocket.onmessage=function(message){
 	 if(message.data==="response"){
 		getAllNumberMessage();
 		updateMessageStatus();
 	 }
  }
  function updateMessageStatus(){
		var uid=parseInt($("#userid").val());
		$.ajax({
			type : "GET",
			url : path+"/user/changereport/"+uid,
			success : function(data) {
			},
			error : function(data) {
			}
		});
	}
  
  function getAllNumberMessage(){
	  var uid=parseInt($("#userid").val());
	  var date="NO";
		/*if($("#sdate").val()==""){
			date="NO";
		}else{
			date=$("#sdate").val();
		}*/
		$.ajax({
			type : "GET",
			url : path+"/user/allnumbermessage/"+uid+"/"+date,
			success : function(data) {
				getNumPagination(data.DATA,5,4);
				listAllMessage(1,recordNum);
			},
			error : function(data) {
				alert("get error");
			}
		});
  }
  
  getAllNumberMessage();
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
	  
  $(document).on('click.pagination', '.pagination .pbtn', function (e) {
		var page = parseInt($(this).text());
		listAllMessage(page,recordNum);
 });
  $(document).on('click.pagination', '.pagination #btnprev', function (e) {
		prevPage(lowPage-1);
		// disableButtNextPrev();
});
 $(document).on('click.pagination', '.pagination #btnnext', function (e) {
	 nextPage(higthPage+1);
	// disableButtNextPrev();
});

  function nextPage(click){
	  var myPagin="<li><a id='btnprev'>«</a></li>";
	  if(click> pageNum){
		  //alert("noth do to do1");
	  }else if(click > higthPage){
		  listAllMessage(click,recordNum);
			  currentPagin++;
		  if(currentPagin * trueDisplay <= pageNum){
			  higthPage=currentPagin * trueDisplay;
			  lowPage=higthPage - trueDisplay + 1;
			 // alert(lowPage+"   "+higthPage);
			  for(var i=(currentPagin-1) * trueDisplay+1;i<=currentPagin*trueDisplay;i++){
				  if(i==(currentPagin-1) * trueDisplay+1){
					  myPagin+="<li><a class='pbtn'>"+i+"</a></li>";
					  }
					  else{
						  myPagin+="<li><a class='pbtn'>"+i+"</a></li>";
					  }
			  }  
			  myPagin+=" <li><a id='btnnext'>»</a></li>";
			  $("#pagination").html(myPagin);
		  }else{
			  lowPage=higthPage+1;
			  higthPage=pageNum;
			  //alert(lowPage+"   "+higthPage);
			  for(var i=(currentPagin-1) * trueDisplay+1;i <= pageNum;i++){
				  if(i==(currentPagin-1) * trueDisplay+1){
					  myPagin+="<li><a class='pbtn'>"+i+"</a></li>";
					  }
					  else{
						  myPagin+="<li><a class='pbtn'>"+i+"</a></li>";
					  }
			  }
			  myPagin+=" <li><a id='btnnext'>»</a></li>";
			  $("#pagination").html(myPagin);
		  }
	  }
  }
  function firstGeneratePagination(){
	  var myPagin="<li><a id='btnprev'>«</a></li>";
	  if(currentPagin * trueDisplay <= pageNum){
		  higthPage=currentPagin * trueDisplay;
		  for(var i=(currentPagin-1) * trueDisplay+1;i<=currentPagin*trueDisplay;i++){
			  if(i==(currentPagin-1) * trueDisplay+1){
			  myPagin+="<li><a class='pbtn'>"+i+"</a></li>";
			  }
			  else{
				  myPagin+="<li><a class='pbtn'>"+i+"</a></li>";
			  }
		  }  
	  }else{
		  higthPage=pageNum;
		  for(var i=(currentPagin-1) * trueDisplay+1;i <= pageNum;i++){
			  if(i==(currentPagin-1) * trueDisplay+1){
				  myPagin+="<li><a class='pbtn'>"+i+"</a></li>";
				  }
				  else{
					  myPagin+="<li><a class='pbtn'>"+i+"</a></li>";
				  }
		  }
	  }
	 // alert(lowPage);
	  myPagin+=" <li><a id='btnnext'>»</a></li>";
	  return myPagin;
}
  function prevPage(click){
	  //alert(click);
	  var myPagin="<li><a id='btnprev'>«</a></li>";
	  if(click <= 0){
		  //alert("noth do to do1");
	  }else if(click < lowPage){
		  	  currentPagin--;
		  	  higthPage=currentPagin * trueDisplay;
		  	  lowPage=higthPage - trueDisplay + 1;
		      listAllMessage(higthPage-trueDisplay+1,recordNum);
		    //  alert(lowPage+"  "+higthPage);
			  for(var i=lowPage;i<=higthPage;i++){
				  if(i==lowPage){
					  myPagin+="<li><a class='pbtn'>"+i+"</a></li>";
					  }
					  else{
						  myPagin+="<li><a class='pbtn'>"+i+"</a></li>";
					  }
			  }  
			  myPagin+=" <li><a id='btnnext'>»</a></li>";
			  $("#pagination").html(myPagin);
	  }
  }
 $('#btnsearch').click(function(){
	 alert(new Date());
 });
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  