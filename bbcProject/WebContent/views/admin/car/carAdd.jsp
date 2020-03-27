<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 	.outer div{
		border: 1px solid black;
	} */
	.enrollBtn{
		border-radius: 5px;
	    outline: 0;
	    border: 0;
	    background-color: orange;
	    color: white;
	    width: 60px;
	    height: 35px;
	    margin-bottom: 0.75rem;
	}
	.deleteBtn{
		border-radius: 5px;
	    outline: 0;
	    border: 0;
	    background-color: rgba(90, 92, 105, 0.5);
	    color: white;
	    width: 60px;
	    height: 35px;
	    margin-bottom: 0.75rem;
	}
	/* ------------------------ */
	div#file-area {
	    float: left;
	    margin-left: 10%;
	    margin-right: 5%;
	    width: 30%;
	    height: 300px;
	    background-color: white;
	    cursor: pointer;
	}
	div#carInfo-area {
	    float: left;
	    width: 55%;
	    height: 390px;
	}
	table#carInfo-table th {
	    float: left;
	    margin-left: 30px;
	}
	tbody td {
	    width: 400px;
	    text-align: left;
	    padding-left: 60px;
	    padding-bottom: 15px;
	}
	div#btn-area button {
	    margin-left: 40px;
	}
	#uploadBtn{
		border-radius: 5px;
	    outline: 0;
	    border: 0;
	    background-color: orange;
	    color: white;
	    width: 80px;
	    height: 35px;
	    margin-bottom: 0.75rem;
	}
	div#upload-area {
	    position: relative;
	    top: 35%;
	}
	div#btn-area {
	    float: left;
	    margin-left: 36%;
	}
	
</style>

</head>
<body>
	<%@ include file="../common/adminBase.jsp" %>
	
	<!-- 차량 등록 시작 -->
	<div class="outer">
		
		<div class="faq-header">
			<h1>차량등록</h1>
		</div>
		<hr id="header-line">
		<br>
		
		<!-- 차량 정보 보내는 form -->
		<form id="insertForm" enctype="multipart/form-data" action="<%=contextPath%>/add.t.ci" method="post">
			<!-- 차량 이미지 등록부분 -->
			<div id="file-area">
				<div id="upload-area">
					<button id="uploadBtn">upload</button>
					<h5>File Upload Click Here</h5>		
				</div>
			</div>
			
			<!-- 차량 정보 입력 부분 -->
			<div id="carInfo-area">
				<table id="carInfo-table">
					<tr>
						<th><li>차종</li></th>
						<td><input type="text" id="car-type" name="car-type" placeholder="내용을 입력해주세요"></td>
					</tr>
					<tr>
						<th><li>차량번호</li></th>
						<td><input type="text" id="car-num" name="car-num" placeholder="내용을 입력해주세요"></td>
					</tr>
					<tr>
						<th><li>연료타입</li></th>
						<td><input type="text" id="fuel" name="fuel" placeholder="내용을 입력해주세요"></td>							
					</tr>
					<tr>
						<th><li>색상</li></th>
						<td><input type="text" id="car-color" name="car-color" placeholder="내용을 입력해주세요"></td>
					</tr>
					<tr>
						<th><li>연식</li></th>
						<td><input type="text" id="year" name="year" placeholder="내용을 입력해주세요"></td>
					</tr>
					<tr>
						<th><li>차량유형</li></th>
						<td>
							<select name="carValue">
								<option>선택하세요</option>
								<option value="경자">경차</option>
								<option value="소형">소형</option>
								<option value="중형">중형</option>
								<option value="준대형">준대형</option>
								<option value="대형">대형</option>
								<option value="승합">승합</option>
								<option value="SUV/RV">SUV/RV</option>
								<option value="전기차">전기차</option>
								<option value="수입차">수입차</option>
							</select>
						</td>
					</tr>
					<tr>
						<th><li>기타옵션</li></th>
						<td>
							<input type="checkbox" id="naviEn" name="naviEn">
							<label for="naviEn">영문 네비게이션</label>
							<input type="checkbox" id="baby" name="baby"> 
							<label for="baby">베이비 시터</label>
						</td>
					</tr>
				</table>
			</div>
			
			<!-- 하단 버튼 영역 -->
			<div id="btn-area">
				<button type="submit" class="enrollBtn">등록</button>
				<button class="deleteBtn">취소</button>
			</div>
		</form>
		
		<!-- 파일이 담길 영역 -->
		<div id="hiddenFileArea">
			<input type="file" name="file" id="file" onchange="loadImg(this, 1);">
		</div>
		
	</div>
	<script>
		$(function(){
			$("#hiddenFileArea").hide();
			
			$("#file-area").click(function(){
				$("#file").click();
			});
		});
		
		function loadImg(inputFile, num){
			if(inputFile.files.length == 1){
				// 파일을 읽어들일 FileReader 객체 생성
				var reader = new FileReader();
				
				// 파일 읽어주는 메소드 실행
				reader.readAsDataURL(inputFile.files[0]);
				
				// 파일 읽기가 다 완료되었을 때 실행할 메소드
				reader.onload = function(e){
					$("#file-area").attr("src", e.target.result);
				}
			}
		}
	</script>

</body>
</html>