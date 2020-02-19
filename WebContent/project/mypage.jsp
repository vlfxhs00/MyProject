<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
td{
	color: white;
}


body {
	background-color: black;
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
<script type="text/javascript">
$(function() {
	
	$("#btnUpdate").click(function() {
		var pass1=$("#pass1").val();
		if(pass1==""){
			alert("비밀번호 입력하세요");
			pass1.focus();
			return;
		}
		//^시작, $끝, {4,10}글자수 지정
		var exp1 = /^[A-Za-z0-9]{4,10}$/;//정규표현식
		//정규표현식.test(검사할 문자열) - 규칙에 맞으면 true, 틀리면 false
		if(!exp1.test(id.value)){
			alert("아이디는 영문자,숫자 4~10자리로 입력하세요.");
			id.focus();
			return;
		}
		var name = document.getElementById("name");
		
		//\x20: 16진수 20=>10진수 32, (스페이스 1개인 공백문자를 의미)
		var exp2 = /^[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{2,10}$/;
		if(!exp2.test(name.value)){
			alert("이름은 한글 2~10자 이내로 입력하세요.");
			name.focus();
			return;
		}
		//이메일 체크
		var email = document.getElementById("email");
		
		var exp3 = /^[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z]{2,}$/;
		if(!exp3.test(email.value)){
			alert("이메일 형식이 잘못 되었습니다. ex) abc@abc.com");
			email.focus();
			return;
		}
		//전화번호 체크
		var tel = document.getElementById("tel");
		var exp = /^[0-9]+$/;
		console.log("match:"+tel.value.match(exp));
		console.log("test:"+exp.test(tel.value));
		if(!tel.value.match(exp)){
			alert("'-'를 제외한 숫자만 입력해주세요.");
			tel.focus();
			return;
		}
		document.form1.action="${path}/JoinMemberController_servlet/update.do";
		document.form1.submit();
	});
	$("#btnDelete").click(function() {
		var check= confirm("정말로 탈퇴하시겠습니까?");
		if(check==true){
			document.form1.action="${path}/JoinMemberController_servlet/delete.do";
			document.form1.submit();
		}
	});
});



</script>
<c:if test="${param.message == 'update' }">
<script>
alert('회원님의 정보가 수정되었습니다.');
location.href="${path}/JoinMemberController_servlet/mypage.do?name=${sessionScope.name}";
</script>
</c:if>
<c:if test="${param.message == 'logout' }">
  <script>
    alert("로그아웃이 완료되었습니다.");
  </script>
  </c:if>
</head>
<body>
<nav class="navbar navbar-inverse">
  <a href="${path}/project/index.jsp"><button type="button" id="home">Home</button></a>
 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                      
      </button>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
      <% String name=(String)session.getAttribute("name"); %>
		     
        <li><a href="${path}/project/main.jsp"><span class="glyphicon glyphicon-log-in"></span>logout</a></li>
	
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">장바구니</a></li>
        <li><a href="${path}/project/join.jsp">회원가입</a></li>
      </ul>
    </div>
    </nav>
        <div class="container">
    <div class="row">
    <div class="col-sm-12 text-center" >
    <div class="col-sm-3"></div>
     
    <div class="col-sm-6">
    <%if(name!=null){%>
     <h1 style="color: white;"><img src="../images2/cocktailbar.jpg"><%=name %>님의 회원정보</h1>
	<%} %>
<form name="form1" id="form1">
<table class="table table-boardered">
<c:forEach var="row" items="${items}">
	<tr>
  <td>이름</td>
  <td><input name="name" value="${row.name}" class="form-control" id="name"></td>
  </tr>
  <tr>
  <td>비밀번호</td>
  <td><input type="password" id="pass1" name="pass1" class="form-control"></td>
  </tr>
   <tr>
  <td>비밀번호 확인</td>
  <td><input type="password" id="pass2" name="pass2" class="form-control"></td>
  </tr>
  <tr>
  <td>아이디</td>
  <td><input name="id" value="${row.id}" class="form-control" id="id"></td>
  <tr>
  <td>이메일</td>
  <td><input type="email" name="email" value="${row.email}" class="form-control" id="email"></td>
  <tr>
  <td>전화번호</td>
  <td><input name="tel" value="${row.tel}" class="form-control" id="tel"></td>
  </tr>
  <tr>
  <td>직업</td>
  <td><input name="job" value="${row.job}" class="form-control" id="job"></td>
  </tr> 
 <tr>
                <td colspan="2">
                <input class="btn btn-primary" value="정보수정" id="btnUpdate">
                <input class="btn btn-danger" value="회원탈퇴" id="btnDelete">
                </td>
            </tr>
</c:forEach>
</table>
</form>
</div>
</div>
</div>
</div>





</body>
</html>