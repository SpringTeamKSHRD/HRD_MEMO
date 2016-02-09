<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Material Login Form</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/reset.css">
    <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css">
    <script
	src='${pageContext.request.contextPath}/resources/admin/js/jquery-cookie.js'></script>
<style >
select option{
	color: green;
}
</style>
</head>

<body>
    <!-- Mixins-->
    <!-- Pen Title-->
    <div class="pen-title">
        <h1>MEMO Login Form</h1><span><i class='fa fa-code'></i> by <a href='http://www.khmeracademy.org'>Khmer Academy</a></span>
    </div>
    <!-- <div class="rerun"><a href="">Rerun Pen</a></div> -->
    <div class="container">
        <div class="card"></div>
        <div class="card">
            <h1 class="title">Login</h1>
            <form id="frmLogin" action="${pageContext.request.contextPath}/login"
        method="POST">
                <div class="input-container">
                    <input type="text" id="username" name="username" required="required" />
                    <label for="Username">Email</label>
                    <div class="bar"></div>
                </div>
                <div class="input-container">
                    <input type="password" id="password" name="password" required="required" />
                    <label for="Password">Password</label>
                    <div class="bar"></div>
                </div>
                <div class="button-container">
                    <button type="submit"><span>Login</span></button>
                </div>
            </form>
        </div>
        <div class="card alt">
            <div class="toggle"></div>
            <h1 class="title">Register
      <div class="close"></div>
    </h1>
            <form id="frmRegister">
                <div class="input-container">
                    <input type="text" id="r_username" name="username" required="required" />
                    <label for="Username">Username</label>
                    <div class="bar"></div>
                </div>
                <div class="input-container">
                    <select name="gender" id="gender">
                      <option value="male" selected="selected">Male</option>
                      <option value="female">Female</option>
                    </select>
                    <div class="bar"></div>
                </div>
                <div class="input-container">
                    <input type="text" id="r_email" name="email" required="required" />
                    <label for="email">Email</label>
                    <div class="bar"></div>
                </div>
                <div class="input-container">
                    <input type="password" id="r_password" name="password" required="required" />
                    <label for="password">Password</label>
                    <div class="bar"></div>
                </div>
                <div class="button-container">
                    <button type="submit"><span>Sign Up</span></button>
                </div>
            </form>
        </div>
    </div>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js'></script>
    <script type="text/javascript">
    var path = '${pageContext.request.contextPath}/';
	 Cookies.remove('MEMO');
	 Cookies.remove('LOGGED', {
         path: ''
     });
	</script>
	<script type="text/javascript"	src='${pageContext.request.contextPath}/resources/js/login.js'>	</script>
    <script src="${pageContext.request.contextPath}/resources/js/index.js"></script>
</body>

</html>
