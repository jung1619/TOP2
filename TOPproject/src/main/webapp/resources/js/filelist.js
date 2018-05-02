function loadList_pj(){
	$.ajax({
		url : 'loadFileList_pj',
		type : 'POST',
		dataType : "json",
		data : { p_num : 44 },
		success : function( data ){
			console.log('프로젝트');
			fileList = data;
			var content = '';
			
			console.log( fileList );
			
			for( var i in fileList )
				content += '<tr>';
				content += '<td>'+ (i+1) +'</td>';
				content += '<td><a href="readFile_project?c_num='+ fileList[i].c_num +'">'+ fileList[i].title +'</a></td>';
				content += '<td>'+ fileList[i].writer +'</td>';
				content += '<td>'+ fileList[i].indate +'</td>';
				content += '</tr>';
			$("#fileListTable").append(content);
		},
		error : function( err ){ $("#errArea").html( JSON.stringify(err) ); }
	});
}


function loadList_ps(){
	$.ajax({
		url : 'loadFileList_ps',
		type : 'POST',
		data : { myId : loginedId },
		dataType : "json",
		success : function( data ){
			console.log('개인');
			fileList = data;
			var content = '';
			
			for( var i in fileList )
				content += '<tr>';
				content += '<td>'+ (i+1) +'</td>';
				content += '<td><a href="readFile_user?c_num='+ fileList[i].c_num +'">'+ fileList[i].title +'</a></td>';
				content += '<td>'+ fileList[i].indate +'</td>';
				content += '</tr>';
			$("#fileListTable").append(content);
		},
		error : function( err ){ $("#errArea").html( JSON.stringify(err) ); }
	});
}


function readFile(){
	$.ajax({
		url : '',
		type : 'POST',
		data : { myId : loginedId, c_num : c_num },
		dataType : "json",
		success : function( data ){
			fileList = data;
			var content = '<tr>';
			content += '<td>'+ data.writer +'</td>';
			content += '<td>'+ data.title +'</td>';
			content += '<td>'+ data.indate +'</td>';
			content += '</tr><tr>';
			content += '<td colspan="3">'+ data.context +'</td><tr>';
			content += '<td colspan="3">'+ '<input type="button" value="수정">';
			content += +'<input type="button" value="삭제"></td>';
			content += '</tr>';
			
			$("#fileContextTable").append(content);
		},
		error : function( err ){ $("#errArea").html( JSON.stringify(err) ); }
	});
}