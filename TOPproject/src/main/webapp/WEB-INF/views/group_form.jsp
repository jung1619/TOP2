<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>그룹 생성</title>
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

<!-- 그룹 생성용 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css" />
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" src="<c:url value='resources/js/group_form.js'/>"></script>

<script type="text/javascript">

var memberList = [];
var loginedId = '<%=(String)session.getAttribute("loginedId")%>';

</script>

<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto:400,300,500);
*:focus {
  outline: none;
}

/* body {
  margin: 0;
  padding: 0;
  background: #DDD;
  font-size: 16px;
  color: #222;
  font-family: 'Roboto', sans-serif;
  font-weight: 300;
} */

#login-box {
  position: relative;
  margin: 5% auto;
  width: 500px;
  height: 580px;
  background: #FFF;
  border-radius: 2px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
}

.left {
  position: absolute;
  top: 0;
  left: 0;
  box-sizing: border-box;
  padding: 40px;
  width: 490px;
  height: auto;
}

h1 {
  margin: 0 0 20px 0;
  font-weight: 300;
  font-size: 28px;
}

input[type="text"].joinText,
input[type="password"].joinText {
  display: block;
  box-sizing: border-box;
  margin-bottom: 20px;
  padding: 4px;
  width: 220px;
  height: 32px;
  border: none;
  border-bottom: 1px solid #AAA;
  font-family: 'Roboto', sans-serif;
  font-weight: 400;
  font-size: 15px;
  transition: 0.2s ease;
}

input[type="text"]:focus.joinText,
input[type="password"]:focus.joinText {
  border-bottom: 2px solid #16a085;
  color: #16a085;
  transition: 0.2s ease;
}

input[type="submit"] {
  margin-top: 28px;
  width: 120px;
  height: 45px;
  background: #16a085;
  border: none;
  border-radius: 2px;
  color: #FFF;
  font-family: 'Roboto', sans-serif;
  font-weight: 500;
  text-transform: uppercase;
  transition: 0.1s ease;
  cursor: pointer;
}

input[type="submit"]:hover,
input[type="submit"]:focus {
  opacity: 0.8;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
  transition: 0.1s ease;
}

input[type="submit"]:active {
  opacity: 1;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.4);
  transition: 0.1s ease;
}

button.social-signin {
  margin-bottom: 20px;
  width: 220px;
  height: 36px;
  border: none;
  border-radius: 2px;
  color: #FFF;
  font-family: 'Roboto', sans-serif;
  font-weight: 500;
  transition: 0.2s ease;
  cursor: pointer;
}

button.social-signin:hover,
button.social-signin:focus {
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
  transition: 0.2s ease;
}


.checkText{
  border:none;
  border-right:0px;
  border-top:0px; 
  boder-left:0px;
  boder-bottom:0px;
  color : rgb(255,0,0);
  
}
</style>
</head>
<body>
<%@ include file="nabi-left.jsp" %>
<%@ include file="nabi-top.jsp" %>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header" style="font-size:40px;">PERSONAL PAGE</h1>
		</div>
	</div>
	<div id="errpage"></div>
<div class="row">
<div class="col-md-6">
				<div class="panel panel-default articles" style="width:1200px">
					<div class="panel-heading">
						CREATE PROJECT
						</div>
					<div class="panel-body articles-container">
						
						 <div class="col-xs-12">

						    <input hidden="loginedId" value="${sessionScope.loginedId}">
						    <input type="text" placeholder="프로젝트명" id="projacename" class="joinText" /><br>
						    
						    <label for="fl">프로젝트 구성원을 선택하십시오.<br>(현재 친구 상태인 유저만 추가 가능합니다.)</label><br><br>
						    <input type="text" placeholder="아이디로 검색할 수 있습니다." class="joinText" id="fl">
						    
						    
						    <ul id="menu" style="width:600px">
							  <li class="ui-widget-header"> <div>프로젝트 매니저 : ${sessionScope.loginedId}</div> </li>
							  <!-- 선택된 멤버가 추가되는 부분 -->
							  
							</ul>
							<input type="button" value="선택 삭제" onclick="del()"><br><br><br>
					
					    	프로젝트 기간을 설정하십시오.<br>
					    	<p>시작일: <input type="text" id="datepicker_start"></p>
					    	<p>종료일: <input type="text" id="datepicker_end"></p>
							
							
						    <input type="button" value="Create" onclick="create()" />
						    </div>
					</div>
				</div><!--End .articles-->
				
