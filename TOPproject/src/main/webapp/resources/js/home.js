$(document).ready(function(){
	
	$('#loginPW').keypress(function(event){
		if( event.which == 13 ){
			login();
		}
	});
	$('#loginBtn').on('click', function(){
		login();
	});
		
});
	  
function login(){
	var id = $('#loginID').val();
	var pw = $('#loginPW').val();
			
	if( id != '' && pw != '' ){
		$.ajax({
			url : 'login',
			type : 'POST',
			data : { 
				'id' : id,
				'pw' : pw
			},
			dataType : 'text',
			success	: function(data){
				if( data == '1' )
					location.href = "group";
				else if( data == '2' )
					alert('입력하신 아이디와 비밀번호를 다시 확인해 주십시오.'); 
			},	
			error : function(err){ console.log("에러발생"); }
		});
	}else{
		alert("아이디와 비밀번호 모두 입력해 주십시오.");	
	}
}//login