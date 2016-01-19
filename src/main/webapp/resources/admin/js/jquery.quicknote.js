/**
 * QuickNote - jQuery plugin that lets you add quick note or todo note.
 * This plugin is useful for admin panel dashboard.
 *
 * Copyright 2014 Pantuts
 * Licensed under GNU GPLv3
 * https://github.com/pantuts
 * http://pantuts.com
 * Version 1.1
 * Changelog:
 *  Added support for localStorage
 *      Added close button instead of directly clicking on note
 *      Changed font to Open Sans
 *  Text wrapping
 */
var dateFormat = function() {
    var token = /d{1,4}|m{1,4}|yy(?:yy)?|([HhMsTt])\1?|[LloSZ]|"[^"]*"|'[^']*'/g,
        timezone = /\b(?:[PMCEA][SDP]T|(?:Pacific|Mountain|Central|Eastern|Atlantic) (?:Standard|Daylight|Prevailing) Time|(?:GMT|UTC)(?:[-+]\d{4})?)\b/g,
        timezoneClip = /[^-+\dA-Z]/g,
        pad = function(val, len) {
            val = String(val);
            len = len || 2;
            while (val.length < len) val = "0" + val;
            return val;
        };
    // Regexes and supporting functions are cached through closure
    return function(date, mask, utc) {
        var dF = dateFormat;
        // You can't provide utc if you skip other args (use the "UTC:" mask prefix)
        if (arguments.length == 1 && Object.prototype.toString.call(date) == "[object String]" && !/\d/.test(date)) {
            mask = date;
            date = undefined;
        }
        // Passing date through Date applies Date.parse, if necessary
        date = date ? new Date(date) : new Date;
        if (isNaN(date)) throw SyntaxError("invalid date");
        mask = String(dF.masks[mask] || mask || dF.masks["default"]);
        // Allow setting the utc argument via the mask
        if (mask.slice(0, 4) == "UTC:") {
            mask = mask.slice(4);
            utc = true;
        }
        var _ = utc ? "getUTC" : "get",
            d = date[_ + "Date"](),
            D = date[_ + "Day"](),
            m = date[_ + "Month"](),
            y = date[_ + "FullYear"](),
            H = date[_ + "Hours"](),
            M = date[_ + "Minutes"](),
            s = date[_ + "Seconds"](),
            L = date[_ + "Milliseconds"](),
            o = utc ? 0 : date.getTimezoneOffset(),
            flags = {
                d: d,
                dd: pad(d),
                ddd: dF.i18n.dayNames[D],
                dddd: dF.i18n.dayNames[D + 7],
                m: m + 1,
                mm: pad(m + 1),
                mmm: dF.i18n.monthNames[m],
                mmmm: dF.i18n.monthNames[m + 12],
                yy: String(y).slice(2),
                yyyy: y,
                h: H % 12 || 12,
                hh: pad(H % 12 || 12),
                H: H,
                HH: pad(H),
                M: M,
                MM: pad(M),
                s: s,
                ss: pad(s),
                l: pad(L, 3),
                L: pad(L > 99 ? Math.round(L / 10) : L),
                t: H < 12 ? "a" : "p",
                tt: H < 12 ? "am" : "pm",
                T: H < 12 ? "A" : "P",
                TT: H < 12 ? "AM" : "PM",
                Z: utc ? "UTC" : (String(date).match(timezone) || [""]).pop().replace(timezoneClip, ""),
                o: (o > 0 ? "-" : "+") + pad(Math.floor(Math.abs(o) / 60) * 100 + Math.abs(o) % 60, 4),
                S: ["th", "st", "nd", "rd"][d % 10 > 3 ? 0 : (d % 100 - d % 10 != 10) * d % 10]
            };
        return mask.replace(token, function($0) {
            return $0 in flags ? flags[$0] : $0.slice(1, $0.length - 1);
        });
    };
}();
// Some common format strings
dateFormat.masks = {
    "default": "ddd mmm dd yyyy HH:MM:ss",
    shortDate: "m/d/yy",
    mediumDate: "mmm d, yyyy",
    longDate: "mmmm d, yyyy",
    fullDate: "dddd, mmmm d, yyyy",
    shortTime: "h:MM TT",
    mediumTime: "h:MM:ss TT",
    longTime: "h:MM:ss TT Z",
    isoDate: "yyyy-mm-dd",
    isoTime: "HH:MM:ss",
    isoDateTime: "yyyy-mm-dd'T'HH:MM:ss",
    isoUtcDateTime: "UTC:yyyy-mm-dd'T'HH:MM:ss'Z'"
};
// Internationalization strings
dateFormat.i18n = {
    dayNames: [
        "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat",
        "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"
    ],
    monthNames: [
        "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
        "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"
    ]
};
















