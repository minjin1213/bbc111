<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  	
  		<%@ include file= "../../../views/branch/common/menubar.jsp" %>
  	
  		<!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">


        <!-- Begin Page Content -->
        <div class="container-fluid">

           <!-- Content Row -->
          <div class="h-bar list-bar">

          <a href="#" class="logout-bt" data-toggle="modal" data-target="#logoutModal">
            <i class="fas fa-sign-out-alt logout-icon">
              log out
            </i>
          </a>
        </div>
        
        <!-- DataTales Example -->
          <div class="container">

            <div class="tab-name">
              <h1>상세 조회</h1>
            </div>
            
            <h5 id="divider-name"><li class="fas fa-fw fa-user-edit"></li>예약 정보</h5>

            <h5 id="info-client">예약자 정보 <hr id="info-client-hr"></h5>

            <!-- 예약자 정보 div -->
            <div>
              <table class="table info-client-table">
                  <tr>
                      <th scope="row">이름</th>
                      <td>임용환</td>
                      <th scope="row">유형</th>
                      <td>비회원</td>
                  </tr>
                  <tr>
                      <th scope="row">연락처</th>
                      <td>010 - 1234 - 5678</td>
                      <th scope="row">이메일</th>
                      <td>asd123@google.com</td>
                  </tr>
                  <tr>
                      <th scope="row">주소</th>
                      <td colspan="3">서울특별시 송파구 삼전동 59-12</td>
                  </tr>
              </table>
            </div>

            <h5 id="info-client">예약 정보 <hr id="info-client-hr"></h5>

            <!-- 예약 정보 div-->
            <div>
                <table class="table info-client-table info-table">
                    <tr>
                        <th>예약 번호</th>
                        <th>대여 기간</th>
                        <th>대여 지점</th>
                        <th>반납 지점</th>
                        <th>차종</th>
                        <th>대여금액 정보</th>
                        <th>총 금액</th>
                    </tr>
                    <tr>
                        <td rowspan="3">1</td>
                        <td>2020.02.05 ~ 2020.02.07</td>
                        <td>강남점</td>
                        <td>강남점</td>
                        <td>아반떼 AD</td>
                        <td>
                           	 대여 금액 : 52.520원<br>
                           	 보험료 : 15,000원 <br>
                           	 쿠폰/이벤트 : -0원
                        </td>
                        <td>67,520원</td>
                    </tr>
                    <tr>
                    	<th>결제 일시</th>
                    	<th>결제 금액</th>
                    	<th colspan="2">결제 방식</th>
                    	<th>환불 여부</th>
                    	<th>환불 일시</th>
                    </tr>
                    <tr>
                    	<td>2018.01.24</td>
                    	<td>52,520원</td>
                    	<td colspan="2">신용카드</td>
                    	<td>진행중</td>
                    	<td>2018.02.04</td>
                    </tr>
                </table>
            </div>

            <button class="bt-style" id="return-detail-view-bt" onclick="returnHandle();">상세 보기</button>
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