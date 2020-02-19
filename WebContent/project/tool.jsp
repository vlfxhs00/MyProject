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

 .container-fluid {
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

    [class|="col"] {
    
      color: white  
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
      <br><br><br>
    <div class="row">
      <div class="col-xs-12 col-sm-6 col-md-4">
      <img src="../images2/지거.jpg" width="200px" align="left">
      <h4>&nbsp;&nbsp;<strong style="color: red">Tool Name</strong> : 지거(MESURE)</h4><br>
   	  <h5>&nbsp;&nbsp;<strong style="color: red">용도</strong> :
   	  칵테일용 계량 용기. 전문 바텐더들의 소도구로 칵테일 제조 시 각 재료를 정확한 비율로 배합하기 위해 사용하는 일종의 계량컵이다.
   	  지거는 일반적으로 위아래에 각기 다른 두 개의 계량컵이 붙어 있어 용량에 따라 뒤집어가며 사용할 수 있으며 나라별 계량 단위에 따라 달라지기도 한다.
   	  프랑스의 더블 지거는 양면에 각각 2cl(20ml), 4cl(40ml)를 계량할 수 있게 되어 있다.
   	  바에서 아페리티프를 서빙하는 잔으로 사용하기도 한다.
   	   </h5>
      </div>

      
      <div class="col-xs-12 col-sm-6 col-md-4">
      <img src="../images2/스트레이너.jpg" width="200px" align="left">
      <h4>&nbsp;&nbsp;<strong style="color: red">Tool Name</strong> : 스트레이너(Strainer)</h4><br>
   	  <h5>&nbsp;&nbsp;<strong style="color: red">용도</strong> :
   	  Mixing Glass에 맞는 칵테일을 글라스에 따를 때 속이 들어 있는 얼음이 밖으로 흘러나오는 것을 방지한다.
   	   </h5>
      </div>
      <br>
      <br>
         <div class="col-xs-12 col-sm-6 col-md-4">
      <img src="../images2/티스푼.jpg" width="200px" align="left">
      <h4>&nbsp;&nbsp;<strong style="color: red">Tool Name</strong> : 티스푼(Tea Spoon)</h4><br>
   	  <h5>&nbsp;&nbsp;<strong style="color: red">용도</strong> :
   		 재료의 분량을 잴 때 쓰는 용어로서 1tsp는 약 1/8 oz 가량이다. 1테이블스푼은 3/8 oz의 분량이 된다.
   		 그리고 칵테일을 저을 때 또한 사용된다.
   	   </h5>
      </div>
      
      
        <div class="col-xs-12 col-sm-6 col-md-4">
      <img src="../images2/셰이커.jpg" width="200px" align="left">
      <h4>&nbsp;&nbsp;<strong style="color: red">Tool Name</strong> : 셰이커(SHAKER)</h4><br>
   	  <h5>&nbsp;&nbsp;<strong style="color: red">용도</strong> :
   	  칵테일용 셰이커. 
   	  바텐더가 칵테일 제조 시 사용하는 도구의 하나로 재료를 얼음과 함께 넣고 흔들어 차가운 칵테일을 서빙하기 위한 것이다. 
   	  특히 크림이나 시럽 농도의 리큐어 베이스에 달걀, 우유 또는 과일주스를 넣어 섞는 칵테일 종류를 만들 때 세이커를 많이 사용한다. 
   	  세이커는 3가지 타입으로 분류할 수 있으며 용량은 500ml에서 1L까지 다양하다.
   	   </h5>
      </div>
      
          <div class="col-xs-12 col-sm-6 col-md-4">
      <img src="../images2/믹싱글라스.jpg" width="200px" align="left">
      <h4>&nbsp;&nbsp;<strong style="color: red">Tool Name</strong> : 믹싱 글라스(Mixing Glass)</h4><br>
   	  <h5>&nbsp;&nbsp;<strong style="color: red">용도</strong> :
   	  Shaker와 같이 술을 섞을 때 사용하는 것이나 셰이커를 사용하는 것과는 다른 맛의 칵테일을 만들고자 할 때 사용.
	  칵테일을 만드는 조주 Glass로서 증류주와 증류주를 혼합할 때, 증류주와 기타주류를 혼합할 때 주로 쓰이는 칵테일 조주 글라스를 말함.
	  ex) 마티니, 맨하탄 등을 만들 때 사용
   	   </h5>
      <br><br><br><br><br><br><br><br><br><br><br><br>
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