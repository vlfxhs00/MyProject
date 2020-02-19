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
  <script type="text/javascript">

  </script>
  <style type="text/css">
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
    <div class="container-fluid">
   <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">  
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>    
        <span class="icon-bar"></span>                   
      </button>
    
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="session_login.jsp"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="myboardindex.jsp">게시판</a></li>
        <li><a href="#">내정보</a></li>
        <li><a href="#">장바구니</a></li>
        <li><a href="join.jsp">회원가입</a></li>
      </ul>
    </div>
    </div>
    </nav>
</body>
</html>