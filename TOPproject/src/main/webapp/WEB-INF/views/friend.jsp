<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html> <!-- 친구 관리 페이지 -->

	<div id="errArea"></div>

	<script type="text/javascript" src="<c:url value='resources/js/jquery-3.3.1.min.js'/>"></script>
	<script type="text/javascript">
		var loginedId = '<%=(String)session.getAttribute("loginedId")%>';
		$(function() {
			load_friendList();
			load_friendReq();
			load_friendRec();
		}); //ready
	</script>
	<script type="text/javascript" src="<c:url value='resources/js/friend2.js'/>"></script>


	<!-- 친구 검색 -->
	
	<!-- 친구 목록 -->
	<div id="friendList">
		<h3>당신의 친구 목록</h3>
		<table id="flTable">
		</table>
	</div><p /><p />
	
	<div id="friendReqList">
		<h3>보낸 친구 신청</h3>
		<table id="reqTable_req">
		</table><p /><p />
		
		<h3>받은 친구 신청</h3>
		<table id="reqTable_rec">
		</table>
	</div><p /><p />
	
	<div id="freindReq">
		회원을 검색하여 친구 요청을 보내십시오. <p />
		<input type="text" id="searchId" placeholder="ID로만 검색할 수 있습니다." onkeyup="searchId()">
		<div id="searchedIds"></div>
	</div>
	
</html>