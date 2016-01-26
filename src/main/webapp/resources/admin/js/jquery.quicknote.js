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
            //            alert(location.protocol+'//'+location.hostname+(location.port ? ':'+location.port: ''))

            var loading = '<div id="loading" style="position:absolute;top:40%;right:45%;z-index:99999999;display:none;"><img src="http://192.168.178.186:8080/HRD_MEMO/resources/admin/imgs/loading.gif" /></div>';
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
            $('#loading').show();
            $.ajax({
                type: "POST",
                url: "http://192.168.178.186:8080/HRD_MEMO/plugin/memo/" + id,
                success: function(json) {
                    $('#loading').hide();
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
            $('#loading').show();
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
                        $('#loading').hide();
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
                        $('#loading').show();
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
                                        $('#loading').hide();
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
                                                    	$('#loading').hide();
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
                                                        $("#qn_sh").append('<span style="color:#FFC962;text-decoration:none;" id="alert">something went wrong !</span>')
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

            var showHide = '<div id="qn_sh" style="margin-bottom:5px"><span id="show-hide">KhmerAcademy Memo</span><img src="http://192.168.178.186:8080/HRD_MEMO/resources/admin/imgs/logout.png" width="14px" heigh="14px" id="logout" style="cursor:pointer;" title="Logout"/></div>';
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
                    $('#loading').show();
                }
                $.ajax({
                    type: "POST",
                    url: "http://192.168.178.186:8080/HRD_MEMO/plugin/memo",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(memo),
                    success: function(json) {
                        console.log(json)
                        $('#loading').hide();
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
                            cb += '<img src="http://192.168.178.186:8080/HRD_MEMO/resources/admin/imgs/' + obj.userimageurl + '" title="'+obj.username+'" class="powertip">';
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
                        	var r = confirm("Are you sure want to report this memo ?");
                            if (r == true) {
                            	var memoid=$(this).parent().parent().parent().attr('id');
                               	var reportedmemo={
                            			"reporterid":Cookies.getJSON('LOGGED').userid,
                            			"memoid":memoid
                            	}
                               	$('#loading').show();
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
                                                    	 $('#loading').hide();
                                                    	 $("#qn_sh").append('<span style="color:#FFC962;text-decoration:none;text-transform:lowercase" id="alert">memo has been reported to administrator !</span>');
                                                     } else {
                                                    	 $('#loading').hide();
                                                         $("#qn_sh").append('<span style="color:#FFC962;text-decoration:none;" id="alert">something went wrong !</span>');
                                                     }
                                                 },
                                                 error: function(data) {
                                                     alert(data.RESPONSE_DATA);
                                                 }
                                             });
                                        } else {
                                        	$('#loading').hide();
                                        	$('#alert').remove();
                                        	$("#qn_sh").append('<span style="color:#FFC962;text-decoration:none;text-transform:lowercase" id="alert">this memo already reported to administrator !</span>');
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
                                $('#loading').show();
                                //                              var url = window.location.pathname.replace("/HRD_MEMO",'');
                                //                              var domainName = window.location.href.replace(window.location.pathname,'/HRD_MEMO');
                                var domainName = location.protocol + '//' + location.hostname + (location.port ? ':' + location.port : '');
                                var url = window.location.pathname;
                                var memo = {
                                    "userid": Cookies.getJSON('LOGGED').userid,
                                    "id": memoid,
                                    "content": $("#notes textarea[name$='qn_input']").val(),
                                    "ispublic": $("#ispublic").val(),
                                    "domainName": domainName,
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
                                            $('#loading').hide();
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
                        $('#loading').show();
                        e.preventDefault();
                        $
                            .ajax({
                                url: "http://192.168.178.186:8080/HRD_MEMO/plugin/memo/login",
                                type: "POST",
                                data: $("#frmLogin").serialize(),
                                success: function(data) {
                                    $('#loading').hide();
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
                                        console.log(Cookies.getJSON('LOGGED').lang);
                                        $('#qn > #qn_sh,#username-password').remove();
                                        _this.appendElem();
                                        $('#mytext').focus();
                                    } else {
                                        $('#qn_sh').html('<span id="show-hide">KhmerAcademy Memo</span>');
                                        $("#qn_sh").append('<span style="color:#FFC962;text-decoration:none;" id="alert">Invalid username or password !</span>')
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
                $('#alert').remove();
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

                var url = window.location.pathname.replace("/HRD_MEMO", '');
                //              var domainName = window.location.href.replace(window.location.pathname,'/HRD_MEMO');
                var domainName = location.protocol + '//' + location.hostname + (location.port ? ':' + location.port : '');
                var url = window.location.pathname;
                var memo = {
                    "userid": Cookies.getJSON('LOGGED').userid,
                    "content": $("#notes textarea[name$='qn_input']").val(),
                    "domainName": domainName,
                    "url": url,
                    "ispublic": $('#ispublic').val()

                }
                if ($("#notes textarea[name$='qn_input']").val()) {
                    //                    // SAVE TO localStorage
                    //                    if (storage === true) {
                    //                        
                    //                    }
                    $('#loading').show();
                    $.ajax({
                        type: "POST",
                        url: "http://192.168.178.186:8080/HRD_MEMO/plugin/memo/add",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify(memo),
                        success: function(data) {
                            if (data.RESPONSE_DATA) {
                                $('#loading').hide();
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
                $('#alert').remove();
                $('.qn_container #logout,.qn_container #notes,.qn_container .chat-container,.qn_container #username-password').slideToggle(100);
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

