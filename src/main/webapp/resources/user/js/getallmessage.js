function listAllMessage(page,limit){
	var uid=parseInt($("#userid").val());
	$.ajax({
		type : "GET",
		url : "http://localhost:8080/HRD_MEMO/user/oldmessage/"+uid+"/"+page+"/"+limit,
		success : function(data) {
		       $("#message_diplayer").html(extractData(data));
		},
		error : function(data) {
			  $("#message_diplayer").html("<div class='row'><div class='col s12 m12' style='text-align:center;'>" +
			  		"<div class='card-panel red'>" +
			  		"<h3 class='white-text'>NO MESSAGE FOR DISPLAY</h3>" +
			  		"</div></div></div>");
		}
	});
}
function goToPage() {
	window.location.href="http://localhost:8080/HRD_MEMO/user/userreport";
}
function extractData(data){
	var str="<table class='bordered highlight responsive-table' style='margin-top:10px;'>" +
			"<thead style='background: #26a69a; color:white;'>" +
			"<tr><th data-field='id'>No</th>" +
			"<th data-field='name'>Sender</th>" +
			"<th data-field='price'>Description</th>" +
			"<th data-field='name'>Date</th>" +
			"<th data-field='name'>Action</th>" +
			" </tr></thead><tbody>";
	for(var i=0;i<data.DATA.length;i++){
		str+=" <tr style='padding:0px;'>"+
				"<td>"+data.DATA[i].id+"</td>" +
				"<td>Admin</td>" +
				"<td>"+data.DATA[i].message+"</td>" +
				"<td>"+data.DATA[i].date+"</td>" +
				"<td><a class='waves-effect waves-light btn modal-trigger' onclick=getBlockedMemo("+data.DATA[i].memoid+")><i class='material-icons'>visibility</i></a></td>" +
				"</tr>";
	}
	str+=" </tbody></table>";
	return str;
}
function getBlockedMemo(id){
	$.ajax({
		type : "GET",
		url : "http://localhost:8080/HRD_MEMO/user/"+id,
		success : function(data) {
		       $("#memo_title").text("Title: "+generateTitle(data.DATA.title));
		       $("#website").text("Website: "+data.DATA.domain);
		       $("#memo_content").text(data.DATA.content);
		       $("#memo_date").text("Date: "+data.DATA.date);
		       $('#modal1').openModal();
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
function getNumberMesage(){
	var uid=parseInt($("#userid").val());
	$.ajax({
		type : "GET",
		url : "http://localhost:8080/HRD_MEMO/user/numbermessage/"+uid,
		success : function(data) {
			if(data.DATA>0){
				$(".numnotify").css('display',"inline");
				$(".numnotify").text(data.DATA);
			}else{
				$(".numnotify").css('display',"none");
			}
		},
		error : function(data) {
		}
	});
}
var url="ws://localhost:8080/HRD_MEMO/memo/usernotification";
  var websocket=new WebSocket(url);
  websocket.onopen=function(message){
  }
  websocket.onclose=function(message){
 	 websocket.close();
  }
  websocket.onmessage=function(message){
 	 if(message.data==="response"){
 		listAllMessage(recordNum,trueDisplay);
 		updateMessageStatus();
 	 }
  }
  function updateMessageStatus(){
		var uid=parseInt($("#userid").val());
		$.ajax({
			type : "GET",
			url : "http://localhost:8080/HRD_MEMO/user/changereport/"+uid,
			success : function(data) {
				getNumberMesage();
			},
			error : function(data) {
			}
		});
	}
  
  function getAllNumberMessage(){
	  var uid=parseInt($("#userid").val());
		$.ajax({
			type : "GET",
			url : "http://localhost:8080/HRD_MEMO/user/allnumbermessage/"+uid,
			success : function(data) {
				getNumPagination(data.DATA,3,3);
				listAllMessage(1,recordNum);
			},
			error : function(data) {
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
	  
  $(document).on('click.waves-effect', '.waves-effect .pbtn', function (e) {
		var page = parseInt($(this).text());
		addAviteClass($(this));
		listAllMessage(page,recordNum);
 });
  $(document).on('click.waves-effect', '.waves-effect #btnprev', function (e) {
		prevPage(lowPage-1);
});
 $(document).on('click.waves-effect', '.waves-effect #btnnext', function (e) {
	 nextPage(higthPage+1);
});
  function nextPage(click){
	  var myPagin=" <li class='waves-effect'><a id='btnprev'><i class='material-icons'>chevron_left</i></a></li>";
	  if(click> pageNum){
		  //alert("noth do to do1");
	  }else if(click > higthPage){
		  listAllMessage(click,recordNum);
			  currentPagin++;
		  if(currentPagin * trueDisplay <= pageNum){
			  higthPage=currentPagin * trueDisplay;
			  lowPage=higthPage - trueDisplay + 1;
			  alert(lowPage+"   "+higthPage);
			  for(var i=(currentPagin-1) * trueDisplay+1;i<=currentPagin*trueDisplay;i++){
				  myPagin+="<li class='waves-effect'><a class='pbtn'>"+i+"</a></li>";
			  }  
			  myPagin+="<li class='waves-effect'><a id='btnnext'><i class='material-icons'>chevron_right</i></a></li>";
			  $("#pagination").html(myPagin);
		  }else{
			  lowPage=higthPage+1;
			  higthPage=pageNum;
			  alert(lowPage+"   "+higthPage);
			  for(var i=(currentPagin-1) * trueDisplay+1;i <= pageNum;i++){
				  myPagin+="<li class='waves-effect'><a class='pbtn'>"+i+"</a></li>";
			  }
			  myPagin+="<li class='waves-effect'><a id='btnnext'><i class='material-icons'>chevron_right</i></a></li>";
			  $("#pagination").html(myPagin);
		  }
	  }
  }
  
  function firstGeneratePagination(){
	  var myPagin=" <li class='waves-effect'><a id='btnprev'><i class='material-icons'>chevron_left</i></a></li>";
	  if(currentPagin * trueDisplay <= pageNum){
		  higthPage=currentPagin * trueDisplay;
		  for(var i=(currentPagin-1) * trueDisplay+1;i<=currentPagin*trueDisplay;i++){
			  myPagin+="<li class='waves-effect active'><a class='pbtn'>"+i+"</a></li>";
		  }  
	  }else{
		  higthPage=pageNum;
		  for(var i=(currentPagin-1) * trueDisplay+1;i <= pageNum;i++){
			  myPagin+="<li class='waves-effect'><a class='pbtn'>"+i+"</a></li>";
		  }
	  }
	 // alert(lowPage);
	  myPagin+="<li class='waves-effect'><a id='btnnext'><i class='material-icons'>chevron_right</i></a></li>";
	  return myPagin;
}
  function prevPage(click){
	  //alert(click);
	  var myPagin=" <li class='waves-effect'><a id='btnprev'><i class='material-icons'>chevron_left</i></a></li>";
	  if(click <= 0){
		  //alert("noth do to do1");
	  }else if(click < lowPage){
		  	  currentPagin--;
		  	  higthPage=currentPagin * trueDisplay;
		  	  lowPage=higthPage - trueDisplay + 1;
		      listAllMessage(higthPage-trueDisplay+1,recordNum);
		      alert(lowPage+"  "+higthPage);
			  for(var i=lowPage;i<=higthPage;i++){
				  myPagin+="<li class='waves-effect'><a class='pbtn'>"+i+"</a></li>";
			  }  
			  myPagin+="<li class='waves-effect'><a id='btnnext'><i class='material-icons'>chevron_right</i></a></li>";
			  $("#pagination").html(myPagin);
	  }
  }
  
  function addAviteClass(obj){
	  $("#pagination").children().removeClass("active").delay(100,function(){
		  obj.addClass("active");
	  });
	  
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  