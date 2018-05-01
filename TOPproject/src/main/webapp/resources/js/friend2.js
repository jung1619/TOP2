function load_friendList(){
	console.log('친구 목록');
	var flList = [];
	
	$.ajax({
		url : "loadFL",
		type : 'POST',
		dataType : "json",
		data : { id : loginedId },
		success : function( data ){
			flList = data;
			var content = '';
			
			for( var i in flList )
				content += '<tr><td>'+ flList[i] +'</td><td><input type="button" onclick="" value="삭제"></td></tr>';
			$("#flTable").append(content);
		},
		error : function( err ){ $("#errArea").html( JSON.stringify(err) ); }
	});
} //load_friendList


// 보낸 친구 요청 목록
function load_friendReq(){
	console.log('보낸 친구 요청 목록');
	$.ajax({
		url : "searchReqList",
		type : 'POST',
		dataType : "json",
		data : { who : 'requester', myId : loginedId },
		success : function( data ){
			var content = '';
			$("#reqTable_req").html(content);
			
			for( var i in data ){
				content += '<tr><td>'+ data[i].RECEIVER;
				content += '</td><td><input type="button" onclick="task_2(\''+data[i].RECEIVER+'\')" value="취소"></td></tr>';
			}
			$("#reqTable_req").append(content);
		},
		error : function( err ){ $("#errArea").html( JSON.stringify(err) ); }
	});
} //load_friendReq


//받은 친구 요청 목록
function load_friendRec(){
	console.log('받은 친구 요청 목록');
	$.ajax({
		url : "searchReqList",
		type : 'POST',
		dataType : "json",
		data : { who : 'receiver', myId : loginedId },
		success : function( data ){
		//	reqList = JSON.stringify(data);
			var content = '';
			$("#reqTable_rec").html(content);
			
			for( var i in data ){
				content += '<tr><td>'+ data[i].REQUESTER;
				content += '</td><td><input type="button" onclick="task_3(\''+data[i].REQUESTER+'\')" value="수락"></td>';
				content += '</td><td><input type="button" onclick="task_4(\''+data[i].REQUESTER+'\')" value="거절"></td></tr>';
			}
			$("#reqTable_rec").append(content);
		},
		error : function( err ){ $("#errArea").html( JSON.stringify(err) ); }
	});
} //load_friendRec


function searchId(){
	console.log('id 검색');
	var id = $("#searchId").val();
	
	$.ajax({
		url : "searchUserList",
		type : 'POST',
		dataType : "json",
		data : { id : id },
		success : function( data ){
			var content = '';
			$("#searchedIds").html(content);
			
			for( var i in data ){ 
				var flag = 'request';
				content += '<tr><td>'+ i + " / ";
				content += data[i].id;
				content += '</td><td><input type="button" onclick="task_1(\''+data[i].id+'\')" value="친구 요청"></td></tr>';
			}
			$("#searchedIds").append(content);
		},
		error : function( err ){ $("#errArea").html( JSON.stringify(err) ); }	
	});
} //searchId



// 친구 요청 보내기
function task_1( herId ){
	console.log('친구 요청');
	var ment = '에게 친구 요청을 보내시겠습니까?';
	var uurl = 'insertReq';
	var suc = function(){ 
		var content = '';
		content += '<tr><td>'+ herId;
		content += '</td><td><input type="button" onclick="" value="취소"></td></tr>';
		$("#reqTable_req").append(content);
	};
	task_0( herId, ment, uurl, suc );
}

function task_2( herId ){
	console.log('요청 취소');
	var ment = '에게 보낸 친구 요청을 취소하시겠습니까?';
	var uurl = 'deleteReq';
	var suc = function(){ location.reload(); };
	task_0( herId, ment, uurl, suc );
}


//task_1,2 -- 요청, 취소
function task_0( herId, ment, uurl, suc ){
	
	if( confirm( herId + ment ) ){		
		$.ajax({
			url : uurl,
			type : "POST",
			data : { myId : loginedId, herId : herId },
			success : suc,
			error : function( err ){ alert(url); $("#errArea").html( JSON.stringify(err) ); }	
		});
	}
}


function task_3( herId ){
	console.log('요청 수락');
	var ment = '의 친구 요청을 수락하시겠습니까?';
	var uurl = 'updateReq';
	var flag = '1';
	task_6( herId, ment, uurl, flag );
}

function task_4( herId ){
	console.log('요청 거절');
	var ment = '의 친구 요청을 거절하시겠습니까?';
	var uurl = 'updateReq';
	var flag = '2';
	task_6( herId, ment, uurl, flag );
}

// task_3,4 -- 수락, 거절
function task_6( herId, ment, uurl, flag ){
	
	if( confirm( herId + ment ) ){
		$.ajax({
			url : uurl,
			type : "POST",
			data : { myId : loginedId, herId : herId, flag : flag },
			success : function(){ location.reload(); },
			error : function( err ){ alert(url); $("#errArea").html( JSON.stringify(err) ); }	
		});
	}else{ location.reload(); }
}


function task_5( herId ){
	var ment = '을 친구 목록에서 삭제하시겠습니까?';
}
