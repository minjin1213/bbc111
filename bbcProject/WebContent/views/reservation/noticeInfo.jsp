<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
    public String helloWorld() {
        return "Hello World";
    }
	
%>
<%
out.println("<script>alert('고객님의 의견을 성실하게 반영하여 더욱 편리하게 이용하실 수 있도록 최선을 다하겠습니다.');<a href='#fn_userinfo()'>1111</a></script>");
%>
    
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script>
function fn_userinfo() {
	//if($('input[name="select_pay"]').is(":checked")) {	
		var $newForm = $('<form></form>');	
		$newForm.attr("method", "post");
		$newForm.attr("action", "insertReservation.rv");
		$newForm.appendTo('body');
			
		$newForm.append($("<input/>", {type:"hidden", name:"rentBrCode", value:rentBrCode}));
		$newForm.append($("<input/>", {type:"hidden", name:"returnBrCode", value:returnBrCode}));
		$newForm.append($("<input/>", {type:"hidden", name:"rentDate", value:rentDate}));
		$newForm.append($("<input/>", {type:"hidden", name:"returnDate", value:returnDate}));
		$newForm.append($("<input/>", {type:"hidden", name:"carPrice", value:carPrice}));
		$newForm.append($("<input/>", {type:"hidden", name:"carNo", value:carNo}));		
		$newForm.append($("<input/>", {type:"hidden", name:"optionInfo", value:optionInfo}));
		$newForm.append($("<input/>", {type:"hidden", name:"discountCate", value:discountCate}));
		$newForm.append($("<input/>", {type:"hidden", name:"discountNo", value:discountNo}));
		$newForm.append($("<input/>", {type:"hidden", name:"discountPrice", value:discountPrice}));
		$newForm.append($("<input/>", {type:"hidden", name:"cwdTotalPrice", value:cwdTotalPrice}));
		$newForm.append($("<input/>", {type:"hidden", name:"totalPrice", value:totalPrice}));
			
		$newForm.submit();
		
	//}else {
		alert("결제방법을 선택하셔야 결제진행이 가능합니다.");
	//	return;
	//}
}
</script>


</body>
</html>