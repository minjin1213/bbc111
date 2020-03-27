<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="<%= request.getContextPath() %>/resources/vendor/chart.js/Chart.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/demo/chart-area-demo.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/demo/chart-pie-demo.js"></script>
<link href="<%= request.getContextPath() %>/resources/css/sb-admin-2.css" rel="stylesheet">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<%@ include file="menubar.jsp"%>

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

						<!-- Pending Requests Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="h-100 py-2">
								<div class="row no-gutters align-items-center">
									<div class="col-auto"></div>
								</div>
							</div>
						</div>

					</div>
				</div>



				<!-- Content Row -->

				<div class="row">

					<!-- Area Table -->
					<div class="col-xl-8 col-lg-7">
						<nav>
							<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
								<a class="nav-item nav-link active" id="nav-home-tab"
									data-toggle="tab" href="#nav-home" role="tab"
									aria-controls="nav-home" aria-selected="true">회원 공지사항
								</a>
								<a class="nav-item nav-link" id="nav-profile-tab"
									data-toggle="tab" href="#nav-profile" role="tab"
									aria-controls="nav-profile" aria-selected="false">지점 공지사항
								</a>
							</div>
						</nav>
						<div class="card shadow mb-4" id="main-notice-body">
							<!-- Card Header -->
							<div>
								<div class="col-md-12">

									<div class="tab-content" id="nav-tabContent">
										<div class="tab-pane fade show active" id="nav-home"
											role="tabpanel" aria-labelledby="nav-home-tab">
											<table class="table">
												<thead>
													<tr>
														<th>No</th>
														<th>제목</th>
														<th>글쓴이</th>
														<th>작성 일자</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>1</td>
														<td>Integration Specialist</td>
														<td>New York</td>
														<td>2012/12/02</td>
													</tr>
													<tr>
														<td>2</td>
														<td>Sales Assistant</td>
														<td>San Francisco</td>
														<td>2012/08/06</td>
													</tr>
													<tr>
														<td>3</td>
														<td>Integration Specialist</td>
														<td>Tokyo</td>
														<td>2010/10/14</td>
													</tr>
													<tr>
														<td>4</td>
														<td>Javascript Developer</td>
														<td>San Francisco</td>
														<td>2009/09/15</td>
													</tr>
													<tr>
														<td>5</td>
														<td>Software Engineer</td>
														<td>Edinburgh</td>
														<td>2008/12/13</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="tab-pane fade" id="nav-profile" role="tabpanel"
											aria-labelledby="nav-profile-tab">
											<table class="table" cellspacing="0">
												<thead>
													<tr>
														<th>No</th>
														<th>제목</th>
														<th>글쓴이</th>
														<th>작성 일자</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>1</td>
														<td>System Architect</td>
														<td>Edinburgh</td>
														<td>2011/04/25</td>
													</tr>
													<tr>
														<td>2</td>
														<td>Accountant</td>
														<td>Tokyo</td>
														<td>2011/07/25</td>
													</tr>
													<tr>
														<td>3</td>
														<td>Junior Technical Author</td>
														<td>San Francisco</td>
														<td>2009/01/12</td>
													</tr>
													<tr>
														<td>4</td>
														<td>Senior Javascript Developer</td>
														<td>Edinburgh</td>
														<td>2012/03/29</td>
													</tr>
													<tr>
														<td>5</td>
														<td>Accountant</td>
														<td>Tokyo</td>
														<td>2008/11/28</td>
													</tr>
												</tbody>
											</table>
										</div>


										<div class="main-pagination">
											<a href="#"> &lt;&lt; </a>
											<a href="#"> &lt; </a>
											<a href="#"> &gt; </a>
											<a href="#"> &gt;&gt; </a>
										</div>
									</div>
								</div>
							</div>

						</div>

					</div>

					<!-- Pie Chart -->
					<div class="col-xl-4 col-lg-5">
						<div class="card shadow mb-4">
							<!-- Card Header-->
							<div
								class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
								<h6 class="m-0 font-weight-bold">이번 달 예약 건수</h6>
							</div>
							<!-- Card Body -->
							<div class="card-body">
								<div class="chart-pie pt-4 pb-2">
									<canvas id="myPieChart"></canvas>
								</div>
								<div class="mt-4 text-center small">
									<span class="mr-2 pie-name">
										<i class="fas fa-circle" id="pie-reservation"></i> Reservation
									</span>
									<span class="mr-2 pie-name">
										<i class="fas fa-circle" id="pie-none"></i> None
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Bar Chart -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold" style="color: black;">월 별 실적 현황</h6>
					</div>
					<div class="card-body">
						<div class="chart-area">
							<canvas id="myAreaChart"></canvas>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- End of Content Wrapper -->

	</div>
	
	<script>
		var ctx = document.getElementById("myPieChart");
		var myPieChart = new Chart(ctx, {
		  type: 'doughnut',
		  data: {
		    labels: ["Reservation", "Referral", "None"],
		    datasets: [{
		      data: [55, 0, 45],
		      backgroundColor: ['orange', '#1cc88a', 'gray'],
		      hoverBackgroundColor: ['orange', '#17a673', 'gray'],
		      hoverBorderColor: "rgba(234, 236, 244, 1)",
		    }],
		  },
		  options: {
		    maintainAspectRatio: false,
		    tooltips: {
		      backgroundColor: "rgb(255,255,255)",
		      bodyFontColor: "#858796",
		      borderColor: '#dddfeb',
		      borderWidth: 1,
		      xPadding: 15,
		      yPadding: 15,
		      displayColors: false,
		      caretPadding: 10,
		    },
		    legend: {
		      display: false
		    },
		    cutoutPercentage: 80,
		  },
		});
		
		function number_format(number, decimals, dec_point, thousands_sep) {
			  // *     example: number_format(1234.56, 2, ',', ' ');
			  // *     return: '1 234,56'
			  number = (number + '').replace(',', '').replace(' ', '');
			  var n = !isFinite(+number) ? 0 : +number,
			    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
			    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
			    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
			    s = '',
			    toFixedFix = function(n, prec) {
			      var k = Math.pow(10, prec);
			      return '' + Math.round(n * k) / k;
			    };
			  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
			  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
			  if (s[0].length > 3) {
			    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
			  }
			  if ((s[1] || '').length < prec) {
			    s[1] = s[1] || '';
			    s[1] += new Array(prec - s[1].length + 1).join('0');
			  }
			  return s.join(dec);
			}

			// Area Chart Example
			var ctx = document.getElementById("myAreaChart");
			var myLineChart = new Chart(ctx, {
			  type: 'line',
			  data: {
			    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
			    datasets: [{
			      label: "Earnings",
			      lineTension: 0.3,
			      backgroundColor: "transparent",
			      borderColor: "orange",
			      pointRadius: 3,
			      pointBackgroundColor: "orange",
			      pointBorderColor: "orange",
			      pointHoverRadius: 3,
			      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
			      pointHoverBorderColor: "black",
			      pointHitRadius: 10,
			      pointBorderWidth: 2,
			      data: [0, 10000, 5000, 15000, 10000, 20000, 15000, 25000, 20000, 30000, 25000, 40000],
			    }],
			  },
			  options: {
			    maintainAspectRatio: false,
			    layout: {
			      padding: {
			        left: 10,
			        right: 25,
			        top: 25,
			        bottom: 0
			      }
			    },
			    scales: {
			      xAxes: [{
			        time: {
			          unit: 'date'
			        },
			        gridLines: {
			          display: false,
			          drawBorder: false
			        },
			        ticks: {
			          maxTicksLimit: 7
			        }
			      }],
			      yAxes: [{
			        ticks: {
			          maxTicksLimit: 5,
			          padding: 10,
			          // Include a dollar sign in the ticks
			          callback: function(value, index, values) {
			            return '$' + number_format(value);
			          }
			        },
			        gridLines: {
			          color: "black",
			          zeroLineColor: "black",
			          drawBorder: false,
			          borderDash: [2],
			          zeroLineBorderDash: [2]
			        }
			      }],
			    },
			    legend: {
			      display: false
			    },
			    tooltips: {
			      backgroundColor: "rgb(255,255,255)",
			      bodyFontColor: "#858796",
			      titleMarginBottom: 10,
			      titleFontColor: '#6e707e',
			      titleFontSize: 14,
			      borderColor: '#dddfeb',
			      borderWidth: 1,
			      xPadding: 15,
			      yPadding: 15,
			      displayColors: false,
			      intersect: false,
			      mode: 'index',
			      caretPadding: 10,
			      callbacks: {
			        label: function(tooltipItem, chart) {
			          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
			          return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
			        }
			      }
			    }
			  }
			});

	</script>

</body>
</html>