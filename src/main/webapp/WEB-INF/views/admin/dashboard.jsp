<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>${pageTitle } | Memo</title>
  <%@ include file="_defaultCss.jsp" %>
  <style>
    @media only screen and (min-width: 960px) and (min-width: 768px) {
      #first-row{
        padding-top:10%;
      }
    }
  </style>
  </head>
      <%@ include file="_header.jsp" %>
        <%@ include file="_sideBarMenu.jsp" %>
      <!-- Your Page Content Here -->
          <!-- Small boxes (Stat box) -->
          <div class="row" id="first-row" >
            <div class="col-lg-3 col-lg-offset-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-aqua">
                <div class="inner">
                  <h3 id="total-user">${dashboard}</h3>
                  <p>Users</p>
                </div>
                <div class="icon">
                  <i class="ion ion-person-stalker"></i>
                </div>
                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-green">
                <div class="inner">
                  <h3 id="total-memo"></h3>
                  <p>Memos</p>
                </div>
                <div class="icon">
                  <i class="ion ion-document-text"></i>
                </div>
                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div><!-- ./col -->
            </div>
            <div class="row"> 
            <div class="col-lg-3 col-lg-offset-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-yellow">
                <div class="inner">
                  <h3 id="total-site">0</h3>
                  <p>Total Sites</p>
                </div>
                <div class="icon">
                  <i class="ion ion-social-html5"></i>
                </div>
                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-red">
                <div class="inner">
                  <h3 id="total-report-list">0</h3>
                  <p>Reported Memos</p>
                </div>
                <div class="icon">
                  <i class="ion ion-bug"></i>
                </div>
                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div><!-- ./col -->
          </div><!-- /.row -->
    <%@ include file="_footer.jsp" %>
    <%-- <%@ include file="_controlSideBar.jsp" %> --%>
 <%@ include file="_defaultJS.jsp" %>
<script>
/*   var result = ${dashboard}; 
 * ${dashboard} get from _defaultJs.jsp 
 */
    $("#total-user").html(result.totaluser);
    $("#total-memo").html(result.totalmemo);
    $("#total-site").html(result.totalsite);
    $("#total-report-list").html(result.totalreportlist);
</script>
  </body>
</html>
