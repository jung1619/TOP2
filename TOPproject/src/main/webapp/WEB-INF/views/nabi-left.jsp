<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 개인페이지의 좌측 메뉴입니다 -->
<body>
<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar collapse in" aria-expanded="true" style="z-index: 2;">
		<div class="profile-sidebar">
			<div class="profile-userpic">
				<img src="./resources/img/rurueo.jpg" class="img-responsive" alt="">
			</div>
			<div class="profile-usertitle">
				<div class="profile-usertitle-name">${sessionScope.loginedId}</div>
				<div class="profile-usertitle-status"><span class="indicator label-success"></span>Online</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="divider"></div>
		<form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="저장된 문서 검색">
			</div>
		</form>
		<ul class="nav menu">
			<c:choose>
				<c:when test="${page == 1}">
					<li class="active"><a><em class="fa"><img src="./resources/icon/human1.png" style="width:17px">&nbsp;</em>MAIN PAGE</a></li>
				</c:when>
				<c:otherwise>
					<li onmouseover="mainpage1.src='./resources/icon/human1.png'"
						onmouseout="mainpage1.src='./resources/icon/human.png'">
					<a href="personal"><em class="fa"><img src="./resources/icon/human.png" id="mainpage1" style="width:17px">&nbsp;</em>MAIN PAGE</a></li>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${page == 2}">
					<li class="active"><a><em class="fa fa-calendar">&nbsp;</em> Calendar</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="personalCalendar"><em class="fa fa-calendar">&nbsp;</em> Calendar</a></li>
				</c:otherwise>
			</c:choose>
			
			
			<!-- <li><a href="#"><em class="fa fa-dashboard">&nbsp;</em> Dashboard</a></li> -->
			 
			<li class="parent "><a data-toggle="collapse" href="#sub-item-1">
				<em class="fa fa-navicon">&nbsp;</em> PROJECT GROUP <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
				</a>
				<ul class="children collapse" id="sub-item-1">
				<c:forEach var="project" items="${p_list}">
					<li><a class="" href="group?groupNum=${project.p_num}">
						<span class="fa fa-arrow-right">&nbsp;</span>${project.name}
					</a></li>
				</c:forEach>
				</ul>
			</li>
			<!-- <li><a href="#"><em class="fa fa-bar-chart">&nbsp;</em> Charts</a></li> -->
			<c:choose>
				<c:when test="${page == 3}">
					<li class="active"><a><em class="fa"><img src="./resources/icon/human22.png" style="width:17px">&nbsp;</em> Friends</a></li>
				</c:when>
				<c:otherwise>
					<li onmouseover="mainpage2.src='./resources/icon/human22.png'"
						onmouseout="mainpage2.src='./resources/icon/human2.png'">
					<a href="friend"><em class="fa"><img src="./resources/icon/human2.png" id="mainpage2" style="width:17px">&nbsp;</em> Friends</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${page == 4}">
					<li class="active"><a><em class="fa fa-toggle-off">&nbsp;</em> Create Project</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="groupForm"><em class="fa fa-toggle-off">&nbsp;</em> Create Project</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${page == 5}">
					<li class="active"><a><em class="fa fa-clone">&nbsp;</em> File List</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="fileList_ps?myId=${sessionScope.loginedId}"><em class="fa fa-clone">&nbsp;</em> File List</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${page == 6}">
					<li class="active"><a><em class="fa fa-power-off">&nbsp;</em> Editor</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="personalEdit"><em class="fa fa-power-off">&nbsp;</em> Editor</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
<!-- <div id="naviLeft">
	<ul>
		<li><img src="./resources/icon/if_calendar.png"></li>
		<li><img src="./resources/icon/if_group.png"></li>
		<li><img src="./resources/icon/if_friend.png"></li>	
		<li><img src="./resources/icon/if_fileP.png"></li>	
		<li><img src="./resources/icon/if_editP.png"></li>	
		<li><img src="./resources/icon/if_memo.png"></li>	
	</ul>

</div> -->

</body>
