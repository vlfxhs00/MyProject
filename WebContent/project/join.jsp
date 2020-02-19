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


</style>

    <script type="text/javascript">
    $(function(){
    	$("#btnSave").click(function(){
    		insert();
    	});
    }); 
    function check(){
    	//아이디 체크
    	var id = document.getElementById("id");
    	if(id.value == ""){
    		alert("아이디를 입력하세요.");
    		id.focus();
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
    	//비밀번호 체크
    	var pass1 = document.getElementById("pass1");
    	if(pass1.value == ""){
    		alert("비밀번호를 입력하세요.");
    		pass1.focus();
    		return;
    	}	
    	var exp0 = /^[A-Za-z0-9]{4,10}$/;
    	if(!exp0.test(pass1.value)){
    		alert("비밀번호는 영대소문자를 사용한 8~12자리로 입력해주세요.");
    		pass1.focus();
    		return;
    	}
    	//이름 체크
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
    	var job = document.getElementById("job");
    	if(job.value == ""){
    		alert("직업을 입력해 주세요.");
    		job.focus();
    		return;
    	}
    		
    	alert("회원가입이 완료되었습니다.");
  
    }
	
	$(function(){
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function(){
			var pass1=$("#pass1").val();
			var pass2=$("#pass2").val();
			if(pass1 != "" || pass2 != ""){
				if(pass1 == pass2){
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				}else{
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled","disabled");
				}
			}
		});
		
	});
    
     function insert(){
    	var param="name="+$("#name").val()
    	+"&id="+$("#id").val()
    	+"&pass1="+$("#pass1").val()
    	+"&pass2="+$("#pass2").val()
    	+"&email="+$("#email").val()
    	+"&tel="+$("#tel").val()
    	+"&job="+$("#job").val();

    	$.ajax({
    		type: "post",
    		url: "/MyProject/JoinMemberController_servlet/join.do",
    		data: param,
    		success: function(){
    			$("#name").val("");
    			$("#id").val("");
    			$("#pass1").val(""); 
    			$("#pass2").val("");
    			$("#email").val("");
    			$("#tel").val("");
    			$("#job").val("");
    		}
    	});
    }



   
    </script>
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
        <li><a href="session_login.jsp"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">내정보</a></li>
        <li><a href="#">장바구니</a></li>
        <li><a href="#">회원가입</a></li>
      </ul>
    </div>
    </nav>
     <div class="container">
    <div class="row">
    <div class="col-sm-12 text-center" >
    <div class="col-sm-3"></div>
     
    <div class="col-sm-6">
     <h1><img src="../images2/cocktailbar.jpg"><strong style="color: red">Cocktail bar</strong><strong style="color: white;">&nbsp;회원가입</strong></h1>
    <form action="#" method="post" name="form1">
        <table class="table table-boardered">
        	<tr>
        		<th>이름</th>
        		<td><input type="text" class="form-control" id="name"></td>
        	</tr>
        
            <tr>
                <th>아이디</th>
                <td><input type="text" class="form-control" id="id" placeholder="아이디는 영문자,숫자 4~10자리로 입력하세요." ></td>
                      
            </tr>
            <tr>
                <th>패스워드</th>
                <td><input type="password" class="form-control" id="pass1" placeholder="비밀번호는 영대소문자 포함 8~12자까지 입력하세요."></td>      
            </tr>
             
            <tr>
                <th>패스워드확인</th>
                <td><input type="password" class="form-control"  id="pass2"></td> 
       
            </tr>
             
            <tr>
                <th>이메일</th>
                <td><input type="email" class="form-control" id="email"></td>       
            </tr>
             
            <tr>
                <th>전화번호</th>
                <td><input type="tel" class="form-control" id="tel" placeholder="'-'를 제외한 숫자만 입력해주세요."></td>       
            </tr>
             
         
             
            <tr>
                <th>직업</th>
                <td><input type="text" class="form-control" id="job"> </td>     
            </tr>
             
                         
           
         
             
             
            <tr>
                <td colspan="2">
                <input type="submit" class="btn btn-primary" value="회원가입" id="btnSave" onclick="check()">
                <input type="reset" class="btn btn-danger" value="취소">
                </td>
            </tr>
        
                <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div> 
                <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
             
        </table>
    </form>
    </div>
     
    </div>
    </div>
</div>
</body>
</html>