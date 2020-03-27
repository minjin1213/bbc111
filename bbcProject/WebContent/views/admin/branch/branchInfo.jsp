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
		width: 150px;	
	}
	#inof-content {
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
	    width: 50%;
	    height: 30%;
	    border-radius: 10px;
	}
	button#infoBtn {
	    margin-top: 24px;
	    margin-left: 32%;
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
		<br>
		
		<table id="info-table">
			<tr>
				<th><li>지역</li></th>
				<td>서울</td>
			</tr>
			<tr>
				<th><li>지점</li></th>
				<td>강남점</td>
			</tr>
			<tr>
				<th><li>주소</li></th>
				<td>서울시 강남구 테헤란로 16길 4 남도빌딩</td>
			</tr>
			<tr>
				<th><li>전화번호</li></th>
				<td>02-123-4567</td>
			</tr>
			<tr>
				<th><li>영업시간</li></th>
				<td>평일 00:00~24:00 / 주말(휴일) 00:00~24:00
			</tr>
			<tr>
				<th><li>교통안내</li></th>
				<td>
				지하철 이용시 : 지하철 2호선 삼성역 8번 출구에서 "도보 5분" <br>
				버스 이용시 : 340번 버스 삼성역 정류장에서 하차 후 "도부 10분" <br>
				승용차 이용시 : 삼성역 남도빌딩 지하주차장 검색 후 이용
				</td>
			</tr>
			<tr><th>지도</th></tr>
		</table>
		
		
		<br>
		
		<textarea id="infomation-area" placeholder="지도영역"></textarea>
		
		<button type="button" id="infoBtn" onclick="goBranchView();">등록하기</button>
	</div>
	<script>
		function goBranchView(){
			alert("등록이 완료되었습니다.");
			location.href="branchView.jsp";
		}
	</script>
</body>
</html>