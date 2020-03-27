<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.bbc.notice.model.vo.Notice"%>
<%
	Notice n = (Notice)request.getAttribute("nList");
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
							<h1>공지사항</h1>
						</div>

						<hr class="tab-divider">

						<div>
							<h5 id="info-client">
								공지사항 수정
								<hr id="notice-hr">
							</h5>
						</div>

						<!-- 공지사항 수정 form -->

						<form enctype="multipart/form-data" action="<%= request.getContextPath() %>/update.b.no" method="post">
							<input type="hidden" name="nno" value="<%= n.getNoticeNo() %>">
							<p id="checkNotice">
								<input type="checkbox" name="showNotice" id="showNotice" value=1> 중요 공지사항
							</p>
							<div>
								<table class="notice-table">
									<tr>
										<th>
											<ul style="width:10rem">
												<li>제목</li>
											</ul>
										</th>
										<td><input type="text" id="title" name="title" value="<%= n.getNoticeTitle() %>"></td>
									</tr>
									<tr>
										<th>
											<ul>
												<li>파일 첨부</li>
											</ul>
										</th>
										<td>
											<img id="contentImg1" style="width:100px; height:100px;">
											<input type="file" id="upfile1" name="upfile1" onchange="loadImg(this, 1);">
											<img id="contentImg2" style="width:100px; height:100px;">
											<input type="file" id="upfile2" name="upfile2" onchange="loadImg(this, 2);">
											<img id="contentImg3" style="width:100px; height:100px;">
											<input type="file" id="upfile3" name="upfile3" onchange="loadImg(this, 3);">
										</td>
									</tr>
									<tr>
										<th>
											<ul>
												<li>내용</li>
											</ul>
										</th>
										<td><textarea class="notice-content" id="content" name="content"><%= n.getNoticeContent() %></textarea></td>
									</tr>
								</table>
							</div>

							<button type="submit" class="bt-style" id="notice-modify-bt">수정하기</button>
						</form>



					</div>

				</div>
				<!-- End of Main Content -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

	</div>
	
	<script>
		$(function(){
			
			$("#upfile1").hide();
			$("#upfile2").hide();
			$("#upfile3").hide();
			
			$("#contentImg1").click(function(){
				$("#upfile1").click();
			});
			
			$("#contentImg2").click(function(){
				$("#upfile2").click();
			});
			
			$("#contentImg3").click(function(){
				$("#upfile3").click();
			});
		});
		
		function loadImg(inputFile, num){
			// inputFile : 현재 변화가 발생한 input 요소

			// console.log(inputFile.files);
		
			if(inputFile.files.length == 1) {
				
				var reader = new FileReader();
				
				reader.readAsDataURL(inputFile.files[0]);
				
				reader.onload = function(e){
					
			switch(num) {
					case 1:$("#contentImg1").attr("src", e.target.result); break;
					case 2:$("#contentImg2").attr("src", e.target.result); break;
					case 3:$("#contentImg3").attr("src", e.target.result); break;
					}
				}
			}
		};
		
	</script>


</body>
</html>