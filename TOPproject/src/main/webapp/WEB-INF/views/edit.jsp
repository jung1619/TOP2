<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
	
	<!-- <script src="https://cdn.ckeditor.com/4.9.1/full-all/ckeditor.js"></script> -->
	<script type="text/javascript" src="<c:url value='resources/js/jquery-3.2.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
	<%-- <script type="text/javascript" src="<c:url value='/resources/ckeditor/samples/js/sample.js'/>"></script>
	<link rel="stylesheet" href='./resources/css/mystyles.css'/>
	<link rel="stylesheet" href='./resources/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css'/>
	<link rel="stylesheet" href='./resources/ckeditor/samples/css/samples.css'/>	 --%>
	
	
	<script type="text/javascript">
		
		/* 드디어 성공이다!!!!! */
		$(document).ready(function(){
			var editor = CKEDITOR.instances.editor1;
			//var editor = $('#editor1');
			
			/*
			editor.on( 'keyup', function( event ) {
			    alert( 't' );
			});
			editor.on('change',function(evt){
				sendContext();
			});*/
			
			
			
			editor.on("instanceReady", function(){
				this.document.on("keyup", function(){
					sendContext();
				});
			});
			
			
			//파일 저장부
			 	$('.makedocs').on('click',function() {
					var data = CKEDITOR.instances.editor1.getData();
					alert(data);
					$.ajax({
						url : 'makedocx'
						, type : 'post'
						, data : {
							textt : data
						}
						, contentType: "application/x-www-form-urlencoded; charset=UTF-8"
						, dataType : 'json'
						,success : function(e) {
							console.log(e);
							console.log(e.file);
							location.href=e.file;
						}
						, error : function(e) {
							console.log(e);
						}
					})  
				}); 
			
			
		});
		
		/* 추가 */
		function sendContext(){
			var context = CKEDITOR.instances.editor1.getData();
			console.log('지금 여기~~~~'+myId);
			stompClient.send("/chat/${p_num}/context",{}, JSON.stringify({
				context :context,
				writer: myId
				})
			);
			console.log('컨컨컨컨컨텍텍텍텍-----------'+myId);
		}
	</script>
	
	<style type="text/css">
	
		body {
			padding: 0px;
			display: flex;
			align-items: center;
			text-align: center;
		}
		
		.container {
			margin: 0 auto;
			padding: 0 auto;
		}
	
	</style>

	<div class="container">
	
	<form action="testUP" method="post" onsubmit="return test1()">
		<textarea name="text" id="editor1">
			
			${test}
			
		</textarea>
		<input type="submit" value="저장">
		<input class="makedocs" type="button" value="docs 파일로 저장">
		</form>
	</div>
	
	<%@include file="editorSetting.jsp" %>
	
</html>

