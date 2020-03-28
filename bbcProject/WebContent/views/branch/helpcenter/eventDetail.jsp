<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.bbc.event.model.vo.Event"%>
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
					<div class="content">
						<div class="wrap-event">
							<div class="tab-name">
								<h1>이벤트 관리</h1>
							</div>

							<hr class="tab-divider black-divider">

							<div class="tit">
								<h4 class="tit-name"><%= eList.getEventTitle() %></h4>
								<em class="status"><%= eList.getEventEnrollDate() %></em>
							</div>

							<div class="list-bt m-list-bt">
								<button class="list-modify-bt" id="event-detail-modify-bt" onclick="modifyEvent();">수정</button>
								<a data-toggle="modal" onClick="$('#event-delete-Modal').modal('show')"><button class="list-delete-bt" id="event-detail-delete-bt">삭제</button></a>
							</div>


							<hr class="tab-divider">

							<div class="detail-cnt">

								<ul>
									<li>할인율 : <%= eList.getDiscountRate() %>%</li>
									<li>유효 기간 : <%= eList.getEventStartDate() %> ~ <%= eList.getEventEndDate() %></li>
									<br>
								</ul>

								<%= eList.getEventContent() %>

							</div>

						</div>
						<!-- End of wrap-event-->

						<hr class="tab-content-divider">
						
						<div class="view-list">
							<table class="tb_col">
								<tr>
									<td><a href="<%= request.getContextPath() %>/detail.b.ev?eno=<%= eList.getNext() %>"> &lt; 다음</a></td>
									<td>-</td>
									<td><a href="<%= request.getContextPath() %>/detail.b.ev?eno=<%= eList.getPrev() %>">이전 &gt;</a></td>
								</tr>

							</table>

							<div class="btn btn-search btn-default back-list" id="event-back-list" onclick="backEvent();">목록</div>

						</div>

					</div>
					<!-- /.container-fluid -->

				</div>
				<!-- End of Main Content -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->
	</div>


	<script>
	 	function backEvent(){
	 		location.href="<%= request.getContextPath() %>/event.b.ev";
	 	}
	 	
	 	function modifyEvent(){
	 		location.href="<%= request.getContextPath() %>/modifyForm.b.ev?eno=<%= eList.getEventNo() %>";
	 	}
	 	
	 	function deleteEventOne(){
	 		location.href="<%= request.getContextPath() %>/deleteOne.b.ev?eno=<%= eList.getEventNo() %>";
	 	}
 	</script>


	<!-- event Delete Modal -->
	<div class="modal fade" id="event-delete-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">이벤트를 삭제하시겠습니까?</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="javascript:deleteEventOne();">삭제</a>
				</div>
			</div>
		</div>
	</div>


</body>
</html>