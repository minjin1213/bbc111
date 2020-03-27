<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.bbc.reservation.model.vo.Reservation, com.bbc.common.page.vo.PageInfo" %>
<%
	ArrayList<Reservation> wholeList = (ArrayList<Reservation>)request.getAttribute("wholeList");
	
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
					<div class="h-bar">

						<a href="#" class="logout-bt" data-toggle="modal"
							data-target="#logoutModal"> <i
							class="fas fa-sign-out-alt logout-icon"> log out </i>
						</a>
						
					</div>



					<!-- DataTales Example -->
					<div class="container">

						<div class="tab-name">
							<h1>전체 조회</h1>
						</div>

						<hr class="tab-divider">

						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item" id="1">
								<a class="nav-link active" data-toggle="tab">예약중</a>
			              	</li>
			              	<li class="nav-item" id="2">
			                	<a class="nav-link" data-toggle="tab">대여중</a>
			              	</li>
			              	<li class="nav-item" id="3">
			                	<a class="nav-link" data-toggle="tab">반납 완료</a>
			              	</li>
			            </ul>

						<!-- Tab panes -->
						<div class="tab-content">
							<div id="tab1" class="container tab-pane active">
								<table id="user-table" class="table table-bordered">
									<thead>
										<tr>
											<th>이름</th>
											<th>예약 번호</th>
											<th>차종</th>
											<th>차량 번호</th>
											<th>예약 기간</th>
										</tr>
									</thead>

									<tbody>
										<% if(wholeList.isEmpty()) { %>
											<tr>
												<td colspan="5">조회된 회원이 없습니다.</td>
											</tr>
										<% } else {%>
											<% for(Reservation r : wholeList) { %>
												<tr>
													<td><%= r.getMemberName() %></td>
													<td><%= r.getReservationNo() %></td>
													<td><%= r.getCarName() %></td>
													<td><%= r.getCarNo() %></td>
													<td><%= r.getRentDate() %> ~ <%= r.getReturnDate() %></td>
												</tr>
											<% } %>
										<% } %>
									</tbody>
								</table>
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
									<ul class="dropdown-menu pull-left" role="menu">
										<li>
											<a href="#"> <span class="glyphicon glyphicon-user"></span>
											<span class="label-icon">이름</span>
											</a>
										</li>
										<li>
											<a href="#">
											<span class="glyphicon glyphicon-user"></span>
											<span class="label-icon">예약 번호</span>
											</a>
										</li>
										<li>
											<a href="#">
											<span class="glyphicon glyphicon-book"></span>
											<span class="label-icon">차량 번호</span>
											</a>
										</li>
									</ul>
								</div>

								<input type="text" class="form-control">

								<div class="input-group-btn">
									<button type="button" class="btn btn-search btn-default"
										id="searching">검색</button>


								</div>
							</div>
						</form>

						<!-- 페이징 바 영역 -->
						<div class="pagination">
						
							<!-- (<<) -->
							<button class="page-bt" onclick="location.href='<%= request.getContextPath()%>/wholeList.b.rv';"> &lt;&lt; </button>
							
							<!-- (<) -->
							<% if(currentPage == 1) { %>
								<button class="page-bt" disabled> &lt; </button>
							<% } else { %>
								<button class="page-bt" onclick="location.href='<%= request.getContextPath() %>/wholeList.b.rv?currentPage=<%= currentPage - 1 %>';"> &lt; </button>
							<% } %>
							
							<% for(int p=startPage; p<=endPage; p++) { %>
								<% if(currentPage == p) { %>
									<button class="page-bt" style="background:orange; color:white;" disabled><%= p %></button>
								<% } else { %>
									<button class="page-bt" onclick="location.href='<%= request.getContextPath() %>/wholeList.b.rv?currentPage=<%= p %>';"><%= p %></button>
								<% } %>
							<% } %>
							
							<!-- (>) -->
							<% if(currentPage == maxPage) { %>
								<button class="page-bt" disabled> &gt; </button>
							<% } else { %>
								<button class="page-bt" onclick="location.href='<%= request.getContextPath() %>/wholeList.b.rv?currentPage=<%= currentPage + 1 %>';"> &gt; </button>
							<% } %>
							
							<!-- (>>) -->
							<button class="page-bt" onclick="location.href='<%= request.getContextPath()%>/wholeList.b.rv?currentPage=<%= maxPage %>';"> &gt;&gt; </button>
						</div>

					</div>
					<!-- /.container-fluid -->

				</div>

			</div>
			<!-- End of Content Wrapper -->
		</div>
	</div>
	
	<script>
		
		// Ajax tab menu
		$(".nav-item").click(function(){
			
			var st = $(this).attr('id');
			var result = "";
			
			$.ajax({
				url:"wholeList.b.rv?st=" + st + "&&fr=tab",
				type:"get",
				success:function(list){
					
					
					result +="<table id='user-table' class='table table-bordered'>"
					result += "<thead> <tr> <th>이름</th> <th>예약 번호</th> <th>차종</th> <th>차량 번호</th> <th>예약 기간</th> </tr> </thead>"
					result += "<tbody>"
					if(list.length == 0) {
						value += "<tr> <td colspan='5'>조회된 회원이 없습니다.</td> </tr>"
					} else { 
						for(var i=0; i<list.length; i++) {  				
							result += "<tr> <td>" + list[i].memberName + "</td> <td>" + list[i].reservationNo 
							result += "</td> <td>" + list[i].carName + "</td> <td>" + list[i].carNo 
							result += "</td> <td>" + list[i].rentDate + "~" + list[i].returnDate + "</td> </tr>"
						}
					}	
					
					result += "</tbody> </table>";
				
					$("#tab1").html(result);
				},
				error:function(){
					console.log("tab menu ajax 통신 실패");
				}
			});
		});
		
		 
	</script>


</body>
</html>