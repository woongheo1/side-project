<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@ page import="a.b.c.com.project.post.vo.PostVO" %> 
<%@ page import="a.b.c.com.common.CodeUtil" %> 
<%@ page import="java.util.List" %> 

<% request.setCharacterEncoding("UTF-8");%> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD : 게시판 : 글쓰기 </title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		$(document).on("click", "#pBtn", function(){
			
			$('#postForm').attr({
				'action':'postInsert.k',
				'method':'POST',
				'enctype':'multipart/form-data'
			}).submit();
		});
	});	
</script>
<style type="text/css">
input[type="button"] {
    background-color: #d7ccc8; /* 연한 갈색으로 변경 */
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    cursor: pointer;
}

input[type="button"]:hover {
    background-color: #795548; /* 갈색으로 변경 */
}
  body {
    font-family: Arial, sans-serif;
    background-color: #f7f7f7;
    margin: 0;
    padding: 0;
  }

  h3 {
    color: #fff;
    background-color: #795548;
    text-align: center;
    margin-top: 20px;
    padding: 10px;
    border-radius: 20px;
    font-weight: bold;
  }

  hr {
    border: 1px solid ##795548;
    margin-bottom: 20px;
  }

  table {
    width: 70%;
    margin: 0 auto;
    background-color: #fff;
    border-collapse: collapse;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
    border-radius: 8px;
  }

  td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
  }

  td:first-child {
    width: 30%;
    background-color: #f2f2f2;
    font-weight: bold;
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px;
  }

  input[type="text"],
  textarea {
    width: calc(100% - 20px);
    padding: 8px;
    border: 1px solid #ddd;
    border-radius: 4px;
    margin: 5px 0;
  }

  input[type="file"] {
    width: calc(100% - 20px);
    margin-top: 5px;
  }

  input[type="button"] {
    background-color: #d7ccc8;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  input[type="button"]:hover {
    background-color: #795548;
  }

  input[type="radio"] {
    margin-right: 5px;
  }

  td:last-child {
    border-top-right-radius: 10px;
    border-bottom-right-radius: 10px;
  }
</style>
</head>
<body>
<h3>레시피작성</h3>
<hr>
<form name="postForm" id="postForm">
  <table border="1" align="center">
  <tr>
    <td colspan="2" align="center">게시판 글쓰기</td>
  </tr>
  <tr>
    <td>게시글 번호</td>
    <td><input type="text" name="pnum" id="pnum" size="30" readonly></td>
  </tr>
  <tr>
    <td>회원번호</td>
    <td><input type="text" name="mnum" id="mnum" value="${mnum}" readonly></td>
  </tr>
  <tr>
    <td>닉네임</td>
    <td><input type="text" name="mnick" id="mnick" value="${mnick}" readonly></td>
  </tr>
  <tr>
    <td>제목</td>
    <td><input type="text" name="ptitle" id="ptitle" size="53"></td>
  </tr>
  <tr>
    <td>카테고리</td>
    <td>
      <input type="radio" name="pcategory" value="양식" />양식
      <input type="radio" name="pcategory" value="중식" />중식
      <input type="radio" name="pcategory" value="한식" />한식
      <input type="radio" name="pcategory" value="일식" />일식
      <input type="radio" name="pcategory" value="디저트" />디저트
    </td>
  </tr>
  <tr>
    <td>내용</td>
    <td>
      <textarea name="pcontent" id="pcontent" cols="100" rows="40"></textarea>
    </td>
  </tr>
  <tr>
    <td>사진</td>
    <td>
      <input type="file" name="pphoto" id="pphoto" size="53">
    </td>
  </tr>
  <tr>
    <td colspan="2" align="right">
      <input type="button" value="글쓰기" id="pBtn">
    </td>
  </tr>
    

</table>
</form>
</body>
</html>