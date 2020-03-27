<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 작은 메뉴 스타일 */
	#price-title {
	    float: left;
	    margin-left: 3rem;
	    margin-top: 1rem;
	}
	
	/* 테이블 스타일 */
	table, tr, td, th {
		border: 1px solid rgba(0, 0, 0, 0.3);
		margin-left: 4rem;
	}
	
	input#stopDay {
	    width: 265px;
	    height: 84px;
	}
	.outer input {
	    box-sizing: border-box;
	    border: 0;
	    text-align: center;
	}
	
	
	/* 탭 스타일 */
	article.tabs{
	    position: relative;
	    display: block;
	    margin-left: 6rem;
	}
	article.tabs section{
	    position: absolute;
        display: block;
        left: 0;
        height: 680px;
        width: 1023px;
        padding: 10px 20px;
        background-color: #ddd;
        border-radius: 5px;
        box-shadow: 0 3px 3px rgba(0,0,0,0.1);
	}
	article.tabs section:first-child{
        z-index: 1;
    }
    
    /* =============탭 메뉴 스타일 (S) =================*/
	article.tabs section h2{
	    position: absolute;
	    font-size: 1em;
	    font-weight: normal;
	    width: 120px;
	    height: 1.8em;
	    top: -1.8em;
	    left: 10px;
	    padding: 0;
	    margin: 0;
	    color: #999;
	    background-color: #ddd;
	    border-radius: 5px 5px 0 0;
	}
	article.tabs section:nth-child(2) h2{
	    left: 132px;
	}
	article.tabs section h2 a{
	    display: block;
	    width: 100%;
	    line-height: 1.8em;
	    text-align: center;
	    text-decoration: none;
	    color: inherit; /* 부모요소 스타일에 따라 변함*/
	    outline: 0 none;
	}
	
	 /* =============탭 메뉴 스타일 (E) =================*/
	 /* 클릭했을때 해당 section 영역 스타일, z-index를 수정함으로써 위로 보이게 함*/
	article.tabs section:target,
	article.tabs section:target h2{
	    color: #333;
	    z-index: 2;
	    background: beige;
	}
	/* 전환효과 */
	article.tabs section,
	article.tabs section h2{
	    -webkit-transition: all 500ms ease;
	    -moz-transition: all 500ms ease;
	    -ms-transition: all 500ms ease;
	    -o-transition: all 500ms ease;
	    transition: all 500ms ease;
	}
	
	/* 보험유형 선택 부분 */
	div.box{
		display:none;
	}
	div#insu-1Box, div#insu-2Box {
	    margin-top: -35px;
	}
	legend#tab2-title {
	    font-size: 19px;
	    margin: 0;
	}
	#completeBtn{
		border-radius: 5px;
	    outline: 0;
	    border: 0;
	    background-color: orange;
	    color: white;
	    width: 80px;
	    height: 35px;
	    margin-bottom: 0.75rem;
	}
	
