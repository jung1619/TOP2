<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>TOP - チームプロジェクト管理</title>
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='resources/js/home.js'/>"></script>
	<script type="text/javascript" src="<c:url value='resources/js/login.js'/>"></script>
	
	<link rel="stylesheet" type="text/css" href="./resources/css/style.css"/>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
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
	
	</script>
</head>
<body>
	<!-- 상단 네비게이터. 메인과 로그인 후 개인화면에서 사용할 예정 -->
	<%-- <%@ include file="nabi-top.jsp" %> --%>
	
	<!-- 슬라이드 쇼 -->
<header class="w3-display-containerH w3-center">
  <button class="w3-button w3-block w3-green w3-hide-large w3-hide-medium" onclick="document.getElementById('download').style.display='block'">Download <i class="fa fa-android"></i> <i class="fa fa-apple"></i> <i class="fa fa-windows"></i></button>
 <div class="mySlides w3-animate-opacity">
    <img src="./resources/img/team5.jpg" alt="Image 1" style="min-width:500px" width="100%" height="90%">
    <div class="display-middle" style="white-space:nowrap;">
	    	<div class="group_top"><span class="cG">T</span>ake <span class="cG">O</span>ut <span class="cG">P</span>roject</div>
	    	<div class="group_middle">SIMPLEなグループウェア</div>
	    	<br><br>
	    	<div class="group_buttom">
		    	<c:choose>
	    			<c:when test="${sessionScope.loginedId == null}">
		    		<p><button class="w3-button w3-block w3-yellow w3-round" onclick="location.href='joinForm'">加入する</button></p>
			    	</c:when>
	    		<c:otherwise>
	    			<p><button class="w3-button w3-block w3-blue w3-round" onclick="location.href='personal'">パーソナルページへ</button></p>
	    		</c:otherwise>
	    		</c:choose>
	    	</div><br><br>
	    	<div class="group_buttom">
	    	<form class="top2" action="login" method="POST">
	    		<c:choose>
	    			<c:when test="${sessionScope.loginedId == null}">
			    	<input type="text" class="form-controlp" placeholder=" ID" name="id" id="loginID">
			    	<input type="password" class="form-controlp" placeholder=" PW" name="pw" id="loginPW">
			    	<input type="submit" class="btn btn-primary btn-md" value="login" style="margin-top: 3px">
	    		</c:when>
	    		<c:otherwise>
	    			<span class="fontsize20"><span class="site__title">${sessionScope.loginedId}</span>様
					<span class="logout"><a href="logout">&nbsp; <span style="color:white;">LOGOUT</span></a></span></span>
	    		</c:otherwise>
	    		</c:choose>
			</form>
		</div>
  	</div>
  </div>
  <div class="mySlides w3-animate-opacity">
    <img src="./resources/img/team4.jpg" alt="Image 1" style="min-width:500px" width="100%" height="90%">
    <div class="w3-display-left w3-padding w3-hide-small" style="width:35%">
      <div class="w3-black w3-opacity w3-hover-opacity-off w3-padding-large w3-round-large">
        <h1 class="w3-xlarge w3-text-red"><b>プロジェクトを</b> Take Out</h1>
        <hr class="w3-opacity">
        <p>いつ、どこでも簡単にチームプロジェクトに参加することができる！</p>
        <p><button class="w3-button w3-block w3-red w3-round" onclick="document.getElementById('download').style.display='block'">使用例</button></p>
      </div>
    </div>
  </div>
  <div class="mySlides w3-animate-opacity">
   <img src="./resources/img/team6.jpg" alt="Image 1" style="min-width:500px" width="100%" height="90%">
    <div class="w3-display-left w3-padding w3-hide-small" style="width:35%">
      <div class="w3-black w3-opacity w3-hover-opacity-off w3-padding-large w3-round-large">
        <h1 class="w3-xlarge">設置が必要ない！</h1>
        <hr class="w3-opacity">
        <p>ワード作成に必要なプログラムなし！ウェーブで解決できる</p>
        <p>そして簡単にセーブができる</p>
        <!-- <p><button class="w3-button w3-block w3-indigo w3-round" onclick="document.getElementById('download').style.display='block'">Download</button></p> -->
      </div>
    </div>
  </div>
  <a class="w3-button w3-black w3-display-right w3-margin-right w3-round w3-hide-small w3-hover-light-grey" onclick="plusDivs(1)">TOPの他の機能は? <i class="fa fa-angle-right"></i></a>
  <a class="w3-button w3-block w3-black w3-hide-large w3-hide-medium" onclick="plusDivs(1)">TOPの他の機能を調べましょうか？　<i class="fa fa-angle-right"></i></a>
</header>
<div id="load"><img src="./resources/img/30.gif" alt="loading"></div>
<div class="content containerH padding-64" id="about">
  <h3 class="center">プロジェクトをTake out</h3>
<p class="center"><em>スプーン＆フリーライダーを防ごう！ </em></p>
<p class="center"><em>(％チーム活動に名前だけ載せる人のこと)</em></p>
  <br><br>
	<div class="group_middle">
	<div>	
		<img src="./resources/icon/no1.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<img src="./resources/icon/no2.png">
	</div>
<!-- 	<div class="rightmain">
		글씨 애들글씨 애들글씨 애들글씨 애들글씨 애들
	</div> -->
	</div><br>
  <div class="group_middle">
  <p class="wide" style="font-size:20px;">スプーン＆フリーライダーの方々はさよなら！</p><br><br>
  <p class="wide" style="font-size:20px;"><i class="fa fa-camera"></i>WORD, PDFセーブ可能</p>
  </div>
 <!--  <img src="./resources/img/main1.png"> --><br><br><br><br>
  <div class="group_middle">
  <p class="wide" style="font-size:20px;"><i class="fa fa-laptop"></i>いつ、どこでも簡単にチームプロジェクトに参加</p>
  <img src="./resources/img/main2.png"></div><br><br><br><br>
  <div class="group_middle">
  <p class="wide button" style="font-size:20px;"><i class="fa fa-photo"></i>便利なスケジュール管理</p>
  <img src="./resources/img/main1.png"></div>
</div>


		<br><br><br><br><br><br><br><br><br><br><br><br>
<script>
// Slideshow
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}

</script>
</body>


</html>