<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@ page import="a.b.c.com.project.post.vo.PostVO" %> 
<%@ page import="a.b.c.com.common.CodeUtil" %> 
<%@ page import="java.util.List" %> 

<% request.setCharacterEncoding("UTF-8");%> 
<%	
	Object obj = request.getAttribute("listS");
	if (obj == null) return;

	List<PostVO> list = (List<PostVO>)obj;	
	int nCnt = list.size();
	
	PostVO _pbvo = null;
	if (nCnt == 1){
		_pbvo = list.get(0);
	}	
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){	
	
		//  U
		$(document).on("click", "#updateBtn", function(e){
			e.preventDefault();
			$("#postForm").attr({ "method":"GET", "action":"postUpdate.k"}).submit();
		});
		
		// D
		$(document).on("click", "#deleteBtn", function(e){
			e.preventDefault();
			$("#postForm").attr({ "method":"GET", "action":"postDelete.k"}).submit();
		});
		
	});		
		
</script>

<style>
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
    <td colspan="2" align="center">게시판 수정</td>
  </tr>
  <tr>
    <td>제목</td>
    <td><input type="text" name="ptitle" id="ptitle" size="53" value="<%=  _pbvo.getPtitle() %>"></td>
  </tr>
  <tr>
    <td>닉네임</td>
    <td><%=  _pbvo.getMnick() %></td>
  </tr>
  <tr>
    <td>카테고리</td>
    <td>
		<%=  _pbvo.getPcategory() %></td>
    </td>
  </tr>
  <tr>
    <td>내용</td>
    <td>
      <textarea name="pcontent" id="pcontent" cols="100" rows="40"><%= _pbvo.getPcontent() %></textarea>
    </td>
  </tr>
  <tr>
    <td>사진</td>
    <td>
      <img src="/project11/fileupload/post/<%= _pbvo.getPphoto() %>" alt="image">
    </td>
  </tr>
  <tr>
    <td>등록일</td>
    <td>
      <%=  _pbvo.getInsertdate() %>
    </td>
  </tr>
  <tr>
    <td>수정일</td>
    <td>
      <%=  _pbvo.getUpdatedate() %>
    </td>
  </tr>
  <tr>
    <td colspan="2" align="right">
      <input type="button" value="수정하기" id="updateBtn">
      <input type="button" value="삭제하기" id="deleteBtn">
    </td>
  </tr>
</table>
	<input type="hidden" name="mnum" value="<%= _pbvo.getMnum() %>">
    <input type="hidden" name="pnum" value="<%= _pbvo.getPnum() %>">
    <input type="hidden" name="plikes" value="<%= _pbvo.getPlikes() %>">
    <input type="hidden" name="mnick" value="<%= _pbvo.getMnick() %>">
    <input type="hidden" name="bhit" value="<%= _pbvo.getBhit() %>">
    <input type="hidden" name="insertdate" value="<%= _pbvo.getInsertdate() %>">
    <input type="hidden" name="updatedate" value="<%= _pbvo.getUpdatedate() %>">
    <input type="hidden" name="pcategory" value="<%= _pbvo.getPcategory() %>">
</form>
</body>
</html>