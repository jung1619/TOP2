<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>PERSONAL PAGE</title>
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
<script type="text/javascript" src="<c:url value='/resources/js/ko.js'/>"></script>

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

var dataset = [
    <c:forEach var="listview" items="${listview}" varStatus="status">
        <c:if test="${listview.startdate != ''}">
            {"id":'<c:out value="${listview.schedule_num}" />'
            ,"title":'<c:out value="${listview.content}" />'
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
	$('#calendar').css('width', '50%');
	$('#calendar').css('padding', '10px');
	$('#calendar').css('border', '1px solid lightgray');
	//$('.fc-day-number.fc-sat').css('background-color', '#0000FF');
	$('#calendar').fullCalendar({
		customButtons: { 
	        myCustomButton: { 
	            text: '일정입력', 
	            click: function(event) { 
	            	 $('#fullCalNew').modal(); 
	            	} 
	        	}
			}, 	
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
    	                  text: '<span class="title">Start: </span>' + ($.fullCalendar.formatDate(event.start, 'hh:mmtt')) + '<br><span class="title">Description: </span>' + event.description       
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
    	    	    $('#startTime').val(moment(event.start).format('YYYY-MM-DD')+'T'+moment(event.start).format('HH:mm'));
    	    	    $('#endTime').val(moment(event.end).format('YYYY-MM-DD')+'T'+moment(event.end).format('HH:mm'));
     	    	    $('#startTimes').val(moment(event.start).format('YYYY-MM-DD HH:mm'));
    	    	    $('#endTimes').val(moment(event.end).format('YYYY-MM-DD HH:mm'));
    	    	    $("#eventInfo").html(event.description);
    	            $("#eventLink").attr('href', event.url);
    	            $("#eventContent").dialog({ modal: true, title: event.title, width:350});
    	            $('.modalTitle').html(event.title);
    	            //$('#modalId').html(event.id);
    	            $('#modalId').attr('value', event.id);
    	            $('.modalTitle').attr('value', event.title);
    	            $('#modalBody').html(event.description);
    	            $('#eventUrl').attr('href',event.url);
    	            $('#fullCalModal').modal();
    	        }
    	    });
    	  });
 
 function deleteUserSchedule(){
	 $('#fullCalModal').modal('hide'); 
	 var schedule_num = document.getElementById('modalId').value;
	 $('.schedule_num').attr('value', schedule_num);
	 var startTimes = document.getElementById('startTimes').value;
	    $('.startTimes').html(startTimes);
	 var endTimes = document.getElementById('endTimes').value;
	    $('.endTimes').html(endTimes);
	 $('#delcalendar').modal();
 }
 

 </script>

<style type="text/css">

</style>
</head>
<body>
<%@ include file="nabi-top.jsp" %>
<%@ include file="nabi-left.jsp" %>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">PERSONAL PAGE</h1>
			</div>
</div>
<div class="row">
<div class="col-md-6">
				<div class="panel panel-default articles">
					<div class="panel-heading">
						PROJECT NOTICE
						<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span></div>
					<div class="panel-body articles-container">
					
						<c:forEach var="notice" items="${noticeArr}"> 
						<div class="article border-bottom">
							<div class="col-xs-12">
								<div class="row">
									<div class="col-xs-10 col-md-10">
										<h4><a href="#">${notice.n_indate }</a></h4>
										<p>${notice.n_content}</p>
									</div>
								</div>
							</div>
							<div class="clear"></div>
						</div><!--End .article-->
						</c:forEach>
						
						<div class="article border-bottom">
							<div class="col-xs-12">
								<div class="row">
									<div class="col-xs-10 col-md-10">
										<h4><a href="#">여기엔 그룹공지 날짜</a></h4>
										<p>여기엔 그룹공지 내용</p>
									</div>
								</div>
							</div>
							<div class="clear"></div>
						</div><!--End .article-->
						<div class="paging"> 1 2 3 4 5 </div>
						
					</div>
				</div><!--End .articles-->
				
				<div class="panel panel-default ">
					<div class="panel-heading">
						Progress bars
						<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span></div>
					<div class="panel-body">
						<div class="col-md-12 no-padding">
							<div class="row progress-labels">
								<div class="col-sm-6">New Orders</div>
								<div class="col-sm-6" style="text-align: right;">80%</div>
							</div>
							<div class="progress">
								<div data-percentage="0%" style="width: 80%;" class="progress-bar progress-bar-blue" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<div class="row progress-labels">
								<div class="col-sm-6">Comments</div>
								<div class="col-sm-6" style="text-align: right;">60%</div>
							</div>
							<div class="progress">
								<div data-percentage="0%" style="width: 60%;" class="progress-bar progress-bar-orange" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<div class="row progress-labels">
								<div class="col-sm-6">New Users</div>
								<div class="col-sm-6" style="text-align: right;">40%</div>
							</div>
							<div class="progress">
								<div data-percentage="0%" style="width: 40%;" class="progress-bar progress-bar-teal" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<div class="row progress-labels">
								<div class="col-sm-6">Page Views</div>
								<div class="col-sm-6" style="text-align: right;">20%</div>
							</div>
							<div class="progress">
								<div data-percentage="0%" style="width: 20%;" class="progress-bar progress-bar-red" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						Friend List
						<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span></div>
					<div class="panel-body">
						<ul class="todo-list">
							<c:forEach var="friend" items="${fList}">
								<li class="todo-list-item">
									${friend} 오른쪽에 친구 삭제기능 넣어야 함
									<div class="pull-right action-buttons"><a href="#" class="trash"><em class="fa fa-trash"></em></a></div>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- <div class="panel-heading">친구검색</div> -->
					<div class="panel-footer">
							<div class="input-group">
							<input id="searchId" type="text" class="form-control input-md" placeholder="추가할 친구 ID를 입력하세요">
							<span class="input-group-btn">
							<button class="btn btn-primary btn-md" id="searchBtn">검색</button></span></div>
					</div>
					<div class="panel-footer">
						<div class="searchedId">
							<a id="idSearchDiv"></a>
							<input type="button" id="addBtn" value="ADD">
						</div>
					</div>
				</div>
			</div>

	<div class="groupList">
		<c:forEach var="group" items="${groupList}">
				<a href="group?groupNum=${group}">${group}그룹</a><br>
		</c:forEach>
	</div>
