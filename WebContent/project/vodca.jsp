<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <%@ include file="../include/header.jsp" %>
</head>
  <style type="text/css">

 .container-fluid  {
    background-color: black;
    background-clip: border-box, content-box;
    min-height: 300px;  /*Cocktail bar only for demo visualization */
   
}
  @media screen and (min-width: 767px) {
#navbar{
	position:absolute;
	top:200px;
	width: 1880px; 
	height: 60px;
	font-style:italic;
	font-size:30px;
	border-bottom: 3px solid #ccc;	
	border-top: 3px solid #ccc;	
	}
}
#mainstyle{
	font-size: 50px;
	font-style: oblique;
	color: red;
}
#footer{
	border-top: 3px solid #ccc;

	color: white;
	

}

</style>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">  
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>    
        <span class="icon-bar"></span>                   
      </button>
      <div><h1 id="mainstyle"><img src="../images2/cocktailbar.jpg">Cocktail bar</h1></div>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
      	<% String name=(String)session.getAttribute("name"); %>
      	<%if(name==null){ %>
        <li><a href="session_login.jsp"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
        <%} else{ %>
        <li><a href="${path}/project/main.jsp"><span class="glyphicon glyphicon-log-in"></span>Logout</a></li>
        <%} %>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<li><a href="index.jsp">Home</a></li>
        <li><a href="myboardindex.jsp">게시판</a></li>    
        <li><a href="#">장바구니</a></li>
        <%if(name == null) { %>
        <li><a href="join.jsp">회원가입</a></li>
        <%} %>
      	<%if(name!=null){ %>
      	<li><a href="${path}/JoinMemberController_servlet/mypage.do?name=<%=name%>">내정보</a></li>
        <li><a href="#"><%=name %>님</a></li>
        <%}%>  	
      </ul>
    </div>
	 <ul class="nav navbar-nav" id="navbar">
        <li><a href="whisky.jsp" style="color: white">Whisky &nbsp;&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="brandy.jsp" style="color: white">brandy &nbsp;&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="vodca.jsp" style="color: white">Vodka  &nbsp;&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="rum.jsp" style="color: white">Rum &nbsp;&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="tequila.jsp" style="color: white">Tequila &nbsp;&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="gin.jsp" style="color: white">Gin &nbsp;&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="tool.jsp" style="color: white">Tool &nbsp;&nbsp;&nbsp;&nbsp;</a></li>
        <li><a href="intro.jsp" style="color: white">Introduce &nbsp;&nbsp;&nbsp;&nbsp;</a></li>
      </ul>     
  </div>
<div class="container-fluid">
<h1 style="color: red">보드카란 ? </h1>
<h3 style="color: white">보드카는 성질이 다른 무색 · 무취 · 무미의 주류와 조화가 잘 되기 때문에 칵테일의 원료로 널리 애용되고 있다.<br><br>
(보드카를 베이스로한 칵테일)
</h3>
<br>
 <div class="row">
    <div class="col-md-4">
<img src="../images2/블랙러시안.jpg"  class="img-responsive" style="width: 250px;" align="left">
<h2 style="color: white;">&nbsp;&nbsp;Black Russian</h2><br>
<h4>&nbsp;&nbsp;<strong style="color: red;">Recipe</strong> Vodka 1oz<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Kahlua 1 / 2oz
</h4>
<h4>&nbsp;&nbsp;<strong style="color: red">Glass</strong>&nbsp;&nbsp;&nbsp;Old Fashioned Glass</h4>  

</div>
</div>
<br>
 <div class="row">
    <div class="col-md-4">
<img src="../images2/모스크뮬.jpg"  class="img-responsive" style="width: 250px;" align="left">
<h2 style="color: white;">&nbsp;&nbsp;Moscow Mule</h2><br>
<h4>&nbsp;&nbsp;<strong style="color: red;">Recipe</strong> Vodka 1.1 / 2oz<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Lime Juice 1 / 2oz<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fill with Ginger ale
</h4>
<h4>&nbsp;&nbsp;<strong style="color: red">Glass</strong>&nbsp;&nbsp;&nbsp;Highball Glass</h4> 
<h4>&nbsp;&nbsp;<strong style="color: red">Garnish</strong>&nbsp;&nbsp;&nbsp;Lemon Slice</h4> 
</div>
</div>
<br>
 <div class="row">
    <div class="col-md-4">
<img src="../images2/블러디메리.jpg"  class="img-responsive" style="width: 250px;" align="left">
<h2 style="color: white;">&nbsp;&nbsp;Bloody Mary</h2><br>
<h4>&nbsp;&nbsp;<strong style="color: red;">Recipe</strong> Worceter Sauce 1tsp<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tabasco Sauce 1dash
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pinch of Salt & Pepper(약간)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vodka 1.1 / 2oz<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fill with Tomato juice
</h4>
<h4>&nbsp;&nbsp;<strong style="color: red">Glass</strong>&nbsp;&nbsp;&nbsp;Highball Glass</h4> 
<h4>&nbsp;&nbsp;<strong style="color: red">Garnish</strong>&nbsp;&nbsp;&nbsp;Lemon Slice of Celery</h4> 

</div>
</div>
<br><br><br>



</div>
  
  
  
  
 
  
 <footer class="container-fluid text-center" id="footer">
<h5>개인정보처리방침<br><br>
이용약관<br><br>
상호명 : 주식회사 Cocktail bar<br><br>
대표자명 : 이재천 | 본사 : 서울시 강동구 천호대로 1095 현대코아 3층 | 사업자번호 : 010-2305-5111<br><br>
대표전화 : 010-2305-5111 | Fax : 010-2305-5111 | 이메일 : dlwocjs789@naver.com<br><br>
© 2019 Cocktail bar F&B. All Rights Reserved</h5>
	</footer>
 </nav> 
  
  
  
  
  
  
</body>
</html>