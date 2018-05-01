<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>GROUP PAGE</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.js'/>"></script>
<link href="https://fonts.googleapis.com/earlyaccess/notosansjapanese.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="./resources/css/style.css"/>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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

</head>
<body id="bodyPj">
<%@ include file="nabi-left2.jsp" %>
<%@ include file="nabi-top2.jsp" %>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">GROUP PAGE</h1>
		</div>
	</div>
<div class="row">

<div class="col-md-6">
	<div class="panel panel-default articles">
		<div class="panel-heading">PROJECT NOTICE
			<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span>
		</div>
		<div class="panel-body articles-container">
					<c:forEach var="notice" items="${n_list}"> 
						<div class="article border-bottom">
							<div class="col-xs-12">
								<div class="row">
									<div class="col-xs-10 col-md-10">
										<h4><a href="#"><span class="site__title2">${notice.n_indate }</span></a></h4>
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
									<h4><a href="#"><span class="site__title2">여기엔 그룹공지 날짜</span></a></h4>
										<p>여기엔 그룹공지 내용</p>
								</div>
							</div>
						</div>
						<div class="clear"></div>
						<div class="paging"> 1 2 3 4 5 </div>
					</div><!--End .article-->
					<form action="NoticeInsert" method="POST">
						<c:if test="${sessionScope.loginedId == pj.p_m_id}">
							<div class="panel-footer">
								<div class="input-group">
									<input type="text" id="context" name="context" class="form-control input-md" placeholder="추가할 공지사항을 입력하세요 근데 이거 Ajax로 넘어갔음 좋겠당">
									<input type="hidden" value="${p_num}" id="p_num" name="p_num">
									<span class="input-group-btn"><input type="submit" class="btn btn-primary btn-md" id="searchBtn" value="작성"></span>
								</div>
							</div>
						</c:if>
					</form>	
				</div>
			</div><!--End .articles-->
			
			</div>
			
			
			
			<!-- 오른쪽 페이지 -->
			
			<div class="col-md-6">
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
			</div>
	</div>
</div>
</body>
</html>




<%-- <!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
	<title>GROUP PAGE</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.js'/>"></script>
<link href="https://fonts.googleapis.com/earlyaccess/notosansjapanese.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="./resources/css/style.css"/>
<!-- 슬라이더, 풀캘린더  -->
<link rel="stylesheet" type="text/css" href="./resources/css/fullcalendar.css" />
<link rel="stylesheet" type="text/css" href="./resources/css/fullcalendar.min.css" />
<link rel="stylesheet" href='./resources/css/fullcalendar.print.min.css' media='print' />
<script type="text/javascript" src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/moment.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/fullcalendar.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.sliderPro.min.js'/>"></script>
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
	$('#calendar').css('float', 'left');
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
  	    	    $('.startTime').val(moment(event.start).format('YYYY-MM-DD')+'T'+moment(event.start).format('HH:mm'));
  	    	    $('.endTime').val(moment(event.end).format('YYYY-MM-DD')+'T'+moment(event.end).format('HH:mm'));
  	            
  	    	    $('.startTime1').html(moment(event.start).format('YYYY')+'년 '
  	    	    		+moment(event.start).format('MM')+'월 '
  	    	    		+moment(event.start).format('DD')+'일 '
  	    	    		+moment(event.start).format('HH')+'시 '
  	    	    		+moment(event.start).format('mm')+'분 '
  	    	    		);
  	    	    $('.endTime1').html(moment(event.end).format('YYYY')+'년 '
  	    	    		+moment(event.end).format('MM')+'월 '
  	    	    		+moment(event.end).format('DD')+'일 '
  	    	    		+moment(event.end).format('HH')+'시 '
  	    	    		+moment(event.end).format('mm')+'분 '
  	    	    		);
  	    	    
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
  	            $('#fullCalModal').modal();
  	        }
  	    });
  	  });

function deleteProjectSchedule(){
	 $('#fullCalModal').modal('hide'); 
	 var schedule_num = document.getElementById('modalIdUP').value;
	 $('.schedule_num').attr('value', schedule_num);
	 $('#delcalendar').modal();
}

 </script>

<style type="text/css">

</style>
</head>
<body>


