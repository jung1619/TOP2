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
<style type="text/css">

</style>
</head>
<body id="bodyPj">
<%@ include file="nabi-left2.jsp" %>
<%@ include file="nabi-top2.jsp" %>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header" style="font-size:40px;">MEMBER LIST</h1>
		</div>
	</div>
	<div class="row">
			<div class="col-md-6">
	 			<div class="panel panel-default">
					<div class="panel-heading">
						MEMBER LIST
						<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span></div>
					<div class="panel-body">
						<ul class="todo-list">
							<li class="todo-list-item">
								<img src="./resources/img/pm.png" style="width:20px;"/> ${pj.p_m_id}
							</li>
							<!-- 일반멤버 -->
							<c:choose>
								<c:when test="${loginedId == pj.p_m_id}">
									<c:forEach var="member" items="${mList}">
										<li class="todo-list-item">
										<a>${member}</a>
										<div class="pull-right action-buttons"><input type="button" id="mDel" value="삭제 구현 오네가이시마스"><a href="mDel" class="trash"><em class="fa fa-trash"></em></a></div>
										</li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach var="member" items="${mList}">
										<li class="todo-list-item">
											<a>${member}</a>
										</li>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
	</div>		
</div>			

</body>
</html>