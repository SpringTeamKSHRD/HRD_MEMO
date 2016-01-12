<!DOCTYPE html>
<html>
	<head>
		<title></title>
		<style type="text/css">
		.video-container {
		    position: relative;
		    padding-bottom: 56.25%;
		    padding-top: 35px;
		    height: 0;
		    overflow: hidden;
		}
		.video-container iframe {
		    position: absolute;
		    top:0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		    overflow-x: hidden;
		}
		.btn-main {
    padding-top: 3px;
    width: 45px;
    height: 45px;
}
.btn-floating {
    display: inline-block;
    color: #fff;
    position: relative;
    overflow: hidden;
    z-index: 1;
    width: 37px;
    height: 37px;
    line-height: 37px;
    padding: 0;
    background-color: #26a69a;
    border-radius: 50%;
    transition: .3s;
    cursor: pointer;
    vertical-align: middle;
}
@font-face {
  font-family: 'Material Icons';
  font-style: normal;
  font-weight: 400;
  src: local('Material Icons'), local('MaterialIcons-Regular'), url(https://fonts.gstatic.com/s/materialicons/v10/2fcrYFNaTjcS6g4U3t-Y5ZjZjT5FdEJ140U2DJYC3mY.woff2) format('woff2');
}
		</style>
		<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/icon?family=Material+Icons">
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	</head>
	<body>
		<p id="outside">this is 1.html</p>	
		<div class="fixed-action-btn horizontal active"> 
	    		<a class="btn-floating btn-main"> <i class="material-icons">view_headline</i></a>		    				
		</div>	
		<div class="col-sm-6 video-container">
			<iframe src="http://localhost:8080/HRD_MEMO/plugin" height="500px" width="500px" frameborder="0"></iframe>			
		</div>
		<script src="jquery-1.11.3.min.js"></script>
	</body>
</html>