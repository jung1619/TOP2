$(function() {
	
	$("#loginID").keyup(function(e) {
		reg = /[ㄱ-ㅎA-Z]/g;
        v = $(this).val();
        if( reg.test(v) ) {
        	console.log( reg.test(v) );
            $(this).val(v.replace(reg, ''));
            $(this).focus();
        }
	});
	$("#loginPW").keyup(function(e) {
		reg = /[ㄱ-ㅎA-Z]/g;
        v = $(this).val();
        if( reg.test(v) ) {
        	console.log( reg.test(v) );
            $(this).val(v.replace(reg, ''));
            $(this).focus();
        }
	});
	
}); //ready


function formCheck(){
	var id = $("#loginID").val();
	var pw = $("#loginPW").val();

	if( (id != '') && (pw != '') ){
		return true;
	}
	else
		alert('아이디와 비밀번호를 모두 입력해주십시오.'); return false;
}