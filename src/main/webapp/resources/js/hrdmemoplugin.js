var d=document;
var hrd_mem_css1=$('<link/>');
hrd_mem_css1.attr('href','http://localhost:8080/HRD_MEMO/resources/css/pess_memo.css');
var hrd_mem_css2=$('<link/>');
hrd_mem_css2.attr('href','http://localhost:8080/HRD_MEMO/resources/materialize/css/materialize.min.css');
var hrd_mem_css3=$('<link/>');
hrd_mem_css3.attr('href','https://fonts.googleapis.com/icon?family=Material+Icons');
//Start javascript
var hrd_mem_script1=$("<script></script>");
hrd_mem_script1.attr("src","http://localhost:8080/HRD_MEMO//resources/admin/js/jquery-2.1.4.min.js");
var hrd_mem_script2=$("<script></script>");
hrd_mem_script2.attr("src","http://localhost:8080/HRD_MEMO/resources/materialize/js/materialize.min.js");
var hrd_mem_script3=$("<script></script>");
hrd_mem_script3.attr("src","http://materializecss.com/js/init.js");
$("head").append(hrd_mem_script1,hrd_mem_css1,hrd_mem_css2,hrd_mem_css3,hrd_mem_script2,hrd_mem_script3);
var wrapper=$("#hrd_memo_pess");
var button_activate_memo=$("<div class='fixed-action-btn horizontal'><a class='btn-floating btn-main'> <i class='material-icons'>view_headline</i></a>" +
		"<ul><li title='Memo'><a class='btn-floating red'><i id='btnmemoboard' class='material-icons'>comment</i></a></li> " +
		"<li title='Login'><a class='btn-floating orange'><i id='btnloginmemo' class='material-icons'>lock_open</i></a></li> " +
		"<li title='Sign Up'><a class='btn-floating indigo'><i id='btnregisterform' class='material-icons'>playlist_add</i></a></li></ul></div>");
wrapper.append(button_activate_memo);
alert("Ok");