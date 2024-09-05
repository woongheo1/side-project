<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="a.b.c.com.project.post.vo.PostVO" %>
<%@ page import="a.b.c.com.project.member.vo.MemberVO" %>
<%@ page import="java.util.List" %>
<% request.setCharacterEncoding("UTF-8");%>
<%	
	
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
        $(document).on("click", ".contentsBtn", function(){	
            // 해당 버튼이 속한 product-card 요소에서 pnum 값을 가져옴
            var pnum = $(this).closest('.product-card').data('pnum');
            
            // 기존의 숨겨진 입력 필드 제거
            $("input[name='pnum']").remove();
            
            // postList 폼 데이터에 pnum 추가
            $("#postList").append('<input type="hidden" name="pnum" value="' + pnum + '">');
            
            // postSelectContents.k로 폼을 submit
            $("#postList").attr({ "method": "GET", "action": "postSelectContents.k" }).submit();
        });	
    });	
</script>

<style>
    	header{
		    position: fixed;
		    top: 0;
		    width: 100%;
		    height: 20%;
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
        .container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .content-container {
            max-width: 1200px;
            margin: 50px auto;
            text-align: center;
            background-color: #fff; /* 컨테이너 색상 */
            border-radius: 5px; /* 선택적으로 컨테이너에 라운드 처리를 추가할 수 있어요. */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
            padding: 20px; /* 내용을 좀 더 공백으로 감싸요 */
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
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 0;
    }
    .container {
        display: flex;
        flex-wrap: wrap;
        justify-content: flex-start; /* 왼쪽부터 정렬 */
        gap: 20px;
        padding: 20px;
    }
    .product-card {
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 5px;
        width: 200px; /* 4개씩 출력, gap 고려 */
        overflow: hidden;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        box-sizing: border-box;
        display: inline-block; /* 블록 요소를 인라인 요소로 변경 */
    }
    .product-card img {
        width: 100%;
        height: 200px;
        object-fit: cover;
    }
    .product-info {
        padding: 10px;
    }
    .product-info h3 {
        font-size: 16px;
        margin: 0 0 10px;
    }
    .product-info p {
        margin: 5px 0;
    }
    div form {
    	margin-top: 200px;
    }
    .btn btn-success btn-sm contentsBtn{
    	background-color: rgb(234, 198, 155);
    }
</style>
</head>
<body>
	<header>
	    <div class="container" style="display: flex; justify-content: space-between;"> <!-- 양쪽 정렬 -->
	        <h1 style="margin: 0; color: rgb(234, 198, 155)">요투리</h1> <!-- 왼쪽 정렬 -->
	        <div> <!-- 오른쪽 정렬 -->
	            <a href="login.k" class="login-button" style="background-color: rgb(234, 198, 155)">로그인</a>
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
    <div class="container">
        <form name="postList" id="postList">
			<%    
			for (int i = 0; i < nCnt; i++) {     
			    PostVO _pbvo = list.get(i);    
			%>
			    <div class="product-card" data-pnum="<%= _pbvo.getPnum() %>">
			        <img src="/project11/fileupload/post/<%= _pbvo.getPphoto() %>" alt="image">
			        <div class="product-info">
			            <h3><%= _pbvo.getPtitle() %></h3>
			        </div>
			        <div>
			            <!-- 클래스를 contentsBtn으로 변경 -->
			            <button type="button" class="btn btn-success btn-sm contentsBtn" style="background-color: rgb(189, 160, 126);">레시피보기</button>
			        </div>
			    </div>
			<% } // end of for %>
        </form>
    </div>

        <footer>
        <div class="container">
            <p>&copy; 2024 만드는 중</p>
        </div>
    </footer>
</body>
</html>