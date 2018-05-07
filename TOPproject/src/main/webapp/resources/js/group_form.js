$(function() {
    
	$( "#menu" ).menu({
	      items: "> :not(.ui-widget-header)"
	    });
	
	$( "#datepicker_start" ).datepicker({
		changeMonth: true,
		changeYear: true,
		dayNamesMin: ['月', '火', '水', '木', '金', '土', '日'], 
		monthNamesShort: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
		minDate: 0, 
        maxDate: "+100Y",
    	dateFormat: 'yy-mm-dd'
	});
	$( "#datepicker_end" ).datepicker({
		changeMonth: true,
		changeYear: true,
		dayNamesMin: ['月', '火', '水', '木', '金', '土', '日'],
		monthNamesShort: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
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
			    		alert('すでにリストにあります。');
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
							alert('プロジェクトを作りました。');
							location.href = "personal";
						}else
							alert('プロジェクトを作ることを失敗しました。');
					},
					error : function( err ){ $('#errpage').html( JSON.stringify(err) ); }
				});//ajax	
			}//if
			
		}else
			alert('期間を確認してください。');
	}else
		alert('内容を確認してください。');
		
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
