<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.bbc.faq.model.vo.Faq" %>
<%
	ArrayList<Faq> list = (ArrayList)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
 	.faq-header>h1 {
	    float: left;

	}	
	#header-line{
		margin-top: 17px;
		width: 70%;

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
	.modal-dialog {
	    max-width: 700px !important;
        margin: 17rem 37rem !important;
	}
	.modal-content{height: 440px !important;}
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
	
		.outer{
		width:860px;
		margin-left:auto;
		margin-right:auto;
	}	
	
		.main-title{
		margin-top: 17px; 
		font-size: 20px;
		font-weight: 900;
	}
	    hr.garo{
		border: 1px solid #757272;
		margin: 17px 0px 0px 0px;
	}
	
 </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>



	<!-- FAQ 시작 -->
	<div class="outer">
		

		<div class="main-title">FAQ</div>
		<small>찾고 있는 질문에 답을 모르시나면? 여기에 자주 묻는 질문들을 공유합니다!</small>
		<hr class="garo">
		<br>
		<br>
		
		<!-- 모달 팝업 부분 -->
		<!-- Button trigger modal -->

		 
		<!-- Modal -->

		
		
		<div style="display:none;"></div>
		
<!--	<div id="faq-title" data-toggle="faq-collapse">
			<table>
		    		<tr>
		    			<td id="title-text">상품 위치를 알고 싶습니다.</td>
		    		</tr>
	   		</table>
		</div>
	    <p class="faq">지금 확인 중 입니다.</p>
-->	    

	    
	    <% if(list.isEmpty()){ %>
	    	<div id="faq-title">
	    		<table id="faq-title">
	    			<tr><td>데이터가 없습니다</td></tr>
	    		</table>
	    	</div>
	    <% }else {  %>
	    	<% for(Faq n : list) { %>
	    	<div id="faq-title" data-toggle="faq-collapse">
				<table>
		    			<tr>
		    				<td id="title-text"> <%= n.getFaqTitle() %></td>
		    			</tr>
		    	</table>
		    </div>
		    <p class="faq"> <%= n.getFaqContent() %>  </p>		
	    	<% } %>
	    <% } %>






	
	    <script>
	        $(function(){
	            $("div").on("click", function(){
	
	                var p = $(this).next();
	
	                if(p.css("display") == "none"){
	                    $(this).siblings("p").slideUp();
	                    p.slideDown();
	                }else{
	                    p.slideUp();
	                }
	            });
	        });
	        
	        /* jsp 연결 부분 */
	        function goWrite(){
	        	location.href="<%=contextPath%>/views/admin/faqWrite.jsp";
	        }
	        

	        
	    </script>
    </div>
     
    
    
    



</body>
</html>