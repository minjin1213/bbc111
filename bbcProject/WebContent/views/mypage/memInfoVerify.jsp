<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 등록</title>
<style>
		.outer{
		width:860px;
		margin-left:auto;
		margin-right:auto;
	}	
	
hr.garo{
		border: 1px solid #757272;
		margin-top: 17px;
		margin-bottom:17px;
	}	
	
.main-title{
		margin-top: 35px; 
		font-size: 20px;
		font-weight: 900;
	}	
.upside{
	margin-top: 30px;
	font: bold;
	font-size:18px;
}

#mgn{
	margin-top:20px;
	margin-left:45px;
}

  input[type="number"],input[type="text"], input[type="checkbox"],select{ 
  	margin-left:10px;
    color: black; 
    font: 'trebuchet ms',helvetica,sans-serif; 
    background-color: white; 
    border:1px solid; 
    border-color: lightgray; 
    margin-top:10px;
    border-radius: 5px;
 
} 

#verifi{
	background-color:#ffc107;
	color:white;
	border-radius:5px;
	font-size: 13px;

}

#mleft{
	margin-top:10px;
}

</style>

</head>
<body>
<body>
    
    <!-- 상단 메뉴바 include -->
    <%@ include file="../common/menubar.jsp" %>
	

		<div class="outer"> 
		     <div class="main-title">회원 정보</div>
		<hr class="garo"> 
		<div class="upside"><b>이메일 정보를 입력해주세요</b></div>
		<hr>
		<form>
			 <div class="form-group options" style="margin-left: 40px;">
			   <input type="checkbox" name="type[]" value="A" required /><b> 이메일 본인확인 전체동의</b><br>

			   <input style="margin-top:20px;"id="mgn" type="checkbox" name="type[]" value="B" required /> 개인정보 이용 동의(필수)<br>
			  <span><input id="mgn" type="checkbox" name="type[]" value="C" required /> 고유 식별 정보처리 동의(필수)
			   </span>
			   <br>  
			   <input id="mgn" type="checkbox" name="type[]" value="D" required /> 서비스 이용약관동의(필수)<br>
			   <input id="mgn" type="checkbox" name="type[]" value="E" required /> 이메일 이용약관 동의(필수)<br>
			<p style="float:right;margin-top: -21%;margin-right: 50px;border:1px solid lightgray;width:500px;height:200px;overflow: auto;margin-top: -165;margin-bottom: 0px;">
				[서비스 이용약관]<br><br>
