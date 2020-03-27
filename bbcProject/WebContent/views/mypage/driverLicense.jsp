<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>운전면허 등록</title>
<style>
.outer{
		width:860px;
		margin-left:auto;
		margin-right:auto;
	}	
	
hr.garo{
		border: 1px solid #757272;
		margin: 17px 0px 0px 0px;
	}	
	
.main-title{
		margin-top: 35px; 
		font-size: 20px;
		font-weight: 900;
	}	
	
<-- upload -->
.uploader {
  display: block;
  clear: both;
  margin: 0 auto;
  float: left;
  width: 20%;
  height:200%;
  margin-top: 10px;
  margin-left: 80px;

}
.uploader label {
  float: left;
  clear: both;
  width: 30%;
  height: 200px;
  margin-top: 50px;
  margin-left: 50px;
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
  padding-top: 30px;
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
  margin: 0 auto .5rem auto;
  max-width: 180px;
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

  input[type="text"],input[type="date"], input[type="checkbox"],select{ 
    color: black; 
    font: 'trebuchet ms',helvetica,sans-serif; 
    background-color: white; 
    border:1px solid; 
    border-color: lightgray; 
    box-size
} 
#right{
   margin-left: 420px;
   margin-top: 68.797px;
}

#chg{
    width: 60px;
    height: 30px;
    margin-left: 10px;
    background-color: white;
}

.chgs{
    height: 25px !important;
    border-radius: 10%;
    text-align: center;
    margin-left: 4px !important;
    padding-right: 10px;
    padding-top: 1px;


#letter{
	font-size:15p;
}

body {font-family: Arial, Helvetica, sans-serif;}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position:flex; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  text-align: center;
  left: 0;
  top: 0;
  width: 40%; /* Full width */
  height: 30%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
  text-align:center;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
