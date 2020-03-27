<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.bbc.notice.model.vo.Notice, java.util.ArrayList, com.bbc.common.page.vo.PageInfo" %>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");

	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int noticeCount = pi.getListCount();
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
					<div class="h-bar list-bar">

						<a href="#" class="logout-bt" data-toggle="modal" data-target="#logoutModal">
							<i class="fas fa-sign-out-alt logout-icon"> log out </i>
						</a>
					</div>

					<!-- DataTales Example -->
					<div class="container">

						<div class="tab-name">
							<h1>공지사항</h1>
						</div>

						<hr class="tab-divider">

						<div class="list-bt">
							<button class="list-enroll-bt" id="notice-enroll-bt" onclick="enrollFormNotice();">등록</button>
							<a data-toggle="modal" data-target="#notice-delete-Modal"><button class="list-delete-bt">삭제</button></a>
						</div>

						<div class="tab-content">
							<div id="home" class="container tab-pane active">
								<br>

								<table id="notice-table" class="table table-bordered">
									<thead>
										<tr>
											<th><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();"></th>
											<th>번호</th>
											<th>제목</th>
											<th>글쓴이</th>
											<th>등록일</th>
											<th>조회수</th>
										</tr>
									</thead>

									<tbody>
										<% if(list.isEmpty()) { %>
											<tr>
												<td colspan="6">조회된 공지사항이 없습니다.</td>
											</tr>
										<% } else { %>
											<% for(Notice n : list) { %>
												<tr>
													<td><input type="checkbox" name="checkRow" value="<%= n.getNoticeNo() %>"></td>
													<td><%= n.getRowNum() %></td>
													<td style="display:none;"><%= n.getNoticeNo() %></td>
													<td><%= n.getNoticeTitle() %></td>
													<td><%= n.getMemberName() %></td>
													<td><%= n.getEnrollDate() %></td>
													<td><%= n.getNoticeReadCnt() %></td>
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
									<button type="button" class="btn btn-search btn-default non-dropmenu">
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
							<button class="page-bt" onclick="location.href='<%= request.getContextPath()%>/notice.b.no';"> &lt;&lt; </button>
							
							<!-- (<) -->
							<% if(currentPage == 1) { %>
								<button class="page-bt" disabled> &lt; </button>
							<% } else { %>
								<button class="page-bt" onclick="location.href='<%= request.getContextPath() %>/notice.b.no?currentPage=<%= currentPage - 1 %>';"> &lt; </button>
							<% } %>
							
							<% for(int p=startPage; p<=endPage; p++) { %>
								<% if(currentPage == p) { %>
									<button class="page-bt" style="background:orange; color:white;" disabled><%= p %></button>
								<% } else { %>
									<button class="page-bt" onclick="location.href='<%= request.getContextPath() %>/notice.b.no?currentPage=<%= p %>';"><%= p %></button>
								<% } %>
							<% } %>
							
							<!-- (>) -->
							<% if(currentPage == maxPage) { %>
								<button class="page-bt" disabled> &gt; </button>
							<% } else { %>
								<button class="page-bt" onclick="location.href='<%= request.getContextPath() %>/notice.b.no?currentPage=<%= currentPage + 1 %>';"> &gt; </button>
							<% } %>
							
							<!-- (>>) -->
							<button class="page-bt" onclick="location.href='<%= request.getContextPath()%>/notice.b.no?currentPage=<%= maxPage %>';"> &gt;&gt; </button>
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


	<!-- notice Delete Modal -->
	<div class="modal fade" id="notice-delete-Modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">공지사항을 삭제하시겠습니까?</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="#" id="selectDelete">삭제</a>
				</div>
			</div>
		</div>
	</div>


	<script>
			                
		function checkAll(){
			if( $("#th_checkAll").is(':checked') ){
			    $("input[name=checkRow]").prop("checked", true);
			}else{
			    $("input[name=checkRow]").prop("checked", false);
			}
		}
							
		$("#notice-table>tbody>tr>td:not(:first-child)").click(function(){
			var nno = $(this).parent().children().eq(2).text();
			location.href="<%= request.getContextPath() %>/detail.b.no?nno=" + nno;
		});
  
			                
		function enrollFormNotice(){
			 location.href="<%= request.getContextPath() %>/enrollForm.b.no";
		}
		
		$("#selectDelete").click(function(){
			
			var arr = new Array();
			
			$('input:checkbox[name=checkRow]:checked').each(function(){
				arr.push($(this).val());
			});
			
			var str = arr.join();
			
			$.ajax({
				url:"chkDelete.b.no",
				type:"get",
				data:{str:str},
				success:function(){
					location.href="notice.b.no";
				},
				error:function(){
					console.log("공지사항 선택 삭제 ajax 통신 오류");
				}
			});
		});
	</script>

</body>
</html>