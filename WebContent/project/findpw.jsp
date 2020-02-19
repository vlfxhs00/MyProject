<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <script src="../include/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	background-color: black;
	color: white;
}

 @media screen and (min-width: 767px) {
  #home{
    background-color: #262626;
  	color: white;
	font-size: 30px;
	border-style: none;
	font-style: oblique;
	position: absolute;
	left: 0;
	}
  }
  #image{
   	width: 600px;
   }
 .text-center{
 	font-size: 30px;
 }  
#footer{
	border-top: 3px solid #ccc;

	color: white;
	

}

</style>
</head>
<body>
<nav class="navbar navbar-inverse">
  <a href="${path}/MyProject/project/index.jsp"><button type="button" id="home">Home</button></a>
 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                      
      </button>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="${path}/MyProject/project/session_login.jsp"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">내정보</a></li>
        <li><a href="#">장바구니</a></li>
        <li><a href="#">회원가입</a></li>
      </ul>
    </div>
    </nav>

<% String pass1=(String)request.getAttribute("pass1"); %>
  		<a href="${path}/MyProject/project/index.jsp"><img class="img-responsive center-block" src="../images2/cocktail2.jpg" id="image"></a>

<p class="text-center">회원님의 비밀번호는 <%=pass1 %> 입니다.</p><br><br>
   <div class="row text-center" style="width: 100%">
                    <div style="width: 30%; float:none; margin:0 auto" >
 	<br><br><br><br><br><br><br>
                            <div>
                    </div>
            </div>
    </div>
	<footer class="container-fluid text-center" id="footer">
<h5>개인정보처리방침<br><br>
이용약관<br><br>
상호명 : 주식회사 Cocktail bar<br><br>
대표자명 : 이재천 | 본사 : 서울시 강동구 천호대로 1095 현대코아 3층 | 사업자번호 : 010-2305-5111<br><br>
대표전화 : 010-2305-5111 | Fax : 010-2305-5111 | 이메일 : dlwocjs789@naver.com<br><br>
© 2019 Cocktail bar F&B. All Rights Reserved</h5>
	</footer>




</body>
</html>