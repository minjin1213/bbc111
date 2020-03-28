<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.bbc.carinfo.model.vo.CarInfo, com.bbc.common.page.vo.PageInfo, java.util.ArrayList"%>
<%
	ArrayList<CarInfo> list = (ArrayList<CarInfo>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
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
							<h1>차량 등록</h1>
						</div>

						<hr class="tab-divider">

						<div>
							<h5 id="info-client">
								전체 차량
								<div class="bt-div">
									<a data-toggle="modal" data-target="#enrollcarModal">
										<button class="bt-style" id="car-enroll-bt">차량 등록</button>
									</a>
								</div>
							</h5>
						</div>
						<hr id="info-client-hr">

						<!-- 전체 차량 div -->


						<!-- 부트 -->
						<div class="container">

							<div id="ads">
								<!-- Category Card -->
								<div class="col-md-4">
									<div class="car-card">
										<div class="card-image">
											<% for(CarInfo ci : list) { %>
											<table>
												<tr>
													<td>
														<% if(ci.getCarLunchYear().equals("2020")) { %> 
															<span class="card-notify-badge"></span>
															<span class="card-notify-year">New</span> 
														<% } %> 
														
														<span class="card-notify-badge"><input type="checkbox" name="chk-car"></span>
														<img src="<%= request.getContextPath() %>/resources/carinfo_upfile/<%= ci.getCarModifyName() %>" style="width:300px; height:200px">
														<div class="card-body text-center">
															<div class="ad-title m-auto">
																<a href="#" data-toggle="modal" data-target="#carModal"><h5><%= ci.getCarTypeName() %></h5></a>
															</div>
														</div>
														<div class="card-exp card-image-overlay m-auto">
															<span>- 색상 : <%= ci.getCarColor() %></span>
															<span>- 연료 : <%= ci.getCarFuel() %></span>
															<span>- 연식 : <%= ci.getCarLunchYear() %></span>
														</div>
													</td>
												</tr>
											</table>
											
											
											
											<!-- car Modal -->
											<div class="modal fade" id="carModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
												<div class="modal-dialog" role="document" id="car-modal-dialog">
													<div class="modal-content" id="car-modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLabel"><%= ci.getCarTypeName() %></h5>
															<button class="close" type="button" data-dismiss="modal" aria-label="Close">
																<span aria-hidden="true">×</span>
															</button>
														</div>
														<div class="modal-body" id="car-modal-body">
															<table class="car-exp-table">
																<tr>
																	<th>차종</th>
																	<td><%= ci.getCarType() %></td>
																</tr>
																<tr>
																	<th>차량 번호</th>
																	<td><%= ci.getCarNum() %></td>
																</tr>
																<tr>
																	<th>색상</th>
																	<td><%= ci.getCarColor() %></td>
																</tr>
																<tr>
																	<th>연료</th>
																	<td><%= ci.getCarFuel() %></td>
																</tr>
																<tr>
																	<th>연식</th>
																	<td><%= ci.getCarLunchYear() %></td>
																</tr>
																<tr>
																	<th>옵션</th>
																	<td><%= ci.getCarOption() %></td>
																</tr>
															</table>
															<div class="modal-footer">
																<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
															</div>
														</div>
													</div>
												</div>
											</div>
											<% } %>
										</div>

									</div>
								</div>

							</div>

							<!-- search form -->
							<form class="navbar-form navbar-search" role="search">
								<div class="input-group">

									<div class="input-group-btn">
										<button type="button" class="btn btn-search btn-default dropdown-toggle" data-toggle="dropdown">
											<span class="glyphicon glyphicon-search"></span>
											<span class="label-icon">전체</span>
											<span class="caret"></span>
										</button>
										<ul class="dropdown-menu text-center" role="menu">
											<li>
												<a href="#">
													<span class="glyphicon glyphicon-user"></span>
													<span class="label-icon">차종</span>
												</a>
											</li>
											<li>
												<a href="#">
													<span class="glyphicon glyphicon-user"></span>
													<span class="label-icon">색상</span>
												</a>
											</li>
											<li>
												<a href="#">
													<span class="glyphicon glyphicon-book"></span>
													<span class="label-icon">연료</span>
												</a>
											</li>
											<li>
												<a href="#">
													<span class="glyphicon glyphicon-book"></span>
													<span class="label-icon">연식</span>
												</a>
											</li>
										</ul>
									</div>

									<input type="text" class="form-control">

									<div class="input-group-btn">
										<button type="button" class="btn btn-search btn-default" id="searching">검색</button>
									</div>
								</div>
							</form>

							<div class="pagination">
						
							<!-- (<<) -->
							<button class="page-bt" onclick="location.href='<%= request.getContextPath()%>/enrollCar.b.ci';"> &lt;&lt; </button>
							
							<!-- (<) -->
							<% if(currentPage == 1) { %>
								<button class="page-bt" disabled> &lt; </button>
							<% } else { %>
								<button class="page-bt" onclick="location.href='<%= request.getContextPath() %>/enrollCar.b.ci?currentPage=<%= currentPage - 1 %>';"> &lt; </button>
							<% } %>
							
							<% for(int p=startPage; p<=endPage; p++) { %>
								<% if(currentPage == p) { %>
									<button class="page-bt" style="background:orange; color:white;" disabled><%= p %></button>
								<% } else { %>
									<button class="page-bt" onclick="location.href='<%= request.getContextPath() %>/enrollCar.b.ci?currentPage=<%= p %>';"><%= p %></button>
								<% } %>
							<% } %>
							
							<!-- (>) -->
							<% if(currentPage == maxPage) { %>
								<button class="page-bt" disabled> &gt; </button>
							<% } else { %>
								<button class="page-bt" onclick="location.href='<%= request.getContextPath() %>/enrollCar.b.ci?currentPage=<%= currentPage + 1 %>';"> &gt; </button>
							<% } %>
							
							<!-- (>>) -->
							<button class="page-bt" onclick="location.href='<%= request.getContextPath()%>/enrollCar.b.ci?currentPage=<%= maxPage %>';"> &gt;&gt; </button>
						</div>
						<!-- 끝 -->


					</div>

				</div>
				<!-- End of Main Content -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->
	</div>

	<!-- enroll car Modal-->
	<div class="modal fade" id="enrollcarModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">등록하기</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">선택된 차량을 등록하시겠습니까 ?</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="enroll-car.html">등록</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>