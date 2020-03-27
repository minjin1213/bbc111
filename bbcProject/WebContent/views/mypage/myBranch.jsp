<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList, com.bbc.area.model.vo.Area, com.bbc.branchmanagement.model.vo.BranchManagement, com.bbc.mybranch.model.vo.MyBranch" %>    
<% 
	ArrayList<Area> list = (ArrayList<Area>)request.getAttribute("list"); 
%>    
<%
	ArrayList<MyBranch> branchlist = (ArrayList<MyBranch>)request.getAttribute("branchlist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>나의 지점</title>
<style>
.outer{
		width:860px;
		margin-left:auto;
		margin-right:auto;
		margin-top:12px;
	}	
	
hr.garo{
		border: 1px solid #757272;
		margin: -6px 0px 0px 0px;
	}	
	
.main-title{
		margin-top: 35px; 
		font-size: 20px;
		font-weight: 900;
	}	
	
	 .search{
        background: #ffc107;
        color:white;
        width: 80px;
        height: 20px;
        border-radius: 4px;
        float:right;
        text-align:center;
        margin-top: -10%;
        margin-right: 20px;
    }
   	table{
   		margin-top:17px;
   	}

   	img{
   		width: 60px;
   		height:60px;
   	}
   	#branchInfo{
   		border: 2px solid lightgray;
   		text-align:left;
   		padding: 10px 10px 10px 10px;
   	}
   	.bran{
   		background-color: lightgray;
   		text-align:center !important;
   	}
   	
</style>
</head>
<body>

<%@ include file="../common/menubar.jsp" %>
	

		<div class="outer"> 
		     <div class="main-title" style="margin-top: 17px;">나의지점</div>
		     
		     
			<!--나의 지점 등록 -->	     	
            <div class="popup" > 
            <div class="container" style="margin-bottom:7px;margin-left:15px;">
                <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" style="float:right;background: #ffc107;height:20px;font-size:10px;width:90px;padding-top:2px;">지점 등록</button>
              	
				  <!-- Modal -->
				  <div class="modal fade" id="myModal" role="dialog" data-backdrop="false">
				    <div class="modal-dialog modal-sm">
				    
				    <!-- Modal Content -->
				      <div class="modal-content" style="margin-top:200px;">
				      
				      <!-- Modal Header -->
				        <div class="modal-header">
						        <h4 class="modal-title" style="font-size:20px;"><strong>지점찾기</strong></h4>
						        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        </div>
				        
				    	<!-- 모달 지역명: -->
				        <div class="modal-body" style="height:310px;">
				       		
				       		<div class="left-branch">
					          		<label class="label-top-title label-top-title-branch">등록 지점</label><br>
					          		<span style="display:inline-block; padding-bottom:5px; font-size:12px; color:#ef2e0f;">* 대여지점과 다른 지점으로 반납하실 경우 별도의 수수료가 부과됩니다.</span>        		
							
							<div style="position:relative">
		
									<% if(list.isEmpty()) { %>
									<select name="brancharea" id="brancharea">
										<option value='no'>지역정보가 없습니다.</option>
									</select>
									<% }else { %>
									<select name="brancharea" id="brancharea">	
								
										<option value='0'>지역선택</option> 
										
										<% for(Area a : list) { %>	
										<option value='<%=a.getAreaCode()%>'><%=a.getAreaName()%></option>
										<% } %>	
									</select>
									<% } %>
							</div>
							
							<div id="selRentDiv" class="select-branch">
									<ul></ul>
							</div>		
							</div>	
				        </div>
				        
				        <div class="modal-footer">
				          <button type="button" onclick="setBranch();"class="btn btn-default" data-dismiss="modal" style="background: #ffc107;color:white;text-align:center;margin-right:85px;">지점등록</button>
				        </div>
				      </div>
				      
				    </div>
				  </div>
				  
				  
		
              </div>
              
              <!-- 모달 끝 -->
			
		
			<!-- 나의 지점 등록 끝 -->
				<hr class="garo"> 
		
			
		<table>
		<% if(branchlist != null){ %>
			<% for(int i=0; i<branchlist.size(); i++){ MyBranch b = branchlist.get(i);%>
			<tr>
				<td><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSnnJncNl4iwO2L7Hx8uavjI4IID2Mej3AMhUro2uivPjOIeBYH"></td>
				<td style="padding-left:15px;font-size:15px;"><b>지점명:</b></td>
				<td style="padding-left:0px;font-size:15px;"><%=b.getBranchName()%></td>
				<td style="padding-left:30px;font-size:15px;"><b>(구)명:</b></td>
				<td style="padding-left: 0px;font-size:15px;padding-right: 10px;"><%=b.getAreaName()%></td>
				<td style="font-size:15px;"><b>전화번호:</b></td>
				<td style="padding-left:0px;font-size:15px;"><%=b.getBranchPhone()%></td>
				

				<td style="padding-left:50px;">
			 <div class="container" style="margin-bottom:7px;margin-left:15px;">
                <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal<%= i %>" style="background: #ffc107;height: 30px;width: 78px;">지점 정보</button>
              	
				  <!-- Modal -->
				  <div class="modal fade" id="myModal<%= i %>" role="dialog" data-backdrop="false">
				    <div class="modal-dialog modal-sm">
				      <div class="modal-content" style="margin-top:200px; width:600px;">
				      
				        <div class="modal-header">
				           <h4 class="modal-title" style="font-size:20px;"><strong>지점안내</strong></h4>
				          <button type="button" class="close" data-dismiss="modal">&times;</button>   
				        </div>
				        
				    <!-- 모달 지점안내 -->
				        <div class="modal-body" style="height: 400px;width:600px;padding-right: 3px;padding-left: 1px;">
				             <table style="border:1px solid lightgray;width:100%;height:300px;text-align:center;left-margin:10px;">				  
							    <tbody>
							        <tr id="branchInfo">
							            <th scope="row" id="branchInfo" class="bran" style="width:80px;"><strong>주소</strong></th>
							          <td id="branchInfo"><b><strong><%=b.getBranchAddress()%></strong></b>
							      			
							          </td>
							        </tr>
							        <tr id="branchInfo">
							            <th scope="row" id="branchInfo" class="bran"><strong>전화번호</strong></th>
							            <td id="branchInfo"><strong><%=b.getBranchPhone()%></strong></td>
							        </tr>
							      <tr id="branchInfo">
							            <th scope="row" id="branchInfo" class="bran"><strong>영업시간</strong></th>
							            <td id="branchInfo"><strong><%=b.getBranchHrs()%></strong></td>
							        </tr>
							      <tr id="branchInfo">
							            <th scope="row"id="branchInfo" class="bran"><strong>교통안내</strong></th>
							        	<td id="branchInfo">
							              <strong><%=b.getBranchDir()%></strong> 
							  
							        </td>
							        </tr>
							    </tbody>
							</table>
				        </div>
				        
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal" style="background: #ffc107;color:white;text-align:center;margin-right:43%;">확인</button>
				        </div>
				      </div>
				      
				    </div>
				  </div>
				</div>
				
				</td>
			
				<td style="padding-left:10px;">
					<input type="hidden" value="<%= b.getBranchNo()%>">
					<button class="search" style="height:30px;background-color:gray;font-size:15px;">삭제</button>
				</td>
				
			</tr>
			       <%} %>
			<%} %>     
		</table>
		
	
