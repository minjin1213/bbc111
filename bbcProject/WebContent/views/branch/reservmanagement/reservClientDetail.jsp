<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.bbc.userInfo.model.vo.UserInfo, com.bbc.payment.model.vo.Payment" %>
<%
	UserInfo ui = (UserInfo)request.getAttribute("ui");
	ArrayList<Payment> list = (ArrayList<Payment>)request.getAttribute("list");
%>
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
							<h1>상세 조회</h1>
						</div>

						<h5 id="divider-name">
							<li class="fas fa-fw fa-user-edit"></li>예약 정보
						</h5>

						<h5 id="info-client">
							회원 정보
						</h5>
						<hr id="info-client-hr">

						<!-- 회원 정보 div -->
						<div>
							<table class="table info-client-table rent-user-table">
								<tr>
									<th scope="row">이름</th>
									<td><%= ui.getMemberName() %></td>
								</tr>
								<tr>
									<th scope="row">주소</th>
									<td><%= ui.getMemberZipcode() %> <%= ui.getMemberAddress() %></td>
								</tr>
								<tr>
									<th scope="row">주민등록번호</th>
									<td><%= ui.getRrn() %></td>
								</tr>
								<tr>
									<th scope="row">연락처</th>
									<td><%= ui.getPhone() %></td>
								</tr>
								<tr>
									<th scope="row">이메일</th>
									<td><%= ui.getMemberEmail() %></td>
								</tr>
							</table>
						</div>

						<h5 id="info-client">
							대여 정보
						</h5>
						<hr id="info-client-hr">

						<!-- 대여 정보 div-->
						<div>
							<table class="table info-client-table info-table">
								<tr>
									<th>대여 번호</th>
									<th width="150px">대여 기간</th>
									<th>차종</th>
									<th>차량 번호</th>
									<th>결제 금액</th>
									<th>결제 일시</th>
									<th>결제 방식</th>
									<th>환불 여부</th>
									<th>환불 일시</th>
								</tr>
								<% for(Payment p : list) { %>
									<tr>
										<td><%= p.getReservationNo() %></td>
										<td><%= p.getRentDate() %> ~ <%= p.getReturnDate() %></td>
										<td><%= p.getCarName() %></td>
										<td><%= p.getCarNo() %></td>
										<td><%= p.getPayAmount() %>원</td>
										<td><%= p.getPayDate() %></td>
										<td><%= p.getPayMethod() %></td>
										<% if(p.getRefundStatus() != "1") { %>
											<td>환불 완료</td>
											<td><%= p.getRefundDate() %></td>
										<% } else if(p.getRefundStatus() == "1") { %>
											<td>-</td>
											<td>-</td>
										<% } %>
									</tr>
								<% } %>
							</table>
						</div>
					</div>

				</div>
				<!-- End of Main Content -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->
	</div>

</body>
</html>