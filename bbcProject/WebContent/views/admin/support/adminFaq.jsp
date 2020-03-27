<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.bbc.faq.model.vo.Faq" %>
<%
	ArrayList<Faq> list = (ArrayList)request.getAttribute("list");
	Faq fm = (Faq)request.getAttribute("faq");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
     p.faq{
         border:1px solid lightgray;
         width:300px;
         height:100px;
         margin-top:-10px;
         border-radius:10px;
         display:none;
            margin-left: 6rem;
            margin-bottom: 30px;
            width: 69%;
     }
	button.faqAdd, #updateBtn {
	    margin-bottom: 10px;
	    border-radius: 5px;
	    outline: 0;
	    border: 0;
	    background-color: orange;
	    color: white;
	    width: 60px;
	    height: 35px;
	    margin-bottom: 0.75rem;
	}
	#deleteBtn, .modal-backBtn{
		border-radius: 5px;
	    outline: 0;
	    border: 0;
	    background-color: rgba(90, 92, 105, 0.5);
	    color: white;
	    width: 60px;
	    height: 35px;
	    margin-bottom: 0.75rem;
	}
	.modal-updateBtn{
		margin-bottom: 10px;
	    border-radius: 5px;
	    outline: 0;
	    border: 0;
	    background-color: orange;
	    color: white;
	    width: 80px;
	    height: 35px;
	    margin-bottom: 0.75rem;
	}
    #faq-title>table{width:100%;}
    #faq-title {
	    color: #333;
	    background-color: #f5f5f5;
	    border-color: #ddd;
        padding: 20px 15px;
	    border-bottom: 1px solid transparent;
	    border-top-left-radius: 3px;
	    border-top-right-radius: 3px;
        width: 69%;
	    text-align: left;
	    margin-left: 6rem;
	    margin-bottom: 15px;
	    padding-left: 80px;
	}
	#btnCol>button {
	    width: 100%;
	}
	#title-text{width:85%;}
	#faq-title [data-toggle="faq-collapse"]:after {
	    font-family: 'Glyphicons Halflings';
	    content: "\e072";
	    float: right;
	    color: #F58723;
	    font-size: 18px;
	    line-height: 22px;
	    -webkit-transform: rotate(-90deg);
	    -moz-transform: rotate(-90deg);
	    -ms-transform: rotate(-90deg);
	    -o-transform: rotate(-90deg);
	    transform: rotate(-90deg);
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
	
	
	
	#faqHeader {
	    text-align: left;
	    margin: 0 0 20px 20px;
	}
 </style>
