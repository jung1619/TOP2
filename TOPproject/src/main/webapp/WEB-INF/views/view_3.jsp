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
	
		<script type="text/javascript">
			var myId = '<%=(String)session.getAttribute("loginedId")%>';
			
			$(function (){
				
				connect();
				
				$("#send").on("click",function(){
					sendMessage();
				})		
				
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
						if( data.id == myId ){
							$('#chatLogView').append('<div class="mine">'+data.message+"</div><br>");
						}else
							$('#chatLogView').append('<div class="other">'+data.nickName+ "님 ->"+data.message+"</div><br>");
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
						
						
						
						/*
						setTimeout(function() {
							var pre = CKEDITOR.instances.editor1.getData();
							console.log('가져온 현재 : '+pre);
							console.log('가져온 디비 : '+data.context);
							
							if( pre != data.context ){ //계속해서 입력했다는 뜻
								console.log('그녀는 계속 입력을 했었다는 것이다는 것이다');
							}else{ //마지막 입력 후 3초가 지났음
								editor.setData( data.context );
								console.log('----------------------------------------------');
							}
						}, 3000);
						*/
						
						//editor.insertHtml( data.context );
						//.document.getBody().setHtml나 setData나..똑같아..커서문제..
						
						//config.extraPlugins = 'liveedit';
					});
				});
			}
			
			
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

<body>
	
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
			</div>
			
			<div class="outer_chatEditor">
				<div class="chatEditor_menubar">
					<!-- if sessionScope.ID == P_M_ID -->
					<button type="button" class="test">notice</button>
					<button type="button">forceout</button>
					
					<button type="button">memberList</button>
				</div>
				
				<div class="chatEditor_textView">
					<textarea rows="5" cols="44" id="message" class="message"></textarea><br>
					<input type="button" value="SEND" id="send" class="send">
				</div>
				
			</div>
			
		</div>
	
	</div>
</body>
</html>