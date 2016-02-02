
/*!
 * @preserve
 *
 * Readmore.js jQuery plugin
 * Author: @jed_foster
 * Project home: http://jedfoster.github.io/Readmore.js
 * Licensed under the MIT license
 *
 * Debounce function from http://davidwalsh.name/javascript-debounce-function
 */

/* global jQuery */

(function(factory) {
  if (typeof define === 'function' && define.amd) {
    // AMD
    define(['jquery'], factory);
  } else if (typeof exports === 'object') {
    // CommonJS
    module.exports = factory(require('jquery'));
  } else {
    // Browser globals
    factory(jQuery);
  }
}(function($) {
  'use strict';

  var readmore = 'readmore',
      defaults = {
        speed: 100,
        collapsedHeight: 90,
        heightMargin: 16,
        moreLink: '<a href="#" style="text-decoration:none;color:#178DB1;font-size:13px;">Read More</a>',
        lessLink: '<a href="#">Close</a>',
        embedCSS: true,
        blockCSS: 'display: block; width: 100%;',
        startOpen: false,

        // callbacks
        beforeToggle: function(){},
        afterToggle: function(){}
      },
      cssEmbedded = {},
      uniqueIdCounter = 0;

  function debounce(func, wait, immediate) {
    var timeout;

    return function() {
      var context = this, args = arguments;
      var later = function() {
        timeout = null;
        if (! immediate) {
          func.apply(context, args);
        }
      };
      var callNow = immediate && !timeout;

      clearTimeout(timeout);
      timeout = setTimeout(later, wait);

      if (callNow) {
        func.apply(context, args);
      }
    };
  }

  function uniqueId(prefix) {
    var id = ++uniqueIdCounter;

    return String(prefix == null ? 'rmjs-' : prefix) + id;
  }

  function setBoxHeights(element) {
    var el = element.clone().css({
          height: 'auto',
          width: element.width(),
          maxHeight: 'none',
          overflow: 'hidden'
        }).insertAfter(element),
        expandedHeight = el.outerHeight(),
        cssMaxHeight = parseInt(el.css({maxHeight: ''}).css('max-height').replace(/[^-\d\.]/g, ''), 10),
        defaultHeight = element.data('defaultHeight');

    el.remove();

    var collapsedHeight = cssMaxHeight || element.data('collapsedHeight') || defaultHeight;

    // Store our measurements.
    element.data({
      expandedHeight: expandedHeight,
      maxHeight: cssMaxHeight,
      collapsedHeight: collapsedHeight
    })
    // and disable any `max-height` property set in CSS
    .css({
      maxHeight: 'none'
    });
  }

  var resizeBoxes = debounce(function() {
    $('[data-readmore]').each(function() {
      var current = $(this),
          isExpanded = (current.attr('aria-expanded') === 'true');

      setBoxHeights(current);

      current.css({
        height: current.data( (isExpanded ? 'expandedHeight' : 'collapsedHeight') )
      });
    });
  }, 100);

  function embedCSS(options) {
    if (! cssEmbedded[options.selector]) {
      var styles = ' ';

      if (options.embedCSS && options.blockCSS !== '') {
        styles += options.selector + ' + [data-readmore-toggle], ' +
          options.selector + '[data-readmore]{' +
            options.blockCSS +
          '}';
      }

      // Include the transition CSS even if embedCSS is false
      styles += options.selector + '[data-readmore]{' +
        'transition: height ' + options.speed + 'ms;' +
        'overflow: hidden;' +
      '}';

      (function(d, u) {
        var css = d.createElement('style');
        css.type = 'text/css';

        if (css.styleSheet) {
          css.styleSheet.cssText = u;
        }
        else {
          css.appendChild(d.createTextNode(u));
        }

        d.getElementsByTagName('head')[0].appendChild(css);
      }(document, styles));

      cssEmbedded[options.selector] = true;
    }
  }

  function Readmore(element, options) {
    this.element = element;

    this.options = $.extend({}, defaults, options);

    embedCSS(this.options);

    this._defaults = defaults;
    this._name = readmore;

    this.init();

    // IE8 chokes on `window.addEventListener`, so need to test for support.
    if (window.addEventListener) {
      // Need to resize boxes when the page has fully loaded.
      window.addEventListener('load', resizeBoxes);
      window.addEventListener('resize', resizeBoxes);
    }
    else {
      window.attachEvent('load', resizeBoxes);
      window.attachEvent('resize', resizeBoxes);
    }
  }


  Readmore.prototype = {
    init: function() {
      var current = $(this.element);

      current.data({
        defaultHeight: this.options.collapsedHeight,
        heightMargin: this.options.heightMargin
      });

      setBoxHeights(current);

      var collapsedHeight = current.data('collapsedHeight'),
          heightMargin = current.data('heightMargin');

      if (current.outerHeight(true) <= collapsedHeight + heightMargin) {
        // The block is shorter than the limit, so there's no need to truncate it.
        return true;
      }
      else {
        var id = current.attr('id') || uniqueId(),
            useLink = this.options.startOpen ? this.options.lessLink : this.options.moreLink;

        current.attr({
          'data-readmore': '',
          'aria-expanded': this.options.startOpen,
          'id': id
        });

        current.after($(useLink)
          .on('click', (function(_this) {
            return function(event) {
              _this.toggle(this, current[0], event);
            };
          })(this))
          .attr({
            'data-readmore-toggle': '',
            'aria-controls': id
          }));

        if (! this.options.startOpen) {
          current.css({
            height: collapsedHeight
          });
        }
      }
    },

    toggle: function(trigger, element, event) {
      if (event) {
        event.preventDefault();
      }

      if (! trigger) {
        trigger = $('[aria-controls="' + _this.element.id + '"]')[0];
      }

      if (! element) {
        element = _this.element;
      }

      var $element = $(element),
          newHeight = '',
          newLink = '',
          expanded = false,
          collapsedHeight = $element.data('collapsedHeight');

      if ($element.height() <= collapsedHeight) {
        newHeight = $element.data('expandedHeight') + 'px';
        newLink = 'lessLink';
        expanded = true;
      }
      else {
        newHeight = collapsedHeight;
        newLink = 'moreLink';
      }

      // Fire beforeToggle callback
      // Since we determined the new "expanded" state above we're now out of sync
      // with our true current state, so we need to flip the value of `expanded`
      this.options.beforeToggle(trigger, $element, ! expanded);

      $element.css({'height': newHeight});

      // Fire afterToggle callback
      $element.on('transitionend', (function(_this) {
        return function() {
          _this.options.afterToggle(trigger, $element, expanded);

          $(this).attr({
            'aria-expanded': expanded
          }).off('transitionend');
        }
      })(this));

      $(trigger).replaceWith($(this.options[newLink])
        .on('click', (function(_this) {
            return function(event) {
              _this.toggle(this, element, event);
            };
          })(this))
        .attr({
          'data-readmore-toggle': '',
          'aria-controls': $element.attr('id')
        }));
    },

    destroy: function() {
      $(this.element).each(function() {
        var current = $(this);

        current.attr({
          'data-readmore': null,
          'aria-expanded': null
        })
          .css({
            maxHeight: '',
            height: ''
          })
          .next('[data-readmore-toggle]')
          .remove();

        current.removeData();
      });
    }
  };


  $.fn.readmore = function(options) {
    var args = arguments,
        selector = this.selector;

    options = options || {};

    if (typeof options === 'object') {
      return this.each(function() {
        if ($.data(this, 'plugin_' + readmore)) {
          var instance = $.data(this, 'plugin_' + readmore);
          instance.destroy.apply(instance);
        }

        options.selector = selector;

        $.data(this, 'plugin_' + readmore, new Readmore(this, options));
      });
    }
    else if (typeof options === 'string' && options[0] !== '_' && options !== 'init') {
      return this.each(function () {
        var instance = $.data(this, 'plugin_' + readmore);
        if (instance instanceof Readmore && typeof instance[options] === 'function') {
          instance[options].apply(instance, Array.prototype.slice.call(args, 1));
        }
      });
    }
  };

}));





