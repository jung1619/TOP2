<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>グループページ</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.js'/>"></script>
<link href="https://fonts.googleapis.com/earlyaccess/notosansjapanese.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="./resources/css/style.css"/>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 슬라이더, 풀캘린더  -->
<link rel="stylesheet" type="text/css" href="./resources/css/fullcalendar.css" />
<link rel="stylesheet" type="text/css" href="./resources/css/fullcalendar.min.css" />
<link rel="stylesheet" href='./resources/css/fullcalendar.print.min.css' media='print' />
<script type="text/javascript" src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/moment.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/fullcalendar.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/ja.js'/>"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/qtip2/3.0.3/jquery.qtip.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/qtip2/3.0.3/jquery.qtip.min.css" rel="stylesheet" />
<link rel="stylesheet" href='./resources/css/jquery.qtip.css' media='print' />
<script type="text/javascript" src="<c:url value='/resources/js/jquery.qtip.js'/>"></script>

<link href="http://www.mikesmithdev.com/shared/css/bootstrapmodal.css" rel="stylesheet" />
<script type="text/javascript" src="<c:url value='/resources/js/bootstrap.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>

<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="./resources/js/script.js"></script>

<!-- css 추가부분 -->
<script src="https://medialoot.com/preview/lumino/js/chart.min.js"></script>
<script src="https://medialoot.com/preview/lumino/js/chart-data.js"></script>
<script src="https://medialoot.com/preview/lumino/js/easypiechart.js"></script>
<script src="https://medialoot.com/preview/lumino/js/easypiechart-data.js"></script>
<script src="https://medialoot.com/preview/lumino/js/bootstrap-datepicker.js"></script>
<script src="https://medialoot.com/preview/lumino/js/custom.js"></script>
<link rel="stylesheet" type="text/css" href="https://medialoot.com/preview/lumino/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="https://medialoot.com/preview/lumino/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="https://medialoot.com/preview/lumino/css/datepicker3.css" />
<link rel="stylesheet" type="text/css" href="./resources/css/customStyle.css" />
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" />


<script type="text/javascript" src="<c:url value='/resources/js/friend.js'/>"></script>

