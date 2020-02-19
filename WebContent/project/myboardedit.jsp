<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
<%@ include file="../include/header.jsp" %>
    <script src="../include/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="../include/jquery-3.4.1.min.js"></script> 
<link rel="stylesheet" href="${path}/include/css/bootstrap.css">
<script type="text/javascript">
$(function(){
	$("#btnUpdate").click(function(){
		document.form1.action="${path}/board_servlet/update.do";
		document.form1.submit();
	});
	$("#btnDelete").click(function(){
		document.form1.action="${path}/board_servlet/delete.do";
		document.form1.submit();
	});
	
});
</script>
<style type="text/css">
body { 
	font-size: 16px;	
	background-color: black;
}
 #image{
   	 width: 600px;
   }
.container-fluid{
	position: absolute;
	left: 50px;
	color: white;
	top: 200px;
}
#table_color{
	color: white;
}
#table_color:hover{
	color: black;
	background-color: white;
}

</style>
</head>
<body>
<div class="container-fluid">  
 <div class="row"> 
 <div class="col-xs-3"><h3><strong>게시판</strong></h3><br></div>
 </div> 
 <div class="row">
 <div class="col-xs-3"><a href="#" style="color: white;">&nbsp;&nbsp;&nbsp;&nbsp;내 정보</a></div>
 </div> 
 <br>
 <div class="row">
 <div class="col-xs-3"><a href="${path}/project/index.jsp" style="color: white;">&nbsp;&nbsp;&nbsp;&nbsp;쇼핑하기</a></div> 
 </div>
 <br>
 <div class="row">
 <div class="col-xs-3"><a href="#" style="color: white;">&nbsp;&nbsp;&nbsp;&nbsp;주문관련 문의</a></div> 
 </div>
 <br>
 <div class="row">
 <div class="col-xs-3"><a href="${path}/project/myboardindex.jsp" style="color: white;">&nbsp;&nbsp;&nbsp;&nbsp;자유게시판</a></div> 
 </div>
 </div>
 <br><br>
	 <a href="${path}/project/index.jsp" id="index"><img class="img-responsive center-block" src="../images2/cocktail2.jpg" id="image"></a>
<form name="form1" method="post" enctype="multipart/form-data">
<div class="container">
<h1><strong style="color: red;">Cocktail bar</strong><strong style="color: white;" >&nbsp;수정/삭제</strong></h1>
<div class="table-responsive"> 
<table border="1" width="700px" class="table">
  <tr>
    <td style="color: white;">이름</td>
    <td><input name="writer" id="writer" value="${dto.writer}"></td>
  </tr>
  <tr>
    <td style="color: white;">제목</td>
    <td><input name="subject" id="subject" size="60" 
    value="${dto.subject}"></td>
  </tr>
  <tr>
    <td style="color: white;">본문</td>
    <td><textarea rows="5" cols="60" style="color: black;"
    name="content" id="content">${dto.content}</textarea></td>
  </tr>
  <tr>
    <td style="color: white;">첨부파일</td>
    <td style="color: white;">
      <c:if test="${dto.filesize > 0}">
        ${dto.filename} ( ${dto.filesize / 1024 } KB )
        <input type="checkbox" name="fileDel">첨부파일 삭제<br>
      </c:if>
    <input type="file" name="file1"></td>
  </tr>
  <tr>
    <td style="color: white;">비밀번호</td>
    <td><input type="password" name="passwd" id="passwd"></td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <!-- 수정,삭제를 위한 처리 -->
      <input type="hidden" name="num" value="${dto.num}">
      <input type="button" value="수정" id="btnUpdate"  class="btn btn-secondary" style="font-size: 15px;">
      <input type="button" value="삭제" id="btnDelete"  class="btn btn-secondary" style="font-size: 15px;">
    </td>
  </tr>
</table>
</div>
</div>
</form>
</body>
</html>