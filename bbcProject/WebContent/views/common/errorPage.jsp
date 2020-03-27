<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String message = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/resources/css/sb-admin-2.css" rel="stylesheet">
</head>
<body>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- 404 Error Text -->
		<div class="text-center">
			<div class="error mx-auto" data-text="404">404</div>
			<p class="lead text-gray-800 mb-5">Page Not Found</p>
			<p class="text-gray-500 mb-0"><%=message%></p>
			<a href="#" onclick="location.href='<%= request.getContextPath() %>';">&larr; Back to Main</a>
		</div>

	</div>
	<!-- /.container-fluid -->

</body>
</html>