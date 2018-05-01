function loadList(){
	$.ajax({
		url : 'fileList_pj',
		type : 'POST',
		data : { myId : loginedId },
		dataType : "json",
		data : { p_num : 44 },
		success : function( data ){
			fileList = data;
			var content = '';
			
			for( var i in fileList )
				content += '<tr>';
				content += '<td>'+ (i+1) +'</td>';
				content += '<td>'+ fileList[i].title +'</td>';
				content += '<td>'+ fileList[i].indate +'</td>';
				content += '</tr>';
			$("#filelistArea").append(content);
		},
		error : function( err ){ $("#errArea").html( JSON.stringify(err) ); }
	});
}