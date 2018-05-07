<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>パーソナルページ</title>
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
<script src="//code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

$(window).load(function() {
	$('#load').hide();
});

var loginedId = '<%=(String)session.getAttribute("loginedId")%>';
$(function() {
	loadList_ps();
});

 </script>
</head>
<body id="bodyP">
<div id="load"><img src="./resources/img/30.gif" alt="loading"></div>

<%@ include file="nabi-left.jsp" %>
<%@ include file="nabi-top2.jsp" %>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">パーソナルページ</h1>
			<div id="errArea"></div>
		</div>
<!-- 	</div>
<div class="row"> -->
<div class="col-lg-12" style="width:1200px">
				<div class="panel panel-default articles">
					<div class="panel-heading">
						PERSONAL FILELIST
						<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span></div>
					<div class="panel-body articles-container">
					
						<c:forEach var="notice" items="${noticeArr}"> 
						<div class="article border-bottom">
							<div class="col-xs-12">
								<div class="row">
									<div class="col-xs-10 col-md-10">
										<h4><a href="#">${notice.indate }</a></h4>
										<p>${notice.content}</p>
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
									
									<div class="row">
										<div class="col-xs-10 col-md-10">
											<h4><a href="#"><span class="site__title2">タイトル</span></a></h4>
												<p>日程</p>
										</div>
									</div>

									</div>
								</div>
							</div>
							<div class="clear"></div>
						</div><!--End .article-->
						
					</div>
				</div><!--End .articles-->

			</div>
			
</div>


</div>
</body>
</html>








<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

	<script type="text/javascript" src="<c:url value='resources/js/jquery-3.3.1.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='resources/js/filelist.js'/>"></script>
	<script type="text/javascript">
		var loginedId = '<%=(String)session.getAttribute("loginedId")%>';
		$(function() {
			loadList_ps();
		});
	</script>

	<div id="errArea"></div>
	
	<div id="filelistArea">
		<table id="fileListTable">
			<tr><td>번호</td><td>제목</td><td>날짜</td></tr>
		</table>
	</div>

</html> --%>