<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.table{margin-left: 3rem;}
	#searchBtn {
	    color: white;
	    background-color: orange;
	    margin-left: 1rem;
	    width: 65px;
	}
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
	.btnList {
	    text-align: end;
	    margin-left: 6.5rem;
	    width: 1110px;
	}
	
	/* 민진 한테 받은 search 스타일 부분 */
	.navbar-form {
	  margin-top: 2rem;
	  margin-left: 20rem;
	  margin-right: 13rem;
	}
	.navbar-search .dropdown-menu { min-width: 10px;}
	#searching {
	  color: white;
	  background-color: orange;
	  margin-left: 1rem;
	}
	.pagination {
	  display: flex;
	  padding-left: 0;
	  list-style: none;
	  border-radius: 0.35rem;
	  margin-left: 24rem;
	  margin-bottom: 5rem;
	}
	button.btn.btn-search.dropdown-toggle {
	    background: transparent;
	    color: black;
	}
	.btn-toolbar .input-group {
	  width: auto;
	}
	.input-group {
	  position: relative;
	  display: flex;
	  flex-wrap: wrap;
	  align-items: stretch;
	  width: 100%;
	  margin-bottom: 3rem;
	}	
	.dropdown-menu {
	  position: absolute;
	  top: 100%;
	  left: 0;
	  z-index: 1000;
	  display: none;
	  float: left;
	  min-width: 10rem;
	  padding: 0.5rem 0;
	  margin: 0.125rem 0 0;
	  font-size: 0.85rem;
	  color: #858796;
	  text-align: left;
	  list-style: none;
	  background-color: #fff;
	  background-clip: padding-box;
	  border: 1px solid #e3e6f0;
	  border-radius: 0.35rem;
	}
	.dropleft .dropdown-menu {
	  top: 0;
	  right: 100%;
	  left: auto;
	  margin-top: 0;
	  margin-right: 0.125rem;
	}
	.dropup .dropdown-menu {
	  top: auto;
	  bottom: 100%;
	  margin-top: 0;
	  margin-bottom: 0.125rem;
	}
	.dropright .dropdown-menu {
	  top: 0;
	  right: auto;
	  left: 100%;
	  margin-top: 0;
	  margin-left: 0.125rem;
	}
	.dropright .dropdown-toggle::after {
	  display: inline-block;
	  margin-left: 0.255em;
	  vertical-align: 0.255em;
	  content: "";
	  border-top: 0.3em solid transparent;
	  border-right: 0;
	  border-bottom: 0.3em solid transparent;
	  border-left: 0.3em solid;
	}
	.dropright .dropdown-toggle:empty::after {
	  margin-left: 0;
	}
	.dropright .dropdown-toggle::after {
	  vertical-align: 0;
	}
	
	/* 모달 스타일 */
	button.faqAdd {
	    position: relative;
	    left: 20%;
	}
	.faq-dialog {
	    max-width: 500px;
	    margin: 1.75rem auto;
	}
	#q-content, #q-title{resize: none}
	textarea#q-title {
	    width: 500px;
	    height: 40px;
	    border-radius: 10px;
	}
	textarea#q-content{
		width: 500px;
		height: 200px;
		border-radius: 10px;
	}
	.modal-footer {display: table-cell !important;}
	div#noticeHeader {
	    text-align: left;
	    margin: 0 0 20px 20px;
	}
	#noticeHeader>h5{font-weight:bold;}
	
	
	button.completeBtn {
	    position: relative;
	    border-radius: 5px;
	    outline: 0;
	    border: 0;
	    background-color: orange;
	    color: white;
	    width: 80px;
	    height: 35px;
	    margin-bottom: 0.75rem;
	}
	button.cancelBtn{
		border-radius: 5px;
	    outline: 0;
	    border: 0;
	    background-color: rgba(90, 92, 105, 0.5);
	    color: white;
	    width: 60px;
	    height: 35px;
	  	
</style>

</head>
<body>
	<%@ include file="../common/adminBase.jsp" %>
	
	<!-- 공지사항 시작 -->
	<div class="outer">
		
		<div class="faq-header">
			<h1>공지사항</h1>
		</div>
		<hr id="header-line">
		<br>

	   	<!-- 등록하기 모달 팝업 부분 -->
		<!-- Button trigger modal -->
		<div class="btnList">
			<button class="enrollBtn" data-toggle="modal" data-target="#myModal">등록</button>
			<button class="deleteBtn">삭제</button>
		</div>
		 
		<!-- 등록하기 Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      
		      <div class="modal-body">
		      	<br>
				<div id="noticeHeader"><h5>공지사항 작성</h5></div>		      	
		      	<table>
		      		<tr>
		      			<th style="width:100px;">제목</th>
		      			<td><textarea id="q-title" name="q-title"></textarea>
		      		</tr>
		      		<tr>
		      			<td><br></td>
		      		</tr>
		      		<tr>
		      			<td>내용</td>
		      			<td><textarea id="q-content" name="q-content"></textarea></td>
		      		</tr>
		      	</table>
		      </div>
		      
		      <div style="display:none;"></div>
		      
		      <div class="modal-footer">
		        <button type="button" class="completeBtn" onclick="complete();">등록하기</button>
		        <button type="button" class="cancelBtn" data-dismiss="modal">취소</button>
		      </div>
		      
		      
		    </div>
		  </div>
		</div>
		
		
        <div class="tab-content">
          <div id="home" class="container tab-pane active"><br>
            
            <table id="notice-table" class="table table-bordered" width="100%" cellspacing="0">
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
                <tr onclick="goNoticeView();">
                    <td><input type="checkbox" name="checkRow" value="${content.IDX}"></td>
                    <td>01</td>
                    <td>System Architect</td>
                    <td>관리자</td>
                    <td>2020/02/25</td>
                    <td>1,761</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="checkRow" value="${content.IDX}"></td>
                    <td>02</td>
                    <td>Accountant</td>
                    <td>관리자</td>
                    <td>2019/12/25</td>
                    <td>1,863</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="checkRow" value="${content.IDX}"></td>
                    <td>03</td>
                    <td>Junior Technical Author</td>
                    <td>관리자</td>
                    <td>2019/09/12</td>
                    <td>1,566</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="checkRow" value="${content.IDX}"></td>
                    <td>04</td>
                    <td>Senior Javascript Developer</td>
                    <td>관리자</td>
                    <td>2019/07/29</td>
                    <td>1,022</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="checkRow" value="${content.IDX}"></td>
                    <td>05</td>
                    <td>Accountant</td>
                    <td>관리자</td>
                    <td>2019/05/28</td>
                    <td>1,033</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="checkRow" value="${content.IDX}"></td>
                    <td>06</td>
                    <td>Integration Specialist</td>
                    <td>관리자</td>
                    <td>2019/03/02</td>
                    <td>961</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="checkRow" value="${content.IDX}"></td>
                    <td>07</td>
                    <td>Sales Assistant</td>
                    <td>관리자</td>
                    <td>2019/01/01</td>
                    <td>959</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="checkRow" value="${content.IDX}"></td>
                    <td>08</td>
                    <td>Integration Specialist</td>
                    <td>관리자</td>
                    <td>2018/12/25</td>
                    <td>1,055</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="checkRow" value="${content.IDX}"></td>
                    <td>09</td>
                    <td>Javascript Developer</td>
                    <td>관리자</td>
                    <td>2018/09/15</td>
                    <td>1,039</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="checkRow" value="${content.IDX}"></td>
                    <td>10</td>
                    <td>Software Engineer</td>
                    <td>관리자</td>
                    <td>2018/07/13</td>
                    <td>923</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="checkRow" value="${content.IDX}"></td>
                    <td>11</td>
                    <td>Office Manager</td>
                    <td>관리자</td>
                    <td>2018/05/19</td>
                    <td>1,023</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="checkRow" value="${content.IDX}"></td>
                    <td>12</td>
                    <td>Support Lead</td>
                    <td>관리자</td>
                    <td>2018/03/03</td>
                    <td>936</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="checkRow" value="${content.IDX}"></td>
                    <td>13</td>
                    <td>Regional Director</td>
                    <td>관리자</td>
                    <td>2018/01/01</td>
                    <td>1,526</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="checkRow" value="${content.IDX}"></td>
                    <td>14</td>
                    <td>Senior Marketing Designer</td>
                    <td>관리자</td>
                    <td>2017/12/18</td>
                    <td>1,011</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="checkRow" value="${content.IDX}"></td>
                    <td>15</td>
                    <td>Regional Director</td>
                    <td>관리자</td>
                    <td>2017/11/17</td>
                    <td>1,680</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
            
            <!-- 전체 선택 스크립트 -->
            <script>
                function checkAll(){
                    if( $("#th_checkAll").is(':checked') ){
                        $("input[name=checkRow]").prop("checked", true);
                    }else{
                        $("input[name=checkRow]").prop("checked", false);
                    }
                }
                
                
                function goNoticeView(){
                	location.href="noticeView.jsp";
                }
                
                function goAdd(){
                	location.href="branchAdd.jsp";
                }
                
                function complete(){
                	alert("공지글이 등록되었습니다.");
                	location.href="branchNotice.jsp"
                }

            </script>
            
	<!-- search form -->
	<form class="navbar-form navbar-search" role="search">
	    <div class="input-group">
	    
	        <div class="input-group-btn">
	            <button type="button" class="btn btn-search btn-default dropdown-toggle" data-toggle="dropdown">
	                <span class="glyphicon glyphicon-search"></span>
	                <span class="label-icon">전체</span>
	                <span class="caret"></span>
	            </button>
	            <ul class="dropdown-menu pull-left" role="menu">
	              <li>
	                <a href="#">
	                    <span class="glyphicon glyphicon-user"></span>
	                    <span class="label-icon">이름</span>
	                </a>
	              </li>
	               <li>
	                    <a href="#">
	                        <span class="glyphicon glyphicon-user"></span>
	                        <span class="label-icon">예약 번호</span>
	                    </a>
	                </li>
	                
	                <li>
	                    <a href="#">
	                    <span class="glyphicon glyphicon-book"></span>
	                    <span class="label-icon">차량 번호</span>
	                    </a>
	                </li>
	            </ul>
	        </div>
	
	        <input type="text" class="form-control">
	    
	        <div class="input-group-btn">
	            <button type="button" class="btn btn-search btn-default" id="searching">검색</button> 
	        </div>
	    </div>  
	</form>   

        <div class="pagination">
             <a href="#"> &lt;&lt; </a>
            <a href="#"> &lt; </a>
            <li><a href="#home">1</a></li>
            <li><a href="#home">2</a></li>
            <li><a href="#home">3</a></li>
            <li><a href="#home">4</a></li>
            <li><a href="#home">5</a></li>
            <a href="#"> &gt; </a>
            <a href="#"> &gt;&gt; </a>
        </div>
		
	</div>

</body>
</html>