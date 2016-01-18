<!DOCTYPE>
<html>
<head>
	<title>Memo</title>
	<link href='https://fonts.googleapis.com/icon?family=Material+Icons' rel='stylesheet'>
	<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/resources/materialize/css/materialize.min.css' />
	<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/resources/css/plugin.css' />
</head>
<body>
	<form id="frmMemo" method="POST" class="col s12" style="padding: 15px 15px 15px 15px;">
		<input type="hidden" id="memoid">
		<div class="row" style="margin-bottom: 0px;">Write Your Note
			Here</div>
		<hr style="margin: 5px 0 10px 0; border-top: 1px solid #ddd;">
		<ul class="collection" style="margin: 0px; border: none; ">
			<li class="collection-item avatar"
				style="border: 0px !important; padding: 0px 0px 0px 72px; height: 0px; min-height: 0px;">
				<img src="${pageContext.request.contextPath}/resources/Male-icon.png" alt="" class="circle">
				<div class="row" style="margin-bottom: 0px;">
					<div class="col s12" style="padding: 0px;">
						<textarea id="note" style="border: 1px solid rgb(221, 221, 221);" required></textarea>
					</div>
				</div>

			</li>
		</ul>
		<div class="row" style="margin: 0 15px 0 15px;">
			<div class="input-field left" style="margin-top: inherit;">
				<p>
					<input type="checkbox" id="ispublic"> <label for="ispublic">Public</label>
				</p>
			</div>
			<div class="input-field right" style="margin-top: inherit;">
				<button class="btn waves-effect waves-light right" type="submit" id="btnsubmit"
					style="margin: 7px 0 7px 0;font-size: 1rem;line-height: inherit;height: 25px;">Add</button>
			</div>
		</div>
	</form>
	<script src='${pageContext.request.contextPath}/resources/admin/js/jquery-2.1.4.min.js'></script>
	<script src='${pageContext.request.contextPath}/resources/materialize/js/materialize.min.js'></script>
	<script type="text/javascript">var path = '${pageContext.request.contextPath}/'</script>
	<script src='${pageContext.request.contextPath}/resources/js/plugin/iplugin.js'></script>
</body>
</html>