<div id="delcalendar" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span class="sr-only">close</span></button>
                <h4 class="modal-title">일정을 삭제하시겠습니까?</h4>
            </div>
            <form action="deleteProjectSchedule" method="post">
            <div id="modalBody" class="modal-body">
	            <table>
	           		 <tr>
						<td>
							<input type="hidden" name="p_num" value="${p_num}">
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
            <form action="insertProjectSchedule" method="post">
	            <table>
	           		 <tr>
						<td>
							<input type="hidden" name="p_num" value="${p_num}">
							<input type="text" name="content" required="required">
						</td>
					</tr>
					<tr>
						<td>
							<input type="datetime-local" name="startdate" required="required">
						</td>
					</tr>
					<tr>
						<td>
							<input type="datetime-local" name="enddate" required="required">
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
            <!-- 내 일정으로 추가 -->
            <div id="modalBody" class="modal-body" style="border-bottom: 1px solid #e5e5e5;">
            <form action="copyUserSchedule" method="post">
            	<table>
            		<tr>
            			<td>해당 스케쥴을 내 프로젝트에 추가합니다</td>
            		</tr>
	           		 <tr>
						<td>
							<input type="hidden" name="p_num" value="${p_num}">
							<input type="hidden" class="modalId" name="schedule_num" required="required">
							<input type="hidden" class="id" name="id" value="${sessionScope.loginedId}" required="required">
							<span class="modalTitle"></span><input type="hidden" name="content" class="modalTitle">
						</td>
					</tr>
					<tr>
						<td>
							시작시간 : <span class="startTime1"></span>
							<input type="hidden" class="startTime" name="startdate">
						</td>
					</tr>
					<tr>
						<td>
							종료시간 : <span class="endTime1"></span>
							<input type="hidden" class="endTime" name="enddate">
						</td>
					</tr>
				</table>
            	<input type="submit" id="eventUrl" class="btn btn-primary" value="추가">
            </form>
            </div>
            <!-- 일정 수정 / 프로젝트 리더만 보이도록 해야함 -->
            <c:if test="${pj.p_m_id==sessionScope.loginedId}">
            <div id="modalBody" class="modal-body">
            <form action="updateProjectSchedule" method="post">
	            <table>
	           		 <tr>
						<td>
							<input type="hidden" name="p_num" value="${p_num}">
							<input type="hidden" id="modalIdUP" name="schedule_num" required="required">
							<input type="text" name="content" class="modalTitle" required="required">
						</td>
					</tr>
					<tr>
						<td>
							<input type="datetime-local" class="startTime" name="startdate">
						</td>
					</tr>
					<tr>
						<td>
							<input type="datetime-local" class="endTime" name="enddate">
						</td>
					</tr>
				</table>
            	<input type="submit" id="eventUrl" class="btn btn-primary" value="수정">
            </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                <!-- 프로젝트 리더만 보이도록 해야함 -->
                <button type="button" id="eventUrl" class="btn btn-primary" onclick="javascript:deleteProjectSchedule()">일정 삭제</button>
            </div>
            </c:if>
        </div>
    </div>
</div>

<div class="top-group">
	<span class="topspan1">TOP </span><span class="topspan2"> SMART GROUPWARE</span>
	
	
	${sessionScope.loginedId}님 
	<span class="logout"><a href="logout">LOGOUT</a></span>
		
</div>

<div class="one">
	<div class="two">
		<span class="center"><a href="chat?p_num=${p_num}">회의하기</a></span><!--여기 들어가있습니다.  -->
	</div>
	<div class="groupName">
		<span class="center"> TOP <br> Take of Project </span>
	</div>
	<div class="groupMember">
		<div class="memberTitle"> MEMBER LIST </div>
		<div class="member">	
			<!--프로젝트매니져-->
			<img src="./resources/img/pm.png" style="width:20px;"/> ${pj.p_m_id} <br />
			
			<!-- 일반멤버 -->
			<c:choose>
				<c:when test="${loginedId == pj.p_m_id}">
					<c:forEach var="member" items="${mList}">
						<a>${member}</a>
						<input type="button" id="mDel" value="삭제">
						<br />
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach var="member" items="${mList}">
						<a>${member}</a>
						<br />
					</c:forEach>
				</c:otherwise>
			</c:choose>
			
		</div>
	</div>
</div>

<div class="three">
<form action="Notice" method="POST">
	<table class="threeTable">
		
		<tr>
			<th class="th0">공지</th>
		
			<td><c:if test="${sessionScope.loginedId == pj.p_m_id }">
			<input type="hidden" value="${p_num}" id="p_num" name="p_num">
				<input type="submit" value="작성">
			</c:if></td>
		</tr>
				
		<!-- 공지리스트를 띄어줌 -->
		<c:forEach var="notice" items="${n_list}"> 
			<tr>
				<td>${notice.n_content}</td>
				<td>${notice.n_indate }</td>
			</tr>
		
		</c:forEach>

		<tr>
			<td colspan="2"><div class="paging"> 1 2 3 4 5 </div></td>
		</tr>
	</table>
</form>
</div>

<div class="four">
	<table class="fourTable">
		<tr>
			<th class="th0">파일리스트</th>
			<td></td>
		</tr>
		<tr>
			<th class="th1">파일1</th>
			<td>03/22</td>
		</tr>
		<tr>
			<th class="th1">파일2</th>
			<td>03/22</td>
		</tr>
		<tr>
			<th class="th1">파일3</th>
			<td>03/20</td>
		</tr>
		<tr>
			<th class="th1">파일4</th>
			<td>03/18</td>
		</tr>
		<tr>
			<th class="th1">파일5</th>
			<td>03/18</td>
		</tr>
		<tr>
			<th class="th1">파일6</th>
			<td>03/18</td>
		</tr>
	</table>
</div>
<div id='calendar'></div>
</body>
</html>
 --%>