<script type="text/javascript">

	var loginedId = '<%=(String)session.getAttribute("loginedId")%>';
	var pmid = '<%=(String)session.getAttribute("pjm")%>';
	var mycustom = '';
	
	if (loginedId == pmid) {
		mycustom = {myCustomButton: {text: "スケジュール入力", click: function(event) { $("#fullCalNew").modal();}}};
	};
	
	var dataset = [
	    <c:forEach var="listview" items="${listview}" varStatus="status">
	        <c:if test="${listview.startdate != ''}">
	            {"id":"<c:out value="${listview.s_num}" />"
	            ,"title":"<c:out value="${listview.content}" />"
	            ,"color":"<c:out value="${listview.color}" />"
	            ,"start":"<c:out value="${listview.startdate}" />"
	            <c:if test="${listview.enddate != ''}">
	                ,"end":"<c:out value="${listview.enddate}" />"
	        	</c:if>
	            } 
	            <c:if test="${!status.last}">,</c:if>
	        </c:if>
	    </c:forEach>
	];
	
 $(document).ready(function() {
	 
	//$("#header").load("/stagestageList.jps")
	//달력 
	$('#calendar').css('width', '90%');
	$('#calendar').css('margin', 'auto');
	$('#calendar').css('padding', '10px');
	$('#calendar').css('border', '1px solid lightgray');
	$('a#calendar').css('color', '#30a5ff');
	$('a:hover#calendar').css('background-image', '-webkit-linear-gradient(92deg,#f35626,#feab3a)');
	$('a:hover#calendar').css('-webkit-background-clip', 'text');
	$('a:hover#calendar').css('-webkit-text-fill-color', 'transparent');
	$('a:hover#calendar').css('-webkit-animation', 'hue 10s infinite linear');
	$('a:hover#calendar').css('-webkit-margin-start', '0px');
	$('a:hover#calendar').css('-webkit-margin-end', '0px');
	
	//$('.fc-day-number.fc-sat').css('background-color', '#0000FF');
	$('#calendar').fullCalendar({
		customButtons: mycustom, 	 	
    	 	header: {
    	        left: 'prev,next myCustomButton',
    	        center: 'title',
    	        right: 'month,agendaWeek,agendaDay,listWeek'
    	    },
    	      //defaultDate: '2017-12-12',
    	      navLinks: true, // can click day/week names to navigate views
    	      editable: true,
    	      eventLimit: true, // allow "more" link when too many events
    	      events: dataset,
    	      eventRender: function (event, element) {
    	    	  element.qtip({    
    	              content: {    
    	                  title: { text: event.title },
    	                  text: '<span class="title">Start : </span>' + ($.fullCalendar.formatDate(event.start, 'YYYY-MM-DD HH:mm')) + '<br><span class="title">End : </span>' + ($.fullCalendar.formatDate(event.end, 'YYYY-MM-DD HH:mm')) 
    	                  /* text: '<span class="title">Start: </span>' + ($.fullCalendar.formatDate(event.start, 'hh:mm')) + '<br><span class="title">Description: </span>' + event.description   */     
    	              },
    	              show: { solo: true },
    	              //hide: { when: 'inactive', delay: 3000 }, 
    	              style: { 
    	                  width: 200,
    	                  padding: 5,
    	                  color: 'black',
    	                  textAlign: 'left',
    	                  border: {
    	                  width: 1,
    	                  radius: 3
    	               },
    	                  tip: 'topLeft',
    	                  classes: { 
    	                      tooltip: 'ui-widget', 
    	                      tip: 'ui-widget', 
    	                      title: 'ui-widget-header', 
    	                      content: 'ui-widget-content' 
    	                  } 
    	              } 
    	          });
    	      },
    	      eventClick:  function(event, jsEvent, view) {
    	    	    $('.startTime').val(moment(event.start).format('YYYY-MM-DD')+'T'+moment(event.start).format('HH:mm'));
    	    	    $('.endTime').val(moment(event.end).format('YYYY-MM-DD')+'T'+moment(event.end).format('HH:mm'));
    	            
    	    	    $('.startTime1').html(moment(event.start).format('YYYY')+'年 '
    	    	    		+moment(event.start).format('MM')+'月 '
    	    	    		+moment(event.start).format('DD')+'日 '
    	    	    		+moment(event.start).format('HH')+'時 '
    	    	    		+moment(event.start).format('mm')+'分 '
    	    	    		);
    	    	    $('.endTime1').html(moment(event.end).format('YYYY')+'年 '
    	    	    		+moment(event.end).format('MM')+'月 '
    	    	    		+moment(event.end).format('DD')+'日 '
    	    	    		+moment(event.end).format('HH')+'時 '
    	    	    		+moment(event.end).format('mm')+'分 '
    	    	    		);
    	    	    $('#startTimes').val(moment(event.start).format('YYYY-MM-DD HH:mm'));
    	    	    $('#endTimes').val(moment(event.end).format('YYYY-MM-DD HH:mm'));
    	    	    $("#eventInfo").html(event.description);
    	            $("#eventLink").attr('href', event.url);
    	            $("#eventContent").dialog({ modal: true, title: event.title, width:350});
    	            $('.modalTitle').html(event.title);
    	            //$('#modalId').html(event.id);
    	            $('.modalId').attr('value', event.id);
    	            $('#modalIdUP').attr('value', event.id);
    	            $('.modalTitle').attr('value', event.title);
    	            $('#modalBody').html(event.description);
    	            $('#eventUrl').attr('href',event.url);
    	            $('.color').attr('value', event.color);
    	            $('#fullCalModal').modal();
    	        }
    	    });
    	  });
 
 function deleteProjectSchedule(){
	 $('#fullCalModal').modal('toggle'); 
	 var s_num = document.getElementById('modalIdUP').value;
	 $('.schedule_num').attr('value', s_num);
	 var startTimes = document.getElementById('startTimes').value;
	    $('.startTimes').html(startTimes);
	 var endTimes = document.getElementById('endTimes').value;
	    $('.endTimes').html(endTimes);
	 $('#delcalendar').modal();
 }
 
 //완료처리 부분 작업 오네가이시마스
 function updateProjectComplete(){
	if (confirm('スケジュールを完了しますか?')) {
	var s_num = document.getElementById('modalIdUP').value;
	location.href = 'updateProjectComplete?s_num=' + s_num;
			
	return true;
	 }else {
	 }
 }

 </script>
