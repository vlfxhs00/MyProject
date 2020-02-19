<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function check(){
	document.form1.action="${path}/Product_servlet/insert.do";
	document.form1.submit();
}
</script>
</head>
<body>
<h2>방명록 작성</h2>
<form name="form1" id="form1" method="post">
<table border="1" width="500px">
 <tr>
  <td>상품 번호</td>
  <td><input name="idx" id="idx" size="40"></td>
 </tr>
 <tr>
  <td>상품명</td>
  <td><input name="p_name" id="p_name" size="40"></td>
 </tr>
 <tr>
  <td>가격</td>
  <td><input name="price" id="price" 
  size="40"></td>
 </tr>
  <tr>
  <td>수량</td>
  <td><input name="amount" id="amount" 
  size="40"></td>
   <tr>
  <td>상품 소개</td>
  <td><input name="intro" id="intro" 
  size="40"></td>
 </tr>
  <tr>
  <td>이미지</td>
  <td><input name="img" id="img" 
  size="40"></td>
 </tr>


 <tr align="center">
  <td colspan="2">
    <input type="button" value="확인" onclick="check()">
    <input type="reset" value="취소">
  </td>
 </tr>
</table>
</form>
</body>
</html>