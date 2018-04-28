$(function(){
	$('#searchBtn').on('click', function(){
		searchId();
	});
	
});

$(function(){
	$('#addBtn').on('click', function(){
		alert('친구추가 하시겠습니까?');
		addFriend();
	});
});

function searchId(){
	var searchId = $('#searchId').val();
	
	if(searchId != ''){
		$.ajax({
			url : 'idSearch',
			type : 'POST',
			data : {
				'searchId' : searchId,
			},
			dataType : 'text',
			success : function(result){
				console.log(result);
				if(result != 'failed'){
					$('#idSearchDiv').html(result);
				}
				else if(result == 'failed'){
					alert("ID를 다시 확인해 주십시오.");
				}
			},
			error : function(err){
				console.log("에러발생");
			}
		});
	} else{
		alert("아이디를 다시 확인해 주십시오.");
	}
}

function addFriend() {
	var searchId = $('#searchId').val();
	
	if(searchId != ''){
		$.ajax({
			url : 'friendAdd',
			type : 'POST',
			data : {
				'searchId' : searchId,
			},
			dataType : 'text',
			success : function(result){
				$('#addedFriendDiv').html(result+"");
				console.log(result);
			},
			error : function(err){
				console.log("에러발생");
			}
		});
	} else{
		alert("아이디를 다시 확인해 주십시오.");
	}
	
}

