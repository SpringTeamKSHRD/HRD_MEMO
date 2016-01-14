$(function() {
	$("#btn-memo").click(function(){
		$("iframe#frame-memo").slideToggle(500);});	
	$(".memo-container").append("<iframe src='http://localhost:8080/HRD_MEMO/plugin/add' frameborder=0 id='frame-memo'></iframe>");
	$(".memo-container").css({
		"position": "relative",
		"padding-bottom": "151px",
		"padding-top": "35px",
		"height": "0",
		"overflow": "hidden"});
	$("#frame-memo").css({
		"display":"none",
		"position":" absolute",
		"top": "0",
		"left": "0",
		"width": "100%",
		"height": "100%",
		"overflow": "hidden"});
});


