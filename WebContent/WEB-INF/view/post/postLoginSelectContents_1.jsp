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
 <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@400;700&display=swap">
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
    <style>
	         body {
            font-family: 'Noto Serif KR', serif;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #f8f4ef;
            padding: 20px 0;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            
        }
        h1 {
            color: #8c6239;
            font-weight: 700;
            font-size: 32px;
            margin: 0;
        }
        .login-button, .post-button {
            display: inline-block;
            background-color: #8c6239;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            margin-left: 10px;
        }
        nav {
            margin-top: 20px;
        }
        nav ul {
            list-style-type: none;
            padding: 0;
            display: flex;
            justify-content: center;
        }
        nav li {
            margin: 0 20px;
        }
        nav a {
            color: #8c6239;
            text-decoration: none;
            font-size: 18px;
            font-weight: 700;
        }
        .product-card {
            position: relative;
            display: inline-block;
            margin: 10px;
            width: 200px;
            height: 200px;
            overflow: hidden;
        }

        .product-card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: opacity 0.3s ease;
        }

        .recipeBoard {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin-top: 30px;
        }

        .product-card:hover img {
           filter: brightness(0.5);
        }
        

        .product-card h3 {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            font-size: 18px;
            font-weight: bold;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .product-card:hover h3 {
            opacity: 1;
        }

        .styles__Title-sc-1ui0xdi-3.rQShB h1 {
            font-family: 'Playfair Display', serif;
            font-size: 28px;
            font-weight: 700;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: #333;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
        }

        .button-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .button-container button {
            margin: 0 10px;
            padding: 10px 20px;
            background-color: rgb(234, 198, 155);
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        
        .profile-picture {
            width: 70px;  
            height: 70px; 
            border-radius: 50%; 
            object-fit: cover;  
            vertical-align: middle; /* 이미지를 수직으로 중앙 정렬합니다. */
  			margin-bottom: 10px; /* 이미지 아래 여백을 추가합니다. */ 
  			border: none;
        }
        .recipe-container {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin-top: 20px;
body {
    background-color: #f8f9fa;
}
.col-md-6 {
    text-align: center;
}

.container {
    margin: 0 auto; /* Center the container horizontally */
    max-width: 1200px; /* Set max-width for the container */
}

.recipe-container {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    margin-top: 20px;
    margin-left: 200px; /* Adjust the value as needed */
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
    text-align: center; /* Center-align the content */
}

.likes-info {
    display: inline-block; /* Display as inline-block for horizontal alignment */
}

.likes-info span {
    margin-right: 10px; /* Add spacing between "추천수:" and the likes count */
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

.profile-picture {
    width: 70px;
    height: 70px;
    border-radius: 50%;
    object-fit: cover;
    vertical-align: middle; /* 이미지를 수직으로 중앙 정렬합니다. */
    margin-bottom: 10px; /* 이미지 아래 여백을 추가합니다. */
    border: none;
}
.recipe-title {
    font-size: 2rem;
    font-weight: bold;
    margin-top: 20px;
    text-align: center; /* Center-align the text */
}
.action-buttons {
    display: flex;
    justify-content: flex-end; /* Align items to the end (right) */
    margin-bottom: 20px;
}

.edit-button {
    margin-left: 10px; /* Add some space between the buttons */
}
.row {
    text-align: center;
}
#likesBtn img {
    width: 30px; /* 이미지의 너비를 조절합니다. */
    height: auto; /* 이미지의 높이를 자동으로 조절합니다. */
}
    </style>
</head>

<body>
    <header>
        <div class="container">
            <h1>요투리</h1>
            <div>
            <td><img class="profile-picture" src="/project11/fileupload/mem/<%= mvo.getMphoto() %>" 
            onerror="this.onerror=null; this.src='/project11/fileupload/mem/gibon.jpg';"
            border="1" alt="image"></td>
            <%= mvo.getMnick() %>님 환영합니다
                <a href="login.k" class="login-button">로그아웃</a>
            </div>
        </div>
        <div class="container">
            <nav>
                <ul>
                    <li><a href="http://localhost:8088/project11/main.jsp">추천</a></li>
                    <li><a href="recipeLoginSelectAll.k">레시피</a></li>
                    <li><a href="postLoginSelectAll.k">회원게시물</a></li>
                    <li><a href="#">가성비 레시피</a></li>
                </ul>
            </nav>
        </div>
    </header>
<form id="boardlikesForm">
    <div class="container">

        <div class="recipe-container">
            <div class="row">
                <div class="col-md-6">
                    <img src="/project11/fileupload/post/<%= _pbvo.getPphoto() %>" alt="Recipe Image" class="recipe-image" width="500" height="500">
                </div>
                <button type="button" class="btn btn-success btn-block mt-3" id="likesBtn">
				    <img src="/project11/img/good.jfif" alt="추천하기">
				</button>
				<span>좋아요: <span id="disp_cnt_recom"><%= _pbvo.getPlikes() %></span></span>
                <div class="col-md-6">
                    <h1 class="recipe-title"><%= _pbvo.getPtitle() %></h1>
                    <div class="recipe-info">
                        <span>작성자: <%= _pbvo.getMnick() %></span><br>
                        <span>조회수: <%= _pbvo.getBhit() %></span><br>
                        <span>게시 날짜: <%= _pbvo.getInsertdate() %></span><br>
                        <span>업데이트 날짜: <%= _pbvo.getUpdatedate() %></span><br>
                        <span>카테고리: <%= _pbvo.getPcategory() %></span><br>
                        
                    </div>
                </div>
            </div>
            <hr>
            <div class="recipe-content">
                <p><%= _pbvo.getPcontent() %></p>
            </div>
                    <div class="action-buttons">
            <button type="button" class="btn btn-primary edit-button" id="updateBtn">수정하기</button>
            <button type="button" class="btn btn-primary edit-button" id="deleteBtn">삭제하기</button>
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
	<jsp:param value="<%=_pbvo.getPnum()%>" name="pnum"/>
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