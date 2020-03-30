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
				<p class="lead text-gray-800 mb-5"><%=message%></p>
			<a href="#" onclick="location.href='<%= request.getContextPath() %>';">&larr; Back to Main</a>
		</div>

	</div>
	<!-- /.container-fluid -->

</body>
</html>