</head>
<body id="bodyPj">
<%@ include file="nabi-top2.jsp"  %>
<%@ include file="nabi-left2.jsp" %>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">グループページ</h1>
			</div>

			<div class="col-lg-12" style="width:1200px">
				<div class="panel panel-default">
					<div class="panel-heading">
						GROUP Calendar</div>
					<div class="panel-body">
						<div id='calendar' style="z-index: 1;"></div>
					</div>
				</div>
			</div>
		</div>


<div id="delcalendar" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span class="sr-only">close</span></button>
                <h4 class="modal-title">このスケジュールを削除してもよろしいですか？</h4>
            </div>
            <form action="deleteProjectSchedule" method="post">
            <div id="modalBody" class="modal-body">
	            <table>
	            	<tr>
		            	<td>
		            		<h4 class="modalTitle"></h4>
		            	</td>
		            </tr>	            
	            	<tr>
		            	<td>
		            		開始日 : <span class="startTimes"></span>
		            	</td>
		            </tr>
		            <tr>
		            	<td>
		            		終了日 : <span class="endTimes"></span>
		            	</td>
		            </tr>
	           		 <tr>
						<td>
							<input type="hidden" name="p_num" value="${p_num}">
							<input type="hidden" class="schedule_num" name="s_num" required="required">
						</td>
					</tr>
				</table>
            </div>
            <div class="modal-footer">
            <input type="submit" id="eventUrl" class="btn btn-primary" value="削除">
            <button type="button" class="btn btn-default" data-dismiss="modal">閉じる</button>
            </div>
            
            </form>
        </div>
    </div>
</div>

<div id="fullCalNew" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span class="sr-only">close</span></button>
                <h4 class="modal-title">新しいスケジュール登録</h4>
            </div>
            <div id="modalBody" class="modal-body">
            <form action="insertProjectSchedule" method="post">
	            <table class="scledulecss">
	           		 <tr>
	           		 	<th>スケジュール名</th>
						<td>
							<input type="text" class="form-control input-md" name="content" required="required">
							<input type="hidden" name="p_num" value="${p_num}">
						</td>
					</tr>
					<tr>
						<th>開始日</th>
						<td>
							<input type="datetime-local" class="form-control input-md" name="startdate" required="required" value="2018-05-01T08:30">
						</td>
					</tr>
					<tr>
						<th>終了日</th>
						<td>
							<input type="datetime-local" class="form-control input-md" name="enddate" required="required" value="2018-05-03T08:30">
						</td>
					</tr>
					</table>
					<table>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td>COLOR</td>
					</tr>
					<tr>
						<td>
						<label class="container">&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#3a87ad">BLUE</span>
						  <input type="radio" checked="checked" id="blue" name="color" value="#3a87ad">
						  <span class="checkmarkb"></span>
						</label>
						</td>
					</tr>
					<tr>
						<td>
						<label class="container">&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#fa6565">RED</span>
						  <input type="radio" id="red" name="color" value="#fa6565">
						  <span class="checkmarkr"></span>
						</label>
						</td>
					</tr>
					<tr>
						<td>
						<label class="container">&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ffe111">YELLOW</span>
						  <input type="radio" id="yellow" name="color" value="#ffe111">
						  <span class="checkmarky"></span>
						</label>
						</td>
					</tr>
				</table>
            	<input type="submit" id="eventUrl" class="btn btn-primary" value="登録">
            </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">閉じる</button>
            </div>
        </div>
    </div>
