<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>

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
  width: 310px;
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
  width: 300px;
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


<script type="text/javascript" src="<c:url value='resources/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='resources/js/join.js'/>"></script>

</head>
<body>

<div id="errpage"></div>

<div id="login-box">
  <div class="left">
    <h1>Sign up</h1>
    
    <input type="text" name="id" class="joinText" placeholder="(필수) ID" id="id" />
	<div id="idCheckDiv"></div>
    
    <input type="password" name="pw" placeholder="(필수) Password" class="joinText"  id="pw1"/>
    <input type="password" placeholder="Retype password" class="joinText" id="pw2"/>
    <div id="pwCheckDiv"></div>
    
    <input type="text" name="email" placeholder="(필수) E-mail" class="joinText" id="email"/>
    <div id="emailCheckDiv"></div>
    
    <input type="text" name="name" placeholder="(필수) Username" class="joinText" id="name" />
	
    <input type="text" name="nickname" placeholder="NickName" class="joinText" id="nickname" />
    
    <input type="text" name="company" class="joinText" placeholder="Company" id="company" />
    
    <input type="submit" name="signup_submit" value="Sign up" id="bt_join"/>
    
  </div>
</div>

</body>
</html>