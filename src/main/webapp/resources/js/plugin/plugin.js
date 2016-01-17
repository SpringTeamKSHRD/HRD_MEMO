//################js for embed with the iframe
$(function() {
	//constuct string url parameter
	var param = $.param({
		"domain":location.hostname, 
		"url":location.pathname, 
		"title":$("title").text()});
	//create iframe with parameter
	$(".memo-container").append("<iframe src='http://localhost:8080/HRD_MEMO/plugin?"+param+"' frameborder=0 id='frame-memo'></iframe>");
	//add style to iframe-container 
	$(".memo-container").css({
		"position": "relative",
		"height": "154px",
		"overflow": "hidden"});
	//add style to iframe
	$("#frame-memo").css({
		"padding":"15px 15px 10px 15px",
		"display":"none",
		"position":" absolute",
		"top": "0",
		"left": "0",
		"width": "100%",
		"height": "100%",
		"overflow": "hidden"});
	//onclick button slidetoggle iframe
	$("#btn-memo").click(function(){$("iframe#frame-memo").slideToggle(500);});
});


