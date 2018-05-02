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
			
			editor.on("instanceReady", function(){
				this.document.on("keyup", function(){
					sendContext();
				});
			});
			
			
			//파일 저장부
		 	$('.makedocs').on('click',function() {
				/* if (confirm('DOCX 파일로 저장하시겠습니까?')) { */
				var data = CKEDITOR.instances.editor1.getData();
				var p_num = document.getElementById('p_num').value;
					$.ajax({
						url : 'makedocx'
						, type : 'post'
						, data : {
							textt : data,
							p_num : p_num
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
	           /*  } */
			}); 
			
			$('.makePDF').on('click',function() {
				/* if (confirm('PDF 파일로 저장하시겠습니까?')) { */
				var data = CKEDITOR.instances.editor1.getData();
				var p_num = document.getElementById('p_num').value;
				$.ajax({
					url : 'makePDF'
					, type : 'post'
					, data : {
						textt : data,
						p_num : p_num
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
				/* } */
			}); 
			
			
		});
		
		/* 추가 */
		function sendContext(){
			var data1 = CKEDITOR.instances.editor1.getData();
			
			var c_num = $('#c_num').val();
			console.log(c_num);
			
			
			
			if(c_num==''){
				console.log("c_num이 없어");
				$("#c_num").remove();
				$("#c_numDiv").html("<input type='hidden' id='c_num' value='0'/>");
			}else{
				$.ajax({
					url : 'personalSave'
					, type : 'POST'
					, data : {
						context : data1
						,c_num : c_num
					}
					, dataType : 'json'
					,success : function(context) {
						console.log(context.c_num);
						$('#c_num').remove();
						$("#c_numDiv").html("<input type='text' id='c_num' value='"+context.c_num+"'/>");
					}
					, error : function(context) {
						console.log("실패");
					}
				});
				
			}
			
		}
			/* old 추가 
			function sendContext(){
				var context = CKEDITOR.instances.editor1.getData();
				console.log('지금 여기~~~~'+myId);
				stompClient.send("/chat/${p_num}/context",{}, JSON.stringify({
					context :context,
					writer: myId
					})
				);
				console.log('컨컨컨컨컨텍텍텍텍-----------'+myId);
			}*/
			
			
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
	<input type="hidden" id="p_num" value="${p_num}">
	<textarea name="text" id="editor1">
		
		${content}
		
	</textarea>
	<input class="makedocs btn btn-primary btn-md" type="button" value="DOCX 파일로 저장">
	<input class="makePDF btn btn-primary btn-md" type="button" value="PDF 파일로 저장">

	</div>
	
	<%@include file="editorSetting.jsp" %>
	
	<div id="c_numDiv">
	<input type="hidden" id="c_num" value=''>
	
	</div>
	
</html>

