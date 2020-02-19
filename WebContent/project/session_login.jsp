<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.4.1.min.js"></script>
   <script src="../include/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#btnLogin").click(function() {
		var id=$("#id").val();
		var pass1=$("#pass1").val();
		if(id==""){
			alert("아이디를 입력해주세요");
			id.focus();
			return;
		}
		if(pass1==""){
			alert("비밀번호를 입력해주세요");
			pass1.focus();
			return;
		}
		document.login_form.submit();
	});
});
$('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').trigger('focus')
	})
</script>
<style type="text/css">
  body {
        background: black;
        padding: 60px 0;
    }
    
    #login-form > div {
        margin: 15px 0;
    }
    #btnLogin{
    	height: 80px;
    	font-size: 30px;
    }
   #image{
   	width: 600px;
   }
	


</style>
<!-- JSTL 명령어 -->
<!-- c: 코어태그 -->
<c:if test="${param.message == 'error' }">
  <script>
    alert("아이디 또는 비밀번호가 일치하지 않습니다.");
  </script>
</c:if>
<c:if test="${param.message == 'logout' }">
  <script>
    alert("로그아웃되었습니다.")
  </script>   
</c:if>
</head>  
<body>
		
  		<a href="index.jsp"><img class="img-responsive center-block" src="../images2/cocktail2.jpg" id="image"></a>
 <h1 style="text-align: center;"><img src="../images2/cocktailbar.jpg"><strong style="color: red">Cocktail bar</strong><strong style="color: white;">&nbsp;로그인</strong></h1>
		<br><br>
<div class="container" id="container">
	<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
		<div class="panel panel-success">

			<div class="panel-body">
			<form id="login-form" name="login_form" action="${path}/JoinMemberController_servlet/login.do">
				<div><input type="text" class="form-control" name="id" id="id" placeholder="아이디">
				</div>
				<div><input type="password" class="form-control" name="pass1" id="pass1" placeholder="비밀번호">
				</div>
				<div>
				<button id="btnLogin" type="button" class="form-control btn btn-danger">로그인</button>
				</div>
			</form>
				<div class="container-fluid" style="text-align: center;">
  	 	<div class="row">
  	 	<div class="col-md-4">
    	<button type="button" data-toggle="modal" data-target="#idModal" class="btn btn-primary">
  아이디 찾기
</button>

<!-- Modal -->
<div class="modal fade" id="idModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">아이디 찾기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <form id="form1" name="form1" action="${path}/JoinMemberController_servlet/findid.do">
	<input type="text" name="name" id="name" placeholder="이름">
	<input type="text" name="email" id="email" placeholder="이메일"><br><br>
	<button id="findid" class="btn btn-secondary">아이디 찾기</button><br>
	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
	</div>
			<div class="col-md-4">
			    	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#passModal">
비밀번호 찾기
</button>

<!-- Modal -->
<div class="modal fade" id="passModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">비밀번호 찾기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <form id="form1" name="form1" action="${path}/JoinMemberController_servlet/findpw.do">
	<input type="text" name="id" id="id" placeholder="아이디">
	<input type="text" name="email" id="email" placeholder="이메일"><br><br>
	<button id="findpw" class="btn btn-secondary">비밀번호 찾기</button><br>
	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
			</div>
			<div class="col-md-4">
			<a href="join.jsp"><button  type="button" class="btn btn-primary">회원가입</button></a>
			</div>
			</div>
			</div>	
			</div>
		</div>
	</div>

</div>

</body>
</html>