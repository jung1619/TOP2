function loadList_pj(){
	$.ajax({
		url : 'fileList_pj',
		type : 'POST',
		dataType : "json",
		data : { p_num : 44 },
		success : function( data ){
			fileList = data;
			var content = '';
			
			for( var i in fileList )
				content += '<tr>';
				content += '<td>'+ (i+1) +'</td>';
				content += '<td><a href="readFile?c_num='+ fileList[i].c_num +'">'+ fileList[i].title +'</a></td>';
				content += '<td>'+ fileList[i].writer +'</td>';
				content += '<td>'+ fileList[i].indate +'</td>';
				content += '</tr>';
			$("#filelistArea").append(content);
		},
		error : function( err ){ $("#errArea").html( JSON.stringify(err) ); }
	});
}


function loadList_ps(){
	$.ajax({
		url : 'fileList_ps',
		type : 'POST',
		data : { myId : loginedId },
		dataType : "json",
		success : function( data ){
			fileList = data;
			var content = '^^';
			
			for( var i in fileList )
				content += '<tr>';
				content += '<td>'+ (i+1) +'</td>';
				content += '<td><a href="readFile?c_num='+ fileList[i].c_num +'">'+ fileList[i].title +'</a></td>';
				content += '<td>'+ fileList[i].indate +'</td>';
				content += '</tr>';
			$("#filelistArea").append(content);
		},
		error : function( err ){ $("#errArea").html( JSON.stringify(err) ); }
	});
}