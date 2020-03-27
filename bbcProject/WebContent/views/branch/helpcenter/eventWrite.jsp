<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="<%= request.getContextPath() %>/resources/css/sb-admin-2.css"
	rel="stylesheet">
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<%@ include file="../../../views/branch/common/menubar.jsp"%>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">


				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Content Row -->
					<div class="h-bar list-bar">

						<a href="#" class="logout-bt" data-toggle="modal"
							data-target="#logoutModal"> <i
							class="fas fa-sign-out-alt logout-icon"> log out </i>
						</a>
					</div>

					<!-- DataTales Example -->
					<div class="container">

						<div class="tab-name">
							<h1>이벤트 관리</h1>
						</div>

						<hr class="tab-divider">

						<div>
							<h5 id="info-client">
								이벤트 등록
								<hr id="event-hr">
							</h5>
						</div>

						<!-- 이벤트 등록 form -->

						<form action="<%= request.getContextPath() %>/enroll.b.ev" method="post">
							<div>
								<table class="event-table">
									<tr>
										<th>
											<ul>
												<li>제목</li>
											</ul>
										</th>
										<td><input type="text" id="title" name="title"></td>
									</tr>
									<tr>
										<th>
											<ul>
												<li>유효 기간</li>
											</ul>
										</th>
										<td><input type="date" id="startDate" name="startDate">
											~ <input type="date" id="endDate" name="endDate"></td>
									</tr>
									<tr>
										<th>
											<ul>
												<li>할인율</li>
											</ul>
										</th>
										<td><input type="number" step="5" id="rate" name="rate">
										</td>
									</tr>
									<tr>
										<th>
											<ul>
												<li>내용</li>
											</ul>
										</th>
									</tr>
								</table>
								<textarea class="notice-content" id="content" name="content"></textarea>
							</div>

							<button type="submit" class="bt-style" id="event-insert-bt" onclick="enrollEvent();">등록하기</button>
						</form>



					</div>

				</div>
				<!-- End of Main Content -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->
	</div>

	<script>
		function enrollEvent(){
			location.href="<%= request.getContextPath() %>/enroll.b.ev";
		}
	</script>

</body>
</html>