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
		// disableButtNextPrev();
});
 $(document).on('click.waves-effect', '.waves-effect #btnnext', function (e) {
	 nextPage(higthPage+1);
	// disableButtNextPrev();
});
  function nextPage(click){
	  var myPagin=" <li class='waves-effect' id='parentprev'><a id='btnprev'><i class='material-icons'>chevron_left</i></a></li>";
	  if(click> pageNum){
		  alert("noth do to do1");
	  }else if(click > higthPage){
		  //listAllMessage(click,recordNum);
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
		      //listAllMessage(higthPage-trueDisplay+1,recordNum);
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
	  json = {
				userid:$("#userid").val(),
				column:"",
				search:""
			};
	  $.ajax({
			type : "POST",
			url : "http://localhost:8080/HRD_MEMO/user/getmemonumber",
			data : JSON.stringify(json),
			contentType: 'application/json',
			success : function(data) {
				getNumPagination(data.DATA,$("#displayrow").val(),4);
			},
			error : function(data) {
				alert("Unsuccess: " + data.MESSAGE);
			}
		});  
  }
  getMemoNumber();
  var search="";
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
			          getAllNumberMessage();
			   }
			}
	 });
  function getSearchValue(){
	  if($("#searchopt").val()==="title"){
		  search=$("#search").val();
	  }else if($("#searchopt").val()==="ispublic"){
		  search=$("#ispublic").va();
	  }else if($("#searchopt").val()==="domain"){
		  search=$("#search1").val();
	  }else if($("#searchopt").val()==="date"){
		  search=$("#sdate").val();
	  }else{
		  search="";
	  } 
  }
  $("#btntest").click(function(){
	  if($("#searchopt").val()==="title"){
		  search=$("#search").val();
	  }else if($("#searchopt").val()==="ispublic"){
		  search=$("#ispublic").val();
	  }else if($("#searchopt").val()==="domain"){
		  search=$("#search1").val();
	  }else if($("#searchopt").val()==="date"){
		  search=$("#sdate").val();
	  }else{
		  search="";
	  } 
	  alert(search);
  });
  $("#displayrow").change(function(){
	  getMemoNumber();
  });