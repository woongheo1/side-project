<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@ page import="a.b.c.com.project.post.vo.PostVO" %>
<%@ page import="a.b.c.com.project.member.vo.MemberVO" %> 
<%@ page import="java.util.List" %>

<% request.setCharacterEncoding("UTF-8"); %> 
<%	
	Object obj = request.getAttribute("listP");
	if (obj == null) return;
	
	MemberVO mvo = (MemberVO) request.getAttribute("user");
	
	List<PostVO> list = (List<PostVO>) obj;	
	int nCnt = list.size();
	
	PostVO _pbvo = null;
	if (nCnt == 1) {
		_pbvo = list.get(0);
	}	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 상세 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
$(document).ready(function(){	
	// like_1 버튼 
	$(document).on("click", "#likesBtn", function(){
		
		let boardLikeURL = "like_cnt_1.k";
		let reqType = "GET";
		let dataParam = {
			plikes: $(this).val(),
			mnum: $("mnum").val(),
			bnum: $("bnum").val(),
		};		
		dataParam = $("#boardlikesForm").serialize();
		console.log("dataParam >>> : " + dataParam);
		
		$.ajax({
			url: boardLikeURL,
			type: reqType,								
			data: dataParam,	            
			success: whenSuccess				
		});
		
		function whenSuccess(resData){
			console.log("resData >>> : " + resData);			
			$("#disp_cnt_recom").text(resData).val();				
		}	
		
	});
	
	$(document).on("click", "#updateBtn", function(){	

		$("#boardlikesForm").attr({ "method":"GET","action":"postSelect.k"}).submit();
	});	
	
	$(document).on("click", "#deleteBtn", function(){	

		$("#boardlikesForm").attr({ "method":"GET","action":"postDelete.k"}).submit();
	});	
	
});
</script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style>
    	header {
		    position: fixed;
		    top: 0;
		    width: 100%;
		    background-color: #fff;
		    z-index: 1000;
		}
    	body, h1, h2, h3, p, nav ul li a, .login-button {
    		font-family: 'Nunito', sans-serif;
		}
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8; /* 외부 배경색 변경 */
        }
        header, nav, footer {
            background-color: #fff; /* 컨테이너 색상 */
            padding: 10px 20px;
        }

        nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        nav ul li {
            display: inline;
            margin-right: 20px;
        }
        nav ul li a {
            text-decoration: none;
            color: rgb(57, 57, 57);
            font-weight: bold;
            transition: color 0.3s;
            
        }
        nav ul li a:hover {
 		   color: rgb(189, 160, 126); /* 마우스를 올렸을 때 색상 변경 */
		}
		
        .recipe-card {
            border: 1px solid #ddd;
            margin: 10px;
            padding: 15px;
            border-radius: 5px;
            background-color: #fff;
        }
        .recipe-card img {
            max-width: 100%;
            border-radius: 5px;
        }
        .login-button , .login-button post-button{
            text-decoration: none;
            color: #fff;
            background-color: #333;
            padding: 10px 20px;
            border-radius: 5px;
            transition: color 0.3s;
        }

        .slider {
            position: relative;
            width: 80%;
            margin: auto;
            overflow: hidden;
        }
        .slides {
            display: flex;
            transition: transform 0.5s ease-in-out;
        }
        .slide {
            min-width: 20%;
            box-sizing: border-box;
            padding: 10px;
        }
        .slide img {
            width: 100%;
            border-radius: 5px;
        }
        .navigation {
            position: absolute;
            top: 50%;
            width: 100%;
            display: flex;
            justify-content: space-between;
            transform: translateY(-50%);
            z-index: 10; /* Add this line */
        }
        .navigation a {
            background-color: rgba(0, 0, 0, 0.5);
            color: white;
            padding: 10px;
            text-decoration: none;
            border-radius: 100%;
        }
        nav ul li a {
        	color: rgb(57, 57, 57);
        }
        main{
            margin-top: 150px; /* 상단에서 150px 떨어지도록 설정 */
		}
    body {
        background-color: #f8f9fa;
    }
    .recipe-container {
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        margin-top: 20px;
    }
    .recipe-image {
        max-width: 100%;
        border-radius: 10px;
    }
    .recipe-title {
        font-size: 2rem;
        font-weight: bold;
        margin-top: 20px;
    }
    .recipe-info {
        margin-top: 10px;
        font-size: 0.9rem;
        color: #6c757d;
    }
    .recipe-content {
        margin-top: 20px;
        font-size: 1.1rem;
        line-height: 1.6;
    }
    .action-buttons {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
    }
    .edit-button {
        margin-left: auto;
    }
