<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="custom.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>

.chat-main{

	width: 1000px;
	right: 1500px;
}
.header-one{
	background: #404040;
}
.name h6{
	display: inline-block;
	font-size: 14px;
}
.options i,.options .arrow-up{
	height: 25px;
	width: 25px;
}
.options i{
	color: #B2B2B2;
	font-size: 16px;
	cursor: pointer;
}
.options .hover:hover, .options .arrow-up:hover{
	background: #737373;
}
.options .arrow-up{
    display: inline-block;
    line-height: 0;
}
.options .hover:hover, .options .arrow-up:hover .fa-arrow-up{
	color: #fff;
}
.options .fa-arrow-up{
	transform: rotate(40deg);
}
.header-two{
	border-top: 2px solid #35AC19;
	background: #ECEFF1;
	color: #5E6060;
	padding: 8px 0px 4px 8px;
	box-shadow: 0px 6px 13px -7px #c1c1c1;
	z-index: 1000;
    position: absolute;
}
.options-left i, .options-right i{
	font-size: 20px;
	cursor: pointer;
}
.options-left i:hover, .options-right i:hover{
	color: #000;
}
.chats{
	height: 285px;
	overflow-x: scroll;
	overflow-x: hidden;
	background: #ECEFF1;
	position: relative;
    top: 35px;
}
.chats ul li{
	display: inline-block;
	list-style: none;
	clear: both;
	font-size: 13px;
}
.send-msg{
	position: relative;
}
.send-msg:after{
	content: "";
	width:0;
	height:0;
	top: 0px;
	right: -8px;
	position: absolute;
	border-top: 8px solid #CFD8DC;
	border-left: 8px solid transparent;
	border-right: 8px solid transparent;
}
.send-msg p{
	background: #CFD8DC;
}
.sender-img{
	display: inline;
}
.sender-img img{
	width: 32px;
	height: 32px;
	border-radius: 100%;
}
.receive-msg .receive-msg-desc{
	display: inline-block;
	position: relative;
}
.receive-msg-desc:before{
	content: "";
	width:0;
	height:0;
	top: 0px;
	left: -8px;
	position: absolute;
	border-top: 8px solid #fff;
	border-left: 8px solid transparent;
	border-right: 8px solid transparent;
}
.receive-msg-time,.send-msg-time{
	color: #7D7E87;
	font-size: 10px;
}
.receive-msg-time i{
	font-size: 4px;
}
.msg-box{
	margin-top: 35px;
}
.msg-box i{
	color: #404040;
}
.msg-box input{
	font-size: 14px;
}
.msg-box input:focus{
	outline: none;
}




</style>
<body>
	<!-- 상단 메뉴바 include -->
	<%@ include file="../common/menubar.jsp" %>
	
   <div class="container">
        <div class="row pt-3">
            <div class="chat-main">
                <div class="col-md-12 chat-header">
                    <div class="row header-one text-white p-1">
                        <div class="col-md-6 name pl-2">
                            <i class="fa fa-comment"></i>
                            <h6 class="ml-1 mb-0">BBC Chat</h6>
                        </div>
                        <div class="col-md-6 options text-right pr-0">
                            <i class="fa fa-window-minimize hide-chat-box hover text-center pt-1"></i>
                            <p class="arrow-up mb-0">
                                <i class="fa fa-arrow-up text-center pt-1"></i>
                            </p>
                            <i class="fa fa-times hover text-center pt-1"></i>
                        </div>
                    </div>
                    <div class="row header-two w-100">
                        <div class="col-md-6 options-left pl-1">
                        </div>
                        <div class="col-md-6 options-right text-right pr-2">
                            <i class="fa fa-cog"></i>
                        </div>
                    </div>
                </div>

                <div class="chat-content">
                    <div class="col-md-12 chats pt-3 pl-2 pr-3 pb-3">
                        <ul class="p-0">
                            <li class="send-msg float-right mb-2">
                                <p class="pt-1 pb-1 pl-2 pr-2 m-0 rounded">
                                    Hii
                                </p>
                            </li>
                            <li class="receive-msg float-left mb-2">
                                <div class="sender-img">
                                    <img src="http://nicesnippets.com/demo/image1.jpg" class="float-left">
                                </div>
                                <div class="receive-msg-desc float-left ml-2">
                                    <p class="bg-white m-0 pt-1 pb-1 pl-2 pr-2 rounded">
                                        hiii <br>    
                                        How are you ?<br>
                                    </p>
                                    <span class="receive-msg-time">ketty, Jan 25, 6:20 PM</span>
                                </div>
                            </li>
                            <li class="send-msg float-right mb-2">
                                <p class="pt-1 pb-1 pl-2 pr-2 m-0 rounded">
                                    nice <br>
                                    Are you fine ?
                                </p>
                            </li>
                            <li class="receive-msg float-left mb-2">
                                <div class="sender-img">
                                    <img src="http://nicesnippets.com/demo/image1.jpg" class="float-left">
                                </div>
                                <div class="receive-msg-desc float-left ml-2">
                                    <p class="bg-white m-0 pt-1 pb-1 pl-2 pr-2 rounded">
                                        Yes always
                                    </p>
                                </div>
                            </li>
                            <li class="send-msg float-right mb-2">
                                <p class="pt-1 pb-1 pl-2 pr-2 m-0 rounded">
                                    <a href="https://nicesnippets.com/" class="text-dark rounded" target="_blank"><u>https://nicesnippets.com/</u></a>
                                </p>
                            </li>
                            <li class="send-msg float-right mb-2">
                                <p class="pt-1 pb-1 pl-2 pr-2 m-0 rounded">
                                    Byy
                                </p>
                                <span class="send-msg-time">1 min</span>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-12 p-2 msg-box border border-primary">
                        <div class="row">
                            <div class="col-md-1 options-left">
                                <i class="fa fa-smile-o"></i>
                            </div>
                            <div class="col-md-9 pl-0">
                                <input type="text" size="80" placeholder=" Send message" />
                            </div>
                            <div class="col-md-2 text-right options-right">
                                <i class="fa fa-picture-o mr-2"></i>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>	
	

</body>
</html>