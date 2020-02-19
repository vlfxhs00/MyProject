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
	$("#btnWrite").click(function(){
		location.href="${path}/project/myboardwrite.jsp";
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
td{
	color: black;
}
th{
	color: black;
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
 <br>
 <br>
  <a href="${path}/project/index.jsp" id="index"><img class="img-responsive center-block" src="../images2/cocktail2.jpg" id="image"></a>
  <div class="container">
<h1><strong style="color: red;">Cocktail bar</strong><strong style="color: white;" >&nbsp;자유게시판</strong></h1>
<form name="form1" method="post"
action="${path}/board_servlet/search.do">
  <select name="search_option">
  <c:choose>
    <c:when test="${search_option == 'writer'}">
	    <option value="writer" selected>이름</option>
	    <option value="subject">제목</option>
	    <option value="content">내용</option>
	    <option value="all">이름+제목+내용</option>
    </c:when>
    <c:when test="${search_option == 'subject'}">
	    <option value="writer">이름</option>
	    <option value="subject" selected>제목</option>
	    <option value="content">내용</option>
	    <option value="all">이름+제목+내용</option>
    </c:when>
    <c:when test="${search_option == 'content'}">
	    <option value="writer">이름</option>
	    <option value="subject">제목</option>
	    <option value="content" selected>내용</option>
	    <option value="all">이름+제목+내용</option>
    </c:when>
    <c:when test="${search_option == 'all'}">
	    <option value="writer">이름</option>
	    <option value="subject">제목</option>
	    <option value="content">내용</option>
	    <option value="all" selected>이름+제목+내용</option>
    </c:when>
  </c:choose>
  </select>
  <input name="keyword" value="${keyword}">
  <button id="btnSearch" class="btn btn-secondary" style="font-size: 15px;">검색</button>
  <!-- button 태그는 기본값이 type="submit"이다.
  type="button"하면 js를 써야한다. -->
</form>

<button id="btnWrite" class="btn btn-secondary pull-right" style="font-size: 20px">글쓰기</button>
<div class="table-responsive"> 
<table border="1" class="table" style="margin-left: auto; margin-right: auto;">
  <tr class="table-info">
    <th>번호</th>
    <th>이름</th>
    <th>제목</th>
    <th>날짜</th>
    <th>조회수</th>
    <th>첨부파일</th>
    <th>다운로드</th>
  </tr>
 <c:forEach var="dto" items="${list}">
   <c:choose>
     <c:when test="${dto.show == 'y'}">
  <tr>
    <td style="color: white;">${dto.num}</td>
    <td style="color: white;">${dto.writer}</td>
    <td>
       <!-- 답글 들여쓰기 -->
       <c:forEach var="i" begin="1" end="${dto.re_level}">
         &nbsp;&nbsp;
       </c:forEach>
    <a href="${path}/board_servlet/view.do?num=${dto.num}">
    ${dto.subject}</a>
    <!-- 댓글갯수 표시 -->
    <c:if test="${dto.comment_count > 0}">
    	<span style="color: red;">(${dto.comment_count})</span>
    </c:if>
    </td>
    <td style="color: white;">${dto.reg_date}</td>
    <td style="color: white;">${dto.readcount}</td>
    <td align="center">
      <c:if test="${dto.filesize > 0}">
       <a href="${path}/board_servlet/download.do?num=${dto.num}">
        <img src="../images/file.gif">
       </a> 
<!-- 			 <script>
       setTimeout('location.reload()',1000);//다운로드 횟수를 1초마다 새로고침
       </script> -->
      </c:if>
    </td>
   <%--  <td>${dto.filename}</td> --%>
    
    <td id="reload" style="color: white;">${dto.down}</td>
  </tr>
  </c:when>
  <c:otherwise>
    <tr>
      <td style="color: white;">${dto.num}</td>
      <td colspan="6" align="center">삭제된 게시물입니다.</td>
    </tr>
  </c:otherwise>
  </c:choose>
 </c:forEach> 
</table>
</div>
</div>
</body>
</html>