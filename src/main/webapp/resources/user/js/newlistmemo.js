// path variable declare in your jsp file
var pageNumber = 0;
var displayRecord = 0;
var current = 1;

function generatePageNumber(data, displayrec) {
    displayRecord = displayrec;
    if (data > 0) {
        if (data % displayrec != 0) {
            pageNumber = Math.floor(data / displayrec) + 1;
        } else {
            pageNumber = data / displayrec;
        }
    }
}

function init() {
    $.ajax({
        type: "GET",
        url: path + "/user/listdomain",
        success: function(data) {
            var dashb=JSON.parse(data.DASHBOARD_DATA);
            $('#total-memo').text(dashb.totalmemo);
            $('#public-memo').text(dashb.publicmemo);
            $('#private-memo').text(dashb.privatememo);
            $('#total-website').text(dashb.totalsite);
            $('#searchdomain').empty();
            $('#searchdomain')
                .append($("<option></option>")
                    .attr("value", "")
                    .text("All Websites"));
            $.each(data.DATA, function(key, value) {
                $('#searchdomain')
                    .append($("<option></option>")
                        .attr("value", value)
                        .text(value));
            });
            listMemo();
        },
        error: function(data) {
        	$('#total-memo').text("");
            $('#public-memo').text("");
            $('#private-memo').text("");
            $('#total-website').text("");
            $('#searchdomain').empty();
            listMemo();
        }
    });
}

var currentPage = 1;

function listMemo() {
    var json = {};
    var url = '';
//    if (($('input[name="privacy"]:checked').val()) == "") {
        url = path + "/user/user/memos";
        json = {
            //userId: $("#userid").val(), //for userid can text ""
        	currentPage : currentPage,
            title: $("#searchtitle").val(), //for search title text can ""
            domainName: $("#searchdomain").val(), //for search domainName text can "
            isPublic : $('input[name="privacy"]:checked').val()
        };
    //} else {
//        url = path + "/user/mylistmemo1";
//        json = {
//            userid: $("#userid").val(), //for userid can text ""
//            title: $("#searchtitle").val(), //for search title text can ""
//            domainName: $("#searchdomain").val(), //for search domainName text can ""
//            ispublic: $('input[name="privacy"]:checked').val() //for privacy true or false text can ""
//        };
//    }

    $.ajax({
        type: "GET",
        url: url,
        data: json,
        contentType: 'application/json',
        success: function(data) {
        	if(data.STATUS==302){
            var tr = '';
            var privacy_icon = '';
            $.each(data.DATA, function(key, value) {
                if (value.ispublic == false) {
                    privacy_icon = '<small class="label label-danger">Private</small>';
                } else {
                    privacy_icon = '<small class="label label-info">Public</small>';
                }
                tr += '<tr id="'+value.id+'">';
                tr += '<td class="mailbox-name" align="center"><a href="' + value.fullDomain + '" target="_blank"><img src="https://www.google.com/s2/favicons?domain=' + value.fullDomain + '" title="' + value.fullDomain + '" ></a></td>';
                tr += '<td class="mailbox-subject">' + privacy_icon + "&nbsp;&nbsp;&nbsp;<b>" + value.title + '</b> <br /><span class="memo-content">' + value.content + '</span></td>';
                tr += '<td class="mailbox-attachment"><div class="tools"><i class="fa fa-trash-o" onclick="deleteMemo('+value.id+')"></i></div>';
                tr += '</td><td class="mailbox-date" align="center">' + moment(value.date).format("DD-MM-YYYY HH:mm:ss") + ' </td>';
                tr += '</tr>';
            });
            $('table.table').html(tr);
            $('.loading').hide();
            if(data.PAGINATION){
            	$("#currentPage").html(data.PAGINATION.currentPage);
            	$("#totalPage").html(data.PAGINATION.totalPages);
            	$("#totalRecord").html(data.PAGINATION.totalCount);
            }
            /* HOVER ON EACH MEMO */
            $('tr').hover(function() {
                $(this).find('.tools i').show();
            }, function() {
                $(this).find('.tools i').hide();
            });
        	}else{
        		$('.loading').hide();
        	}
        },
        error: function(data) {
            $('table.table').html("");
            $('.loading').hide();
        }
    });
}
function deleteMemo(id){
	var r = confirm("Are you sure to delete this memo ?");
	if (r == true) {
		$('.loading').show();
		$.ajax({
	        type: "POST",
	        url: path+"/plugin/memo/" + id,
	        success: function(json) {
	        	$('.loading').hide();
	           init();
	           alert('Memo deleted !');
	        }
	    });
	} 
	
}
function updateMemo(id, content,title, ispublic){
	var memo = {
            "userid": $('#userid').val(),
            "id": id,
            "title":title,
            "content": content,
            "ispublic": ispublic
        }
	$.ajax({
        type: "PUT",
        url: path+"/user/"+id,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(memo),
        success: function(json) {
        	$('.loading').hide();
        	init();
        	alert("Memo updated !")
        	$('#txtTitle').val("");
			$('#content_memo').val("");
			$('#isPublic').val("false");
			$('#txtTitle').focus();
			$('#btn-update').html('<i class="fa fa-save"></i>Save').attr("id","btn-save");
			$('div.col-md-8 > div > div.box-header.with-border > h3').text("Compose New Memo");
			$('#btn-reset').show();
			$('#btn-addnew').hide();
        }
    });
}






function getMemoDisplay(page) {
    json = {
        userid: $("#userid").val(), //for userid
        title: $("#searchtitle").val(), //for search title 
        domainName: $("#searchdomain").val(), //for search domainName can ""
        date: "", //for search date format YYYY-MM-DD text can ""
        ispublic: $('input[name="privacy"]:checked').val(), //for privacy true or false text can ""
        page: page,
        limit: displayRecord
    };
    $.ajax({
        type: "POST",
        url: path + "/user/usermemo",
        data: JSON.stringify(json),
        contentType: 'application/json',
        success: function(data) {
            //Extract data function here
        },
        error: function(data) {
            $("#listmemo").html("<div>No Recorde Has Been Found</div>");
            $("#pagination").html("");
            $("#rowwrapper").css("display", "none");
        }
    });
}

//for next button 
$("#next").click(function() {
    if (current < pageNumber) {
        current++;
        getMemoDisplay(current);
    }
});
//for prev button
$("#prev").click(function() {
    if (current > 1) {
        current--;
        getMemoDisplay(current);
    }
});


// TODO: PAGINATION 

$("#btnNext").click(function(){
	if($("#currentPage").html() < $("#totalPage").html()){
		currentPage++;	
		listMemo();
	}else{
		console.log("ELSE IN NEXT BUTTON");
	}
});

$("#btnPrevious").click(function(){
	if($("#currentPage").html() > 1){
		currentPage--;
		listMemo();
	}else{
		console.log("ELSE IN PREVIOUS BUTTON");
	}
});