</div>

	<div id="fullCalModal" class="modal fade">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span class="sr-only">close</span></button>
	                <!-- 내 일정으로 추가 -->
	                <h4 class="modal-title">個人スケジュールにコピー</h4>
	            </div>
	             <div id="modalBody" class="modal-body" style="border-bottom: 1px solid #e5e5e5;">
            	<form action="copyUserSchedule" method="post">
            	<table>
            		<tr>
            			<td>このスケジュールを個人スケジュールにコピーします</td>
            		</tr>
            		<tr><td>&nbsp;</td></tr>
	           		 <tr>
						<td>
							<input type="hidden" name="p_num" value="${p_num}">
							<!-- <input type="text" class="modalId" name="schedule_num" required="required"> -->
							<input type="hidden" name="color" class="color">
							<input type="hidden" class="id" name="id" value="${sessionScope.loginedId}" required="required">
							<span class="modalTitle"></span><input type="hidden" name="content" class="modalTitle">
						</td>
					</tr>
					<tr>
						<td>
							開始日 : <span class="startTime1"></span>
							<input type="hidden" class="startTime" name="startdate">
						</td>
					</tr>
					<tr>
						<td>
							終了日 : <span class="endTime1"></span>
							<input type="hidden" class="endTime" name="enddate">
						</td>
					</tr>
				</table>
				<br>
            	<input type="submit" id="eventUrl" class="btn btn-primary" value="追加">
	            </form>
	            </div>

            
                
	        <!-- 일정 수정 / 프로젝트 리더만 보이도록 해야함 -->
			<c:if test="${pj.p_m_id==sessionScope.loginedId}">
				<br>
	           	<h4 class="modal-title">&nbsp;&nbsp;&nbsp;スケジュール修正</h4>
	            <form action="updateProjectSchedule" method="post">
	            <div id="modalBody" class="modal-body">
		            <table class="scledulecss">
		           		 <tr>
		           		 	<th>スケジュール名</th>
							<td>
								<input type="hidden" name="p_num" value="${p_num}">
								<input type="hidden" id="modalIdUP" name="s_num" required="required">
								<input type="text" name="content" class="modalTitle form-control input-md" required="required">
							</td>
						</tr>
						<tr>
							<th>開始日</th>
							<td>
								<input type="datetime-local" class="startTime form-control input-md" name="startdate">
								<input type="hidden" id="startTimes">
							</td>
						</tr>
						<tr>
							<th>終了日</th>
							<td>
								<input type="datetime-local" class="endTime form-control input-md" name="enddate">
								<input type="hidden" id="endTimes">
							</td>
						</tr>
						</table>
						<table>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td>COLOR</td>
						</tr>
						<tr>
							<td>
							<label class="container">&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#3a87ad">BLUE</span>
							  <input type="radio" checked="checked" id="blue" name="color" value="#3a87ad">
							  <span class="checkmarkb"></span>
							</label>
							</td>
						</tr>
						<tr>
							<td>
							<label class="container">&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#fa6565">RED</span>
							  <input type="radio" id="red" name="color" value="#fa6565">
							  <span class="checkmarkr"></span>
							</label>
							</td>
						</tr>
						<tr>
							<td>
							<label class="container">&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ffe111">YELLOW</span>
							  <input type="radio" id="yellow" name="color" value="#ffe111">
							  <span class="checkmarky"></span>
							</label>
							</td>
						</tr>
					</table>
	            </div>
	            <div class="modal-footer">
	            	<button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:updateProjectComplete()" style="background:#ffe179;">スケジュール完了</button>
	            	<input type="submit" id="eventUrl" class="btn btn-primary" value="修正">
	                <button type="button" class="btn btn-default" data-dismiss="modal">閉じる</button>
	                <button type="button" id="eventUrl" class="btn btn-primary" onclick="javascript:deleteProjectSchedule()">スケジュール削除</button>
	            </div>
	            </form>
	            </c:if>
	            <!-- 관리자메뉴 끝 -->
	            
	        </div>
	    </div>
	</div>

</div>
</body>
</html>