<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
	
</head>

<body>
<div class="w3-top shadow" style="background: #222; z-index: 3; height:60px;">
  <!-- <div class="w3-row w3-white" id="myNavbar"> -->
  <div>
   <!-- 메인 페이지 -->
    <div class="nabi-col s3">
    	<a href="<c:url value='/'/>" class="p3-block nabi-button" style="text-align:left; padding: 11px 13px 13px 30px;"><span class="site__title33">TOP</span></a>
    </div>
    
<!-- 	<div class="nabi-col s3">
		<span class="w3-block nabi-button">SMART GROUP WARE</span>
	</div> -->

	
    <!-- 로그인을 했을 때 보이는 메뉴(개인 메뉴까지만 보임. 그룹 페이지는 적용할지 말지 아직 고민중) -->
<%-- 	<c:if test="${personal != null}">
		<div class="nabi-col s3">
	    	<a href="<c:url value='/groupForm'/>" class="w3-block nabi-button">프로젝트 생성</a>
	    </div>
	    <div class="nabi-col s3">
	    	<a href="<c:url value='/edit'/>" class="w3-block nabi-button">에디터</a>
	    </div>
	</c:if> --%>
	
	<form class="top" action="login" method="POST">
	    <c:choose>
	    	<c:when test="${sessionScope.loginedId == null}">
			    <input type="text" placeholder=" ID" name="id" id="loginID">
			    <input type="password" placeholder=" PW" name="pw" id="loginPW">
			    <input type="submit" value="login">
	    	</c:when>
	    	<c:otherwise>
	    		<a href="personal" class="site__title4">${sessionScope.loginedId}</a><span class="site__title6">님 &nbsp;&nbsp;
				<a href="logout" class="logout"> LOGOUT</a></span>
	    	</c:otherwise>
	    </c:choose>
	</form>
  </div>

</div>
</body>