</style>

    </head>
    <body>
    
    <!-- 상단 메뉴바 include -->
    <%@ include file="../common/menubar.jsp" %>
	

		<div class="outer"> 
		     <div class="main-title">운전면허 등록</div>
		<hr class="garo"> 
	     
		
	 <form id="file-upload-form" class="uploader" style="margin-top: 25px;">
                <input id="file-upload" type="file" name="fileUpload" accept="image/*" />
              
                <label for="file-upload" id="file-drag" style="margin-top: 0px; margin-bottom: 0px;">
                  <img id="file-image" src="#" alt="Preview" class="hidden">
                  <div id="start">
                    <i class="fa fa-download" aria-hidden="true"></i>
                    <div id="file-upload-btn" class="btn btn-primary" >Select a file</div>
                  </div>
                  <div id="response" class="hidden">
                    <div id="messages"></div>
                    <progress class="progress" id="file-progress" value="0">
                      <span>0</span>%
                    </progress>
                  </div>
                </label>
              </form>
		
		
        <div id="right" style="margin-bottom: 0px; margin-top: 35px;">
       
            <ul style="margin-right:50px;margin-top:20px;margin-bottom: 30px;">
                <li>
                    <form>
                         <label for="type" id="letter" style="width: 20%;">면허 종류: </label>
                            <select id="type" name="type">
                                <option value="선택">선택</option>
                                <option value="1종대형">1종대형</option>
                                <option value="1종보통">1종보통</option>
                                <option value="2종보통">2종보통</option>
                                <option value="2종오토">2종오토</option>
                            </select>
                     </form>
               </li>
                <li style="margin-top:14px;">
                    <form>
                     <span> 
                        <label for="type" id="letter">면허증 번호: </label>
                         <select id="small" name="type">
                                <option value="선택">선택</option>
                                <option value="11">11</option>
                                <option value="22">22</option>
                        </select>
                         </form>
                        <input type="text" id="chg" class="chgs" value="0000" > - <input type="text" id="chg" class="chgs" value="0000"  style="width:60px"> - <input type="text" id="chg" class="chgs" value="0000"  style="width:60px">
                      </span>
                </li>
                <li style="margin-top:14px;">
                        <label for="발급일" id="letter">발급일:</label>
                        <input type="date" style="width: 150px;" class="chgs" name="발급일">
        
                </li>
                    <li style="margin-top:14px;">
                        <label for="만료일" id="letter">만료일:</label>
                        <input type="date" style="width: 150px;" class="chgs" name="만료일">
                </li> 
            </ul>
        </div>
		
		  <h3 style="margin-top:60px;">운전면허정보 등록을 위한 이용자 동의사항</h3>
            <hr>
            <span><input type="checkbox" style="margin-right:5px;" required>고유 식별 정보 수집에 관한 동의(필수)</span>
    				
    			
    
               <div style=" margin-left: 20px; border:1px solid lightgray; width:800px; height:200px; overflow: auto;margin-top:10px; margin-bottom:40px;">
                  1. 수집/이용에 대한 동의<br><br>
                    가. 수집/이용 목적 <br>
                     ① 서비스 가입/변경/해지, AS, 청구서발송, 물품(단말기/경품 등)배송, 본인확인, 개인식별, 가입의사확인, 고지사항전달, 서비스제공관련 안내 , 명의도용방지를 위한 등록된 이동전화로 가입사실통보, 이용요금 상담 할인 청구(개별/통합/합산) 고지 결재 및 추심, 이용관련 문의.불만처리<br>
                     ② 이용요금 및 위탁수수료의 정산, 서비스이용 확인.점검, 위치기반서비스<br>
                     ③ 기타 법령에서 정한 내용<br><br>
                    나. 수집항목<br>
                      여권번호, 운전면허의 면허번호, 외국인등록번호, 주민등록번호, I-Pin번호<br><br>
                    다. 이용 및 보유기간<br>
                    서비스 가입기간(가입일~해지일) 또는 분쟁기간 동안 이용하고 지체없이 파기하며, 요금정산, 요금과오납 등 분쟁대비를 위해 해지후 6개월까지 , 요금의 미/과납이 있어 요금관련 분쟁이 계속될 경우에는 해결시 까지 보유(단, 법령에 특별한 규정이 있는 경우 관련 법령에 따라 보관)<br><br>
                    라. 부정가입 방지 관련<br>
                    부정가입 방지를 위해 고객(대리인 포함)이 제시한 신분증의 진위 여부 및 법정대리인 관계확인에 필요한 성명 , 주민등록번호(외국인은 외국인등록번호, 거소신고번호, 여권번호), 운전면허번호, 그 밖에 신분증 기재사항을 한국정보통신진흥협회, 행정자치부, 법원행정처 등 신분증 발급기관에 제공하여 진위 여부를 확인하는데 동의합니다.<br>
               </div>
         
		

<!-- Trigger/Open The Modal -->
<button id="myBtn" type="submit" style="background: #ffc107; color:white; font-weight:bold; width: 100px; height: 40px; border-radius: 4px; float:right; text-align:center; margin-top: 40px; margin-right: 380px;" onclick="successDL();">등록</button>




</div>

<script>

function successDL(){
		alert("등록되었습니다.");
	}


</script>

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
	      '<strong>' + encodeURI(file.name) + '</strong>'
	    );
	    
	    // var fileType = file.type;
	    // console.log(fileType);
	    var imageName = file.name;

	    var isGood = (/\.(?=gif|jpg|png|jpeg)/gi).test(imageName);
	    if (isGood) {
	      document.getElementById('start').classList.add("hidden");
	      document.getElementById('response').classList.remove("hidden");
	      document.getElementById('notimage').classList.add("hidden");
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

	  function updateFileProgress(e) {
	    var pBar = document.getElementById('file-progress');

	    if (e.lengthComputable) {
	      pBar.value = e.loaded;
	    }
	  }

	  function uploadFile(file) {

	    var xhr = new XMLHttpRequest(),
	      fileInput = document.getElementById('class-roster-file'),
	      pBar = document.getElementById('file-progress'),
	      fileSizeLimit = 1024; // In MB
	    if (xhr.upload) {
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