제1조 (목적)<br>
본 약관은 NICE평가정보(주) (이하 "회사"라 한다)이 제공하는 본인확인서비스(이하 "서비스"라 한다)에 관한 이용조건 및 절차 등 기본적인 사항을 규정함을 목적으로 합니다.<br><br>
제2조 (약관의 효력 및 변경)<br>
1. 본 약관은 "이용자"에게 "서비스" 화면에 게시하거나, 기타의 방법으로 공지하는 것으로 효력이 발생합니다.
2. "회사"는 약관의 규제에 관한 법률 및 기타 관련 법령에 위배되지 않는 범위에서 본 약관의 내용을 개정할 수 있으며, 변경된 경우에는 제1항과 같은 방법으로 공지합니다. 다만 "이용자"의 권리와 의무에 관한 중요한 사항은 변경된 내용의 시행 15일 이전에 공지합니다.
3. "이용자"는 변경된 약관에 대한 내용을 알지 못하여 발생하는 손해 및 피해에 대해서는 "회사"가 책임을 지지 않습니다.<br><br>
제3조 (약관 외 준칙)<br>
본 약관에 명시되지 아니한 사항에 대해서는 정보통신망 이용 촉진 및 정보보호 등에 관한 법률등 기타 관련 법령 또는 상관례에 따릅니다.<br><br>
제4조 (용어의 정의)<br>
본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
1. "본인확인서비스"라 함은 "이용자"가 인터넷상에서 휴대폰 등의 인증수단을 이용하여, 본인임을 안전하게 식별 및 확인해 주는 서비스를 말합니다.
2. "이용자"라 함은 "회사"에서 제공하는 "서비스"의 이용을 위해 자신의 "본인확인정보"를 "회사" 및 "본인확인기관" 등에게 제공하고, 본인임을 확인 받고자 하는 자를 말합니다.
3. "본인확인정보"라 함은 "이용자"가 입력한 생년월일, 성별, 성명, 내/외국인, 휴대폰번호, 통신사 등 본인 식별에 필요한 "이용자"의 정보를 말합니다.
4. "본인확인기관"이라 함은 주민등록번호를 사용하지 아니하고 본인을 확인하는 방법 또는 서비스를 제공하는 자로 방송통신위원회로부터 본인확인기관으로 지정을 받은 자를 의미합니다.
5. "인터넷사업자"라 함은 인터넷을 이용하여 정보를 제공하거나, 정보의 제공을 매개하는 일을 업으로 하는 자로 "회사"와 계약을 통해 운영하며, 인터넷 웹사이트의 "이용자"에 대한 "본인확인정보"를 제공 받는 사업체를 말합니다.
6. "중복가입확인정보"라 함은 웹사이트에 가입하고자 하는 이용자의 중복 확인을 위해 제공되는 정보를 말합니다.
7. "연계정보" 라 함은 "인터넷사업자"의 온ㆍ오프라인 서비스 연계 등의 목적으로 "이용자"를 식별하기 위해 제공되는 정보를 말합니다.<br><br>
제5조 (회사의 의무)<br>
1. "회사"는 "서비스" 제공과 관련하여 인지한 "이용자"의 "본인확인정보"를 본인의 승낙 없이 제3자에게 누설하거나 배포하지 않습니다. 단, 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있는 경우 등 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우에는 그러하지 않습니다.
2. "회사"는 "이용자"에게 안전한 "서비스" 제공을 위하여 지속적으로 "서비스"의 예방점검, 유지보수 등을 이행하며, "서비스"의 장애가 발생하는 경우, 이를 지체 없이 수리 및 복구합니다.
3. "회사"는 "이용자"가 제기한 의견, 불만이 타당하다고 인정되는 경우 적절한 절차를 거쳐 이를 지체 없이 처리하거나 처리에 관한 일정을 통지하여야 합니다.
4. "회사"는 접근매체의 발급 주체가 아닌 경우에는 접근 매체의 위조나 변조로 발생한 사고로 인하여, "이용자"에게 발생한 손해에 대하여 배상책임이 없습니다.<br><br>
제6조 (이용자의 의무)<br>
1. "이용자"는 "서비스"를 이용함에 있어서 다음 각호에 해당하는 행위를 하여서는 안되며, "회사"는 위반 행위에 따르는 일체의 법적 책임을 지지 않습니다.
1) 타 "이용자"의 "본인확인정보"를 부정하게 사용 및 도용하는 행위
2) "회사"의 저작권, 제3자의 저작원 등 기타 권리를 침해하는 행위
3) 범죄 행위
4) 기타 관련 법령에 위배되는 행위
2. "이용자"는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근 매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.
3. "이용자"는 본 약관에서 규정하는 사항과 "서비스"에 대한 이용안내 또는 주의사항을 준수하여야 합니다.
제7조 (서비스의 내용)<br>
1. "서비스"는 "이용자"가 주민등록번호의 입력 없이, 본인명의로 된 인증수단(휴대폰 등)을 이용하여 본인 확인이 가능한 인증 서비스 입니다.
2. "인터넷사업자"는 회원가입, ID/PW찾기, 성인인증, 기타 본인확인이 필요한 컨텐츠 요청 시 "이용자"에게 "서비스"를 제공 합니다.
3. "이용자"는 자신의 생년월일, 성명, 성별, 내/외국인, 휴대폰번호, 통신사 등의 정보를 입력 후, 입력한 정보가 일치한 경우 해당 휴대폰번호로 1회성 비밀번호(승인번호)가 발송되며, 수신된 승인번호를 정확하게 입력하는 것으로 본인 확인이 이루어 집니다.<br>
                   
			</p>
			 </div>
		</form>
	
		<div style="padding-top:40px;font-size:18px;"><b>인증정보 입력</b></div>
		<hr>
		
 <form style="margin-left: 40px;">
        <ul id="mleft">
            이름: <input type="text" value="">
        </ul>
        <ul id="mleft">주민등록번호: <input type="number"> - <input type="number">
        </ul >
        <ul id="mleft">
           이메일
           
                <input  type="text" style="width:140px;"> <button type="submit" id="verifi">인증하기</button>
      
        </ul>
        <ul id="mleft">
           인증번호: <input type="number">
        </ul>
        
        
        <button  type="submit" style="background:#ffc107; lightgray;color:white;font-weight:bold;width: 100px;height: 40px;border-radius: 4px;float:right;text-align:center;margin-top: 5%;margin-right: 50%;margin-left: -40;margin-left: -41;">등록</button>
		<button  type="submit" style="background: lightgray;color:white;font-weight:bold;width: 100px;height: 40px;border-radius: 4px;float:right;text-align:center;margin-top: 5%;margin-right: -25%;margin-left: 0px;">취소</button>

	
    </form>
		
		
		
		
	 </div>
	 
</body>
</html>