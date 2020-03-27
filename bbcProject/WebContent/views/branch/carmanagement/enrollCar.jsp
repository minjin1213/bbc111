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
								<hr id="info-client-hr">
							</h5>
						</div>

						<!-- 전체 차량 div -->


						<!-- 부트 -->
						<div class="container">

							<div id="ads">
								<!-- Category Card -->
								<div class="col-md-4">
									<div class="car-card">
										<div class="card-image">
										<a href="#" data-toggle="modal" data-target="#carModal">
												<span class="card-notify-badge"><input type="checkbox" name="chk-car"></span>
												<span class="card-notify-year">New</span>
												<img class="img-fluid"
												src="https://imageonthefly.autodatadirect.com/images/?USER=eDealer&PW=edealer872&IMG=USC80HOC011A021001.jpg&width=440&height=262"
												alt="Alternate Text">
										</div>
										<div class="card-body text-center">
											<div class="ad-title m-auto">
												<h5>Honda Accord LX</h5>
											</div>
										</div>
										</a>
										<div class="card-exp card-image-overlay m-auto">
											<span>- 색상 : white</span>
											<span>- 연료 : gasoline</span>
											<span>- 연식 : 2019/07</span>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="car-card second-car">
										<div class="card-image">
											<a href="#" data-toggle="modal" data-target="#carModal">
												<span class="card-notify-badge"><input type="checkbox" name="chk-car"></span>
												<span class="card-notify-year">New</span>
												<img class="img-fluid"
												src="https://imageonthefly.autodatadirect.com/images/?USER=eDealer&PW=edealer872&IMG=CAC80HOC021B121001.jpg&width=440&height=262"
												alt="Alternate Text">
										</div>
										<div class="card-body text-center">
											<div class="ad-title m-auto">
												<h5>Honda CIVIC HATCHBACK</h5>
											</div>
										</div>
										</a>
										<div class="card-exp card-image-overlay m-auto">
											<span>- 색상 : white</span> <span>- 연료 : gasoline</span> <span>-
												연식 : 2019/07</span>
										</div>
									</div>
								</div>

								<div class="col-md-4">
									<div class="car-card third-car">
										<div class="card-image">
											<a href="#" data-toggle="modal" data-target="#carModal">
												<span class="card-notify-badge"><input type="checkbox" name="chk-car"></span>
												<span class="card-notify-year">New</span>
												<img class="img-fluid"
												src="https://imageonthefly.autodatadirect.com/images/?USER=eDealer&PW=edealer872&IMG=USC80HOC091A021001.jpg&width=440&height=262"
												alt="Alternate Text">
										</div>
										<div class="card-body text-center">
											<div class="ad-title m-auto">
												<h5>Honda Accord Hybrid</h5>
											</div>
										</div>
										</a>
										<div class="card-exp card-image-overlay m-auto">
											<span>- 색상 : white</span>
											<span>- 연료 : gasoline</span>
											<span>- 연식 : 2019/07</span>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="car-card">
										<div class="card-image">
											<a href="#" data-toggle="modal" data-target="#carModal">
												<span class="card-notify-badge"><input
													type="checkbox" name="chk-car"></span> <img
												class="img-fluid"
												src="https://imageonthefly.autodatadirect.com/images/?USER=eDealer&PW=edealer872&IMG=USC80HOC011A021001.jpg&width=440&height=262"
												alt="Alternate Text" />
										</div>
										<div class="card-body text-center">
											<div class="ad-title m-auto">
												<h5>Honda Accord LX</h5>
											</div>
										</div>
										</a>
										<div class="card-exp card-image-overlay m-auto">
											<span>- 색상 : white</span>
											<span>- 연료 : gasoline</span>
											<span>- 연식 : 2019/07</span>
										</div>
									</div>
								</div>

								<div class="col-md-4">
									<div class="car-card second-car">
										<div class="card-image">
											<a href="#" data-toggle="modal" data-target="#carModal">
												<span class="card-notify-badge"><input type="checkbox" name="chk-car"></span>
												<img class="img-fluid"
												src="https://imageonthefly.autodatadirect.com/images/?USER=eDealer&PW=edealer872&IMG=CAC80HOC021B121001.jpg&width=440&height=262"
												alt="Alternate Text">
										</div>
										<div class="card-body text-center">
											<div class="ad-title m-auto">
												<h5>Honda CIVIC HATCHBACK</h5>
											</div>
										</div>
										</a>
										<div class="card-exp card-image-overlay m-auto">
											<span>- 색상 : white</span>
											<span>- 연료 : gasoline</span>
											<span>- 연식 : 2019/07</span>
										</div>
									</div>
								</div>

								<div class="col-md-4">
									<div class="car-card third-car">
										<div class="card-image">
											<a href="#" data-toggle="modal" data-target="#carModal">
												<span class="card-notify-badge"><input type="checkbox" name="chk-car"></span>
												<img class="img-fluid"
												src="https://imageonthefly.autodatadirect.com/images/?USER=eDealer&PW=edealer872&IMG=USC80HOC091A021001.jpg&width=440&height=262"
												alt="Alternate Text">
										</div>

										<div class="card-body text-center">
											<div class="ad-title m-auto">
												<h5>Honda Accord Hybrid</h5>
											</div>
										</div>
										</a>
										<div class="card-exp card-image-overlay m-auto">
											<span>- 색상 : white</span>
											<span>- 연료 : gasoline</span>
											<span>- 연식 : 2019/07</span>
										</div>
									</div>
								</div>

								<div class="col-md-4">
									<div class="car-card">
										<div class="card-image">
											<a href="#" data-toggle="modal" data-target="#carModal">
												<span class="card-notify-badge"><input
													type="checkbox" name="chk-car"></span> <img
												class="img-fluid"
												src="https://imageonthefly.autodatadirect.com/images/?USER=eDealer&PW=edealer872&IMG=USC80HOC011A021001.jpg&width=440&height=262"
												alt="Alternate Text" />
										</div>
										<div class="card-body text-center">
											<div class="ad-title m-auto">
												<h5>Honda Accord LX</h5>
											</div>
										</div>
										</a>
										<div class="card-exp card-image-overlay m-auto">
											<span>- 색상 : white</span>
											<span>- 연료 : gasoline</span>
											<span>- 연식 : 2019/07</span>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="car-card second-car">
										<div class="card-image">
											<a href="#" data-toggle="modal" data-target="#carModal">
												<span class="card-notify-badge"><input type="checkbox" name="chk-car"></span>
												<img class="img-fluid"
												src="https://imageonthefly.autodatadirect.com/images/?USER=eDealer&PW=edealer872&IMG=CAC80HOC021B121001.jpg&width=440&height=262"
												alt="Alternate Text">
										</div>
										<div class="card-body text-center">
											<div class="ad-title m-auto">
												<h5>Honda CIVIC HATCHBACK</h5>
											</div>
										</div>
										</a>
										<div class="card-exp card-image-overlay m-auto">
											<span>- 색상 : white</span>
											<span>- 연료 : gasoline</span>
											<span>- 연식 : 2019/07</span>
										</div>
									</div>
								</div>

								<div class="col-md-4">
									<div class="car-card third-car">
										<div class="card-image">
											<a href="#" data-toggle="modal" data-target="#carModal">
												<span class="card-notify-badge"><input type="checkbox" name="chk-car"></span>
												<img class="img-fluid"
												src="https://imageonthefly.autodatadirect.com/images/?USER=eDealer&PW=edealer872&IMG=USC80HOC091A021001.jpg&width=440&height=262"
												alt="Alternate Text">
										</div>
										<div class="card-body text-center">
											<div class="ad-title m-auto">
												<h5>Honda Accord Hybrid</h5>
											</div>
										</div>
										</a>
										<div class="card-exp card-image-overlay m-auto">
											<span>- 색상 : white</span>
											<span>- 연료 : gasoline</span>
											<span>- 연식 : 2019/07</span>
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
								<a href="#"> &lt;&lt; </a>
								<a href="#"> &lt; </a>
								<li><a href="#home">1</a></li>
								<li><a href="#home">2</a></li>
								<li><a href="#home">3</a></li>
								<li><a href="#home">4</a></li>
								<li><a href="#home">5</a></li>
								<a href="#"> &gt; </a>
								<a href="#"> &gt;&gt; </a>
							</div>

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



	<!-- car Modal -->
	<div class="modal fade" id="carModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document" id="car-modal-dialog">
			<div class="modal-content" id="car-modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Honda Accord Hybrid</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body" id="car-modal-body">
					<table class="car-exp-table">
						<tr>
							<th>차종</th>
							<td>중형</td>
						</tr>
						<tr>
							<th>차량 번호</th>
							<td>143하 5497</td>
						</tr>
						<tr>
							<th>색상</th>
							<td>white</td>
						</tr>
						<tr>
							<th>유종</th>
							<td>휘발유</td>
						</tr>
						<tr>
							<th>변속기</th>
							<td>오토</td>
						</tr>
						<tr>
							<th>연식</th>
							<td>2019/07</td>
						</tr>
						<tr>
							<th>옵션</th>
							<td>
								<ul>
									<li>하이패스</li>
									<li>네비게이션</li>
									<li>베이비 시트</li>
								</ul>
							</td>
						</tr>
					</table>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
					</div>
				</div>
			</div>
		</div>
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