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
	
	int index = 0;
	
	// list.size() 15 --> 5행
				 //14 --> 5행
				 //13 --> 5행
				 //10 --> 4행
				 // 9 --> 3행
				 // 5 --> 2행
				 // 1 --> 1행
	int trSize = (int)(Math.ceil((list.size()-1)/3)) + 1;
	//int listSize = list.size();
	//int size = (int)(Math.ceil((double)list.size()/3));
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

						<a href="#" class="logout-bt" data-toggle="modal"
							data-target="#logoutModal"> <i
							class="fas fa-sign-out-alt logout-icon"> log out </i>
						</a>
					</div>

					<!-- DataTales Example -->
					<div class="container">

						<div class="tab-name">
							<h1>차량 관리</h1>
						</div>

						<hr class="tab-divider">

						<div>
							<h5 id="info-client">
								보유 차량
								<div class="bt-div">
									<a href="#" data-toggle="modal" data-target="#deletecarModal">
										<button class="bt-style" id="car-delete-bt">차량 삭제</button>
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

												<% for(int j=0; j<trSize; j++) { %>
													<tr>
														<% int temp=0; %>
														<% for(int i=0; i<list.size(); i++) { %>
	
														<td>
															<input type="checkbox" name="chk-car" value="<%= list.get(index).getCarNo() %>" style="margin-right: 230px;">
															<% if(list.get(index).getCarLunchYear().equals("2020")) { %>
																<span class="card-notify-year">New</span> 
															<% } %>
															<img src="<%= request.getContextPath() %>/resources/carinfo_upfile/<%= list.get(index).getCarModifyName() %>" style="width: 250px; height: 150px">
															<div class="card-body text-center">
																<div class="ad-title m-auto">
																	<a href="#" data-toggle="modal" data-target="#carModal"
																		data-cartypename="<%= list.get(index).getCarTypeName()%>"
																		data-cartype="<%= list.get(index).getCarType() %>"
																		data-carnum="<%= list.get(index).getCarNum() %>"
																		data-carcolor="<%= list.get(index).getCarColor() %>"
																		data-carfuel="<%= list.get(index).getCarFuel() %>"
																		data-caryear="<%= list.get(index).getCarLunchYear() %>"
																		data-caroption="<%= list.get(index).getCarOption() %>">
																		<h5><%= list.get(index).getCarTypeName() %></h5>
																	</a>
																</div>
															</div>
															<div class="card-exp card-image-overlay m-auto">
																<span>- 색상 : <%= list.get(index).getCarColor() %></span>
																<span>- 연료 : <%= list.get(index).getCarFuel() %></span>
																<span>- 연식 : <%= list.get(index).getCarLunchYear() %></span>
															</div>
														</td>
														
														<%  temp++;
															index++;
															if(temp == 3) break; 
														%>
	
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

							<!-- 페이징 바 영역 -->
							<div class="pagination">

								<!-- (<<) -->
								<button class="page-bt" onclick="location.href='<%= request.getContextPath()%>/carList.b.ci';"> &lt;&lt;</button>

								<!-- (<) -->
								<% if(currentPage == 1) { %>
									<button class="page-bt" disabled>&lt;</button>
								<% } else { %>
									<button class="page-bt" onclick="location.href='<%= request.getContextPath() %>/carList.b.ci?currentPage=<%= currentPage - 1 %>';"> &lt;</button>
								<% } %>

								<% for(int p=startPage; p<=endPage; p++) { %>
									<% if(currentPage == p) { %>
										<button class="page-bt" style="background: orange; color: white;" disabled><%= p %></button>
									<% } else { %>
										<button class="page-bt" onclick="location.href='<%= request.getContextPath() %>/carList.b.ci?currentPage=<%= p %>';"><%= p %></button>
									<% } %>
								<% } %>

								<!-- (>) -->
								<% if(currentPage == maxPage) { %>
									<button class="page-bt" disabled>&gt;</button>
								<% } else { %>
									<button class="page-bt" onclick="location.href='<%= request.getContextPath() %>/carList.b.ci?currentPage=<%= currentPage + 1 %>';"> &gt;</button>
								<% } %>

								<!-- (>>) -->
								<button class="page-bt" onclick="location.href='<%= request.getContextPath()%>/carList.b.ci?currentPage=<%= maxPage %>';"> &gt;&gt;</button>
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

	<!-- delete car Modal -->
	<div class="modal fade" id="deletecarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">삭제하기</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">선택된 차량을 삭제하시겠습니까 ?</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="#" id="selectDelete">삭제</a>
				</div>
			</div>
		</div>
	</div>

	<!-- car Modal -->
	<div class="modal fade" id="carModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document" id="car-modal-dialog">
			<div class="modal-content" id="car-modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">
						<label class="cartypename"></label>
					</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body" id="car-modal-body">
					<table class="car-exp-table">
						<tr>
							<th>차종</th>
							<td><label class="cartype"></label></td>
						</tr>
						<tr>
							<th>차량 번호</th>
							<td><label class="carnum"></label></td>
						</tr>
						<tr>
							<th>색상</th>
							<td><label class="carcolor"></label></td>
						</tr>
						<tr>
							<th>연료</th>
							<td><label class="carfuel"></label></td>
						</tr>
						<tr>
							<th>연식</th>
							<td><label class="caryear"></label></td>
						</tr>
						<tr>
							<th>옵션</th>
							<td><label class="caroption"></label></td>
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
			
			$("#carModal").on('show.bs.modal', function(event){
				
				var cartypename = $(event.relatedTarget).data('cartypename');
				var cartype = $(event.relatedTarget).data('cartype');
				var carnum = $(event.relatedTarget).data('carnum');
				var carcolor = $(event.relatedTarget).data('carcolor');
				var carfuel = $(event.relatedTarget).data('carfuel');
				var caryear = $(event.relatedTarget).data('caryear');
				var caroption = $(event.relatedTarget).data('caroption');
				
				var modal = $(this);
				
				modal.find(".cartypename").text(cartypename);
				modal.find(".cartype").text(cartype);
				modal.find(".carnum").text(carnum);
				modal.find(".carcolor").text(carcolor);
				modal.find(".carfuel").text(carfuel);
				modal.find(".caryear").text(caryear);
				modal.find(".caroption").text(caroption);
			});
		});
		
		$("#selectDelete").click(function(){
			
			var arr = new Array();
			
			$('input:checkbox[name=chk-car]:checked').each(function(){
				arr.push($(this).val());
			});
			
			console.log(arr);
			
			var str = arr.join();
			 
			$.ajax({
				url:"deleteCar.b.ci",
				type:"get",
				data:{str:str},
				success:function(){
					location.href="carList.b.ci";
				},
				error:function(){
					console.log("차량 선택 삭제 ajax 통신 오류");
				}
			});
		});
	</script>

</body>
</html>