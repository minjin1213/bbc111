<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
	/* div#carInfo-area {
	    float: left;
	    width: 55%;
	    height: 390px;
	    margin-left: 230px;
	} */
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
	    margin-left: 40%;
    	margin-top: 30px;
	}
	
	/* 파일 업로드 영역 시작 */
	.uploader {
	  display: block;
	  clear: both;
	  margin: 0 auto;
	  float: left;
	  width: 70%;
	  height:200%;
	  margin-top: 10px;
	  margin-left: 80px;
	
	}
	.uploader label {
	  float: left;
	  clear: both;
	  width: 38%;
	  height: 260px;
	  margin-top: 50px;
	  margin-left: 50px;
	  margin-right: 60px;
	  padding: 2rem 1.5rem;
	  text-align: center;
	  background: #fff;
	  border-radius: 7px;
	  border: 3px solid #eee;
	  -webkit-transition: all .2s ease;
	  transition: all .2s ease;
	  -webkit-user-select: none;
	     -moz-user-select: none;
	      -ms-user-select: none;
	          user-select: none;
	}
	.uploader label:hover {
	  border-color: #ffc107;
	}
	.uploader label.hover {
	  border: 3px solid #ffc107;
	  box-shadow: inset 0 0 0 6px #eee;
	}
	.uploader label.hover #start i.fa {
	  -webkit-transform: scale(0.8);
	          transform: scale(0.8);
	  opacity: 0.3;
	}
	.uploader #start {
	  float: left;
	  clear: both;
	  width: 100%;
	  padding-top: 60px;
	}
	.uploader #start.hidden {
	  display: none;
	}
	.uploader #start i.fa {
	  font-size: 50px;
	  margin-bottom: 1rem;
	  -webkit-transition: all .2s ease-in-out;
	  transition: all .2s ease-in-out;
	}
	.uploader #response {
	  float: left;
	  clear: both;
	  width: 100%;
	}
	.uploader #response.hidden {
	  display: none;
	}
	.uploader #response #messages {
	  margin-bottom: .5rem;
	}
	.uploader #file-image {
		display: inline;
	    width: 100%;
	    height: 98%;
	}
	.uploader #file-image.hidden {
	  display: none;
	}
	.uploader #notimage {
	  display: block;
	  float: left;
	  clear: both;
	  width: 100%;
	}
	.uploader #notimage.hidden {
	  display: none;
	}
	
	.uploader .progress[value]::-webkit-progress-bar {
	  border-radius: 4px;
	  background-color: #eee;
	}
	.uploader .progress[value]::-webkit-progress-value {
	  background: -webkit-linear-gradient(left, #ffc107 0%, #ffc107 50%);
	  border-radius: 4px;
	}
	.uploader .progress[value]::-moz-progress-bar {
	  background: linear-gradient(to right, #ffc107 0%, #454cad 50%);
	  border-radius: 4px;
	}
	.uploader input[type="file"] {
	  display: none;
	}
	.uploader div {
	  margin: 0 0 .5rem 0;
	  color: #5f6982;
	}
	.uploader .btn {
	  display: inline-block;
	  margin: .5rem .5rem 1rem .5rem;
	  clear: both;
	  font-family: inherit;
	  font-weight: 700;
	  font-size: 14px;
	  text-decoration: none;
	  text-transform: initial;
	  border: none;
	  border-radius: .2rem;
	  outline: none;
	  padding: 0 1rem;
	  height: 36px;
	  line-height: 36px;
	  color: #fff;
	  -webkit-transition: all 0.2s ease-in-out;
	  transition: all 0.2s ease-in-out;
	  box-sizing: border-box;
	  background: #ffc107;
	  border-color: #ffc107;
	  cursor: pointer;
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
		
		<!-- 차량 이미지 등록부분 -->
		<div class="outer">
			<form  id="file-upload-form"  class="uploader"  style="margin-top:25px;" enctype="multipart/form-data"  action="<%= request.getContextPath() %>/add.t.ci" method="post">
				<!-- <form> -->
	                <input id="file-upload" type="file" name="fileUpload" accept="image/*">
	              
	                <label for="file-upload" id="file-drag" style="margin-top: 0px; margin-bottom: 0px;">
	                <img id="file-image" src="#" alt="Preview" class="hidden">
	                <div id="start">
	                    <i class="fa fa-download" aria-hidden="true"></i>
	                    <div id="file-upload-btn" class="btn btn-primary" >Select a file</div>
	                </div>
	                <div id="response" class="hidden">
	                	<div id="messages"></div>
	                </div>
	                </label> 
	            <!-- </form> -->
	            
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
								<input type="checkbox" id="naviEn" name="naviEn" value="영문 네비게이션"> &nbsp;영문 네비게이션
								&nbsp;&nbsp;&nbsp;
								<input type="checkbox" id="baby" name="baby" value="베이비 시터"> &nbsp;베이비 시터
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
		</div>
		
	</div>
	
	<script type="text/javascript" >
		function ekUpload(){
			  function Init() {
		
			    console.log("Upload Initialised");
		
			    var fileSelect    = document.getElementById('file-upload'),
			        fileDrag      = document.getElementById('file-drag'),
			        submitButton  = document.getElementById('submit-button');
		
			    fileSelect.addEventListener('change', fileSelectHandler, false);
		
			    // Is XHR2 available?
			    var xhr = new XMLHttpRequest();
			    if (xhr.upload) {
			      // File Drop
			      fileDrag.addEventListener('dragover', fileDragHover, false);
			      fileDrag.addEventListener('dragleave', fileDragHover, false);
			      fileDrag.addEventListener('drop', fileSelectHandler, false);
			    }
			  }
		
			  function fileDragHover(e) {
			    var fileDrag = document.getElementById('file-drag');
		
			    e.stopPropagation();
			    e.preventDefault();
		
			    fileDrag.className = (e.type === 'dragover' ? 'hover' : 'modal-body file-upload');
			  }
		
			  function fileSelectHandler(e) {
			    // Fetch FileList object
			    var files = e.target.files || e.dataTransfer.files;
		
			    // Cancel event and hover styling
			    fileDragHover(e);
		
			    // Process all File objects
			    for (var i = 0, f; f = files[i]; i++) {
			      parseFile(f);
			      uploadFile(f);
			    }
			  }
		
			  // Output
			  function output(msg) {
			    // Response
			    var m = document.getElementById('messages');
			    m.innerHTML = msg;
			  }
		
			  function parseFile(file) {
		
			    console.log(file.name);
			    output(
			      '<strong style="font-size:10px;">' + file.name + '</strong>'
			    );
			    
			    // var fileType = file.type;
			    // console.log(fileType);
			    var imageName = file.name;
		
			    var isGood = (/\.(?=gif|jpg|png|jpeg)/gi).test(imageName);
			    if (isGood) {
			      document.getElementById('start').classList.add("hidden");
			      document.getElementById('response').classList.remove("hidden");
		
			      // Thumbnail Preview
			      document.getElementById('file-image').classList.remove("hidden");
			      document.getElementById('file-image').src = URL.createObjectURL(file);
			    }
			    else {
			      document.getElementById('file-image').classList.add("hidden");
			      document.getElementById('notimage').classList.remove("hidden");
			      document.getElementById('start').classList.remove("hidden");
			      document.getElementById('response').classList.add("hidden");
			      document.getElementById("file-upload-form").reset();
			    }
			  }
		
			  function setProgressMaxValue(e) {
			    var pBar = document.getElementById('file-progress');
		
			    if (e.lengthComputable) {
			      pBar.max = e.total;
			    }
			  }
		
			
		
			  function uploadFile(file) {
		
			    var xhr = new XMLHttpRequest();
			      fileInput = document.getElementById('file-upload'),
			      pBar = document.getElementById('file-progress'),
			      fileSizeLimit = 1024; // In MB
			    if (xhr.fileInput) {
			      // Check if file is less than x MB
			      if (file.size <= fileSizeLimit * 1024 * 1024) {
			        // Progress bar
			        pBar.style.display = 'inline';
			        xhr.upload.addEventListener('loadstart', setProgressMaxValue, false);
			        xhr.upload.addEventListener('progress', updateFileProgress, false);
		
			        // File received / failed
			        xhr.onreadystatechange = function(e) {
			          if (xhr.readyState == 4) {
			            // Everything is good!
		
			            // progress.className = (xhr.status == 200 ? "success" : "failure");
			            // document.location.reload(true);
			          }
			        };
		
			        // Start upload
			        xhr.open('POST', document.getElementById('file-upload-form').action, true);
			        xhr.setRequestHeader('X-File-Name', file.name);
			        xhr.setRequestHeader('X-File-Size', file.size);
			        xhr.setRequestHeader('Content-Type', 'multipart/form-data');
			        xhr.send(file);
			      } else {
			        output('Please upload a smaller file (< ' + fileSizeLimit + ' MB).');
			      }
			    }
			  }
		
			  // Check for the various File API support.
			  if (window.File && window.FileList && window.FileReader) {
			    Init();
			  } else {
			    document.getElementById('file-drag').style.display = 'none';
			  }
			}
		
			  ekUpload();

	</script>

</body>
</html>