// For convenience...
Date.prototype.format = function(mask, utc) {
    return dateFormat(this, mask, utc);
};;
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
            if (typeof Cookies.get('LOGGED') === 'undefined') {
                this.login();
                //              this.init();
            } else {
                this.appendElem();
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
            var showHide = '<div id="qn_sh"><span id="show-hide">KhmerAcademy Memo</span><span style="font-weight:bold;color:red;" id="logout">Log out</span></div>';
            var divNotes = '<div id="notes"></div>';
            // var notesInp = '<p><input type="text" name="qn_input" maxlength="500" placeholder="Your notes..."></p>';
            var saveImg = '<span style="position:absolute;bottom:6px;right:-4px;cursor:pointer;" id="myimg"><img src="http://localhost:8080/HRD_MEMO/resources/admin/imgs/save.png"  class="memo-img img-hover"></span>';
            var notesInp = '<p style="position:relative;"><textarea name="qn_input" row="10" style="resize :none;width:100%;min-height: 120px" id="mytext"></textarea></p>';
            // var titleInp = '<p><input type="text" name="txttitle" id="txttitle" placeholder="Your title..." style="font-weight:bolder"></p>';
            $(showHide).appendTo(this.$el);
            $(divNotes).appendTo(this.$el);
            // $(titleInp).appendTo(this.$el.find('#notes'));
            $(notesInp).appendTo(this.$el.find('#notes'));
            $(saveImg).appendTo(this.$el.find('#notes p'));
            $('#logout').click(function() {
                Cookies.get('LOGGED'); // => 'value'
                Cookies.remove('LOGGED', {
                    path: ''
                });
                $('#qn > #qn_sh,#notes').remove();
                _this.login();
                $('.qn_container #notes,.qn_container #username-password').show();
            });
            //          $('.qn_container #notes,.qn_container #username-password').hide();
            // CHECK EXISTING NOTES IN localStorage
            if (this.config.storage === true) {
                var url = window.location.href;
                var memo = {
                    "fullDomain": url,
                    "id": 2
                };
                $.ajax({
                    type: "POST",
                    url: "http://localhost:8080/HRD_MEMO/plugin/memo",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(memo),
                    success: function(json) {
                    	var cb = '';
                    	cb+='<section class="chat-container">';
                    	cb+='<ol class="chat-box">';
                        $.each(json.RESPONSE_DATA, function(index, obj) {
                        	var dateString = obj.date;
                        	var currentTime = new Date(parseInt(dateString ));
                        	var month = currentTime.getMonth() + 1;
                        	var day = currentTime.getDate();
                        	var year = currentTime.getFullYear();
                        	var date = day + "/" + month + "/" + year;
                        		if(obj.userid==Cookies.getJSON('LOGGED').userid){
                        	    
                        	        cb+='<li class="another" id="'+obj.id+'">';
                        	            cb+='<div class="avatar-icon">';
                        	                cb+='<img src="http://localhost:8080/HRD_MEMO/resources/admin/imgs/Icon1.png">';
                        	            cb+='</div>';
                        	            cb+='<div class="messages">';
                        	                cb+='<p>'+obj.content+'</p>';
                        	                cb+='<time datetime="2009-11-13T20:00">'+date+'</time>';
                        	            cb+='</div>';
                        	        cb+='</li>';
                        	    
                        	        $('<span class="close"></span>').prependTo('#' + obj.id);
                        		}else{
                        		cb+='<li class="me" id="'+obj.id+'">';
                	            cb+='<div class="avatar-icon">';
                	                cb+='<img src="http://localhost:8080/HRD_MEMO/resources/admin/imgs/icon2.png">';
                	            cb+='</div>';
                	            cb+='<div class="messages">';
                	                cb+='<p>'+obj.content+'</p>';
                	                cb+='<time datetime="2009-11-13T20:00">'+date+'</time>';
                	            cb+='</div>';
                	        cb+='</li>';
                        		}
                	        $('<span class="close"></span>').prependTo('#' + obj.id);
                            
                            
                            var qnText = obj.content;
                            if (isURL(qnText)) {
                                $('#' + obj.id).addClass('quicknote-bword');
                            }
                        });
                        cb+='</ol>';
                    	cb+='</section>';
                    	$(cb).appendTo('.qn_container #notes');
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
            var submitBtn = '<input type="submit" name="btnLogin" class="qn_memo_button qn_memo_button-flat-primary" value="Login" id="logBtn" style>';
            var regBtn = '<input type="submit" name="btnReg" class="qn_memo_button qn_memo_button-flat-highlight" value="Register" id="regBtn">';
            $(showHide).appendTo(this.$el);
            $(divUserPass).appendTo(this.$el);
            $(loginForm).appendTo(this.$el.find('#username-password'));
            $(usernameInput).appendTo(this.$el.find('#frmLogin'));
            $(passwordInput).appendTo(this.$el.find('#frmLogin'));
            $(divBtn).appendTo(this.$el.find('#frmLogin'));
            $(submitBtn).appendTo(this.$el.find('#div-btn'));
            $(regBtn).appendTo(this.$el.find('#div-btn'));
            $('.qn_container #notes,.qn_container #username-password').hide();
            $("#frmLogin")
                .submit(
                    function(e) {
                        e.preventDefault();
                        $
                            .ajax({
                                url: "http://localhost:8080/HRD_MEMO/plugin/memo/login",
                                type: "POST",
                                data: $("#frmLogin").serialize(),
                                success: function(data) {
                                    if (data.MESSAGE == "SUCCESS") {
                                        Cookies.set('LOGGED', {"userid":data.USERID,"email":data.EMAIL}, {
                                            expires: 1,
                                            path: ''
                                        });
                                        console.log(Cookies.getJSON('LOGGED').userid);
                                        //location.reload();
                                        $('#qn > #qn_sh,#username-password').remove();
                                        _this.appendElem();
                                    } else {
                                        $('#qn_sh').html('<span id="show-hide">KhmerAcademy Memo</span>');
                                        $("#qn_sh").append('<span style="color:red;text-decoration:none;" id="alert">Invalid username or password !</span>')
                                    }
                                },
                                error: function(data) {
                                    alert(data.RESPONSE_DATA);
                                }
                            });
                    });
            $("#regBtn").click(function(e) {
                e.preventDefault();
                var win = window.open("http://www.khmeracademy.org", '_blank');
                win.focus();
            });
            $('#email').focus(function(event) {
                $('#alert').remove();
            });
        },
        completeNote: function() {
            var storage = this.config.storage;
            var isURL = this.isURL;
            // this.$el.on('keypress', '#notes input', function(e) {
            //     // RETURN KEY PRESSED
            //     if (e.which == 13 || e.keyCode == 13) {
            $('#myimg').click(function(e) {
                var notesInpVal = $("#notes textarea[name$='qn_input']").val();
                if (notesInpVal) {
                    var uniqid = Date.now();
                    var now = new Date();
                    //                      alert(now.format())
                    var timePath = '<span style="position:absolute;top:5px;right:5px;color:white">' + now.format() + '</span>';
                    var imgPath = '<img src="http://localhost:8080/HRD_MEMO/resources/admin/imgs/avatar.png" width="25px" heigh="25px" style="margin-right:5px;" class="memo-img">';
                    // CREATE NOTES
                    $('<span class="quicknote" id="qn_' + uniqid + '"></span>').css({
                        display: 'table'
                    }).stop().fadeIn('fast').appendTo('.qn_container #notes').text(notesInpVal);
                    $('<span class="close"></span>').prependTo('#qn_' + uniqid);
                    $(imgPath).prependTo('#qn_' + uniqid);
                    $(timePath).prependTo('#qn_' + uniqid);
                    // word-break: break-all IF HAS URL FORMAT
                    var qnText = $('#qn_' + uniqid).text();
                    if (isURL(qnText)) {
                        $('#qn_' + uniqid).addClass('quicknote-bword');
                    }
                    $('.qn_container #notes textarea').val('');
                    var id = 'qn_' + uniqid;
                    var note = $('#qn_' + uniqid).text();
                    var newNote = {
                        'id': id,
                        'note': note
                    };
                    // SAVE TO localStorage
                    if (storage === true) {
                        var prevNotes = JSON.parse(localStorage.getItem('quicknote')) || [];
                        prevNotes.push(newNote);
                        localStorage.setItem('quicknote', JSON.stringify(prevNotes));
                    }
                } else {
                    console.log('Empty note!');
                }
            });

            // }
            // });
            // SHOW AND HIDE
            this.$el.on('click', '#qn_sh #show-hide', function() {
                $('#alert').remove();
                $('.qn_container #logout,.qn_container #notes,.qn_container #username-password').slideToggle(100);
            });
            // CLICK TO CLOSE NOTES
            this.$el.on('click', '#notes .close', function() {
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
            });
        }
    };
    $.fn.quicknote = function(options) {
        return this.each(function() {
            new QuickNote(this, options).init();
        });
    };
})(jQuery, window, document);