</style>
</head>

<body>
	<header>
	    <div class="container" style="display: flex; justify-content: space-between;"> <!-- 양쪽 정렬 -->
	        <h1 style="margin: 0; color: rgb(234, 198, 155)">요투리</h1> <!-- 왼쪽 정렬 -->
	        <div> <!-- 오른쪽 정렬 -->
	        	<img src="/project11/fileupload/mem/<%= mvo.getMphoto() %>" border="1" width="100" height="100" alt="image">
            	<%= mvo.getMnick() %>님 환영합니다
	            <a href="#" class="login-button" style="background-color: rgb(234, 198, 155)">로그인</a>
	            <a href="postForm.k" class="login-button post-button" style="background-color: rgb(234, 198, 155)">게시글 작성</a>
	        </div>
	    </div>
	    <div class="container" >
	    <nav>
            <ul>
                <li><a href="http://localhost:8088/project11/main.jsp">추천</a></li>
                <li><a href="#">레시피</a></li>
                <li><a href="postSelectAll.k">회원게시물</a></li>
                <li><a href="#">가성비 레시피</a></li>
            </ul>
        </nav>
        </div>
	</header>
<form id="boardlikesForm">
<div class="container" style="margin-top: 150px;">
    <div class="action-buttons">
        <button type="button" class="btn btn-primary edit-button" id="updateBtn">수정하기</button>
        <button type="button" class="btn btn-primary edit-button" id="deleteBtn">삭제하기</button>
    </div>
    <div class="recipe-container">
        <div class="row">
            <div class="col-md-6">
                <img src="/project11/fileupload/post/<%= _pbvo.getPphoto() %>" alt="Recipe Image" class="recipe-image" width="500" height="500">
                <button type="button" class="btn btn-success btn-block mt-3" id="likesBtn">추천하기</button>
            </div>
            <div class="col-md-6">
                <h1 class="recipe-title"><%= _pbvo.getPtitle() %></h1>
                <div class="recipe-info">
                    <span>작성자: <%= _pbvo.getMnick() %></span><br>
                    <span>조회수: <%= _pbvo.getBhit() %></span><br>
                    <span>게시 날짜: <%= _pbvo.getInsertdate() %></span><br>
                    <span>업데이트 날짜: <%= _pbvo.getUpdatedate() %></span><br>
                    <span>카테고리: <%= _pbvo.getPcategory() %></span><br>
                    <span>추천수: <span id="disp_cnt_recom"><%= _pbvo.getPlikes() %></span></span>
                </div>
            </div>
        </div>
        <hr>
        <div class="recipe-content">
            <p><%= _pbvo.getPcontent() %></p>
        </div>
    </div>
</div>
	<input type="hidden" name="mnum" value="<%= _pbvo.getMnum() %>">
    <input type="hidden" name="pnum" value="<%= _pbvo.getPnum() %>">
    <input type="hidden" name="plikes" value="<%= _pbvo.getPlikes() %>">
    <input type="hidden" name="ptitle" value="<%= _pbvo.getPtitle() %>">
    <input type="hidden" name="mnick" value="<%= _pbvo.getMnick() %>">
    <input type="hidden" name="bhit" value="<%= _pbvo.getBhit() %>">
    <input type="hidden" name="insertdate" value="<%= _pbvo.getInsertdate() %>">
    <input type="hidden" name="updatedate" value="<%= _pbvo.getUpdatedate() %>">
    <input type="hidden" name="pcategory" value="<%= _pbvo.getPcategory() %>">
</form>
<jsp:include page="/commentForm.k">
	<jsp:param value="<%=_pbvo.getCnum()%>" name="cnum"/>
</jsp:include>	
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <footer>
        <div class="container">
            <p>&copy; 2024 만드는 중</p>
        </div>
    </footer>
</body>
</html>