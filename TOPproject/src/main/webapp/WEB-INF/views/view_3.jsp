<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
	<head>
		<title>conference</title>
		
		<link rel="stylesheet" type="text/css" href="resources/css/view_3.css">
		<link rel="stylesheet" type="text/css" href="resources/css/conference.css">
			
		<script type="text/javascript" src="<c:url value='resources/js/jquery-3.2.1.js'/>"></script>
		<script type="text/javascript" src="<c:url value='resources/js/sockjs.js'/>"></script>
		<script type="text/javascript" src="<c:url value='resources/js/stomp.js'/>"></script>
	
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	
		<!-- css 추가부분 -->
		<script src="https://medialoot.com/preview/lumino/js/chart.min.js"></script>
		<script src="https://medialoot.com/preview/lumino/js/chart-data.js"></script>
		<script src="https://medialoot.com/preview/lumino/js/easypiechart.js"></script>
		<script src="https://medialoot.com/preview/lumino/js/easypiechart-data.js"></script>
		<script src="https://medialoot.com/preview/lumino/js/bootstrap-datepicker.js"></script>
		<script src="https://medialoot.com/preview/lumino/js/custom.js"></script>
		<link rel="stylesheet" type="text/css" href="https://medialoot.com/preview/lumino/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="https://medialoot.com/preview/lumino/css/font-awesome.min.css" />
		<link rel="stylesheet" type="text/css" href="https://medialoot.com/preview/lumino/css/datepicker3.css" />
		<link rel="stylesheet" type="text/css" href="./resources/css/customStyle.css" />
		<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" />
		
		<script type="text/javascript">
			var myId = '<%=(String)session.getAttribute("loginedId")%>';
			
			$(function (){

				connect();
				
				$('#chatSave').on('click',function(){
					
					
					var chat_log  =  $('#chatLogView').html();
					alert(chatSave);
					
					
					$.ajax({
						url : 'saveChat'
						,type: 'post'
						,dataType: 'text'
						,data : {
							chat_log : chat_log
							,p_num : ${p_num}
						}
						,success:function(data){
							if(data==1){
								
							console.log('채팅 저장완료');
							
							}
						}
						,error:function(err){
							console.log('채팅 저장실패');
						}
							
							
					});
					
				});

				
				
				
				
				$("#send").on("click",function(){
					sendMessage();
				});
				
				$("#message").keydown(function(event){
					if( event.keyCode == 13 ){
						sendMessage();
					}
				});
				
				document.onkeydown = function (event){
					if(event.keyCode==116
						||event.ctrlKey==true && (event.keyCode == 82)){
						
						disconnect();
						event.cancleBubble=true;
						event.returnValue=false;
						setTimeout(function(){
							window.location.reload();
						},100);
						return false;
					}
				}
			});
			
			var stompClient= null;
			
			function connect(){
				var socket = new SockJS('/TOPproject/endpoint');
				stompClient = Stomp.over(socket);
				stompClient.connect({},function(frame){
					
					stompClient.subscribe('/subscribe/chat/${p_num}',function(message){
						var data = JSON.parse(message.body);                                                                                                 
						if( data.id == myId )
							$('#chatLogView').append('<div class="mine">'+data.message+"</div><br>");
						else
							$('#chatLogView').append('<div class="other">'+data.nickName+ "님 ▶"+data.message+"</div><br>");
						$('#chatLogView').scrollTop(1000000);						
					});
					stompClient.subscribe('/subscribe/chat/${p_num}/context',function(context){
						//var editor = CKEDITOR.document.getById('editor1');
						var editor = CKEDITOR.instances.editor1;
						
						var data = JSON.parse(context.body);
						console.log('id체크' + data.writer +' // '+ myId);
						console.log("받아보자:"+data.context);
						
						if( data.writer == myId ){
							console.log(myId+'가 입력중');
						}else{
							console.log('나는 보는중');		
						}
						
						setTimeout(function() {
							if( data.writer != myId ){
								console.log('^^');
								editor.setData( data.context );								
							}
						}, 10);
						
					}); //stomp_context
				}); //stomp
			} //connect
			
			
			function sendMessage(){
				var str = $('#message').val();
					stt = str.replace(/ /gi, '&nbsp;')
					str = str.replace(/(?:\r\n|\r|\n)/g, '<br />');
					
					if(str.length>0){
						stompClient.send("/chat/${p_num}",{}, JSON.stringify({
									message :str	
						}));
					};
					$("#message").val("");
			}
		
		</script>
