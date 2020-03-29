<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.bbc.carinfo.model.vo.CarInfo, com.bbc.common.page.vo.PageInfo, java.util.ArrayList, java.lang.Math"%>
<%
	ArrayList<CarInfo> list = (ArrayList<CarInfo>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	int index = 0;
	
	int listSize = list.size();
	int size = (int)(Math.ceil((double)list.size()/3));
	
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
											<table>
												<tr>
												<% for(int i=0; i<size; i++) { %>
												
													<% for(int j=0; j<3; j++) { %>
													
														<% if(listSize != index) { %>
														<td>
															<input type="checkbox" name="chk-car" value="<%= list.get(i).getCarNo() %>" style="margin-right: 230px;">
															<% if(list.get(index).getCarLunchYear().equals("2020")) { %> 
																<span class="card-notify-year">New</span> 
															<% } %> 
															
															<img src="<%= request.getContextPath() %>/resources/carinfo_upfile/<%= list.get(index).getCarModifyName() %>" style="width:250px; height:150px">
															<div class="card-body text-center">
																<div class="ad-title m-auto">
																	<a href="#" data-toggle="modal" data-target="#carModal"
																			data-carTypeName="<%= list.get(index).getCarTypeName()%>"
																			data-carType="<%= list.get(index).getCarType() %>"
																			data-carNum="<%= list.get(index).getCarNum() %>"
																			data-carColor="<%= list.get(index).getCarColor() %>"
																			data-carFuel="<%= list.get(index).getCarFuel() %>"
																			data-carYear="<%= list.get(index).getCarLunchYear() %>"
																			data-carOption="<%= list.get(index).getCarOption() %>"><h5><%= list.get(index).getCarTypeName() %></h5>
																	</a>
																</div>
															</div>
															<div class="card-exp card-image-overlay m-auto">
																<span>- 색상 : <%= list.get(index).getCarColor() %></span>
																<span>- 연료 : <%= list.get(index).getCarFuel() %></span>
																<span>- 연식 : <%= list.get(index).getCarLunchYear() %></span>
															</div>
														</td>
														<% index++; %>
														
														<% } %>
													<% } %>
													
												</tr>
												
												<% } %>
												
											</table>
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
					<a class="btn btn-primary" href="#" id="selectCar">등록</a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- car Modal -->
	<div class="modal fade" id="carModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document" id="car-modal-dialog">
			<div class="modal-content" id="car-modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"><label class="carTypeName"></label></h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body" id="car-modal-body">
					<table class="car-exp-table">
						<tr>
							<th>차종</th>
							<td><label class="carType"></label></td>
						</tr>
						<tr>
							<th>차량 번호</th>
							<td><label class="carNum"></label></td>
						</tr>
						<tr>
							<th>색상</th>
							<td><label class="carColor"></label></td>
						</tr>
						<tr>
							<th>연료</th>
							<td><label class="carFuel"></label></td>
						</tr>
						<tr>
							<th>연식</th>
							<td><label class="carFuel"></label></td>
						</tr>
						<tr>
							<th>옵션</th>
							<td><label class="carOption"></label></td>
						</tr>
					</table>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	
		$(function(){
			
			var carNo="";
			
			$("#carModal").on('show.bs.modal', function(event){
				
				var carTypeName = $(event.relatedTarget).data('carTypeName');
				var carType = $(event.relatedTarget).data('carType');
				var carNum = $(event.relatedTarget).data('carNum');
				var carColor = $(event.relatedTarget).data('carColor');
				var carFuel = $(event.relatedTarget).data('carFuel');
				var carYear = $(event.relatedTarget).data('carYear');
				var carOption = $(event.relatedTarget).data('carOption');
				
				var modal = $(this);
				modal.find(".carTypeName").text(carTypeName);
				modal.fin(".carType").text(carType);
				modal.find(".carNum").text(carNum);
				modal.find(".carColor").text(carColor);
				modal.find(".carFuel").text(carFuel);
				modal.find(".carYear").text(carYear);
				modal.find(".carOption").text(carOption);
			});
		});
		
		$("#selectCar").click(function(){
			
			var arr = new Array();
			
			$('input:checkbox[name=chk-car]:checked').each(function(){
				arr.push($(this).val());
			});
			
			var str = arr.join();
			
			$.ajax({
				url:"enrollCar.b.ci",
				type:"get",
				data:{str:str},
				success:function(){
					location.href="enrollCarPage.b.ci";
				},
				error:function(){
					console.log("차량 선택 등록 ajax 통신 오류");
				}
			});
		});
	</script>

</body>
</html>