$(function() {
    
	$( "#menu" ).menu({
	      items: "> :not(.ui-widget-header)"
	    });
	
	$( "#datepicker_start" ).datepicker({
		changeMonth: true,
		changeYear: true,
		dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		minDate: 0, 
        maxDate: "+100Y",
    	dateFormat: 'yy-mm-dd'
	});
	$( "#datepicker_end" ).datepicker({
		changeMonth: true,
		changeYear: true,
		dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		minDate: +1, 
        maxDate: "+100Y",
        dateFormat: 'yy-mm-dd'
	});
	
	
	var flList = [];
   	var index = 0;
   	
	$.ajax({
		url : "loadFL",
		type : "POST",
		dataType : "json",
		data : { myId : loginedId },
		success : function( data ){ 
			flList = data; 
			$('#fl').autocomplete({
				source : flList,
				minLength: 2,
			    select: function( event, ui ) { //값이 선택될 때 발생하는 이벤트 함수
			    	var selected = ui.item.value;
			    	var str = '<li><div id="'+index+'" onclick="check('+index+')">'+selected+'</div></li>';
			    	
			    	var check = addList(selected);
			    	if( check ){
			    		alert('이미 목록에 존재합니다.');
			    	}else{
				    	$('#menu').append(str);
				    	index++;			    		
			    	}
			    	$('#fl').empty(); //.val('');
			    }
			});
		},
		error : function( err ){ $('#errpage').html( JSON.stringify(err) ); }
	});//ajax
	
	
});

function create(){
	var name = $('#projacename').val();
	var memberlist = '';
	var startdate = $('#datepicker_start').val();
	startdate = parseInt(startdate.replace(/-/gi, ""));
	var enddate = $('#datepicker_end').val();
	enddate = parseInt(enddate.replace(/-/gi, ""));
	
	
	if( (name != '') && (memberList.length >= 1) && (startdate != '') && (enddate != '') ){
		if( startdate < enddate ){
			
			for( var i in memberList ){ 
				memberlist += ('/' + memberList[i]); 
			}
			
			if( (name != null) ){ //인원제한+시작일마감일
				$.ajax({
					url : 'createProject',
					type : "POST",
					data : {
						'name' : name, //인원, 시작일마감일
						'p_m_id' : loginedId,
						'memberlist' : memberlist,
						'startdate' : startdate + "000000",
						'enddate' : enddate + "235959"
					},
					success : function( data ){ 
						if( data == '1' ){							
							alert('프로젝트 생성이 완료되었습니다.');
							location.href = "personal";
						}else
							alert('프로젝트 생성에 실패하였습니다.');
					},
					error : function( err ){ $('#errpage').html( JSON.stringify(err) ); }
				});//ajax	
			}//if
			
		}else
			alert('프로젝트 기간 설정을 다시 선택해주십시오.');
	}else
		alert('내용을 모두 작성해주십시오.');
		
}//create()


function addList(selected){
	var flag = false;
	
	for(var i in memberList){ 
		if( memberList[i] == selected )
			flag = true;
	}
	if( flag )
		return true;
	else{
		memberList.push(selected);
		return false;			
	}
}


function check(index){
	$('#'+index).attr('selected', 't');
}


function del(){
	var itemids = $.makeArray($('div[selected="selected"]').map(function(){
	    return $(this).attr('id');
		})
	);

	for(var i in itemids){ memberList.splice(i, 1); }
	
	$('div[selected="selected"]').remove();
}
