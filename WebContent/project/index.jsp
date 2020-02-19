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
<c:if test="${param.message == 'login' }">
  <script>
    alert("로그인이 완료되었습니다.");
  </script>
</c:if>
<c:if test="${param.message == 'logout' }">
  <script>
    alert("로그아웃이 완료되었습니다.");
  </script>
</c:if>
<c:if test="${param.message == 'delete' }">
  <script>
    alert("회원 탈퇴가 되었습니다.");
  </script>
</c:if>
</head>
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
  		<img class="img-responsive center-block" src="../images2/cocktail2.jpg" id="image">
  	
  </div>


  
  <div class="container-fluid" style="text-align: center;">
  	 <div class="row">
    <div class="col-md-4">
      <h3><strong style="color: red">Cocktail bar</strong> 대표전화</h3>
      <h2>010-2305-5111</h2>
      <br>
      <br>
            업무시간 : AM 9:00 ~ PM 6:00
      <br>     
      <br>
            주말,공휴일 휴무 
      <br>
      <br>
            문의 메일: dlwocjs789@naver.com     
    </div>
    <div class="col-md-4">
<h3><strong style="color: red">무통장입금</strong> 계좌번호</h3><br><br>
예금주 : 이재천<br><br>
국민은행 : 416502-04-216502<br>
기업은행 : 00-0000-00<br>
하나은행 : 000-000000-00000<br>
신한은행 : 000-000-000000<br>
농협은행 : 000-0000-0000-00<br>
우리은행 : 0000-000-000000 
      
    </div>
    <div class="col-md-4">
 <h3><strong style="color: red">Cocktail bar</strong> 오시는 길</h3><br>
 서울시 강동구 천호대로 1095 현대코아 3층<br><br>
 <a href="https://map.naver.com/v5/search/%EC%84%9C%EC%9A%B8%EC%8B%9C%20%EA%B0%95%EB%8F%99%EA%B5%AC%20%EC%B2%9C%ED%98%B8%EB%8C%80%EB%A1%9C%201095%20%ED%98%84%EB%8C%80%EC%BD%94%EC%95%84%203%EC%B8%B5?c=14152351.0196931,4513970.4918704,17,0,0,0,dh" target="_blank"><img src="../images2/주소.jpg"></a>
 <br><br><br><br><br><br><br><br>
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

</nav>





</body>
</html>