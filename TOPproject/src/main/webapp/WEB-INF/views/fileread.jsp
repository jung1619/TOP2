<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

	<script type="text/javascript" src="<c:url value='resources/js/jquery-3.3.1.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='resources/js/filelist.js'/>"></script>
	<script type="text/javascript">
		var loginedId = '<%=(String)session.getAttribute("loginedId")%>';
		
		$(function() {
			readFile();
		});
	</script>

	<div id="errArea"></div>
	
	<div id="fileContextArea">
		<table id="fileContextTable">
			<tr><td>コピーライター </td><td>タイトル</td><td>日付</td></tr>
		</table>
	</div>

</html>