</style>
</head>
<body>
	<%@ include file="../common/adminBase.jsp" %>
	
	<div class="outer">
		<div class="faq-header">
			<h1>금액정보</h1>
		</div>
		<hr id="header-line">
		<br>	
		
		
	    <article class="tabs">
			<!-- 첫번째 탭 내용 -->
	        <section id="carPrice-tab">
	            <h2><a href="#carPrice-tab">차량금액</a></h2>
	            <h5 id="price-title">기간별 대여료</h5>
	            <br><br>
	            <table id="day-price">
	                <tr height="40px;">
	                    <th width="50px;">비고</th>
	                    <th width="350px;">차종</th>
	                    <th>1일</th>
	                    <th>3~6일</th>
	                    <th>7일+</th>
	                </tr>
	                <tr>
	                    <td><input type="checkbox" name="checkRow"></td>
	                    <td>경차, 준중형, 중형(2000cc미만)</td>
	                    <td><input type="text" id="s-day1" name="s-day1" placeholder="금액을입력해주세요"></td>
	                    <td><input type="text" id="s-day6" name="s-day6" placeholder="금액을입력해주세요"></td>
	                    <td><input type="text" id="s-day7" name="s-day7" placeholder="금액을입력해주세요"></td>
	                </tr>
	                <tr>
	                    <td><input type="checkbox" name="checkRow"></td>
	                    <td>준대형(2000cc이상 3000cc미만), 승합/RV</td>
	                    <td><input type="text" id="m-day1" name="m-day1" placeholder="금액을입력해주세요"></td>
	                    <td><input type="text" id="m-day6" name="m-day6" placeholder="금액을입력해주세요"></td>
	                    <td><input type="text" id="m-day7" name="m-day7" placeholder="금액을입력해주세요"></td>
	                </tr>
	                <tr>
	                    <td><input type="checkbox" name="checkRow"></td>
	                    <td>대형,수입차량(3000cc초과, 수입차량)</td>
	                    <td><input type="text" id="l-day1" name="l-day1" placeholder="금액을입력해주세요"></td>
	                    <td><input type="text" id="l-day6" name="l-day6" placeholder="금액을입력해주세요"></td>
	                    <td><input type="text" id="l-day7" name="l-day7" placeholder="금액을입력해주세요"></td>
	                </tr>
	            </table>
	            
	            <br>
	            
	            <h5 id="price-title">초과 시간당 요금</h5>
	            <br><br>
	            <table id="over-price">
	                <tr height="40px;">
	                    <th width="50px;">비고</th>
	                    <th width="350px;">차종</th>
	                    <th>+6시간</th>
	                    <th>+9시간</th>
	                    <th>+12시간</th>
	                </tr>
	                <tr>
	                    <td><input type="checkbox" name="checkRow"></td>
	                    <td>경차, 준중형, 중형(2000cc미만)</td>
	                    <td><input type="text" id="s-over1" name="s-over1" placeholder="금액을입력해주세요"></td>
	                    <td><input type="text" id="s-over6" name="s-over6" placeholder="금액을입력해주세요"></td>
	                    <td><input type="text" id="s-over7" name="s-over7" placeholder="금액을입력해주세요"></td>
	                </tr>
	                <tr>
	                    <td><input type="checkbox" name="checkRow"></td>
	                    <td>준대형(2000cc이상 3000cc미만), 승합/RV</td>
	                    <td><input type="text" id="m-over1" name="m-over1" placeholder="금액을입력해주세요"></td>
	                    <td><input type="text" id="m-over6" name="m-over6" placeholder="금액을입력해주세요"></td>
	                    <td><input type="text" id="m-over7" name="m-over7" placeholder="금액을입력해주세요"></td>
	                </tr>
	                <tr>
	                    <td><input type="checkbox" name="checkRow"></td>
	                    <td>대형,수입차량(3000cc초과, 수입차량)</td>
	                    <td><input type="text" id="l-over1" name="l-over1" placeholder="금액을입력해주세요"></td>
	                    <td><input type="text" id="l-over6" name="l-over6" placeholder="금액을입력해주세요"></td>
	                    <td><input type="text" id="l-over7" name="l-over7" placeholder="금액을입력해주세요"></td>
	                </tr>
	            </table>
	            
	            <br>
	            
	            <h5 id="price-title">알뜰카 대여료</h5>
	            <br><br>
	            <table id="car-price">
	                <tr height="40px;">
	                    <th width="50px;">비고</th>
	                    <th width="350px;">차종</th>
	                    <th>1일</th>
	                </tr>
	                <tr>
	                    <td><input type="checkbox" name="checkRow"></td>
	                    <td>경차, 준중형, 중형(2000cc미만)</td>
	                    <td><input type="text" id="s-car1" name="s-car1" placeholder="금액을입력해주세요"></td>
	                </tr>
	                <tr>
	                    <td><input type="checkbox" name="checkRow"></td>
	                    <td>준대형(2000cc이상 3000cc미만), 승합/RV</td>
	                    <td><input type="text" id="m-car1" name="m-car1" placeholder="금액을입력해주세요"></td>
	                </tr>
	                <tr>
	                    <td><input type="checkbox" name="checkRow"></td>
	                    <td>대형,수입차량(3000cc초과, 수입차량)</td>
	                    <td><input type="text" id="l-car1" name="l-car1" placeholder="금액을입력해주세요"></td>
	                </tr>
	            </table>
	        </section>
	        
	        
	        <!-- 두번째 탭 내용 -->
	        <section id="tab2">
	       		<h2><a href="#tab2">보험금액</a></h2>
	       		<fieldset>
	       			<legend id="tab2-title">보험 유형을 선택하세요.</legend>
	       			<input type="radio" name="category" onclick="showInsurance(this);" id="insu-1">
	       			<label for="insu-1">보험유형1</label>&nbsp; &nbsp; 
	       			<input type="radio" name="category" onclick="showInsurance(this);" id="insu-2">
	       			<label for="insu-2">보험유형2</label>
	       		</fieldset>
	       		
	       		<!-- 보험유형1 테이블 영역 -->
	       		<div id="insu-1Box" class="box">
	       			<h5 id="price-title">24시간 기준 금액</h5>
					<br><br>
					<table id="day-price">
		                <tr height="40px;">
		                    <th width="50px;">비고</th>
		                    <th width="350px;">차종</th>
		                    <th>금액</th>
		                </tr>
		                <tr>
		                    <td><input type="checkbox" name="checkRow"></td>
		                    <td>경차, 준중형, 중형(2000cc미만)</td>
		                    <td><input type="text" id="s-insurance1" name="s-insurance1" placeholder="금액을입력해주세요"></td>
		                </tr>
		                <tr>
		                    <td><input type="checkbox" name="checkRow"></td>
		                    <td>준대형(2000cc이상 3000cc미만), 승합/RV</td>
		                    <td><input type="text" id="m-insurance1" name="m-insurance1" placeholder="금액을입력해주세요"></td>
		                </tr>
		                <tr>
		                    <td><input type="checkbox" name="checkRow"></td>
		                    <td>대형,수입차량(3000cc초과, 수입차량)</td>
		                    <td><input type="text" id="l-insurance1" name="l-insurance1" placeholder="금액을입력해주세요"></td>
		                </tr>
		            </table>
		            
		            <br>
		            
		            <h5 id="price-title">사고시,처리면책금(본인부담금)</h5>
					<br><br>
					<table id="day-price">
		                <tr height="40px;">
		                    <th width="50px;">비고</th>
		                    <th width="350px;">차종</th>
		                    <th>금액</th>
		                    <th>휴차료</th>
		                </tr>
		                <tr>
		                    <td><input type="checkbox" name="checkRow"></td>
		                    <td>경차, 준중형, 중형(2000cc미만)</td>
		                    <td><input type="text" id="s-accident1" name="s-accident1" placeholder="금액을입력해주세요"></td>
		                    <td rowspan="3" width="200px"><input type="text" id="stopDay" name="stopDay" placeholder="1일 대여로의 비율로 입력하세요.(%)"></td>
		                </tr>
		                <tr>
		                    <td><input type="checkbox" name="checkRow"></td>
		                    <td>준대형(2000cc이상 3000cc미만), 승합/RV</td>
		                    <td><input type="text" id="m-accident1" name="m-accident1" placeholder="금액을입력해주세요"></td>
		                </tr>
		                <tr>
		                    <td><input type="checkbox" name="checkRow"></td>
		                    <td>대형,수입차량(3000cc초과, 수입차량)</td>
		                    <td><input type="text" id="l-accident1" name="l-accident1" placeholder="금액을입력해주세요"></td>
		                </tr>
		            </table>
		            
		            <br>
		            
		            <h5 id="price-title">보상한도</h5>
					<br><br>
					<table id="day-price">
		                <tr height="40px;">
		                    <th width="50px;">비고</th>
		                    <th width="350px;">차종</th>
		                    <th>기준 금액</th>
		                </tr>
		                <tr>
		                    <td><input type="checkbox" name="checkRow"></td>
		                    <td>경차, 준중형, 중형(2000cc미만)</td>
		                    <td><input type="text" id="s-reward1" name="s-reward1" placeholder="금액을입력해주세요"></td>
		                </tr>
		                <tr>
		                    <td><input type="checkbox" name="checkRow"></td>
		                    <td>준대형(2000cc이상 3000cc미만), 승합/RV</td>
		                    <td><input type="text" id="m-reward1" name="m-reward1" placeholder="금액을입력해주세요"></td>
		                </tr>
		                <tr>
		                    <td><input type="checkbox" name="checkRow"></td>
		                    <td>대형,수입차량(3000cc초과, 수입차량)</td>
		                    <td><input type="text" id="l-reward1" name="l-reward1" placeholder="금액을입력해주세요"></td>
		                </tr>
		            </table>
		            
		            <br>
		            
		            <button type="button" id="completeBtn" onclick="goComplete();">등록하기</button>
	       		
	       		</div>
	       		
	       		<!-- 보험유형2 테이블 영역 -->
	       		<div id="insu-2Box" class="box">
	       			<h5 id="price-title">24시간 기준 금액</h5>
					<br><br>
					<table id="day-price">
		                <tr height="40px;">
		                    <th width="50px;">비고</th>
		                    <th width="350px;">차종</th>
		                    <th>금액</th>
		                </tr>
		                <tr>
		                    <td><input type="checkbox" name="checkRow"></td>
		                    <td>경차, 준중형, 중형(2000cc미만)</td>
		                    <td><input type="text" id="s-insurance2" name="s-insurance2" placeholder="금액을입력해주세요"></td>
		                </tr>
		                <tr>
		                    <td><input type="checkbox" name="checkRow"></td>
		                    <td>준대형(2000cc이상 3000cc미만), 승합/RV</td>
		                    <td><input type="text" id="m-insurance2" name="m-insurance2" placeholder="금액을입력해주세요"></td>
		                </tr>
		                <tr>
		                    <td><input type="checkbox" name="checkRow"></td>
		                    <td>대형,수입차량(3000cc초과, 수입차량)</td>
		                    <td><input type="text" id="l-insurance2" name="l-insurance2" placeholder="금액을입력해주세요"></td>
		                </tr>
		            </table>
		            
		            <br>
		            
		            <h5 id="price-title">사고시,처리면책금(본인부담금)</h5>
					<br><br>
					<table id="day-price">
		                <tr height="40px;">
		                    <th width="50px;">비고</th>
		                    <th width="350px;">차종</th>
		                    <th>금액</th>
		                    <th>휴차료</th>
		                </tr>
		                <tr>
		                    <td><input type="checkbox" name="checkRow"></td>
		                    <td>경차, 준중형, 중형(2000cc미만)</td>
		                    <td><input type="text" id="s-accident2" name="s-accident2" placeholder="금액을입력해주세요"></td>
		                    <td rowspan="3" width="200px"><input type="text" id="stopDay" name="stopDay" placeholder="1일 대여로의 비율로 입력하세요.(%)"></td>
		                </tr>
		                <tr>
		                    <td><input type="checkbox" name="checkRow"></td>
		                    <td>준대형(2000cc이상 3000cc미만), 승합/RV</td>
		                    <td><input type="text" id="m-accident2" name="m-accident2" placeholder="금액을입력해주세요"></td>
		                </tr>
		                <tr>
		                    <td><input type="checkbox" name="checkRow"></td>
		                    <td>대형,수입차량(3000cc초과, 수입차량)</td>
		                    <td><input type="text" id="l-accident2" name="l-accident2" placeholder="금액을입력해주세요"></td>
		                </tr>
		            </table>
		            
		            <br>
		            
		            <h5 id="price-title">보상한도</h5>
					<br><br>
					<table id="day-price">
		                <tr height="40px;">
		                    <th width="50px;">비고</th>
		                    <th width="350px;">차종</th>
		                    <th>기준 금액</th>
		                </tr>
		                <tr>
		                    <td><input type="checkbox" name="checkRow"></td>
		                    <td>경차, 준중형, 중형(2000cc미만)</td>
		                    <td><input type="text" id="s-reward2" name="s-reward2" placeholder="금액을입력해주세요"></td>
		                </tr>
		                <tr>
		                    <td><input type="checkbox" name="checkRow"></td>
		                    <td>준대형(2000cc이상 3000cc미만), 승합/RV</td>
		                    <td><input type="text" id="m-reward2" name="m-reward2" placeholder="금액을입력해주세요"></td>
		                </tr>
		                <tr>
		                    <td><input type="checkbox" name="checkRow"></td>
		                    <td>대형,수입차량(3000cc초과, 수입차량)</td>
		                    <td><input type="text" id="l-reward2" name="l-reward2" placeholder="금액을입력해주세요"></td>
		                </tr>
		            </table>
		            
		            <br>
		            
		            <button type="button" id="completeBtn" onclick="goComplete();">등록하기</button>
	       		
	       		</div>
	        </section>
	    </article>
	
	
	</div>
    <script>
        var vHas = location.hash;
        if(vHas==""){
            location.hash = "#carPrice-tab";
        }
        
        function showInsurance(element){
        	var tag = document.getElementsByClassName("box");
        	
        	for(var i=0; i<tag.length; i++){
        		if(element.id+"Box" == tag[i].id){
        			tag[i].style.display = "block";
        		}else{
        			tag[i].style.display = "none";
        		}
        	}
        }
        
        function goComplete(){
        	alert("정상적으로 등록되었습니다.");
        }
    </script>


</body>
</html>