</div>


<div id='calendar' class="calendarP"></div>

<div id="delcalendar" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span class="sr-only">close</span></button>
                <h4 class="modal-title">일정을 삭제하시겠습니까?</h4>
            </div>
            <form action="deleteUserSchedule" method="post">
            <div id="modalBody" class="modal-body">
	            <table>
	            	<tr>
		            	<td>
		            		<h4 class="modalTitle"></h4>
		            	</td>
		            </tr>	            
	            	<tr>
		            	<td>
		            		시작일 : <span class="startTimes"></span>
		            	</td>
		            </tr>
		            <tr>
		            	<td>
		            		종료일 : <span class="endTimes"></span>
		            	</td>
		            </tr>
	           		 <tr>
						<td>
							<input type="hidden" name="id" value="${sessionScope.loginedId}">
							<input type="hidden" class="schedule_num" name="schedule_num" required="required">
						</td>
					</tr>
				</table>
            </div>
            <div class="modal-footer">
            <input type="submit" id="eventUrl" class="btn btn-primary" value="삭제">
            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
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
                <h4 class="modal-title">새로운 일정 등록</h4>
            </div>
            <div id="modalBody" class="modal-body">
            <form action="insertUserSchedule" method="post">
	            <table>
	           		 <tr>
						<td>
							<input type="hidden" name="id" value="${sessionScope.loginedId}">
							<input type="text" name="content" required="required">
						</td>
					</tr>
					<tr>
						<td>
							<input type="datetime-local" name="startdate" required="required" value="2018-05-01T08:30">
						</td>
					</tr>
					<tr>
						<td>
							<input type="datetime-local" name="enddate" required="required" value="2018-05-03T08:30">
						</td>
					</tr>
				</table>
            	<input type="submit" id="eventUrl" class="btn btn-primary" value="등록">
            </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<div id="fullCalModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span class="sr-only">close</span></button>
                <h4 class="modal-title modalTitle"></h4>
            </div>
            <div id="modalBody" class="modal-body">
            <form action="updateUserSchedule" method="post">
	            <table>
	           		 <tr>
						<td>
							<input type="hidden" name="schedule_num" id="modalId">
							<input type="text" name="content" class="modalTitle" required="required">
						</td>
					</tr>
					<tr>
						<td>
							<input type="datetime-local" id="startTime" name="startdate">
							<input type="hidden" id="startTimes">
						</td>
					</tr>
					<tr>
						<td>
							<input type="datetime-local" id="endTime" name="enddate">
							<input type="hidden" id="endTimes">
						</td>
					</tr>
				</table>
            	<input type="submit" id="eventUrl" class="btn btn-primary" value="수정">
            </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                <button type="button" id="eventUrl" class="btn btn-primary" onclick="javascript:deleteUserSchedule()">일정 삭제</button>
            </div>
        </div>
    </div>
</div>

</div>
</body>
</html>