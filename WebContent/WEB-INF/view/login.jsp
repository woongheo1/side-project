<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>로그인</title>
  <link rel="stylesheet" href="styles.css">
  <!-- jQuery 라이브러리 포함 -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
     
    }
    
    
    

    .login-container {
      width: 300px;
      margin: 100px auto;
      padding: 20px;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      
    }

    h2 {
      text-align: center;
    }

    input[type="text"],
    input[type="password"],
    button {
      display: block;
      width: 100%;
      margin-bottom: 20px;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 16px; 
      box-sizing: border-box; 
    }

    button {
      background-color: rgb(234, 198, 155);
      color: #fff;
      border: none;
      cursor: pointer;
      font-size: 16px; 
    }

    button:hover {
      background-color: rgb(116, 65, 3);
    }
    
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
            background-color: #fff; 
            border-radius: 5px; 
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); 
            padding: 20px; 
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
		.content-container {
		    height: 300px; /* 원하는 높이값으로 조정 */
		}
    
    
  </style>
</head>
<body>
<hr>
  <div class="login-container">
    <h2>로그인</h2>
    <form id="login-form">
      <input type="text" id="mid" placeholder="아이디" required>
      <input type="password" id="mpw" placeholder="비밀번호" required>
      <button type="button" id="loginBtn">로그인</button>
      <button type="button" id="LBtn">회원가입</button> 
    </form>
  </div>

  <script>
  $(document).ready(function() {
	    console.log("jQuery ready() 함수 블럭 진입 >>> : ");

	    $(document).on("click", "#loginBtn", function(event) {
	        console.log("loginBtn 클릭 >>> : ");

	        var mid = $('#mid').val();
	        var mpw = $('#mpw').val();

	        if (mid.trim() === '' || mpw.trim() === '') {
	            event.preventDefault();
	            alert("아이디와 비밀번호를 입력해주세요.");
	        } else {
	        
	            $('#login-form').append('<input type="hidden" name="mid" value="' + mid + '">');
	            $('#login-form').append('<input type="hidden" name="mpw" value="' + mpw + '">');
	            $('#login-form').attr({
	                'action': 'loginGo.k',
	                'method': 'POST'
	            }).submit();
	        }
	    });
	    
	    $(document).on("click", "#LBtn", function(){
	          alert("LBtn 버튼 블럭 진입 >>> : ");		
	          $('#login-form').attr({
	              'action': 'memForm.k',
	              'method': 'GET',
	              'enctype': 'multipart/form-data'
	          }).submit();
	      });
	    
	});
  </script>
</body>
</html>
