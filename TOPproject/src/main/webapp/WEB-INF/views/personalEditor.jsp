<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PERSONAL EDITOR</title>
	
		<link rel="stylesheet" type="text/css" href="resources/css/view_3.css">
		<link rel="stylesheet" type="text/css" href="resources/css/conference.css">
			
		<script type="text/javascript" src="<c:url value='resources/js/jquery-3.2.1.js'/>"></script>
	
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	
		<!-- css 추가부분 -->
		<script src="https://medialoot.com/preview/lumino/js/chart.min.js"></script>
		<script src="https://medialoot.com/preview/lumino/js/chart-data.js"></script>
		<script src="https://medialoot.com/preview/lumino/js/easypiechart.js"></script>
		<script src="https://medialoot.com/preview/lumino/js/easypiechart-data.js"></script>
		<script src="https://medialoot.com/preview/lumino/js/bootstrap-datepicker.js"></script>
		<!-- <script src="https://medialoot.com/preview/lumino/js/custom.js"></script> -->
		<link rel="stylesheet" type="text/css" href="https://medialoot.com/preview/lumino/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="https://medialoot.com/preview/lumino/css/font-awesome.min.css" />
		<link rel="stylesheet" type="text/css" href="https://medialoot.com/preview/lumino/css/datepicker3.css" />
		<link rel="stylesheet" type="text/css" href="./resources/css/customStyle.css" />
		<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" />
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
<%@ include file="nabi-top2.jsp"%>
<div class="title"> </div>
<div class="outer_editor" style="margin-top:60px;">
<%@include file="edit.jsp" %>
<input type="button" value="セーブ" id="save" name="save">
</div>

<div class="list">
		<p>ファイルlist</p>
		<c:forEach var = "context" items="${c_list }">
			<div class="context">
			<input type="button" value="${context.indate}" data="${context.c_num}" class="loadContext btn btn-primary btn-md">
			</div>
		</c:forEach>
		

</div>

<!-- JS를 부득이하게 위치르 여기로 가져옴 -->
<script type="text/javascript">
	$('.loadContext').on('click',function(){
		
		var c_num = $(this).attr('data');
		alert(c_num);
		
		$.ajax({
			
			type:"POST"
				,url:"loadContext"
				,data : {
					c_num : c_num
				}
				,dataType : 'text'
				,success:function(context){
					console.log(context);
					
					var incontext = JSON.stringify(context);
					var editor = CKEDITOR.instances.editor1;
					editor.setData(context);
					
					
					console.log("불러오기 성공");
				}
				,error:function(context){
					console.log(JSON.stringify(context));
					console.log("불러오기 실패")
				}
			
		});
		
		
	});
	
	$('#save').on('click',function(){
		
		var data1 = CKEDITOR.instances.editor1.getData();
		alert(data1);
		
		$.ajax({
			type:"POST"
			,url:"personalSave"
			,data : {
				context : data1
			}
			,dataType : 'text'
			,success:function(data){
				console.log("저장 성공");
			}
			,error:function(err){
				console.log("저장 실패")
			}
			
		});
		
		
		
		$('#loadContext').on('click',function(){
			
			console.log("안들어와?")
			var loadContext = $('#"loadContext"').val();
			alert(loadContext);
			
			
		});
	});
	
	
	
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

</script>

</body>
</html>