<style type="text/css">
.w3-top, .chatLogView{font-family: "Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;}
.w3-top{background-color:#1c213e !important;}
.shadow{    box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16), 0 2px 10px 0 rgba(0,0,0,0.12); padding:0px}
.nabi-col.s3 {width: 15%; float: left; }
.p3-block {
    display: block;
    width: 100%;
    height: 60px;
    font-size: 20px !important;
}
.nabi-button{
	border:none;
	display:inline-block;
	padding-top:16px;
	vertical-align:middle;
	overflow:hidden;
	text-decoration:none;
	color:inherit;
	background-color:inherit;
	text-align:center;
	cursor:pointer;
	white-space:nowrap;
	-webkit-touch-callout:none;
	-webkit-user-select:none;
	-khtml-user-select:none;
	-moz-user-select:none;
	-ms-user-select:none;
	user-select:none;
	white-space:normal;
	/* border-bottom: 1px solid white; */
 	transition: .7s ease-in-out; 
}
.site__title4{
	text-decoration:none !important;
    color: #ffffff !important;
    font-size: 16px !important;
}

.site__title6{
	text-decoration:none !important;
    color: #ffffff !important;
    font-size: 16px !important;
}
.logout{
    color: #ffffff !important;
    font-weight: bold;
}
.top{
	float:right;
	padding:16px;
	font-weight: lighter;
}
.site__title33{
	text-decoration:none !important;
    color: #ffffff;
    font-size: 25px;
}
</style>
</head>

<body>
<%@ include file="nabi-top2.jsp"  %>
	<div class="outer">
		
		<!-- EDITOR -->
		<div class="outer_editor">
			<%@include file="edit.jsp" %>
		</div>
		
		
		<!-- CHAT -->
		<div class="outer_chat">
			<!-- if !(NOTICE.isempty) && STATUS == NOTICE on -->
			<div class="notice">
				<div class="notice_content">
					<!-- content -->
				</div>
				<div class="notice_btn">
					<button type="button">close</button>
					<button type="button">folding</button>
				</div>
			</div>
			
			
			<div class="chatLogView" id="chatLogView">
			${chat}
			</div>
			
			<div class="outer_chatEditor">
				<div class="chatEditor_menubar">
					<!-- if sessionScope.ID == P_M_ID -->
					<button type="button" class="test">notice</button>
					<button type="button">forceout</button>
					
					<button type="button" id="chatSave">chat save</button>
				</div>
				
				<div class="chatEditor_textView">
					<textarea id="message" class="message form-controlp" style="resize: none; width:290px; height:90px;"></textarea><br>
				</div>
				<input type="button" value="SEND" id="send" class="send btn btn-primary btn-md" style="width:304px">
				
			</div>
			
		</div>
	
	</div>
</body>
</html>

<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
	<head>
		<title>conference</title>
		
		<link rel="stylesheet" type="text/css" href="resources/css/view_3.css">
		<link rel="stylesheet" type="text/css" href="resources/css/conference.css">
			
		<script type="text/javascript" src="<c:url value='resources/js/jquery-3.2.1.js'/>"></script>
		<script type="text/javascript" src="<c:url value='resources/js/sockjs.js'/>"></script>
		<script type="text/javascript" src="<c:url value='resources/js/stomp.js'/>"></script>
	
 		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

		<!-- css 추가부분 -->
 		<script src="https://medialoot.com/preview/lumino/js/chart.min.js"></script>
		<script src="https://medialoot.com/preview/lumino/js/chart-data.js"></script>
		<script src="https://medialoot.com/preview/lumino/js/easypiechart.js"></script>
		<script src="https://medialoot.com/preview/lumino/js/easypiechart-data.js"></script>
		<script src="https://medialoot.com/preview/lumino/js/bootstrap-datepicker.js"></script>
		<script src="https://medialoot.com/preview/lumino/js/custom.js"></script>
		<link rel="stylesheet" type="text/css" href="https://medialoot.com/preview/lumino/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="https://medialoot.com/preview/lumino/css/font-awesome.min.css" />
		<link rel="stylesheet" type="text/css" href="https://medialoot.com/preview/lumino/css/datepicker3.css" />
		<link rel="stylesheet" type="text/css" href="./resources/css/customStyle.css" />
 		<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" />
 
		<script type="text/javascript">
			var myId = '<%=(String)session.getAttribute("loginedId")%>';
			
			$(function (){
				
				connect();
				
				$('#chatSave').on('click',function(){
					
					
					var chat_log  =  $('#chatLogView').html();
					alert(chatSave);
					
					
					$.ajax({
						url : 'saveChat'
						,type: 'post'
						,dataType: 'text'
						,data : {
							chat_log : chat_log
							,p_num : ${p_num}
						}
						,success:function(data){
							if(data==1){
								
							console.log('채팅 저장완료');
							
							}
						}
						,error:function(err){
							console.log('채팅 저장실패');
						}
							
							
					});
					
				});
				
				$("#send").on("click",function(){
					sendMessage();
				});
				
				$("#message").keydown(function(event){
					if( event.keyCode == 13 ){
						sendMessage();
					}
				});
				
				document.onkeydown = function (event){
					if(event.keyCode==116
						||event.ctrlKey==true && (event.keyCode == 82)){
						
						disconnect();
						event.cancleBubble=true;
						event.returnValue=false;
						setTimeout(function(){
							window.location.reload();
						},100);
						return false;
					}
				}
			});
			
			var stompClient= null;
			
			function connect(){
				var socket = new SockJS('/TOPproject/endpoint');
				stompClient = Stomp.over(socket);
				stompClient.connect({},function(frame){
					
					stompClient.subscribe('/subscribe/chat/${p_num}',function(message){
						var data = JSON.parse(message.body);                                                                                                 
						if( data.id == myId )
							$('#chatLogView').append('<div class="mine">'+data.message+"</div><br>");
						else
							$('#chatLogView').append('<div class="other">'+data.nickName+ "님 ->"+data.message+"</div><br>");
						$('#chatLogView').scrollTop(1000000);
					});
					stompClient.subscribe('/subscribe/chat/${p_num}/context',function(context){
						//var editor = CKEDITOR.document.getById('editor1');
						var editor = CKEDITOR.instances.editor1;
						
						var data = JSON.parse(context.body);
						console.log('id체크' + data.writer +' // '+ myId);
						console.log("받아보자:"+data.context);
						
						if( data.writer == myId ){
							console.log(myId+'가 입력중');
						}else{
							console.log('나는 보는중');		
						}
						
						setTimeout(function() {
							if( data.writer != myId ){
								console.log('^^');
								editor.setData( data.context );								
							}
						}, 10);
						
					}); //stomp_context
				}); //stomp
			} //connect
			
			
			function sendMessage(){
				var str = $('#message').val();
					stt = str.replace(/ /gi, '&nbsp;')
					str = str.replace(/(?:\r\n|\r|\n)/g, '<br />');
					
					if(str.length>0){
						stompClient.send("/chat/${p_num}",{}, JSON.stringify({
									message :str	
						}));
					};
					$("#message").val("");
			}
		
		</script>
</head>
<style type="text/css">
/* .w3-top, .chatLogView{font-family: "Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;}
 */.w3-top{background-color:#1c213e !important;}
.shadow{    box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16), 0 2px 10px 0 rgba(0,0,0,0.12); padding:0px}
.nabi-col.s3 {width: 15%; float: left; }
.p3-block {
    display: block;
    width: 100%;
    height: 60px;
    font-size: 20px !important;
}
.nabi-button{
	border:none;
	display:inline-block;
	padding-top:16px;
	vertical-align:middle;
	overflow:hidden;
	text-decoration:none;
	color:inherit;
	background-color:inherit;
	text-align:center;
	cursor:pointer;
	white-space:nowrap;
	-webkit-touch-callout:none;
	-webkit-user-select:none;
	-khtml-user-select:none;
	-moz-user-select:none;
	-ms-user-select:none;
	user-select:none;
	white-space:normal;
	/* border-bottom: 1px solid white; */
 	transition: .7s ease-in-out; 
}
.site__title4{
	text-decoration:none !important;
    color: #ffffff !important;
    font-size: 16px !important;
}

.site__title6{
	text-decoration:none !important;
    color: #ffffff !important;
    font-size: 16px !important;
}
.logout{
    color: #ffffff !important;
    font-weight: bold;
}
.top{
	float:right;
	padding:16px;
	font-weight: lighter;
}
.site__title33{
	text-decoration:none !important;
    color: #ffffff;
    font-size: 25px;
}
</style>
<body>
<%@ include file="nabi-top2.jsp"  %>
	<div class="outer">
		
		<!-- EDITOR -->
		<div class="outer_editor">
			<%@include file="edit.jsp" %>
		</div>
		
		
		<!-- CHAT -->
		<div class="outer_chat">
			<!-- if !(NOTICE.isempty) && STATUS == NOTICE on -->
			<div class="notice">
				<div class="notice_content">
					<!-- content -->
				</div>
				<div class="notice_btn">
					<button type="button">close</button>
					<button type="button">folding</button>
				</div>
			</div>
			
			
			<div class="chatLogView" id="chatLogView">
			${chat}
			</div>
			
			<div class="outer_chatEditor">
				<div class="chatEditor_menubar">
					<!-- if sessionScope.ID == P_M_ID -->
					<button type="button" class="test">notice</button>
					<button type="button">forceout</button>
					
					<button type="button" id="chatSave">chat save</button>
				</div>
				
				<div class="chatEditor_textView">
					<textarea id="message" class="message form-controlp" style="resize: none; width:290px; height:90px;"></textarea><br>
				</div>
				<input type="button" value="SEND" id="send" class="send btn btn-primary btn-md" style="width:304px">
				
			</div>
			
		</div>
	
	</div>
</body>
</html> --%>