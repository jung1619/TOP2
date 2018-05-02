<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 개인페이지의 좌측 메뉴입니다 -->
<body>
<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar collapse in" aria-expanded="true" style="z-index: 2;">
		<div class="profile-sidebar">
			<div class="profile-userpic">
				<img src="resources/icon/group.png" class="img-responsive" alt="" style="width:50px">
			</div>
			<div class="profile-usertitle" style="margin-top: 20px; margin-left: 15px;">
				<div class="profile-usertitle-name" style="margin:auto">${pj.p_name}</div>
				<!-- <div class="profile-usertitle-status"><span class="indicator label-success"></span>Online</div> -->
			</div>
			<div class="clear"></div>
		</div>
		<div class="divider"></div>
		<a href="chat?p_num=${p_num}"><div class="kaigi"> 회의하기 </div></a>
		<form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="저장된 문서 검색">
			</div>
		</form>
		<ul class="nav menu">
			<c:choose>
				<c:when test="${page == 1}">
					<li class="active"><a><em class="fa"><img src="./resources/icon/home1.png" style="width:17px">&nbsp;</em>MAIN PAGE</a></li>
				</c:when>
				<c:otherwise>
					<li onmouseover="mainpage2.src='./resources/icon/home1.png'"
						onmouseout="mainpage2.src='./resources/icon/home.png'"><a href="group?groupNum=${p_num}"><em class="fa">
					<img src="./resources/icon/home.png" id="mainpage2" border="0" width="17px">
					<!-- img src="./resources/icon/home.png" style="width:17px" id="homeimage" onmouseover="move()"> -->&nbsp;</em>MAIN PAGE</a></li>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${page == 2}">
					<li class="active"><a><em class="fa fa-calendar">&nbsp;</em> Calendar</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="groupCal?groupNum=${p_num}"><em class="fa fa-calendar">&nbsp;</em> Calendar</a></li>
				</c:otherwise>
			</c:choose>
			
			
			<!-- <li><a href="#"><em class="fa fa-dashboard">&nbsp;</em> Dashboard</a></li> -->
			 
<%-- 			<li class="parent "><a data-toggle="collapse" href="#sub-item-1">
				<em class="fa fa-navicon">&nbsp;</em> PROJECT GROUP <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
				</a>
				<ul class="children collapse" id="sub-item-1">
				<c:forEach var="group" items="${groupList}">
					<li><a class="" href="group?groupNum=${p_num}">
						<span class="fa fa-arrow-right">&nbsp;</span>${group}그룹
					</a></li>
				</c:forEach>
				</ul>
			</li> --%>
			
			<!-- 
			<li><a href="groupForm"><em class="fa fa-toggle-off">&nbsp;</em> Create Project</a></li> -->
			<c:choose>
				<c:when test="${page == 3}">
					<li class="active"><a><em class="fa"><img src="./resources/icon/human22.png" style="width:17px">&nbsp;</em> Members</a></li>
				</c:when>
				<c:otherwise>
					<li onmouseover="mainpage3.src='./resources/icon/human22.png'"
						onmouseout="mainpage3.src='./resources/icon/human2.png'">
						<a href="groupMem?groupNum=${p_num}"><em class="fa">
						<img src="./resources/icon/human2.png" id="mainpage3" style="width:17px">&nbsp;</em> Members</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${page == 4}">
					<li class="active"><a><em class="fa fa-bar-chart">&nbsp;</em> Charts</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="#"><em class="fa fa-bar-chart">&nbsp;</em> Charts</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${page == 5}">
					<li class="active"><a href=""><em class="fa fa-clone">&nbsp;</em> File List</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="fileList_pj?p_num=${p_num}"><em class="fa fa-clone">&nbsp;</em> File List</a></li>
				</c:otherwise>
			</c:choose>
<%-- 			<c:choose>
				<c:when test="${page == 6}">
					<li class="active"><a href="#"><em class="fa fa-power-off">&nbsp;</em> Editor</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="edit"><em class="fa fa-power-off">&nbsp;</em> Editor</a></li>
				</c:otherwise>
			</c:choose> --%>
		</ul>
	</div>

</body>
