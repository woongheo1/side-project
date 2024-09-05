<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="a.b.c.com.project.post.vo.PostVO" %>
<%@ page import="a.b.c.com.project.member.vo.MemberVO" %>
<%@ page import="java.util.List" %>
<% request.setCharacterEncoding("UTF-8");%>
<%	
	Object mobj = request.getAttribute("mlistAll");
	List<MemberVO> mlist = (List<MemberVO>)mobj;
	
	MemberVO mvo = (MemberVO) request.getAttribute("user");
	
	
	
	Object obj = request.getAttribute("listAll");
	List<PostVO> list = (List<PostVO>)obj;
	
	int nCnt = list.size();
	String nCntS = ":::: 전체 조회 건수  " + nCnt + " 건";	
	
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@400;700&display=swap">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  
<script type="text/javascript" src="/kosmoSpring/js/common.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script>
    $(document).ready(function(){
        // 글 내용보기 버튼 클릭 시
        $(document).on("click", "#show", function(){	
            // 해당 버튼이 속한 product-card 요소에서 pnum 값을 가져옴
            var pnum = $(this).closest('.product-card').data('pnum');
            
            // 기존의 숨겨진 입력 필드 제거
            $("input[name='pnum']").remove();
            
            // postList 폼 데이터에 pnum 추가
            $("#postList").append('<input type="hidden" name="pnum" value="' + pnum + '">');
            
            // postSelectContents.k로 폼을 submit
            $("#postList").attr({ "method": "GET", "action": "postLoginSelectContents.k" }).submit();
        });	
        
		$(document).on("click", "#postBtn", function(){
			
			$('#postList').attr({
				'action':'postForm.k',
				'method':'GET',
				'enctype':'multipart/form-data'
			}).submit();
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
		        .contentsBtn {
    width: 200px; /* 이미지 크기와 동일하게 설정 */
    background-color: #eac69b; /* 버튼 배경색 연갈색으로 설정 */
    border: none;
    color: white;
    display: block;
    margin: 10px auto 0; /* 이미지 아래에 붙도록 설정 */
    text-align: center;
    padding: 10px;
    border-radius: 5px;
    font-size: 14px;
      transition: background-color 0.3s ease;
     opacity: 0.7;
     transition: opacity 0.5s;
}
    .contentsBtn:hover {
        background-color: #8c6239; /* 변경하고자 하는 색상으로 설정 */
        opacity: 1;
    }
	.product-card .contentsBtn {
    display: none;
}

.product-card:hover .contentsBtn {
    display: block;
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
                <a id="postBtn" class="login-button post-button">게시글 작성</a>
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
        <div class="styles__Title-sc-1ui0xdi-3 rQShB" style="text-align: center; margin-top: 20px;">
        <h1>|RECIPES FOR YOU|</h1>
    </div>
    <div class="container">
<form name="postList" id="postList">
			<%    
			for (int i = 0; i < nCnt; i++) {     
			    PostVO _pbvo = list.get(i);    
			%>
<div class="product-card" data-pnum="<%= _pbvo.getPnum() %>" style="position: relative;">
    <div style="position: absolute; top: 5px; left: 5px; z-index: 1;">
    </div>
    <a>
        <img src="/project11/fileupload/post/<%= _pbvo.getPphoto() %>" alt="image" style="display: block;">
        <% if (i == 0 || i == 1) { %>
        <h3 style="margin-bottom: 20px;" ><%= _pbvo.getPtitle() %></h3>
        <% } else { %>
        <h3><%= _pbvo.getPtitle() %></h3>
        <% } %>
    </a>
    <button type="button" id="show" class="contentsBtn" style="position: absolute; bottom: 0;">레시피보기</button>
</div>

			<% } // end of for %>
			<input type="hidden" name="mphoto" id="mphoto" value="<%= mvo.getMphoto() %>">
            <input type="hidden" name="mnick" id="mnick" value="<%= mvo.getMnick() %>">
            <input type="hidden" name="mnum" id="mnum" value="<%= mvo.getMnum() %>">
        </form>
    </div>
        <footer>
        <div class="container">
            <p>&copy; 2024 만드는 중</p>
        </div>
    </footer>
</body>
</html>