</head>
<body>
	<%@ include file="../common/adminBase.jsp" %>
	
	<!-- FAQ 시작 -->
	<div class="outer">
		
		<div class="faq-header">
			<h1>FAQ</h1>
		</div>
		<hr id="header-line">
		<br>
		
		
		<!-- Modal Area 시작 -->
		<!-- 모달 팝업 부분 -->
		<!-- Button trigger modal -->
		<button type="button" class="faqAdd" data-toggle="modal" data-target="#myModal">
		  등록
		</button>	
		<br>
		 
		<!-- FAQ 등록 Modal -->
		<form id="insertForm" action="<%=contextPath%>/insert.fa" method="post">
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      
			      <div class="modal-body">
			      <br>
			      	<div id="faqHeader"><h5>FAQ 등록</h5></div>	
					<hr>  
	
			      	<table>
			      		<tr>
			      			<th style="width:100px;">제목</th>
			      			<td><textarea id="q-title" name="q-title"></textarea>
			      		</tr>
			      		<tr>
			      			<td>내용</td>
			      			<td><textarea id="q-content" name="q-content"></textarea></td>
			      		</tr>
			      	</table>
			      	<!-- 로그인한 아이디 값의 value로 수정해야함 -->
			      	<input type="hidden" value="1" name="memNo">
			      </div>
			      
			      <div style="display:none;"></div>
			      
			      <div class="modal-footer">
			        <button type="submit" class="modal-updateBtn">등록하기</button>
			        <button type="button" class="modal-backBtn" data-dismiss="modal">취소</button>
			      </div>
			      
			      
			    </div>
			  </div>
			</div>
		</form>
		
		
		<!-- FAQ 수정 Modal -->
		<form id="insertForm" action="<%=contextPath%>/update.t.fa" method="post">
			<div class="modal fade" id="update-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      
			      <div class="modal-body">
			      <br>
			      	<div id="faqHeader"><h5>FAQ 수정</h5></div>	
					<hr>  
			      	<table>
			      		<tr>
			      			<th style="width:100px;">제목</th>
			      			<td><textarea id="q-title" class="update-title" name="update-title"></textarea></td>
			      		</tr>
			      		<tr>
			      			<td>내용</td>
			      			<td><textarea id="q-content" class="update-content" name="update-content"></textarea></td>
			      		</tr>
			      	</table>
	      			<input type="hidden" class="delete-faqNo" name="update-faqNo">
			      	
			      	<!-- 로그인한 아이디 값의 value로 수정해야함 -->
			      	<input type="hidden" value="1" name="memNo">
			      </div>
			      
			      <div style="display:none;"></div>
			      
			      <div class="modal-footer">
			        <button type="submit" class="modal-updateBtn">수정하기</button>		        
				    <button class="modal-backBtn" data-dismiss="modal">취소</button>
			      </div>
			      
			      
			    </div>
			  </div>
			</div>
		</form>
		
		
		<!-- FAQ 삭제 Modal -->
		<form id="insertForm" action="<%=contextPath%>/delete.t.fa" method="post">
			<div class="modal fade" id="delete-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      
			      <div class="modal-body">
			      <br>
			      	<div id="faqHeader"><h5>FAQ 삭제</h5></div>	
					<hr>  
			      	<table>
			      		<tr>
			      			<th style="width:100px;">제목</th>
			      			<td><textarea id="q-title" class="update-title" name="update-title"></textarea></td>
			      		</tr>
			      		<tr>
			      			<td>내용</td>
			      			<td><textarea id="q-content" class="update-content" name="update-content"></textarea></td>
			      		</tr>
			      	</table>
	      			<input type="hidden" class="delete-faqNo" name="delete-faqNo">
			      	
			      	<!-- 로그인한 아이디 값의 value로 수정해야함 -->
			      	<input type="hidden" value="1" name="memNo">
			      </div>
			      
			      <div style="display:none;"></div>
			      
			      <div class="modal-footer">
			        <button type="submit" class="modal-updateBtn">삭제하기</button>		        
				    <button class="modal-backBtn" data-dismiss="modal">취소</button>
			      </div>
			      
			      
			    </div>
			  </div>
			</div>
		</form>
	    
	 <% if(list.isEmpty()){ %>
	    	<div id="faq-title">
	    		<table id="faq-title">
	    			<tr><td>데이터가 없습니다</td></tr>
	    		</table>
	    	</div>
	    <% }else {  %>
	    	<% for(int i=0; i<list.size(); i++){ %>
	    		<div id="faq-title" class="faq-title-cla">
			    	<table>
			    		<tr>
			    			<td id="title-text" class="title-text"><%= list.get(i).getFaqTitle() %></td>
			    			<td id="btnCol">
			    				<input type="hidden" value="<%=list.get(i).getFaqTitle() %>">
			    				<button type="button" class="btnNo" id="updateBtn" data-toggle="modal" data-target="#update-modal">수정</button>
			    				<input type="hidden" value="<%=list.get(i).getFaqContent() %>">
			    				<input type="hidden" class="faqNo" name="faqNo" value="<%=list.get(i).getFaqNo() %>">
			    			</td>
			    			<td id="btnCol">
			    				<input type="hidden" value="<%=list.get(i).getFaqTitle() %>">
			    				<button type="button" class="btnNo" id="deleteBtn" data-toggle="modal" data-target="#delete-modal">삭제</button>
			    				<input type="hidden" value="<%=list.get(i).getFaqContent() %>">
			    				<input type="hidden" class="faqNo" name="faqNo" value="<%=list.get(i).getFaqNo() %>">
			    			</td>
			    		</tr>
			    	</table>
			    </div>
			    <p class="faq"><%= list.get(i).getFaqContent() %></p>
	    	<% } %>
	    
	    <% } %> 
	    
	    
		
	    
	    
	    <script>
	    	/* FAQ 항목 열리는 script */
	        $(function(){
	            $(".faq-title-cla").on("click", function(){
	
	                var p = $(this).next();
	
	                if(p.css("display") == "none"){
	                    $(this).siblings("p").slideUp();
	                    p.slideDown();
	                }else{
	                    p.slideUp();
	                }
	            });
	        });
	    
	    	
	    	$(".btnNo").click(function(){
	    		
	    		var title = $(this).prev().val();
	    		// 클릭한 버튼의 이전 요소 번호
		    	console.log(title);
				
	    		var content = $(this).next().val();
	    		console.log(content);
	    		
	    		/* var faqNo = $(".faqNo").val();
	    		console.log(faqNo); */
	    		
	    		var no = $(this).next().next().val();
	    		console.log(no);
	    		
	    		$(".update-title").html(title);
	    		$(".update-content").html(content); 
	    		
	    		
	    		$(".update-faqNo").val(no);
	    		/* 삭제하는 case에 사용 */
	    		$(".delete-faqNo").val(no);
	    	});
	    	
	        
	        
	    </script>
    </div>
     
    
    
    



</body>
</html>