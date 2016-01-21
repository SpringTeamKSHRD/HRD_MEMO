var iframeWin = document.getElementById('hrdmemo_iframe').contentWindow;
$(iframeWin).on('resize', function(){
	document.getElementById("hrdmemo_iframe").style.height = document.getElementById("hrdmemo_iframe").contentWindow.document.body.scrollHeight + "px";
});