(function($, window, document, undefined) {
    'use strict';
    var QuickNote = function(el, options) {
        this.el = el;
        this.$el = $(el);
        this.options = options;
    };

    QuickNote.prototype = {
        defaults: {
            theme: 'dark',
            pos: 'right',
            storage: true || false
        },
        init: function() {
            this.config = $.extend({}, this.defaults, this.options);
            // DETECTING localStorage
            if (Storage === void(0)) {
                this.config.storage = false;
            }
            //            memo-alert(location.protocol+'//'+location.hostname+(location.port ? ':'+location.port: ''))

            var loading = '<div id="memo-loading" style="position:absolute;top:40%;right:45%;z-index:99999999;display:none;"><img src="http://192.168.178.186:8080/HRD_MEMO/resources/admin/imgs/loading.gif" /></div>';
            $(loading).appendTo(this.$el);

            if (typeof Cookies.get('LOGGED') === 'undefined') {
                this.login();
                //              this.init();
            } else {
                if ("km" != Cookies.getJSON('LOGGED').lang) {
                    this.login();
                } else {
                    this.appendElem();
                }

            }
            this.completeNote();
        },
        isURL: function(str) {
            // CHECKING IF NOTE IS HAS URL FORMAT
            if (/(http|https|ftp):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/i.test(str)) {
                return true;
            } else {
                return false;
            }
        },
        //        showLoading:function(){
        //          var loading ='<div id="loading" style="position:absolute;top:50%;right:40%"><img src="http://192.168.178.186:8080/HRD_MEMO/resources/admin/imgs/loading.gif" /></div>';
        //           $(loading).appendTo(this.$el);
        //        },
        deleteMemo: function(id) {
            var _this = this;
            $('#memo-loading').show();
            $.ajax({
                type: "POST",
                url: "http://192.168.178.186:8080/HRD_MEMO/plugin/memo/" + id,
                success: function(json) {
                    $('#memo-loading').hide();
                    if (json.RESPONSE_DATA) {
                        //                     $('#qn > .chat-container,#qn > #notes,#qn > #qn_sh').remove();
                        $('#qn').empty();
                        _this.appendElem();
                        $('#mytext').focus();
                    } else {
                        console.log(json.RESPONSE_DATA);
                    }
                }
            });
        },
        updateMemo: function(id, content, ispublic) {
            $('#memo-loading').show();
            var memo = {
                "userid": Cookies.getJSON('LOGGED').userid,
                "id": id,
                "content": content,
                "ispublic": ispublic
            }
            console.log(memo);
            $.ajax({
                type: "POST",
                url: "http://192.168.178.186:8080/HRD_MEMO/plugin/memo/update",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(memo),
                success: function(json) {
                    if (json.RESPONSE_DATA) {
                        $('#memo-loading').hide();
                        //                     $('#qn > .chat-container,#qn > #notes,#qn > #qn_sh').remove();
                        $('#qn').empty();
                        _this.appendElem();
                    } else {
                        console.log(json.RESPONSE_DATA);
                    }
                }
            });
        },
        register: function() {
        	var _this=this;
            $('#qn').empty();
            // SIGN UP FORM         
            var showHide = '<div id="qn_sh" ><span id="show-hide">KhmerAcademy Memo</span></div>';
            var loginForm = '<form id="frmRegister" method="post"></form>';
            var divUserPass = '<div id="username-password"></div>';
            var divBtn = '<div id="div-btn" class="memo-btn-group" style="margin-top:10px"></div>';
            var usernameInput = '<p><input type="text" name="username" id="username" maxlength="500" placeholder="Full Name..." required></p>'
            var genderInput = '<p><select id="gender" class="memo-uibutton" name="gender" style="width:100%;border-radius:5px">' +
                '<option value="male">Male</option>' +
                '<option value="female">Female</option>' +
                '</select></p>';
            var emailInput = '<p><input type="email" name="email" id="email" maxlength="500" placeholder="E-mail" required></p>';
            var passwordInput = '<p><input type="password" name="password" id="password" maxlength="500" placeholder="Password" required></p>';
            var okBtn = '<input type="submit" name="btnRegOk" class="memo-uibutton confirm" value="Ok" id="btnRegOk">';
            var cancelBtn = '<input type="button" name="btnRegCancel" class="memo-uibutton" value="Cancel" id="btnRegCancel">';
            $(showHide).appendTo(this.$el);
            $(divUserPass).appendTo(this.$el);
            $(loginForm).appendTo(this.$el.find('#username-password'));
            $(usernameInput).appendTo(this.$el.find('#frmRegister'));
            $(genderInput).appendTo(this.$el.find('#frmRegister'));
            $(emailInput).appendTo(this.$el.find('#frmRegister'));
            $(passwordInput).appendTo(this.$el.find('#frmRegister'));
            $(divBtn).appendTo(this.$el.find('#frmRegister'));
            $(okBtn).appendTo(this.$el.find('#div-btn'));
            $(cancelBtn).appendTo(this.$el.find('#div-btn'));


            $('#email').focus(function(e) {
                $(this).css('borderColor', '');
            });
            $('input[type="text"]').focus(function(e) {
                $('#warning').remove();
            });;
            //SIGN UP BUTTON CANCEL ACTION
            $('#btnRegCancel').click(function(e){
            	$('#qn').empty();
                _this.login();
                $('.qn_container #notes,.qn_container #username-password').show();
            });


            //SIGN UP BUTTON OK ACTION
            $("#frmRegister")
                .submit(
                    function(e) {
                        $('#memo-loading').show();
                        e.preventDefault();
                        $
                            .ajax({
                                url: "http://192.168.178.186:8080/HRD_MEMO/plugin/memo/validate",
                                type: "POST",
                                data: {
                                    email: $('#email').val()
                                },
                                success: function(data) {
                                    if (data.RESPONSE_DATA == true) {
                                        $('#warning').remove();
                                        $('#memo-loading').hide();
                                        $('#email').css({
                                            borderColor: 'red'
                                        });
                                        $("#qn_sh").append('<span style="color:#FFC962;text-decoration:none;" id="warning">Email already existed !</span>')
                                    } else {
                                    	console.log(data)
                                        $
                                            .ajax({
                                                url: "http://192.168.178.186:8080/HRD_MEMO/plugin/memo/register",
                                                type: "POST",
                                                data: $("#frmRegister").serialize(),
                                                success: function(data) {
                                                    if (data.MESSAGE == "SUCCESS") {
                                                    	$('#memo-loading').hide();
                                                        Cookies.set('LOGGED', {
                                                            "userid": data.USERID,
                                                            "email": data.EMAIL,
                                                            "lang": "km",
                                                            "imageUrl": data.IMAGE_URL
                                                        }, {
                                                            expires: 1,
                                                            path: ''
                                                        });
                                                        console.log(Cookies.getJSON('LOGGED').lang);
                                                        $('#qn > #qn_sh,#username-password').remove();
                                                        _this.appendElem();
                                                        $('#mytext').focus();
                                                    } else {
                                                        $('#qn_sh').html('<span id="show-hide">KhmerAcademy Memo</span>');
                                                        $("#qn_sh").append('<span style="color:#FFC962;text-decoration:none;" id="memo-alert">something went wrong !</span>')
                                                    }
                                                },
                                                error: function(data) {
                                                    alert(data.RESPONSE_DATA);
                                                }
                                            });
                                    }
                                },
                                error: function(data) {
                                    alert(data.RESPONSE_DATA);
                                }
                            });
                    });

        },
        appendElem: function() {
            var isURL = this.isURL;
            var _this = this;
            // THEME
            if (this.config.theme == 'light') {
                this.$el.addClass('qn_container_light').addClass('qn_container');
            } else if (this.config.theme == 'dark') {
                this.$el.addClass('qn_container');
            } else {
                console.log('Error: Theme >> ' + this.config.theme + ' not found.');
                // SET DEFAULT
                this.$el.addClass('qn_container');
            }
            // POSITION
            if (this.config.pos == 'left') {
                this.$el.css({
                    'left': '0',
                    'bottom': '0',
                    'margin-left': '5px'
                });
            } else if (this.config.pos == 'right') {} else {
                console.log('Error: Position >> ' + this.config.pos + ' not found.');
            }
            // ALREADY LOGGED IN     

            var dl = '';
            dl += '<div  style="position:absolute;bottom:4px;right:50px;margin-right:10px;height:22px;">';
            dl += '<select class="memo-uibutton" id="ispublic">';
            dl += '<option value="true">Public</option>';
            dl += '<option value="false"selected class="memo-uibutton icon secure">Only Me </option>';
            dl += '</select>';
            dl += '</div>';
            dl += '</div>';

            var showHide = '<div id="qn_sh" style="margin-bottom:5px"><span id="show-hide" style="position:relative">KhmerAcademy Memo</span><a href="http://192.168.178.186:8080/HRD_MEMO/user/listallmemo" target="_blank"><img src="http://192.168.178.186:8080/HRD_MEMO/resources/admin/imgs/viewall.png" width="25px" heigh="25px" id="viewall" style="cursor:pointer;position:absolute;top:0px;left:6px" title="View all memos"/></a><img src="http://192.168.178.186:8080/HRD_MEMO/resources/admin/imgs/logout.png" width="25px" heigh="25px" id="logout" style="cursor:pointer;position:absolute;top:0px;right:6px" title="Logout"/></div>';
            var divNotes = '<div id="notes" style="background: #E4E4E4;padding-bottom: 30px;"></div>';
            var saveBtn = '<button class="memo-uibutton confirm" style="position:absolute;right:8px;bottom:2px;height:24px;" id="btnSave" >Save</button>';
            var notesInp = '<textarea name="qn_input" row="10" style="resize :none;width:100%;min-height: 120px;border:none;padding:10px;" id="mytext"></textarea>';
            $(showHide).appendTo(this.$el);
            $(divNotes).appendTo(this.$el);
            $(notesInp).appendTo(this.$el.find('#notes'));
            $(saveBtn).appendTo(this.$el.find('#notes'));
            $(dl).appendTo(this.$el.find('#notes'));
            $('#logout').click(function() {
                Cookies.get('LOGGED'); // => 'value'
                Cookies.remove('LOGGED', {
                    path: ''
                });
           		 $.ajax({
           				url : "http://192.168.178.186:8080/HRD_MEMO/plugin/logout",
           				type : "GET",
           				success : function(data){
           				},
           				error : function(data) {
           					console.log(data);
           				}
           			});
                $('#qn > .chat-container,#qn_sh,#notes').remove();
                _this.login();
                $('.qn_container #notes,.qn_container #username-password').show();
            });
            //          $('.qn_container #notes,.qn_container #username-password').hide();
            // CHECK EXISTING NOTES IN localStorage
            if (this.config.storage === true) {
                var url = window.location.href;
                var memo = {
                    "fullDomain": url,
                    "id": Cookies.getJSON('LOGGED').userid
                };
                if ($('.chat-container').length == true) {
                    $('#memo-loading').show();
                }
                $.ajax({
                    type: "POST",
                    url: "http://192.168.178.186:8080/HRD_MEMO/plugin/memo",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(memo),
                    success: function(json) {
                        console.log(json)
                        $('#memo-loading').hide();
                        var cb = '';
                        cb += '<section class="chat-container">';
                        cb += '<ol class="chat-box">';
                        $.each(json, function(index, obj) {
                            var deleted = "";
                            var update = "";
                            var report='';
                            if (obj.userid == Cookies.getJSON('LOGGED').userid) {
                                $('#qn > #notes').remove();
                                cb += '<li class="another" id="' + obj.id + '">';
                                cb += '<input type="hidden" id="ispublic" value="' + obj.ispublic + '"/>';
                                update = '<img src="http://192.168.178.186:8080/HRD_MEMO/resources/admin/imgs/edit.png" width="14px" heigh="14px" class="btnUpdateMemo" id="' + obj.id + '" style="cursor:pointer" title="Update Memo" />'
                                deleted = '<img src="http://192.168.178.186:8080/HRD_MEMO/resources/admin/imgs/delete.png" width="14px" heigh="14px" class="btnDeleteMemo" id="' + obj.id + '" style="cursor:pointer" title="Delete Memo" />'
                            } else {
                                cb += '<li class="me" id="' + obj.id + '" >';
                                report='<span style="position:relative;cursor:pointer" id="'+obj.userid+'" class="report"> Report <img src="http://192.168.178.186:8080/HRD_MEMO/resources/admin/imgs/report.png" width="9px" height="9px;" title="Report this memo"/></span>';
                            }
                            cb += '<div class="avatar-icon">';
                            cb += '<img src="http://192.168.178.186:8080/HRD_MEMO/resources/user/image/' + obj.userimageurl + '" title="'+obj.username+'" >';
                            cb += '</div>';
                            cb += '<div class="messages">';
                            cb += '<p style="font-size:13px">' + obj.content + '</p>';
                            cb += '<time datetime="2009-11-13T20:00" style="font-size:9px">' + obj.date + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+report + update + "&nbsp;&nbsp;" + deleted + ' </time>';
                            cb += '</div>';
                            /*  cb+='<span class="close"></span>';*/
                            cb += '</li>';

                            var qnText = obj.content;
                            if (isURL(qnText)) {
                                $('#' + obj.id).addClass('quicknote-bword');
                            }
                        });
                        cb += '</ol>';
                        cb += '</section>';
                        $(cb).appendTo('.qn_container');
                        $('.messages p').readmore({
                        	  speed: 75,
                        	  lessLink: '<a href="#" style="text-decoration:none;color:#178DB1;font-size:13px;">Read less</a>'
                        	});

                        /*$(document).on('click',".btnDeleteMemo", function(){*/
                        $('.btnDeleteMemo').click(function() {
                            var r = confirm("Are you sure want to delete ?");
                            if (r == true) {
                                var id = $(this).attr('id');
                                _this.deleteMemo(id);
                            }

                        });
                        
                        //REPORT MEMO
                        $('.report').click(function() {
                        	
                        	var hrd_notify_url="ws://192.168.178.186:8080/HRD_MEMO/memo/usernotification";
	                       	 var hrd_memo_websocket=new WebSocket(hrd_notify_url);
	                       	 hrd_memo_websocket.onopen=function(message){
	                       	 }
	                       	 hrd_memo_websocket.onclose=function(message){
	                       	 	hrd_memo_websocket.close();
	                       	 }
	                       	 hrd_memo_websocket.onmessage=function(message){
	                       	 	 if(message.data==="response"){
	                       	 		 
	                       	 	 }else if(message.data==="public"){
	                       	 		pluginGetMemoPulic();
	                       	 	 }
	                       	 }
	                       	 function sendReportNotify(message){
	                       			hrd_memo_websocket.send(message);
	                       	 }
                       	 
                        	var r = confirm("Are you sure want to report this memo ?");
                            if (r == true) {
                            	var memoid=$(this).parent().parent().parent().attr('id');
                               	var reportedmemo={
                            			"reporterid":Cookies.getJSON('LOGGED').userid,
                            			"memoid":memoid
                            	}
                               	$('#memo-loading').show();
                            	$.ajax({
                                    url: "http://192.168.178.186:8080/HRD_MEMO/plugin/memo/memoexisted/"+memoid,
                                    type: "POST",
                                    success: function(data) {
                                        if (data.RESPONSE_DATA == false) {
                                        	 $
                                             .ajax({
                                                 url: "http://192.168.178.186:8080/HRD_MEMO/plugin/memo/report",
                                                 type: "POST",
                                                 dataType: "json",
                                                 contentType: "application/json; charset=utf-8",
                                                 data: JSON.stringify(reportedmemo),
                                                 success: function(data) {
                                                     if (data.RESPONSE_DATA==true) {
                                                    	 $('#memo-loading').hide();
                                                    	 $('#memo-alert').remove();
                                                    	 sendReportNotify("report")
                                                    	 $("#qn_sh").append('<span style="color:#FFC962;text-decoration:none;text-transform:lowercase" id="memo-alert">memo has been reported to administrator !</span>');
                                                     } else {
                                                    	 $('#memo-loading').hide();
                                                         $("#qn_sh").append('<span style="color:#FFC962;text-decoration:none;" id="memo-alert">something went wrong !</span>');
                                                     }
                                                 },
                                                 error: function(data) {
                                                     alert(data.RESPONSE_DATA);
                                                 }
                                             });
                                        } else {
                                        	$('#memo-loading').hide();
                                        	$('#memo-alert').remove();
                                        	$("#qn_sh").append('<span style="color:#FFC962;text-decoration:none;text-transform:lowercase" id="memo-alert">this memo already reported to administrator !</span>');
                                        }
                                    },
                                    error: function(data) {
                                        alert(data.RESPONSE_DATA);
                                    }
                                });
                            }
                        });

                        $('.btnUpdateMemo').click(function() {
                            var updateText = $('li.another div.messages > p').text();
                            var ispublic = $('li.another input[type=hidden]').val();
                            var memoid = $('li.another').attr('id');
                            $('#qn').empty();
                            var dl = '';
                            dl += '<div  style="position:absolute;bottom:4px;right:170px;margin-right:10px;height:22px;">';
                            dl += '<select class="memo-uibutton" id="ispublic">';
                            if (ispublic == "false") {
                                dl += '<option value="true">Public</option>';
                                dl += '<option value="false" selected>Only Me</option>';
                            } else {
                                dl += '<option value="true" selected>Public</option>';
                                dl += '<option value="false">Only Me</option>';
                            }

                            dl += '</select>';
                            dl += '</div>';
                            dl += '</div>';

                            var showHide = '<div id="qn_sh" style="margin-bottom:5px"><span id="show-hide">KhmerAcademy Memo</span><img src="http://192.168.178.186:8080/HRD_MEMO/resources/admin/imgs/logout.png" width="14px" heigh="14px" id="logout" style="cursor:pointer;" title="Logout"/></div>';
                            var divNotes = '<div id="notes" style="background: #E4E4E4;padding-bottom: 30px;"></div>';
                            var cancelBtn = '<button class="memo-uibutton" style="position:absolute;right:70px;bottom:2px;height:24px;" id="btnCancel" >Cancel</button>';
                            var saveBtn = '<button class="memo-uibutton confirm" style="position:absolute;right:8px;bottom:2px;height:24px;" id="btnUpdate" >Update</button>';
                            var notesInp = '<textarea name="qn_input" row="10" style="resize :none;width:100%;min-height: 120px;border:none;padding:10px;" id="mytext">' + updateText + '</textarea>';
                            $(showHide).appendTo('#qn');
                            $(divNotes).appendTo('#qn');
                            $(notesInp).appendTo('#notes');
                            $(saveBtn).appendTo('#notes');
                            $(dl).appendTo('#notes');
                            $(cancelBtn).appendTo('#notes');
                            $('#mytext').focus();

                            // BUTTON UPDATE CLICKED
                            $('#btnUpdate').click(function() {
                                //                              that.updateMemo(memoid,$("#notes textarea[name$='qn_input']").val(),$("#ispublic").val());
                                $('#memo-loading').show();
                                //                              var url = window.location.pathname.replace("/HRD_MEMO",'');
                                //                              var domainName = window.location.href.replace(window.location.pathname,'/HRD_MEMO');
                                var domainName = window.location.protocol + '//' + window.location.hostname + (window.location.port ? ':' + window.location.port : '');
                                var url = window.location.href.replace(domainName,"");
                                var memo = {
                                    "userid": Cookies.getJSON('LOGGED').userid,
                                    "id": memoid,
                                    "content": $("#notes textarea[name$='qn_input']").val().replace("<script>","").replace("</script>",""),
                                    "ispublic": $("#ispublic").val(),
                                    "domainName": domainName,
                                    "title":document.title,
                                    "url": url
                                }
                                console.log(memo);
                                $.ajax({
                                    type: "POST",
                                    url: "http://192.168.178.186:8080/HRD_MEMO/plugin/memo/update",
                                    dataType: "json",
                                    contentType: "application/json; charset=utf-8",
                                    data: JSON.stringify(memo),
                                    success: function(json) {
                                        if (json.RESPONSE_DATA) {
                                            $('#memo-loading').hide();
                                            //                                         $('#qn > .chat-container,#qn > #notes,#qn > #qn_sh').remove();
                                            $('#qn').empty();
                                            _this.appendElem();
                                        } else {
                                            console.log(json.RESPONSE_DATA);
                                        }
                                    }
                                });
                            });

                            // BUTTON CANCEL CLICKED
                            $('#btnCancel').click(function() {
                                $('#qn').empty();
                                _this.appendElem();
                            });
                        });
                    }

                });


            }
        },
        login: function() {
            var isURL = this.isURL;
            var _this = this;
            // THEME
            if (this.config.theme == 'light') {
                this.$el.addClass('qn_container_light').addClass('qn_container');
            } else if (this.config.theme == 'dark') {
                this.$el.addClass('qn_container');
            } else {
                console.log('Error: Theme >> ' + this.config.theme + ' not found.');
                // SET DEFAULT
                this.$el.addClass('qn_container');
            }
            // POSITION
            if (this.config.pos == 'left') {
                this.$el.css({
                    'left': '0',
                    'bottom': '0',
                    'margin-left': '5px'
                });
            } else if (this.config.pos == 'right') {} else {
                console.log('Error: Position >> ' + this.config.pos + ' not found.');
            }
            // SIGN IN FORM         
            var showHide = '<div id="qn_sh" ><span id="show-hide">KhmerAcademy Memo</span></div>';
            var loginForm = '<form id="frmLogin" method="post"></form>';
            var divUserPass = '<div id="username-password"></div>';
            var divBtn = '<div id="div-btn" class="memo-btn-group" style="margin-top:10px"></div>';
            var usernameInput = '<p><input type="email" name="email" id="email" maxlength="500" placeholder="E-mail" required></p>';
            var passwordInput = '<p><input type="password" name="password" id="password" maxlength="500" placeholder="Password" required></p>';
            var submitBtn = '<input type="submit" name="btnLogin" class="memo-uibutton confirm" value="Login" id="logBtn" style>';
            var regBtn = '<input type="submit" name="btnReg" class="memo-uibutton special" value="Register" id="regBtn">';
            $(showHide).appendTo(this.$el);
            $(divUserPass).appendTo(this.$el);
            $(loginForm).appendTo(this.$el.find('#username-password'));
            $(usernameInput).appendTo(this.$el.find('#frmLogin'));
            $(passwordInput).appendTo(this.$el.find('#frmLogin'));
            $(divBtn).appendTo(this.$el.find('#frmLogin'));
            $(submitBtn).appendTo(this.$el.find('#div-btn'));
            $(regBtn).appendTo(this.$el.find('#div-btn'));
            $('.qn_container #notes,.qn_container #username-password,.qn_container .chat-container').hide();
            $("#frmLogin")
                .submit(
                    function(e) {
                    	 function logingMainMemo(email,pwd){
         					var json={
         							username:email,
         							password:pwd
         					};
         					$.ajax({
         						url : "http://192.168.178.186:8080/HRD_MEMO/login",
         						type : "POST",
         						dataType:'json',
         						data :json,
         						success : function(data) {
         						},
         						error : function(data) {
         							console.log(data);
         						}
         					});
                    	 }
                        $('#memo-loading').show();
                        e.preventDefault();
                        $
                            .ajax({
                                url: "http://192.168.178.186:8080/HRD_MEMO/plugin/memo/login",
                                type: "POST",
                                data: $("#frmLogin").serialize(),
                                success: function(data) {
                                    $('#memo-loading').hide();
                                    if (data.MESSAGE == "SUCCESS") {
                                        Cookies.set('LOGGED', {
                                            "userid": data.USERID,
                                            "email": data.EMAIL,
                                            "lang": "km",
                                            "imageUrl": data.IMAGE_URL
                                        }, {
                                            expires: 1,
                                            path: ''
                                        });
                                        logingMainMemo($('#email').val(),$('#password').val());
                                        console.log(Cookies.getJSON('LOGGED').lang);
                                        $('#qn > #qn_sh,#username-password').remove();
                                        _this.appendElem();
                                        $('#mytext').focus();
                                    } else {
                                        $('#qn_sh').html('<span id="show-hide">KhmerAcademy Memo</span>');
                                        $("#qn_sh").append('<span style="color:#FFC962;text-decoration:none;" id="memo-alert">Invalid username or password !</span>')
                                    }
                                },
                                error: function(data) {
                                    alert(data.RESPONSE_DATA);
                                }
                            });
                    });
            $("#regBtn").click(function(e) {
                e.preventDefault();
                /* var win = window.open("http://www.khmeracademy.org", '_blank');
                win.focus();*/
                _this.register();
            });
            $('#email').focus(function(event) {
                $('#memo-alert').remove();
            });
        },
        completeNote: function() {
            var _this = this;
            var storage = this.config.storage;
            var isURL = this.isURL;
            // this.$el.on('keypress', '#notes input', function(e) {
            //     // RETURN KEY PRESSED
            //     if (e.which == 13 || e.keyCode == 13) {
            //            $('#myimg').click(function(e) {
            this.$el.on('click', '#notes #btnSave', function(e) {
                // var notesInpVal = $("#notes textarea[name$='qn_input']").val();

                //var url = window.location.pathname.replace("/HRD_MEMO", '');
                //              var domainName = window.location.href.replace(window.location.pathname,'/HRD_MEMO');
                var domainName = window.location.protocol + '//' + window.location.hostname + (window.location.port ? ':' + window.location.port : '');
                var url = window.location.href.replace(domainName,"");
                var memo = {
                    "userid": Cookies.getJSON('LOGGED').userid,
                    "content": $("#notes textarea[name$='qn_input']").val().replace("<script>","").replace("</script>",""),
                    "domainName": domainName,
                    "url": url,
                    "title":document.title,
                    "ispublic": $('#ispublic').val()

                }
                if ($("#notes textarea[name$='qn_input']").val()) {
                    //                    // SAVE TO localStorage
                    //                    if (storage === true) {
                    //                        
                    //                    }
                    $('#memo-loading').show();
                    $.ajax({
                        type: "POST",
                        url: "http://192.168.178.186:8080/HRD_MEMO/plugin/memo/add",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify(memo),
                        success: function(data) {
                            if (data.RESPONSE_DATA) {
                                $('#memo-loading').hide();
                                $('#qn').empty();
                                _this.appendElem();
                            }
                        },
                        error: function(data) {

                        }
                    });


                } else {
                    console.log('Empty note!');
                }
            });

            // }
            // });
            // SHOW AND HIDE
            this.$el.on('click', '#qn_sh #show-hide', function() {
                $('#memo-alert').remove();
                $('.qn_container #logout,.qn_container #viewall,.qn_container #notes,.qn_container .chat-container,.qn_container #username-password').slideToggle(100);
            });
            // CLICK TO CLOSE NOTES
            /*this.$el.on('click', '#notes .close', function() {
                $(this).each(function() {
                    $(this).parent('.quicknote').stop().fadeOut(100, function() {
                        var id = $(this).attr('id');
                        var note = $(this).text();
                        var theNote = {
                            'id': id,
                            'note': note
                        };
                        // REMOVAL OF ITEM IN localStorage
                        if (storage === true) {
                            var ls = JSON.parse(localStorage.getItem('quicknote')) || [];
                            if (ls) {
                                $.each(ls, function(index, obj) {
                                    // console.log(ID);
                                    if (obj.id == id) {
                                        ls.splice(index, 1);
                                        localStorage.setItem('quicknote', JSON.stringify(ls));
                                        return false;
                                    }
                                });
                            }
                        }
                        // REMOVE CURRENT ELEMENT FROM DOM
                        $(this).remove();
                    });
                });
            });*/
        }
    };
    $.fn.quicknote = function(options) {
        return this.each(function() {
            new QuickNote(this, options).init();
        });
    };
})(jQuery, window, document);


