
var idCheck = false;
var pwCheck = false;
var emailCheck = false;
var nameCheck = false;

$(document).ready(function(){
	
	
	//id check
	$('#id').blur(function(){
		var id = $('#id').val();
		var msg = '';
		if( id != null ){
			$.ajax({
				url :'CheckIdEmail',
				type : 'POST',
				data :{ 'idEmail' : id },
				dataType : 'text',
				success	:function(data){
					if( data == 1 ) msg = "중복입니다. 다시 작성해주십시오.";
					else if( data == 2 ) msg = "사용 가능합니다.";
					$('#idCheckDiv').html( msg );
					idCheck = true;
					console.log('id'+idCheck+" : "+msg);
				},
				error:function(err){ console.log("에러발생"); }
			});
		}
	});
	
	//email check 이메일 형식 제한 필요하다고 생각
	$('#email').blur(function(){
		var email = $('#email').val();
		var msg = '';
		if( email != null ){
			$.ajax({
				url :'CheckIdEmail',
				type : 'POST',
				data :{ idEmail : email },
				dataType : 'text',
				success	:function(data){
					if( data == 1 ) msg = "중복입니다. 다시 작성해주십시오.";
					else if( data == 2 ) msg = "사용 가능합니다.";
					$('#emailCheckDiv').html( msg );
					emailCheck = true;
					console.log('email'+emailCheck);
				},
				error:function(err){ console.log("에러발생"); }
			});
		}
	});
	
	$('#name').blur(function(){
		var name = $('#name').val();
		if( name != null ){
			nameCheck = true;
			console.log('name'+nameCheck);
		}
	});
	
	//pw check
	$('#pw2').blur(function(){
		var pw1 = $('#pw1').val();
		var pw2 = $('#pw2').val();
		var msg = '';
		
		if( pw1 == pw2 ){
			if( pw1.length >= 10 ){ //이후 10자 이상으로 수정 요망
				msg = "비밀번호가 일치합니다.";
				pwCheck = true;
				console.log('pw'+pwCheck);
			}
		}else
			msg = "비밀번호가 일치하지 않습니다.";
		$('#pwCheckDiv').html(msg);
	});
	
	
	$('#bt_join').on('click', function(){
		var id = $('#id').val();
		var pw1 = $('#pw1').val();
		var pw2 = $('#pw2').val();
		var email = $('#email').val();
		var name = $('#name').val();
		
		if( id != '' && pw1 != '' && pw2 != '' && email != '' && name != ''){
			console.log(id + pw1 + email + company);
			join();
		}else
			alert("필수 입력 사항을 모두 기재해 주십시오.");
	})//join
});


function join(){
	if( idCheck && pwCheck && emailCheck && nameCheck ){
		var id = $('#id').val();
		var pw = $('#pw1').val();
		var email = $('#email').val();
		var name = $('#name').val();
		var nickname = $('#nickname').val();
		var company = $('#company').val();
		
		console.log(id + pw + email + company);
		
		if( nickname == '' ){
			nickname = name;
		}
		
		$.ajax({
			url :'join',
			type : 'POST',
			data : {
				id : id,
				pw : pw,
				email : email,
				name : name,
				nickname : nickname,
				company : company
			},
			success : function( data ){ 
				alert('회원가입을 축하드립니다. 로그인을 해 주십시오.');
				location.replace("home");
			},
			error : function( err ){ $('#errpage').html( JSON.stringify(err) ); }
		});
	}else{
		alert("폼을 다시 확인해 주십시오.");
		
	}
}//join()
