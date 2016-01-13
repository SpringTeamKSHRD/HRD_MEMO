$(function() {
	$("#btn-memo").click(function(){
		$("iframe#frame-memo").slideToggle(500);
	});
	$(".memo-container").css({
		"position": "relative",
		"padding-bottom": "251px",
		"padding-top": "35px",
		"height": "0",
		"overflow": "hidden"});
	$("#frame-memo").css({
		"position":" absolute",
		"top": "0",
		"left": "0",
		"width": "100%",
		"height": "100%",
		"overflow": "hidden"});
});


