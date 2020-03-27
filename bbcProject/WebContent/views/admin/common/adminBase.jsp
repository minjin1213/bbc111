<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbc.userInfo.model.vo.UserInfo" %>
<%
	String contextPath = request.getContextPath();

	UserInfo loginUser = (UserInfo)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Admin Main Page</title>

  <!-- Custom fonts for this template-->
  <link href="<%=request.getContextPath() %>/resources/css/admin/faq//vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="<%=request.getContextPath() %>/resources/css/admin/faq/sb-admin-2.css" rel="stylesheet">
  
  <script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/faqJs/js/jquery-1.10.2.min.js"></script>
  <script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/faqJs/bootstrap/js/bootstrap.min.js"></script>
  <style>
	.faq-header>h1 {
	    float: left;
	    margin-left: 6rem;
	}	
	#header-line{
		margin-top: 5.5rem;
		width: 70%;
	    margin-left: 5.5rem;
	}
	
	/* Modal 공통 속성 */
	.modal-dialog {
	    max-width: 700px !important;
        margin: 17rem 37rem !important;
        width: 580px !important;
	}
	.modal-content{height: 440px !important;}
  </style>

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Home -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=contextPath%>/views/admin/common/admin.jsp">
        <div class="sidebar-brand-text mx-3">
          BBC
          <i class="fa fa-home fa-fw home-icon"></i>
        </div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        
          <i class="nav-link fa fa-user fa-5x"></i>
          <p class="m-name">통합 관리자</p>
        
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Nav Item - 고객센터 Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fa fa-book fa-fw"></i>
          <span>고객센터</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar" aria-exppanded="true">
          <div class="py-2 collapse-inner rounded">
            <a class="collapse-item" id="faq" onclick="faqList();">FAQ</a>
            <a class="collapse-item" id="notice" onclick="userNoticeList();">공지사항</a>
            <a class="collapse-item" id="qa" onclick="InquiryList();">문의내역</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - 지점 관리 Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-users"></i>
          <span>지점 관리</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="py-2 collapse-inner rounded">
            <a class="collapse-item" onclick="userNoticeList();">공지사항</a>
            <a class="collapse-item" onclick="branchList();">지점등록</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - 회원 관리 Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseCar" aria-expanded="true" aria-controls="collapseCar">
          <i class="fas fa-fw fa-users"></i>
          <span>회원 관리</span>
        </a>
        <div id="collapseCar" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="py-2 collapse-inner rounded">
            <a class="collapse-item" onclick="couponList();">쿠폰등록</a>
            <a class="collapse-item" onclick="memberList();">회원조회</a>
            <a class="collapse-item" onclick="blackList();">회원정지</a>
          </div>
        </div>
      </li>
      
      <!-- Nav Item - 차량 관리 Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#test" aria-expanded="true" aria-controls="test">
          <i class="fas fa-fw fa-car"></i>
          <span>차량 관리</span>
        </a>
        <div id="test" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="py-2 collapse-inner rounded">
            <a class="collapse-item" onclick="carAdd();">차량등록</a>
            <a class="collapse-item" href="<%=contextPath%>/views/admin/car/priceInfo.jsp">금액정보</a>
          </div>
        </div>
      </li>

    </ul>
    <!-- End of Sidebar -->
    
    <!-- 페이지 이동 script -->
    <script>
    	function faqList(){
    		location.href = "<%=contextPath%>/list.t.fa";
    	}
    	
    	function userNoticeList(){
    		location.href = "<%=contextPath%>/uList.t.no";
    	}
    	
    	function InquiryList(){
    		location.href = "<%=contextPath%>/list.t.mi";
    	}
    
    	function branchList(){
    		location.href = "<%=contextPath%>/list.t.br";
    	}
    	
    	function couponList(){
    		location.href = "<%=contextPath%>/list.t.co";
    	}
    	
    	function memberList(){
    		location.href = "<%=contextPath%>/list.t.ui";
    	}
    	
    	function blackList(){
    		location.href = "<%=contextPath%>/blackList.t.ui";
    	}
    	
    	function carAdd(){
    		location.href = "<%=contextPath%>/carAdd.t.ci";
    	}
    </script>


    
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

    <!-- Content Row -->
          <div class="h-bar">

          <a href="#" class="logout-bt">
            <i class="fas fa-sign-out-alt logout-icon">
              log out
            </i>
          </a>
    
    
    
    
    
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Bootstrap core JavaScript-->
  <script src="<%=request.getContextPath() %>/resources/css/admin/vendor/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath() %>/resources/css/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="<%=request.getContextPath() %>/resources/css/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="<%=request.getContextPath() %>/resources/js/admin/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="<%=request.getContextPath() %>/resources/css/admin/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="<%=request.getContextPath() %>/resources/js/admin/demo/chart-area-demo.js"></script>
  <script src="<%=request.getContextPath() %>/resources/js/admin/demo/chart-pie-demo.js"></script>

</body>

</html>