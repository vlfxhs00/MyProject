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
	comment_list();
	$("#btnSave").click(function(){
		comment_add();
	});
	$("#btnList").click(function(){
		location.href="${path}/board_servlet/list.do";
	});
	$("#btnReply").click(function(){
		document.form1.action="${path}/board_servlet/reply.do";
		document.form1.submit();
	});
	$("#btnEdit").click(function(){
		document.form1.action="${path}/board_servlet/pass_check.do";
		document.form1.submit();
	});
});

function comment_add(){
	var param="board_num=${dto.num}&writer="+$("#writer").val()
	+"&content="+$("#content").val();
	$.ajax({
		type: "post",
		url: "${path}/board_servlet/comment_add.do",
		data: param,
		success: function(){
			$("#writer").val("");
			$("#content").val("");
			comment_list();
		}
	});
}


function comment_list(){
	$.ajax({
		type: "post",
		url: "${path}/board_servlet/commentList.do",
		data: "num=${dto.num}",
		success: function(result){
			$("#commentList").html(result);
		}
	});
}

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
	 <a href="${path}/project/index.jsp" id="index"><img class="img-responsive center-block" src="../images2/cocktail2.jpg" id="image"></a>
	 <br>
	 <div class="container">
<h1><strong style="color: red;">Cocktail bar</strong><strong style="color: white;" >&nbsp;상세화면</strong></h1>
<form name="form1" method="post">
<div class="table-responsive"> 
<table border="1" width="1000px" class="table">
  <tr>
    <td style="color: white">날짜</td>
    <td style="color: white">${dto.reg_date}</td>
    <td style="color: white">조회수</td>
    <td style="color: white">${dto.readcount}</td>
  </tr>
  <tr>
    <td style="color: white">이름</td>
    <td colspan="3" style="color: white">${dto.writer}</td>
  </tr>
  <tr>
    <td style="color: white">제목</td>
    <td colspan="3" style="color: white">${dto.subject}</td>
  </tr>
  <tr>
    <td style="color: white">본문</td>
    <td colspan="3" style="color: white">${dto.content}</td>
  </tr>
  <tr>
    <td style="color: white;">비밀번호</td>
    <td colspan="3" style="color: black">
      <input type="password" name="passwd" id="passwd">
        <c:if test="${param.message == 'error'}">
          <span style="color: red">
           비밀번호가 일치하지 않습니다.
          </span>
        </c:if>
    </td>
  </tr>
  <tr>
    <td style="color: white">첨부파일</td>
    <td colspan="3" style="color: white">
      <c:if test="${dto.filesize > 0}">
        ${dto.filename}( ${dto.filesize} bytes )
        <a href="${path}/board_servlet/download.do?num=${dto.num}">
        [다운로드]</a>
      </c:if>
    </td>
  </tr>
  <tr>
    <td colspan="4" align="center">
      <input type="hidden" name="num" value="${dto.num}">
      <input type="button" value="수정/삭제" id="btnEdit" class="btn btn-secondary" style="font-size: 15px;">
      <input type="button" value="답변" id="btnReply" class="btn btn-secondary"  style="font-size: 15px;">
      <input type="button" value="목록" id="btnList" class="btn btn-secondary"  style="font-size: 15px;">
    </td>  
  </tr>
</table>
</div>
</form>
<!-- 댓글 쓰기 폼 -->
<table width="700px">
  <tr>
    <td><input id="writer" placeholder="이름"></td>
    <td rowspan="2">
      <button id="btnSave" type="button"  class="btn btn-secondary"  style="font-size: 15px;">확인</button>
    </td>
  </tr>
  <tr>
    <td><textarea rows="5" cols="80" placeholder="내용을 입력하세요"
    id="content"></textarea></td>
  </tr>
  
</table>

</div>
<!-- 댓글 목록을 출력할 영역 -->
<div id="commentList"></div>

</body>
</html>