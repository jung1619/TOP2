function load_friendList(){
	console.log('フレンドリスト');
	var flList = [];
	
	$.ajax({
		url : "loadFL",
		type : 'POST',
		dataType : "json",
		data : { myId : loginedId },
		success : function( data ){
			flList = data;
			var content = '';
			
			if( flList == null ){
				content += 'フレンドがないです。';
			}else{				
				for( var i in flList )
					content += '<tr><td>'+ flList[i] +'</td><td><input type="button" onclick="task_5(\''+flList[i]+'\')" value="削除"></td></tr>';
			}
			$("#flTable").append(content);
		},
		error : function( err ){ $("#errArea").html( JSON.stringify(err) ); }
	});
} //load_friendList


// 보낸 친구 요청 목록
function load_friendReq(){
	console.log('申し込み中のフレンドリスト');
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
				content += '</td><td><input type="button" onclick="task_2(\''+data[i].RECEIVER+'\')" value="キャンセル"></td></tr>';
			}
			$("#reqTable_req").append(content);
		},
		error : function( err ){ $("#errArea").html( JSON.stringify(err) ); }
	});
} //load_friendReq


//받은 친구 요청 목록
function load_friendRec(){
	console.log('申し込みもを貰ったリスト');
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
				content += '</td><td><input type="button" onclick="task_3(\''+data[i].REQUESTER+'\')" value="応諾"></td>';
				content += '</td><td><input type="button" onclick="task_4(\''+data[i].REQUESTER+'\')" value="拒絶"></td></tr>';
			}
			$("#reqTable_rec").append(content);
		},
		error : function( err ){ $("#errArea").html( JSON.stringify(err) ); }
	});
} //load_friendRec


function searchId(){
	console.log('ID検索');
	var id = $("#searchId").val();
	
	$.ajax({
		url : "searchUserList",
		type : 'POST',
		dataType : "json",
		data : { id : id, myId : loginedId },
		success : function( data ){
			var content = '';
			$("#searchedIds").html(content);
			
			for( var i in data ){ 
				if( data[i].id == loginedId ){
					content += '';
				}else{					
					content += '<tr><td><b>'+ (parseInt(i)+1) + "</b></td><td>";
					content += data[i].id;
					content += '</td><td><input type="button" onclick="task_1(\''+data[i].id+'\')" value="フレンド申し込み"></td></tr>';
				}
			}
			$("#searchedIds").append(content);
		},
		error : function( err ){ $("#errArea").html( JSON.stringify(err) ); }	
	});
} //searchId



// 친구 요청 보내기
function task_1( herId ){
	console.log('申し込み');
	var ment = 'に申し込みにをしますか?';
	var uurl = 'insertReq';
	var suc = function(){ location.reload(); };
	task_0( herId, ment, uurl, suc );
}


function task_2( herId ){
	console.log('申し込みキャンセル');
	var ment = 'への申し込みをキャンセルしますか?';
	var uurl = 'deleteReq';
	var suc = function(){ location.reload(); };
	task_0( herId, ment, uurl, suc );
}


function task_3( herId ){
	console.log('申し込み応諾');
	var ment = 'の申し込みを応諾しますか?';
	var uurl = 'addFriend';
	var suc = function(){ location.reload(); };
//	var flag = '1';
	task_0( herId, ment, uurl, suc );
}

function task_4( herId ){
	console.log('申し込み');
	var ment = 'の申し込みを拒絶しますか?';
	var uurl = 'deleteReq';
	var suc = function(){ location.reload(); };
//	var flag = '2';
	task_0( herId, ment, uurl, suc );
}


function task_5( herId ){
	var ment = 'をフレンドリストで削除しますか？';
	var uurl = 'deleteFriend';
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


/*
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
*/


