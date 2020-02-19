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
  <style type="text/css">
  body{
  	background-color: black;
  
  }
  p{
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
  </style>
</head>
<body>
<nav class="navbar navbar-inverse">
  <a href="index.jsp"><button type="button" id="home">Home</button></a>
 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                      
      </button>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">내정보</a></li>
        <li><a href="#">장바구니</a></li>
        <li><a href="#">회원가입</a></li>
      </ul>
    </div>
    </nav>
<div class="container">
	
  
  <h1><strong style="color: red">Cocktail bar</strong><strong style="color: white;">를 소개합니다</strong></h1>
  <div class="page-header">
  
  <p>저희 업장을 소개하겠습니다~</p>
  <p>저희 Cocktail bar는 오랜 시간 전통을 가진 bar로써 전통있는 바텐더들이 운영을 하고 있습니다. </p>
  <p>저희는 보드카, 럼, 위스키, 브랜디, 데낄라, 진 등 모든 술을 다루고 있으며</p>
  <p>전문적인 바텐더들이 직접 타주는 칵테일 한잔을 해보는 건 어떨까요</p>
  </div>
  
  <div class="row">
    <div class="col-md-4">
      <div class="thumbnail">
          <img src="../images2/cocktail.jpg" alt="Lights" style="width:100%">
          <div class="caption">
            The most potent muse of all is our own inner child.
          </div>
        
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
          <img src="../images2/cock.jpg" alt="Nature" style="width:100%">
          <div class="caption">
           
		Purchase not friends by gifts; when thou ceasest to give, such will cease to love.


          </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        
          <img src="../images2/cock2.jpg" alt="Fjords" style="width:100%">
          <div class="caption">
           You need chaos in your soul to give birth to a dancing star.
          </div>
       
      </div>
    </div>
  </div>
</div>
<div class="container">
  <div class="row">
    <div class="col-md-4">
      <div class="thumbnail">
          <img src="../images2/cock3.jpg" alt="Lights" style="width:100%">
          <div class="caption">
           All love that has not friendship for its base, is like a mansion built upon sand.
          </div>
        
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
          <img src="../images2/cock4.jpg" alt="Nature" style="width:100%">
          <div class="caption">
            A likely impossibility is always preferable to an unconvincing possibility.
          </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        
          <img src="../images2/cock5.jpg" alt="Fjords" style="width:100%">
          <div class="caption">
            If youth only knew: if age only could.
          </div>
       
      </div>
    </div>
  </div>
</div>


</body>
</html>