</div>
</div>
</div>
</body>
</html>





<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>그룹 생성</title>

<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto:400,300,500);
*:focus {
  outline: none;
}

body {
  margin: 0;
  padding: 0;
  background: #DDD;
  font-size: 16px;
  color: #222;
  font-family: 'Roboto', sans-serif;
  font-weight: 300;
}

#login-box {
  position: relative;
  margin: 5% auto;
  width: 500px;
  height: 580px;
  background: #FFF;
  border-radius: 2px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
}

.left {
  position: absolute;
  top: 0;
  left: 0;
  box-sizing: border-box;
  padding: 40px;
  width: 490px;
  height: auto;
}

h1 {
  margin: 0 0 20px 0;
  font-weight: 300;
  font-size: 28px;
}

input[type="text"].joinText,
input[type="password"].joinText {
  display: block;
  box-sizing: border-box;
  margin-bottom: 20px;
  padding: 4px;
  width: 220px;
  height: 32px;
  border: none;
  border-bottom: 1px solid #AAA;
  font-family: 'Roboto', sans-serif;
  font-weight: 400;
  font-size: 15px;
  transition: 0.2s ease;
}

input[type="text"]:focus.joinText,
input[type="password"]:focus.joinText {
  border-bottom: 2px solid #16a085;
  color: #16a085;
  transition: 0.2s ease;
}

input[type="submit"] {
  margin-top: 28px;
  width: 120px;
  height: 45px;
  background: #16a085;
  border: none;
  border-radius: 2px;
  color: #FFF;
  font-family: 'Roboto', sans-serif;
  font-weight: 500;
  text-transform: uppercase;
  transition: 0.1s ease;
  cursor: pointer;
}

input[type="submit"]:hover,
input[type="submit"]:focus {
  opacity: 0.8;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
  transition: 0.1s ease;
}

input[type="submit"]:active {
  opacity: 1;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.4);
  transition: 0.1s ease;
}

button.social-signin {
  margin-bottom: 20px;
  width: 220px;
  height: 36px;
  border: none;
  border-radius: 2px;
  color: #FFF;
  font-family: 'Roboto', sans-serif;
  font-weight: 500;
  transition: 0.2s ease;
  cursor: pointer;
}

button.social-signin:hover,
button.social-signin:focus {
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
  transition: 0.2s ease;
}


.checkText{
  border:none;
  border-right:0px;
  border-top:0px; 
  boder-left:0px;
  boder-bottom:0px;
  color : rgb(255,0,0);
  
}
</style>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css" />
<script type="text/javascript" src="<c:url value='resources/js/jquery-3.3.1.min.js'/>"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" src="<c:url value='resources/js/group_form.js'/>"></script>

<script type="text/javascript">

var memberList = [];
var loginedId = '<%=(String)session.getAttribute("loginedId")%>';

</script>

</head>
<body>

	<div id="errpage"></div>
	
	<div id="login-box">
	  <div class="left">
	    <h1>새 프로젝트 생성</h1>
	    
	    <input hidden="loginedId" value="${sessionScope.loginedId}">
	    <input type="text" placeholder="프로젝트명" id="projacename" class="joinText" /><br>
	    
	    <label for="fl">프로젝트 구성원을 선택하십시오.<br>(현재 친구 상태인 유저만 추가 가능합니다.)</label><br><br>
	    <input type="text" placeholder="아이디로 검색할 수 있습니다." class="joinText" id="fl">
	    
	    
	    <ul id="menu">
		  <li class="ui-widget-header"> <div>프로젝트 매니저 : ${sessionScope.loginedId}</div> </li>
		  <!-- 선택된 멤버가 추가되는 부분 -->
		  
		</ul>
		<input type="button" value="선택 삭제" onclick="del()"><br><br><br>

    	프로젝트 기간을 설정하십시오.<br>
    	<p>시작일: <input type="text" id="datepicker_start"></p>
    	<p>종료일: <input type="text" id="datepicker_end"></p>
		
		
	    <input type="button" value="Create" onclick="create()" />
	    
	  </div>
	</div>

</body>
</html> --%>