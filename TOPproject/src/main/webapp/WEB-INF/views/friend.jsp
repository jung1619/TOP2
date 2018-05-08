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
<!-- <script src="//code.jquery.com/jquery-latest.min.js"></script> -->
<script type="text/javascript">
/* $(window).load(function() {
	$('#load').hide();
}); */

		var loginedId = '<%=(String)session.getAttribute("loginedId")%>';
		$(function() {
			load_friendList();
			load_friendReq();
			load_friendRec();
		}); //ready
	</script>
<script type="text/javascript" src="<c:url value='resources/js/friend2.js'/>"></script>
<%-- <script type="text/javascript" src="<c:url value='/resources/js/friend.js'/>"></script> --%>
<style type="text/css">
			.searchId{ ime-mode:disabled; }
			td{ padding: 3px; }
		</style>
</head>
<body id="bodyP">
<!-- <div id="load"><img src="./resources/img/30.gif" alt="loading"></div> -->

<%@ include file="nabi-left.jsp" %>
<%@ include file="nabi-top2.jsp" %>	
	<div id="errArea"></div>
	
	

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">パーソナルページ</h1>
		</div>
	</div>
<div class="row">
<div class="col-md-6">
				<div class="panel panel-default articles">
					<div class="panel-heading">
						フレンド
						<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span></div>
					<div class="panel-body articles-container">

					
						<div class="article border-bottom">
							<div class="col-xs-12">
						<div id="friendList">
							<h4>あなたのフレンド</h4>
							<table id="flTable">
							</table>
						</div><p /><p />
							</div>
							<div class="clear"></div>
						</div><!--End .article-->
						
						<!-- <div class="article border-bottom"> -->
							<div class="col-xs-12">
								<div class="row">
									<div class="col-xs-10 col-md-10">
									<div id="friendReqList">
										<h4>フレンド申し込み中</h4>
										<table id="reqTable_req">
										</table><p /><p />
									</div>
								</div>
							</div>
							<div class="clear"></div>
						</div><!--End .article-->
						
					<!-- </div> -->
					
					<div class="article border-bottom">
							<div class="col-xs-12">
								<div class="row">
									<div class="col-xs-10 col-md-10">
									<h4>貰ったフレンド申し込み</h4>
										<table id="reqTable_rec">
										</table>
									</div><p /><p />
								</div>
							</div>
							<div class="clear"></div>
						</div><!--End .article-->
					
				</div><!--End .articles-->
				
			</div>
			<br>

					<div class="panel panel-default articles">
					<div class="panel-heading">
						IDを検索してフレンド申し込みをしよう
						<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span></div>
					<div class="panel-body articles-container">			
					<!-- <div class="article border-bottom"> -->
							<div class="col-xs-12">	
								<div class="row">
									<div class="col-xs-10 col-md-10">
									<div id="freindReq">
										<input type="text" id="searchId" class="searchId" placeholder="IDで検索してください" onkeyup="searchId()">
										<div id="searchedIds"></div>
									</div> 
								</div>
							</div>
							<div class="clear"></div></div>
						<!-- </div> --><!--End .article-->
						</div>
					</div>
		
<br><br>		
<!-- 	<div id="freindReq">
		<h1 class="page-header" style="font-size:15px;">회원을 검색하여 친구 요청을 보내십시오.</h1>		
		<input type="text" id="searchId" class="searchId" placeholder="ID로만 검색할 수 있습니다." onkeyup="searchId()">
		<div id="searchedIds"></div>
	</div>  -->
			
		
</div>


</div>
</div>
</body>
</html>

<%-- 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html> <!-- 친구 관리 페이지 -->

	<head>
		<style type="text/css">
			.searchId{
				ime-mode:disabled;
			}
		</style>
	</head>
	
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
		<input type="text" id="searchId" class="searchId" placeholder="ID로만 검색할 수 있습니다." onkeyup="searchId()">
		<div id="searchedIds"></div>
	</div>
	
</html> --%>