<!DOCTYPE>
<html>
<head>
	<title>Memo</title>
	<link href='https://fonts.googleapis.com/icon?family=Material+Icons' rel='stylesheet'>
	<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/resources/materialize/css/materialize.min.css' />
	<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/resources/css/plugin.css' />
</head>
<body>
	<form id="frmMemo" method="POST" class='col s12'>
		<div class='row' style="margin-bottom: 0px;">
			<div class="col s12" style="padding: 0px;">
				<textarea id="note" style="border: 1px solid #ddd;"></textarea>
			</div>
		</div>
		<div class="row" style="margin: 0 15px 0 15px;">
			<div class="input-field switch " style="margin-top: inherit;">
				<label> Public <input type="checkbox"> <span
					class="lever"></span>
				</label>
			</div>
			<div class='input-field right' style="margin-top: inherit;">							
				<button class="btn waves-effect waves-light right" type="submit" style="margin: 7px 0 7px 0;">
					<i class='material-icons'>done_all</i>
				</button>
			</div>
		</div>
	</form>
</body>
	<script src='${pageContext.request.contextPath}/resources/admin/js/jquery-2.1.4.min.js'></script>
	<script src='${pageContext.request.contextPath}/resources/materialize/js/materialize.min.js'></script>
	<script type="text/javascript">var path = '${pageContext.request.contextPath}/'</script>
	<script src='${pageContext.request.contextPath}/resources/js/plugin/iplugin.js'></script>
</html>
