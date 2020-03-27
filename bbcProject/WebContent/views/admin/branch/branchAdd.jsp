<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#info-table{
		margin-left: 8rem;
		text-align: left;
	}
	#info-table th{
		height: 50px;
		width: 120px;	
	}
	#info-content {
	    margin-left: 9.5rem;
	    width: 50%;
	    height: 22%;
	    resize: none;
	    border-radius: 10px;
	    display: flex;
	}
	#infomation-area{
		display: flex;
	    resize: none;
	    margin-left: 9.5rem;
	    margin-top: 3px;
	    width: 36%;
	    height: 30%;
	    border-radius: 10px;
	}
	button#infoBtn {
	    margin-top: 24px;
	    margin-left: 23%;
	    position: relative;
	    display: flex;
	    border-radius: 5px;
	    outline: 0;
	    border: 0;
	    background-color: orange;
	    color: white;
	    width: 80px;
	    height: 35px;
	    justify-content: center;
	}
	#addressBtn{
		border-radius: 5px;
	    outline: 0;
	    border: 0;
	    background-color: rgb(64, 64, 64);
	    color: white;
	    width: 100px;
	    height: 35px;
	    margin-bottom: 0.75rem;
	}
	textarea#transport {
	    resize: none;
	    border-radius: 10px;
	    width: 610px;
	    margin-left: 20px;
	    height: 250px;
	}
	input#sample5_address {
	    width: 410px;
	}

</style>

</head>
<body>
	<%@ include file="../common/adminBase.jsp" %>
	
	<!-- 지점등록 상세 정보 페이지 시작 -->
	<div class="outer">
		
		<div class="faq-header">
			<h1>지점등록</h1>
		</div>
		<hr id="header-line">
		<form action="<%=contextPath%>/insert.t.br" method="get">
			<table id="info-table">
				<thead>
				<input type="hidden" id="loginUser" name="loginUser" value="1">
					<tr>
						<th><li>지역</li></th>
						<td>
							<select id="local" name="local">
								<option value="서울">서울</option>
								<option value="인천/경기/강원">인천/경기/강원</option>
								<option value="대전/충청/세종">대전/충정/세종</option>
								<option value="광주/전라">광주/전라</option>
								<option value="대구/부산/울산/경상">대구/부산/울산/경상</option>
							</select>
						</td>
						<th><li>지점</li></th>
						<td><input type="text" id="localSmall" name="localSmall"></td>
						<th><li>지도</li></th>
					</tr>			
				</thead>
				<tbody>
					<tr>
					
						<th id="address-th"><li>주소</li></th>
						<td colspan="3">
							<input type="text" id="sample5_address" name="address" placeholder="주소">
							<input type="button" id="addressArea" onclick="sample5_execDaumPostcode()" value="주소 검색">
						</td>
						<td colspan="3" rowspan="8">
							<div id="map" style="width:500px;height:500px;margin-top:10px;"></div>
						</td>
						<!-- 지도 x, y값 -->
						<input type="hidden" id="mapX" name="mapX" value="">
						<input type="hidden" id="mapY" name="mapY" value="">
					</tr>
					<tr>
						<th><li>전화번호</li></th>
						<td><input type="text" id="tellNo" name="tellNo"></td>
					</tr>
					<tr>
						<th><li>영업시간</li></th>
						<td><input type="text" id="office-hours" name="office-hours">
					</tr>
					<tr>
						<th><li>교통안내</li></th>
					</tr>
					<tr>
						<td colspan="4">
							<textarea id="transport" name="transport" placeholder="교통안내 작성"></textarea>					
						</td>
					</tr>
				</tbody>
			</table>
						
			<button type="submit" id="infoBtn">등록하기</button>
		</form>
		<!-- 지도 API 연결 부분 -->
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9d483cae05a686fa35a6aaef87d12240&libraries=services"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	        mapOption = {
	            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	            level: 5 // 지도의 확대 레벨
	        };
	
		    //지도를 미리 생성
		    var map = new daum.maps.Map(mapContainer, mapOption);
		    //주소-좌표 변환 객체를 생성
		    var geocoder = new daum.maps.services.Geocoder();
		    //마커를 미리 생성
		    var marker = new daum.maps.Marker({
		        position: new daum.maps.LatLng(37.537187, 127.005476),
		        map: map
		    });
		
		
		    function sample5_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                var addr = data.address; // 최종 주소 변수
		
		                // 주소 정보를 해당 필드에 넣는다.
		                document.getElementById("sample5_address").value = addr;
		                // 주소로 상세 정보를 검색
		                geocoder.addressSearch(data.address, function(results, status) {
		                    // 정상적으로 검색이 완료됐으면
		                    if (status === daum.maps.services.Status.OK) {
		
		                        var result = results[0]; //첫번째 결과의 값을 활용
		
		                        // 해당 주소에 대한 좌표를 받아서
		                        var coords = new daum.maps.LatLng(result.y, result.x);
		                        
		                        // 지도를 보여준다.
		                        mapContainer.style.display = "block";
		                        map.relayout();
		                        
		                        // 지도 중심을 변경한다.
		                        map.setCenter(coords);
		                        
		                        // 마커를 결과값으로 받은 위치로 옮긴다.
		                        marker.setPosition(coords);
		                        
		                        // 값을 받아줄 input hidden에 값 넣어주기
		                        $("#mapX").val(result.x);	// 127.005476
		                        $("#mapY").val(result.y);	// 37.537187
		                        
		                    }
		                });
		            }
		        }).open();
		    }
		    
		    $("#sample5_address").click(function(){
				$("#addressArea").click();
			});
		    
		   
		</script>		
		
	</div>
</body>
</html>