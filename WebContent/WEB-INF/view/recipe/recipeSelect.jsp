<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@ page import="a.b.c.com.project.recipe.vo.RecipeVO" %> 
<%@ page import="a.b.c.com.common.CodeUtil" %> 
<%@ page import="java.util.List" %> 

<% request.setCharacterEncoding("UTF-8");%> 
<%	
	Object obj = request.getAttribute("listS");
	if (obj == null) return;

	List<RecipeVO> list = (List<RecipeVO>)obj;	
	int nCnt = list.size();
	
	RecipeVO _rbvo = null;
	if (nCnt == 1){
		_rbvo = list.get(0);
	}	
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>레시피 작성</title>
<script  src="https://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		$(document).on("click", "#updateBtn", function(){
			.attr({ "method":"GET","action":"recipeUpdate.k"}).submit();
		});
	});	
	


</script>
<style>
    /* 테이블 스타일 */
    table {
        width: 100%;
        border-collapse: collapse;
        font-family: Arial, sans-serif;
    }
    
    th, td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    
    /* 폼 요소 스타일 */
    input[type=text], textarea {
        width: 100%;
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    
    input[type=radio] {
        margin-right: 5px;
    }
    
    /* 버튼 스타일 */
    #insertBtn {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
</style>
</head>
<body>
        <form name="recipeForm" id="recipeForm">
        	<table border="1" align="center">
        	<tr>
        		<td> 레시피 내용 수정하기 </td>
        	</tr>
            <tr>
    <td>게시글 번호</td>
    <td><input type="text" name="rnum" id="rnum" value="<%= _rbvo.getRnum() %>" size="30" readonly></td>
  </tr>
    <tr>
    <td>제목</td>
    <td><input type="text" name="rtitle" id="rtitle"value="<%= _rbvo.getRtitle() %>" size="53"></td>
  </tr>
  <tr>
    <td>내용</td>
    <td>
      <textarea name="rcontent" id="rcontent"value="<%= _rbvo.getRcontent() %>" cols="100" rows="40"></textarea>
    </td>
  </tr>
  <tr>
    <td>카테고리</td>
    <td>
      <input type="radio" name="rcategory" value="양식" />양식
      <input type="radio" name="rcategory" value="중식" />중식
      <input type="radio" name="rcategory" value="한식" />한식
      <input type="radio" name="rcategory" value="일식" />일식
      <input type="radio" name="rcategory" value="디저트" />디저트
    </td>
  </tr>
  <tr>
    <td>사진</td>
    <td>
      <input type="file" name="rphoto" id="rphoto" value="<%= _rbvo.getRphoto() %>" size="53">
    </td>
  </tr>
  <tr>
    <td>작성날짜</td>
    <td><input type="text" name="rdate" id="rdate" size="53"></td>
  </tr>
  <tr>
    <td colspan="2" align="right">
      <input type="button" value="글수정" id="updateBtn">
    </td>
  </tr>

   </table>
 </form>
</body>
</html>