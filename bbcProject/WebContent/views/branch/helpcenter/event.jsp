<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.bbc.event.model.vo.Event, com.bbc.common.page.vo.PageInfo" %>
<%
	ArrayList<Event> list = (ArrayList<Event>)request.getAttribute("list");

	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int eventCount = pi.getListCount();
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

<link href="<%=request.getContextPath()%>/resources/css/sb-admin-2.css" rel="stylesheet">

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

						<div class="list-bt">
							<button class="list-enroll-bt" id="event-enroll-bt" onclick="enrollEvent();">등록</button>
							<a data-toggle="modal" data-target="#event-delete-Modal"><button class="list-delete-bt">삭제</button></a>
						</div>

						<div class="tab-content">
							<div id="home" class="container tab-pane active">
								<br>

								<table id="event-table" class="table table-bordered">
									<thead>
										<tr>
											<th><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();"></th>
											<th>번호</th>
											<th>제목</th>
											<th>글쓴이</th>
											<th>유효 기간</th>
											<th>조회수</th>
										</tr>
									</thead>

									<tbody>
										<% if(list.isEmpty()) { %>
											<tr>
												<td colspan="6">조회된 이벤트가 없습니다.</td>
											</tr>
										<% } else { %>
											<% for(Event e : list) { %>
												<tr>
													<td><input type="checkbox" name="checkRow" value="<%= e.getEventNo() %>"></td>
													<td><%= e.getRowNum() %></td>
													<td style="display:none;"><%= e.getEventNo() %></td>
													<td><%= e.getEventTitle() %></td>
													<td><%= e.getMemberName() %></td>
													<td><%= e.getEventStartDate() %> - <%= e.getEventEndDate() %></td>
													<td><%= e.getEventReadCnt() %></td>
												</tr>
											<% } %>
										<% } %>
										
									</tbody>
								</table>
							</div>
						</div>
						

						<!-- search form -->
						<form class="navbar-form navbar-search" role="search" action="">
							<div class="input-group">

								<div class="input-group-btn">
									<button type="button"
										class="btn btn-search btn-default non-dropmenu">
										<span class="label-icon">제목</span>
									</button>
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
							<button class="page-bt" onclick="location.href='<%= request.getContextPath()%>/event.b.ev';"> &lt;&lt; </button>
							
							<!-- (<) -->
							<% if(currentPage == 1) { %>
								<button class="page-bt" disabled> &lt; </button>
							<% } else { %>
								<button class="page-bt" onclick="location.href='<%= request.getContextPath() %>/event.b.ev?currentPage=<%= currentPage - 1 %>';"> &lt; </button>
							<% } %>
							
							<% for(int p=startPage; p<=endPage; p++) { %>
								<% if(currentPage == p) { %>
									<button class="page-bt" style="background:orange; color:white;" disabled><%= p %></button>
								<% } else { %>
									<button class="page-bt" onclick="location.href='<%= request.getContextPath() %>/event.b.ev?currentPage=<%= p %>';"><%= p %></button>
								<% } %>
							<% } %>
							
							<!-- (>) -->
							<% if(currentPage == maxPage) { %>
								<button class="page-bt" disabled> &gt; </button>
							<% } else { %>
								<button class="page-bt" onclick="location.href='<%= request.getContextPath() %>/event.b.ev?currentPage=<%= currentPage + 1 %>';"> &gt; </button>
							<% } %>
							
							<!-- (>>) -->
							<button class="page-bt" onclick="location.href='<%= request.getContextPath()%>/event.b.ev?currentPage=<%= maxPage %>';"> &gt;&gt; </button>
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
					<a class="btn btn-primary" id="delsel" href="#">삭제</a>
				</div>
			</div>
		</div>
	</div>
	
	<script>
							
		$("#th_checkAll").change(function(){
			$("input[name=checkRow]").prop("checked", $(this).prop("checked"))
		});
							
		$("#event-table>tbody>tr>td:not(:first-child)").click(function(){
			var eno = $(this).parent().children().eq(2).text();
				location.href="<%= request.getContextPath() %>/detail.b.ev?eno=" + eno;
		});

		function enrollEvent(){
			location.href="<%= request.getContextPath() %>/enrollForm.b.ev";
		}
					        
		$("#delsel").click(function(){
			
			var arr = new Array();
			
			$('input:checkbox[name=checkRow]:checked').each(function(){
				arr.push($(this).val());
			});
			
			var str = arr.join();
			
			$.ajax({
				url:"deleteChk.b.ev",
				type:"get",
				data:{str:str},
				success:function(){
					location.href="event.b.ev";
				},
				error:function(){
					console.log("이벤트 선택 삭제 ajax 통신 오류");
				}
			});
		});
					       
		</script>

</body>
</html>