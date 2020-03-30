<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

	<title>BBC Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	

		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="<%= request.getContextPath() %>/resources/css/login/images/icons/favicon.ico"/>
<!--===============================================================================================-->
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/login/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/login/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/login/css/main.css">
<!--===============================================================================================-->


</head>
<style>
 .outer{
		width:860px;
		margin-left:auto;
		margin-right:auto;
	}

 
 a:hover {
 color: #ffc107;
}
</style>
<body>
	<div class="outer">
	<div class="limiter">
	
	  
			<div class="wrap-login100">
			  <button type="button" class="close" data-dismiss="modal">&times;</button>
				<form class="login100-form validate-form" action="<%=request.getContextPath()%>/login.ui" method="post" >
					<span class="login100-form-title p-b-26">
						BBC
					</span>
	
					<div class="wrap-input100 validate-input" data-validate = "아이디">
						<input class="input100" type="text" name="userId">
						<span class="focus-input100" data-placeholder="ID"></span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate="비밀번호" >
						<span class="btn-show-pass">
							
						</span>
						<input class="input100" type="password" name="userPwd">
						<span class="focus-input100" data-placeholder="Password"></span>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								Login
							</button>
						</div>
					</div>
					<div class="text-center p-t-115">
						<span class="txt1">
							<a href="<%=request.getContextPath()%>/findmyid.ui" class="txt2" class="txt2">
								아이디 찾기
							</a>
							<a href="<%=request.getContextPath()%>/findpw.ui" class="txt2">
								/ 비밀번호 찾기
							</a>
						</span>
					</div>
					<div class="text-center p-t-115">
						<span class="txt1">
							처음이신가요?
						</span>
					
						<a href="<%=request.getContextPath()%>/signup.ui" class="txt2">
							회원가입
						</a>
					</div>
				</form>
			</div>
		</div>
	
	

	<div id="dropDownSelect1"></div>
	
	</div>
	
<!--===============================================================================================-->
	<script src="<%= request.getContextPath() %>/resources/css/login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="<%= request.getContextPath() %>/resources/css/login/vendor/bootstrap/js/popper.js"></script>

<!--===============================================================================================-->
	<script src="<%= request.getContextPath() %>/resources/css/login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<!--===============================================================================================-->
	<script src="<%= request.getContextPath() %>/resources/css/login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="<%= request.getContextPath() %>/resources/css/login/js/main.js"></script>
</body>
</html>