</div>

<script>

$(".search").click(function(){
	console.log($(this).prev().val());
	location.href="deletemb.mb?bno=" + $(this).prev().val();
})

	
	

	// 지점선택 후 확인 클릭시 수행
	function setBranch(){
		location.href="<%=request.getContextPath()%>/myBranch.mb?bno="+$("#selRentDiv ul").find(":checked").val();
	
	}
	
	
 	// 지역선택시 선택된 지역의 지점리스트 조회
  	$('#brancharea').on('change', function() {
  		
  		var areano = $(this).val();
  		
  		console.log("areano : "+areano);
  		
  		$.ajax({
  			url:"branchSearch.mb?areano=" + areano,
  			type:"get",
  			success:function(list){  
  				var value = "";  	
  				for(var i=0; i<list.length; i++) {  
  					console.log(list[i]);
  					// 선택한 지점의 이벤트리스트가 있는 경우 이벤트 아이콘 표시	
  				
  			
  					value += "<br>" +
  							 "<input type='radio' id='rdo-" + list[i].branchNo + 
  							 "' class='radio-branch' name='rdo-'" + list[i].branchNo + 
  							 "' value='"  + list[i].branchNo + "'>" + 
  							 " <label for='rdo-" + list[i].branchNo + "'>" +
  							 list[i].branchName + "</label>" 
  				}  	  	
  				
  				return $("#selRentDiv ul").html(value);
  				
  			},
  			error:function(){
  				console.log("지점리스트 가져오는 ajax 통신 오류");
  			}
  		 });  		
  	});
  	
</script>

</body>
</html>