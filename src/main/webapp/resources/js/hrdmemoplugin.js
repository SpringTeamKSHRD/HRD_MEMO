
	 var windowScrollWidth = document.getElementsByTagName('body')[0].offsetWidth-document.getElementsByTagName('body')[0].clientWidth;
	//add css to iclude iframe
		$('head').append("<link href='https://fonts.googleapis.com/icon?family=Material+Icons' rel='stylesheet'>");
		$('head').append(" <script type='text/javascript' src='http://localhost:8080/HRD_MEMO/resources/js/iframeResizer.min.js'></script>");
	//iframe wrapper
		var wrapper=document.getElementById("hrd_memo_pess");
	//create iframe
		var ifrm_hrdmemo = document.createElement("IFRAME");
		ifrm_hrdmemo.setAttribute("src", "http://localhost:8080/HRD_MEMO/hrdmemoplugin");
	//ifrm_hrdmemo.setAttribute("sandbox","allow-same-origin allow-scripts allow-modals");
		ifrm_hrdmemo.setAttribute('class','my-memo-class');
		ifrm_hrdmemo.setAttribute('id','IFRAME_MEMO_PESS');
		ifrm_hrdmemo.style.width ="100%";
		ifrm_hrdmemo.style.height="auot";
		ifrm_hrdmemo.style.position="relative";
		ifrm_hrdmemo.style.right="0px";
		ifrm_hrdmemo.style.top="0px";
		ifrm_hrdmemo.style.margin="0px 5px 0px 0px";
		ifrm_hrdmemo.style.padding="0px";
		ifrm_hrdmemo.style.border ="none";
		ifrm_hrdmemo.setAttribute('scrolling','no');
		
	//wrapper style
		wrapper.style.height=window.innerHeight+"px";
		wrapper.style.width="0px";
		wrapper.style.zIndex="999999";
		wrapper.style.right=windowScrollWidth+'px';
		wrapper.style.position="fixed";
		wrapper.style.top="0px";
		wrapper.style.background="#F5F5F5";
		wrapper.style.margin="0px";
		wrapper.style.border="1px solid #E0E0E0";
		wrapper.appendChild(ifrm_hrdmemo);
	///start script
		var iframe_memo_id="";
		var memo_iframe_height=0;
		var memo_title = document.getElementsByTagName("title")[0].innerHTML;
		document.getElementById("IFRAME_MEMO_PESS").onload=function(){
		iFrameResize({
			sizeHeight:true,
			autoResize:false,
			checkOrigin:false,
			inPageLinks:true,
			targetOrigin:'*',
			messageCallback         : function(messageData){
				iframe_memo_id=messageData.iframe.id;
			},
			resizedCallback         : function(messageData){
				memo_iframe_height=messageData.height;
				document.getElementsByClassName('my-memo-class')[0]
				.iFrameResizer.sendMessage( messageData.height+"hrdmem"+location.hostname+"hrdmem"+location.href+"hrdmem"+memo_title+"hrdmem"+window.innerHeight);
				ifrm_hrdmemo.style.height="100%";
			}
		});
};
		var activate_desc_memo=document.createElement("P");
		activate_desc_memo.setAttribute("id","btn-act-desc");
		activate_desc_memo.setAttribute("title","Memo");
		activate_desc_memo.style.position="fixed";
		activate_desc_memo.style.background="#4DB6AC";
		activate_desc_memo.style.borderRadius="10px 0px 0px 10px";
		activate_desc_memo.style.boxShadow="-1px 2px 3px gray";
		activate_desc_memo.style.fontSize="14px";
		activate_desc_memo.style.fontWeight="bold";
		activate_desc_memo.style.cursor="pointer";
		activate_desc_memo.style.color="white";
		activate_desc_memo.style.width="35px";
		activate_desc_memo.style.right="0px";
		activate_desc_memo.style.top="43%";
		activate_desc_memo.style.margin="0px";
		activate_desc_memo.style.padding="5px";
		activate_desc_memo.style.textAlign="center";
		activate_desc_memo.innerHTML=" <i class='large material-icons'>description</i>";
		activate_desc_memo.style.zIndex="9999";
		$('body').append(activate_desc_memo);
		var my_memo_hide=true;
		$("#btn-act-desc").click(function(){
			if(my_memo_hide==true){
				$("#btn-act-desc").animate({right: 341+windowScrollWidth, marginLeft: 0,}, {duration: 300});
				$("#hrd_memo_pess").animate({width: 341+windowScrollWidth, marginLeft: 0,padding:5}, {duration: 300});
				document.getElementsByClassName('my-memo-class')[0]
				.iFrameResizer.sendMessage( memo_iframe_height+"hrdmem"+location.hostname+"hrdmem"+location.href+"hrdmem"+memo_title+"hrdmem"+window.innerHeight);
				my_memo_hide=false;
			}else{
				my_memo_hide=true;
				$("#btn-act-desc").animate({right:1+windowScrollWidth, marginLeft: 0}, {duration: 300});
				$("#hrd_memo_pess").animate({width: 0-windowScrollWidth, marginLeft: 0,padding:0}, {duration: 300});
			}
		});
		$("#btn-act-desc").css('display','block');
		$(window).resize(function() {	
			windowScrollWidth =document.getElementsByTagName('body')[0].offsetWidth-document.getElementsByTagName('body')[0].clientWidth;
			wrapper.style.height= window.innerHeight+"px";
			wrapper.style.right=windowScrollWidth+'px';
			document.getElementsByClassName('my-memo-class')[0]
			.iFrameResizer.sendMessage( memo_iframe_height+"hrdmem"+location.hostname+"hrdmem"+location.href+"hrdmem"+memo_title+"hrdmem"+window.innerHeight);
			});
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		