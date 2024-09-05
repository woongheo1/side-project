<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="a.b.c.com.project.recipe.vo.RecipeVO" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="a.b.c.com.project.member.vo.MemberVO" %>

<%
Logger logger = LogManager.getLogger(this.getClass());
logger.info("RecipeSelectAll.jsp 페이지 >>> : ");

Object mobj = request.getAttribute("mlistAll");
List<MemberVO> mlist = (List<MemberVO>)mobj;

MemberVO mvo = (MemberVO) request.getAttribute("user");
Object obj = request.getAttribute("listAll");
List<RecipeVO> list = (List<RecipeVO>)request.getAttribute("listAll");
int nCnt = list.size();
String nCntS = "::::  전체 조회 건수  " + nCnt + " 건";
%>

<!DOCTYPE html> 
<html> 
<head> 
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@400;700&display=swap"> 
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap"> 
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
 <script src="http://code.jquery.com/jquery-latest.min.js"></script> 
 <meta charset="UTF-8"> 
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script type="text/javascript">
        $(document).ready(function() {
            // 모든 rnum 체크박스의 초기 상태를 해제로 설정
            $('.rnum').prop('checked', false);

            $(document).on("click", "#chkAll", function(){
                // #chkAll 체크박스 클릭 시 모든 rnum 체크박스 상태 변경
                $('.rnum').prop('checked', $(this).prop('checked'));
            });

            $(document).on("click", ".rnum", function(){
                // rnum 체크박스 클릭 시 다른 rnum 체크박스 상태는 변경되지 않음
                if(!$(this).prop('checked')){
                    $('#chkAll').prop('checked', false);
                }
            });
            
            $(document).on("click", "#insertBtn", function(){
                location.href="recipeForm.k";
            });

            $(document).on("click", "#updateBtn", function(){
                if ($('.rnum:checked').length == 0){
                    alert("수정할 글번호 하나를 선택하세요!!");
                    return;
                }
                $("#recipeBoard").attr({ "method":"GET","action":"recipeSelect.k"}).submit();
            });

            $(document).on("click", "#deletetBtn", function(){
                if ($('.rnum:checked').length == 0){
                    alert("삭제할 글번호 하나를 선택하세요!!");
                    return;
                }
                $("#recipeBoard").attr({ "method":"GET","action":"recipeDelete.k"}).submit();
            });

            $('.category-btn').click(function() {
                var category = $(this).data('category');
                if (category === '모두 보기') {
                    $('.product-card').show();
                } else {
                    $('.product-card').hide();
                    $('.product-card[data-category="' + category + '"]').show();
                }
            });
        });
    </script>
<title>요투리</title>
    <header>
        <div class="container">
            <h1>요투리</h1>
            <div>
            <td><img class="profile-picture" src="/project11/fileupload/mem/<%= mvo.getMphoto() %>" 
            onerror="this.onerror=null; this.src='/project11/fileupload/mem/gibon.jpg';"
            border="1" alt="image"></td>
            <%= mvo.getMnick() %>님 환영합니다
                <a href="loginGo.k" class="login-button">로그인</a>
                <a href="recipeForm.k" class="login-button post-button">게시글 작성</a>
            </div>
        </div>
        <div class="container">
            <nav>
                <ul>
                    <li><a href="http://localhost:8088/project11/main.jsp">추천</a></li>
                    <li><a href="recipeSelectAll.k">레시피</a></li>
                    <li><a href="postLoginSelectAll.k">회원게시물</a></li>
                    <li><a href="#">가성비 레시피</a></li>
                </ul>
            </nav>
        </div>
    </header>
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

        .styles__Title h1 {
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
        .recipe-categories {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin-top: 20px;
        }

        .category-btn {
            background-color: #ffffff;
            border: 1px solid #B8572E;
            color: #B8572E;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
            margin: 5px;
            transition: all 0.3s ease;
        }

        .category-btn:hover {
            background-color: #B8572E;
            color: #ffffff;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

        .category-btn.active {
            background-color: #B8572E;
            color: #ffffff;
        }
        .footer-container {
        max-width: 1200px;
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .footer-links a {
        
        text-decoration: none;
        margin-right: 20px;
    }

    .footer-links a:hover {
       
    }

    .footer-info {
        font-size: 14px;
        line-height: 1.5;
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
    </style>
</head> 
<body> 
<div class="styles__Title" style="text-align: center; margin-top: 20px;">
        <h1>|RECIPES CATEGORY|</h1>
    </div>
    <div class="recipe-categories">
        <a href="#" class="category-btn" data-category="모두 보기">모두 보기</a>
        <% for (RecipeVO rbvo : list) { %>
            <a href="#" class="category-btn" data-category="<%= rbvo.getRcategory() %>"><%= rbvo.getRcategory() %></a>
        <% } %>
    </div>
    
    <div class="styles__Title" style="text-align: center; margin-top: 20px;">
        <h1>|RECIPES FOR YOU|</h1>
    </div>
<form name="recipeBoard" id="recipeBoard">
    <div class="recipeBoard">
        <% for (int i = 0; i < nCnt; i++) { RecipeVO _rbvo = list.get(i); %>
        <div class="product-card" data-category="<%= _rbvo.getRcategory() %>">
            <div style="position: absolute; top: 5px; left: 5px; z-index: 1;">
                <input type="checkbox" name="rnum" id="rnum" class="rnum" value=<%= _rbvo.getRnum() %> />
            </div>
            <a href="recipePage.k?value=<%=_rbvo.getRnum()%>&name=rnum">
                <img src="/project11/fileupload/recipe/<%= _rbvo.getRphoto() %>" alt="image">
                <% if (i == 0 || i == 1) { %>
                <h3><%= _rbvo.getRtitle() %></h3>
                <p><%= _rbvo.getRcontent() %></p>
                <% } else { %>
                <h3><%= _rbvo.getRtitle() %></h3>
                <% } %>
            </a>
        </div>
        <% } // end of for %>
        <div class="button-container">
            <button type="button" class="btn btn-success btn-sm" id="updateBtn">글수정</button> 
    		<button type="button" class="btn btn-success btn-sm" id="deletetBtn">글삭제</button> </div>
    	</div>
   <footer>
    <div class="footer-container">
        <div class="footer-links">
            <a href="#">고객센터</a>
            <a href="#">이용약관</a>
            <a href="#">개인정보처리방침</a>
            <a href="#">공지사항</a>
            <a href="#">자주묻는질문</a>
            <a href="#">광고/제휴 문의: tazu@naver.net</a>
        </div>
        <div class="footer-info">
            <p>(주) 하웅의 움직이는 성 | 대표자: 하웅</p>
            <p>전화번호: 1234-5678</p>
        </div>
    </div>
</footer>
</form>
</body>
</html>