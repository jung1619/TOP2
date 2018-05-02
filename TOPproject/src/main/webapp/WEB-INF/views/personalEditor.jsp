<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PERSONAL EDITOR</title>


</head>
<body>
<div class="title"> </div>
<div class="outer_editor">
<%@include file="edit.jsp" %>
<input type="button" value="저장" id="save" name="save">
</div>

<div class="list">
		<p>파일 list</p>
		<c:forEach var = "context" items="${c_list }">
			<div class="context">
			<input type="button" value="${context.indate}" data="${context.c_num}" class="loadContext">
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

</script>

</body>
</html>