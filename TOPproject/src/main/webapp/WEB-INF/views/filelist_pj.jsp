<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

	<script type="text/javascript" src="<c:url value='resources/js/jquery-3.3.1.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='resources/js/filelist.js'/>"></script>
	<script type="text/javascript">
		var loginedId = '<%=(String)session.getAttribute("loginedId")%>';
		var p_num = '<%=(String)session.getAttribute("loginedId")%>';
		$(function() {
			loadList_pj();
		});
	</script>

	<div id="errArea"></div>
	
	<div id="filelistArea">
		<table id="fileListTable">
			<tr><td>번호</td><td>제목</td><td>마지막 수정자</td><td>날짜</td></tr>
		</table>
	</div>

</html>