<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.bbc.event.model.vo.Event" %>
<%
	Event eList = (Event)request.getAttribute("eList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%= request.getContextPath() %>/resources/css/sb-admin-2.css" rel="stylesheet">
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

						<a href="#" class="logout-bt" data-toggle="modal" data-target="#logoutModal">
							<i class="fas fa-sign-out-alt logout-icon"> log out </i>
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
								이벤트 수정
								<hr id="event-hr">
							</h5>
						</div>

						<!-- 이벤트 수정 form -->

						<form action="<%= request.getContextPath() %>/modifyEvent.b.ev" method="post">
							<div>
								<table class="event-table">
									<tr>
										<th>
											<ul>
												<li>제목</li>
											</ul>
										</th>
										<td><input type="text" id="title" name="title" value="<%= eList.getEventTitle() %>"></td>
									</tr>
									<tr>
										<th>
											<ul>
												<li>유효 기간</li>
											</ul>
										</th> 
										<td><input type="date" id="startDate" name="startDate" value="<%= eList.getEventStartDate()%>">
											~ <input type="date" id="endDate" name="endDate" value="<%= eList.getEventEndDate() %>"></td>
									</tr>
									<tr>
										<th>
											<ul>
												<li>할인율</li>
											</ul>
										</th>
										<td><input type="number" step="5" id="rate" name="rate" value="<%= eList.getDiscountRate() %>">
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
								<textarea class="event-content" id="content" name="content"><%= eList.getEventContent() %></textarea>
							</div>

							<a data-toggle="modal" data-target="#event-modify-modal"><button class="bt-style" id="event-modify-bt">수정하기</button></a>
						</form>



					</div>

				</div>
				<!-- End of Main Content -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->
		

		<!-- event enroll Modal -->
		<div class="modal fade" id="event-modify-modal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">수정하시겠습니까?</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
						<a class="btn btn-primary" href="<%= request.getContextPath() %>/modifyEvent.b.ev">수정</a>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>