$(document).ready(function(){   
	$(".more").click(function(){
		$(".progress").toggle(500);
	});
	$(".btn-main").click(function(){
		$(".image_textarae_btnsave_container").slideUp(500);
		$(".form_register_wraper").slideUp(500);
		$(".form_login_memo_wraper").slideUp(500);
	});
    $("#btnmemoboard").click(function(){
		$(".image_textarae_btnsave_container").slideDown(500);
		$(".form_register_wraper").slideUp(500);
		$(".form_login_memo_wraper").slideUp(500);
    });
    $("#btnregisterform").click(function(){
    	$(".form_register_wraper").slideDown(500);
    	$(".image_textarae_btnsave_container").slideUp(500);
    	$(".form_login_memo_wraper").slideUp(500);
    });
    $("#btnloginmemo").click(function(){
    	$(".form_login_memo_wraper").slideDown(500);
    	$(".image_textarae_btnsave_container").slideUp(500);
    	$(".form_register_wraper").slideUp(500);
    });    
    $("body").on("focus", "textarea#note", function(e) {    	
    	$("textarea#note").css({"border": "2px solid #009688"});
    });
    $("body").on("focusout", "textarea#note", function(e) {    	
    	$("textarea#note").css({"border": "1px solid #ddd"});
    });
    $(function() {
        $( ".pess_memo" ).draggable();
      });
    +function(a){"use strict";var b=function(c,d){this.$element=a(c),this.options=a.extend({},b.DEFAULTS,d),this.$element.on("click.bs.rowlink","td:not(.rowlink-skip)",a.proxy(this.click,this))};b.DEFAULTS={target:"a"},b.prototype.click=function(b){var c=a(b.currentTarget).closest("tr").find(this.options.target)[0];if(a(b.target)[0]===c)return;b.preventDefault();if(c.click)c.click();else if(document.createEvent){var d=document.createEvent("MouseEvents");d.initMouseEvent("click",!0,!0,window,0,0,0,0,0,!1,!1,!1,!1,0,null),c.dispatchEvent(d)}};var c=a.fn.rowlink;a.fn.rowlink=function(c){return this.each(function(){var d=a(this),e=d.data("bs.rowlink");e||d.data("bs.rowlink",e=new b(this,c))})},a.fn.rowlink.Constructor=b,a.fn.rowlink.noConflict=function(){return a.fn.rowlink=c,this},a(document).on("click.bs.rowlink.data-api",'[data-link="row"]',function(b){if(a(b.target).closest(".rowlink-skip").length!==0)return;var c=a(this);if(c.data("bs.rowlink"))return;c.rowlink(c.data()),a(b.target).trigger("click.bs.rowlink")})}(window.jQuery),+function(a){"use strict";var b=window.orientation!==undefined,c=navigator.userAgent.toLowerCase().indexOf("android")>-1,d=window.navigator.appName=="Microsoft Internet Explorer",e=function(b,d){if(c)return;this.$element=a(b),this.options=a.extend({},e.DEFAULTS,d),this.mask=String(this.options.mask),this.init(),this.listen(),this.checkVal()};e.DEFAULTS={mask:"",placeholder:"_",definitions:{9:"[0-9]",a:"[A-Za-z]",w:"[A-Za-z0-9]","*":"."}},e.prototype.init=function(){var b=this.options.definitions,c=this.mask.length;this.tests=[],this.partialPosition=this.mask.length,this.firstNonMaskPos=null,a.each(this.mask.split(""),a.proxy(function(a,d){d=="?"?(c--,this.partialPosition=a):b[d]?(this.tests.push(new RegExp(b[d])),this.firstNonMaskPos===null&&(this.firstNonMaskPos=this.tests.length-1)):this.tests.push(null)},this)),this.buffer=a.map(this.mask.split(""),a.proxy(function(a,c){if(a!="?")return b[a]?this.options.placeholder:a},this)),this.focusText=this.$element.val(),this.$element.data("rawMaskFn",a.proxy(function(){return a.map(this.buffer,function(a,b){return this.tests[b]&&a!=this.options.placeholder?a:null}).join("")},this))},e.prototype.listen=function(){if(this.$element.attr("readonly"))return;var b=(d?"paste":"input")+".bs.inputmask";this.$element.on("unmask.bs.inputmask",a.proxy(this.unmask,this)).on("focus.bs.inputmask",a.proxy(this.focusEvent,this)).on("blur.bs.inputmask",a.proxy(this.blurEvent,this)).on("keydown.bs.inputmask",a.proxy(this.keydownEvent,this)).on("keypress.bs.inputmask",a.proxy(this.keypressEvent,this)).on(b,a.proxy(this.pasteEvent,this))},e.prototype.caret=function(a,b){if(this.$element.length===0)return;if(typeof a=="number")return b=typeof b=="number"?b:a,this.$element.each(function(){if(this.setSelectionRange)this.setSelectionRange(a,b);else if(this.createTextRange){var c=this.createTextRange();c.collapse(!0),c.moveEnd("character",b),c.moveStart("character",a),c.select()}});if(this.$element[0].setSelectionRange)a=this.$element[0].selectionStart,b=this.$element[0].selectionEnd;else if(document.selection&&document.selection.createRange){var c=document.selection.createRange();a=0-c.duplicate().moveStart("character",-1e5),b=a+c.text.length}return{begin:a,end:b}},e.prototype.seekNext=function(a){var b=this.mask.length;while(++a<=b&&!this.tests[a]);return a},e.prototype.seekPrev=function(a){while(--a>=0&&!this.tests[a]);return a},e.prototype.shiftL=function(a,b){var c=this.mask.length;if(a<0)return;for(var d=a,e=this.seekNext(b);d<c;d++)if(this.tests[d]){if(e<c&&this.tests[d].test(this.buffer[e]))this.buffer[d]=this.buffer[e],this.buffer[e]=this.options.placeholder;else break;e=this.seekNext(e)}this.writeBuffer(),this.caret(Math.max(this.firstNonMaskPos,a))},e.prototype.shiftR=function(a){var b=this.mask.length;for(var c=a,d=this.options.placeholder;c<b;c++)if(this.tests[c]){var e=this.seekNext(c),f=this.buffer[c];this.buffer[c]=d;if(e<b&&this.tests[e].test(f))d=f;else break}},e.prototype.unmask=function(){this.$element.unbind(".bs.inputmask").removeData("bs.inputmask")},e.prototype.focusEvent=function(){this.focusText=this.$element.val();var a=this.mask.length,b=this.checkVal();this.writeBuffer();var c=this,d=function(){b==a?c.caret(0,b):c.caret(b)};d(),setTimeout(d,50)},e.prototype.blurEvent=function(){this.checkVal(),this.$element.val()!==this.focusText&&(this.$element.trigger("change"),this.$element.trigger("input"))},e.prototype.keydownEvent=function(a){var c=a.which;if(c==8||c==46||b&&c==127){var d=this.caret(),e=d.begin,f=d.end;return f-e===0&&(e=c!=46?this.seekPrev(e):f=this.seekNext(e-1),f=c==46?this.seekNext(f):f),this.clearBuffer(e,f),this.shiftL(e,f-1),!1}if(c==27)return this.$element.val(this.focusText),this.caret(0,this.checkVal()),!1},e.prototype.keypressEvent=function(a){var b=this.mask.length,c=a.which,d=this.caret();if(a.ctrlKey||a.altKey||a.metaKey||c<32)return!0;if(c){d.end-d.begin!==0&&(this.clearBuffer(d.begin,d.end),this.shiftL(d.begin,d.end-1));var e=this.seekNext(d.begin-1);if(e<b){var f=String.fromCharCode(c);if(this.tests[e].test(f)){this.shiftR(e),this.buffer[e]=f,this.writeBuffer();var g=this.seekNext(e);this.caret(g)}}return!1}},e.prototype.pasteEvent=function(){var a=this;setTimeout(function(){a.caret(a.checkVal(!0))},0)},e.prototype.clearBuffer=function(a,b){var c=this.mask.length;for(var d=a;d<b&&d<c;d++)this.tests[d]&&(this.buffer[d]=this.options.placeholder)},e.prototype.writeBuffer=function(){return this.$element.val(this.buffer.join("")).val()},e.prototype.checkVal=function(a){var b=this.mask.length,c=this.$element.val(),d=-1;for(var e=0,f=0;e<b;e++)if(this.tests[e]){this.buffer[e]=this.options.placeholder;while(f++<c.length){var g=c.charAt(f-1);if(this.tests[e].test(g)){this.buffer[e]=g,d=e;break}}if(f>c.length)break}else this.buffer[e]==c.charAt(f)&&e!=this.partialPosition&&(f++,d=e);if(!a&&d+1<this.partialPosition)this.$element.val(""),this.clearBuffer(0,b);else if(a||d+1>=this.partialPosition)this.writeBuffer(),a||this.$element.val(this.$element.val().substring(0,d+1));return this.partialPosition?e:this.firstNonMaskPos};var f=a.fn.inputmask;a.fn.inputmask=function(b){return this.each(function(){var c=a(this),d=c.data("bs.inputmask");d||c.data("bs.inputmask",d=new e(this,b))})},a.fn.inputmask.Constructor=e,a.fn.inputmask.noConflict=function(){return a.fn.inputmask=f,this},a(document).on("focus.bs.inputmask.data-api","[data-mask]",function(b){var c=a(this);if(c.data("bs.inputmask"))return;c.inputmask(c.data())})}(window.jQuery),+function(a){"use strict";var b=window.navigator.appName=="Microsoft Internet Explorer",c=function(b,c){this.$element=a(b),this.$input=this.$element.find(":file");if(this.$input.length===0)return;this.name=this.$input.attr("name")||c.name,this.$hidden=this.$element.find('input[type=hidden][name="'+this.name+'"]'),this.$hidden.length===0&&(this.$hidden=a('<input type="hidden">').insertBefore(this.$input)),this.$preview=this.$element.find(".fileinput-preview");var d=this.$preview.css("height");this.$preview.css("display")!=="inline"&&d!=="0px"&&d!=="none"&&this.$preview.css("line-height",d),this.original={exists:this.$element.hasClass("fileinput-exists"),preview:this.$preview.html(),hiddenVal:this.$hidden.val()},this.listen()};c.prototype.listen=function(){this.$input.on("change.bs.fileinput",a.proxy(this.change,this)),a(this.$input[0].form).on("reset.bs.fileinput",a.proxy(this.reset,this)),this.$element.find('[data-trigger="fileinput"]').on("click.bs.fileinput",a.proxy(this.trigger,this)),this.$element.find('[data-dismiss="fileinput"]').on("click.bs.fileinput",a.proxy(this.clear,this))},c.prototype.change=function(b){var c=b.target.files===undefined?b.target&&b.target.value?[{name:b.target.value.replace(/^.+\\/,"")}]:[]:b.target.files;b.stopPropagation();if(c.length===0){this.clear();return}this.$hidden.val(""),this.$hidden.attr("name",""),this.$input.attr("name",this.name);var d=c[0];if(this.$preview.length>0&&(typeof d.type!="undefined"?d.type.match(/^image\/(gif|png|jpeg)$/):d.name.match(/\.(gif|png|jpe?g)$/i))&&typeof FileReader!="undefined"){var e=new FileReader,f=this.$preview,g=this.$element;e.onload=function(b){var e=a("<img>");e[0].src=b.target.result,c[0].result=b.target.result,g.find(".fileinput-filename").text(d.name),f.css("max-height")!="none"&&e.css("max-height",parseInt(f.css("max-height"),10)-parseInt(f.css("padding-top"),10)-parseInt(f.css("padding-bottom"),10)-parseInt(f.css("border-top"),10)-parseInt(f.css("border-bottom"),10)),f.html(e),g.addClass("fileinput-exists").removeClass("fileinput-new"),g.trigger("change.bs.fileinput",c)},e.readAsDataURL(d)}else this.$element.find(".fileinput-filename").text(d.name),this.$preview.text(d.name),this.$element.addClass("fileinput-exists").removeClass("fileinput-new"),this.$element.trigger("change.bs.fileinput")},c.prototype.clear=function(a){a&&a.preventDefault(),this.$hidden.val(""),this.$hidden.attr("name",this.name),this.$input.attr("name","");if(b){var c=this.$input.clone(!0);this.$input.after(c),this.$input.remove(),this.$input=c}else this.$input.val("");this.$preview.html(""),this.$element.find(".fileinput-filename").text(""),this.$element.addClass("fileinput-new").removeClass("fileinput-exists"),a!==undefined&&(this.$input.trigger("change"),this.$element.trigger("clear.bs.fileinput"))},c.prototype.reset=function(){this.clear(),this.$hidden.val(this.original.hiddenVal),this.$preview.html(this.original.preview),this.$element.find(".fileinput-filename").text(""),this.original.exists?this.$element.addClass("fileinput-exists").removeClass("fileinput-new"):this.$element.addClass("fileinput-new").removeClass("fileinput-exists"),this.$element.trigger("reset.bs.fileinput")},c.prototype.trigger=function(a){this.$input.trigger("click"),a.preventDefault()};var d=a.fn.fileinput;a.fn.fileinput=function(b){return this.each(function(){var d=a(this),e=d.data("bs.fileinput");e||d.data("bs.fileinput",e=new c(this,b)),typeof b=="string"&&e[b]()})},a.fn.fileinput.Constructor=c,a.fn.fileinput.noConflict=function(){return a.fn.fileinput=d,this},a(document).on("click.fileinput.data-api",'[data-provides="fileinput"]',function(b){var c=a(this);if(c.data("bs.fileinput"))return;c.fileinput(c.data());var d=a(b.target).closest('[data-dismiss="fileinput"],[data-trigger="fileinput"]');d.length>0&&(b.preventDefault(),d.trigger("click.bs.fileinput"))})}(window.jQuery),+function(a){"use strict";var b=function(c,d){this.$element=a(c),this.options=a.extend({},b.DEFAULTS,d),this.state=null,this.placement=null,this.options.recalc&&(this.calcClone(),a(window).on("resize",a.proxy(this.recalc,this))),this.options.autohide&&a(document).on("click",a.proxy(this.autohide,this)),this.options.toggle&&this.toggle(),this.options.disablescrolling&&(this.options.disableScrolling=this.options.disablescrolling,delete this.options.disablescrolling)};b.DEFAULTS={toggle:!0,placement:"auto",autohide:!0,recalc:!0,disableScrolling:!0,modal:!1},b.prototype.offset=function(){switch(this.placement){case"left":case"right":return this.$element.outerWidth();case"top":case"bottom":return this.$element.outerHeight()}},b.prototype.calcPlacement=function(){function e(a,b){if(d.css(b)==="auto")return a;if(d.css(a)==="auto")return b;var c=parseInt(d.css(a),10),e=parseInt(d.css(b),10);return c>e?b:a}if(this.options.placement!=="auto"){this.placement=this.options.placement;return}this.$element.hasClass("in")||this.$element.css("visiblity","hidden !important").addClass("in");var b=a(window).width()/this.$element.width(),c=a(window).height()/this.$element.height(),d=this.$element;this.placement=b>=c?e("left","right"):e("top","bottom"),this.$element.css("visibility")==="hidden !important"&&this.$element.removeClass("in").css("visiblity","")},b.prototype.opposite=function(a){switch(a){case"top":return"bottom";case"left":return"right";case"bottom":return"top";case"right":return"left"}},b.prototype.getCanvasElements=function(){var b=this.options.canvas?a(this.options.canvas):this.$element,c=b.find("*").filter(function(){return a(this).css("position")==="fixed"}).not(this.options.exclude);return b.add(c)},b.prototype.slide=function(b,c,d){if(!a.support.transition){var e={};return e[this.placement]="+="+c,b.animate(e,350,d)}var f=this.placement,g=this.opposite(f);b.each(function(){a(this).css(f)!=="auto"&&a(this).css(f,(parseInt(a(this).css(f),10)||0)+c),a(this).css(g)!=="auto"&&a(this).css(g,(parseInt(a(this).css(g),10)||0)-c)}),this.$element.one(a.support.transition.end,d).emulateTransitionEnd(350)},b.prototype.disableScrolling=function(){var b=a("body").width(),c="padding-"+this.opposite(this.placement);a("body").data("offcanvas-style")===undefined&&a("body").data("offcanvas-style",a("body").attr("style")||""),a("body").css("overflow","hidden");if(a("body").width()>b){var d=parseInt(a("body").css(c),10)+a("body").width()-b;setTimeout(function(){a("body").css(c,d)},1)}a("body").on("touchmove.bs",function(a){a.preventDefault()})},b.prototype.enableScrolling=function(){a("body").off("touchmove.bs")},b.prototype.show=function(){if(this.state)return;var b=a.Event("show.bs.offcanvas");this.$element.trigger(b);if(b.isDefaultPrevented())return;this.state="slide-in",this.calcPlacement();var c=this.getCanvasElements(),d=this.placement,e=this.opposite(d),f=this.offset();c.index(this.$element)!==-1&&(a(this.$element).data("offcanvas-style",a(this.$element).attr("style")||""),this.$element.css(d,-1*f),this.$element.css(d)),c.addClass("canvas-sliding").each(function(){a(this).data("offcanvas-style")===undefined&&a(this).data("offcanvas-style",a(this).attr("style")||""),a(this).css("position")==="static"&&a(this).css("position","relative"),(a(this).css(d)==="auto"||a(this).css(d)==="0px")&&(a(this).css(e)==="auto"||a(this).css(e)==="0px")&&a(this).css(d,0)}),this.options.disableScrolling&&this.disableScrolling(),this.options.modal&&this.toggleBackdrop();var g=function(){if(this.state!="slide-in")return;this.state="slid",c.removeClass("canvas-sliding").addClass("canvas-slid"),this.$element.trigger("shown.bs.offcanvas")};setTimeout(a.proxy(function(){this.$element.addClass("in"),this.slide(c,f,a.proxy(g,this))},this),1)},b.prototype.hide=function(b){if(this.state!=="slid")return;var c=a.Event("hide.bs.offcanvas");this.$element.trigger(c);if(c.isDefaultPrevented())return;this.state="slide-out";var d=a(".canvas-slid"),e=this.placement,f=-1*this.offset(),g=function(){if(this.state!="slide-out")return;this.state=null,this.placement=null,this.$element.removeClass("in"),d.removeClass("canvas-sliding"),d.add(this.$element).add("body").each(function(){a(this).attr("style",a(this).data("offcanvas-style")).removeData("offcanvas-style")}),this.$element.trigger("hidden.bs.offcanvas")};this.options.disableScrolling&&this.enableScrolling(),this.options.modal&&this.toggleBackdrop(),d.removeClass("canvas-slid").addClass("canvas-sliding"),setTimeout(a.proxy(function(){this.slide(d,f,a.proxy(g,this))},this),1)},b.prototype.toggle=function(){if(this.state==="slide-in"||this.state==="slide-out")return;this[this.state==="slid"?"hide":"show"]()},b.prototype.toggleBackdrop=function(b){b=b||a.noop;if(this.state=="slide-in"){var c=a.support.transition;this.$backdrop=a('<div class="modal-backdrop fade" />').insertAfter(this.$element),c&&this.$backdrop[0].offsetWidth,this.$backdrop.addClass("in"),c?this.$backdrop.one(a.support.transition.end,b).emulateTransitionEnd(150):b()}else if(this.state=="slide-out"&&this.$backdrop){this.$backdrop.removeClass("in"),a("body").off("touchmove.bs");var d=this;a.support.transition?this.$backdrop.one(a.support.transition.end,function(){d.$backdrop.remove(),b(),d.$backdrop=null}).emulateTransitionEnd(150):(this.$backdrop.remove(),this.$backdrop=null,b())}else b&&b()},b.prototype.calcClone=function(){this.$calcClone=this.$element.clone().html("").addClass("offcanvas-clone").removeClass("in").appendTo(a("body"))},b.prototype.recalc=function(){if(this.$calcClone.css("display")==="none"||this.state!=="slid"&&this.state!=="slide-in")return;this.state=null,this.placement=null;var b=this.getCanvasElements();this.$element.removeClass("in"),b.removeClass("canvas-slid"),b.add(this.$element).add("body").each(function(){a(this).attr("style",a(this).data("offcanvas-style")).removeData("offcanvas-style")})},b.prototype.autohide=function(b){a(b.target).closest(this.$element).length===0&&this.hide()};var c=a.fn.offcanvas;a.fn.offcanvas=function(c){return this.each(function(){var d=a(this),e=d.data("bs.offcanvas"),f=a.extend({},b.DEFAULTS,d.data(),typeof c=="object"&&c);e||d.data("bs.offcanvas",e=new b(this,f)),typeof c=="string"&&e[c]()})},a.fn.offcanvas.Constructor=b,a.fn.offcanvas.noConflict=function(){return a.fn.offcanvas=c,this},a(document).on("click.bs.offcanvas.data-api","[data-toggle=offcanvas]",function(b){var c=a(this),d,e=c.attr("data-target")||b.preventDefault()||(d=c.attr("href"))&&d.replace(/.*(?=#[^\s]+$)/,""),f=a(e),g=f.data("bs.offcanvas"),h=g?"toggle":c.data();b.stopPropagation(),g?g.toggle():f.offcanvas(h)})}(window.jQuery),+function(a){function b(){var a=document.createElement("bootstrap"),b={WebkitTransition:"webkitTransitionEnd",MozTransition:"transitionend",OTransition:"oTransitionEnd otransitionend",transition:"transitionend"};for(var c in b)if(a.style[c]!==undefined)return{end:b[c]};return!1}"use strict";if(a.support.transition!==undefined)return;a.fn.emulateTransitionEnd=function(b){var c=!1,d=this;a(this).one(a.support.transition.end,function(){c=!0});var e=function(){c||a(d).trigger(a.support.transition.end)};return setTimeout(e,b),this},a(function(){a.support.transition=b()})}(window.jQuery)     
});






































































































