<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
 <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@400;700&display=swap">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>요투리</title>
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
    z-index: 10;
}

.navigation a {
    background-color: rgba(0, 0, 0, 0.5);
    color: white;
    padding: 10px;
    text-decoration: none;
    border-radius: 100%;
}
.content-container {
    margin-bottom: 20px; /* 각 컨텐츠 컨테이너 사이의 간격을 조정할 수 있습니다. */
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
    </style>
</head>
<body>

	    <header>
        <div class="container">
            <h1>요투리</h1>
            <div>
                <a href="login.k" class="login-button">로그인</a>
                <a href="recipeForm.k" class="login-button post-button" onclick="showLoginAlert(event)">게시글 작성</a>
            </div>
        </div>
        <div class="container">
            <nav>
                <ul>
                    <li><a href="http://localhost:8088/project11/main.jsp">추천</a></li>
                    <li><a href="recipeSelectAll.k">레시피</a></li>
                    <li><a href="postSelectAll.k">회원게시물</a></li>
                    <li><a href="#">가성비 레시피</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <main>
        <div class="content-container">
            <h2>베스트 요리 모음</h2>
            <div class="slider" id="best-slider">
                <div class="slides">
                    <div class="slide"><img src="/project11/img/6.jpg" alt="Item 1"></div>
                    <div class="slide"><img src="/project11/img/2.jpg" alt="Item 2"></div>
                    <div class="slide"><img src="/project11/img/4.jpg" alt="Item 3"></div>
                    <div class="slide"><img src="/project11/img/3.jpg" alt="Item 4"></div>
                    <div class="slide"><img src="/project11/img/5.jpg" alt="Item 5"></div>
                    <div class="slide"><img src="/project11/img/9.jpg" alt="Item 9"></div>
                    <div class="slide"><img src="/project11/img/8.jpg" alt="Item 8"></div>
                    <div class="slide"><img src="/project11/img/7.jpg" alt="Item 7"></div>
                    <div class="slide"><img src="/project11/img/1.jpg" alt="Item 6"></div>
                    <div class="slide"><img src="/project11/img/10.jpg" alt="Item 10"></div>
                    <div class="slide"><img src="/project11/img/13.jpg" alt="Item 13"></div>
                    <div class="slide"><img src="/project11/img/14.jpg" alt="Item 14"></div>
                    <div class="slide"><img src="/project11/img/15.jpg" alt="Item 15"></div>
                    <div class="slide"><img src="/project11/img/11.jpg" alt="Item 11"></div>
                    <div class="slide"><img src="/project11/img/12.jpg" alt="Item 12"></div>
                </div>
                <div class="navigation">
                    <a href="#" class="prev" data-slider="best-slider">&#10094;</a>
                    <a href="#" class="next" data-slider="best-slider">&#10095;</a>
                </div>
            </div>
        </div>
        <div class="content-container">
            <h2>조회수 순</h2>
            <div class="slider" id="views-slider">
                <div class="slides">
                                        <div class="slide"><img src="/project11/img/6.jpg" alt="Item 1"></div>
                    <div class="slide"><img src="/project11/img/7.jpg" alt="Item 2"></div>
                    <div class="slide"><img src="/project11/img/8.jpg" alt="Item 3"></div>
                    <div class="slide"><img src="/project11/img/9.jpg" alt="Item 4"></div>
                    <div class="slide"><img src="/project11/img/5.jpg" alt="Item 5"></div>
                    <div class="slide"><img src="/project11/img/9.jpg" alt="Item 9"></div>
                    <div class="slide"><img src="/project11/img/8.jpg" alt="Item 8"></div>
                    <div class="slide"><img src="/project11/img/7.jpg" alt="Item 7"></div>
                    <div class="slide"><img src="/project11/img/6.jpg" alt="Item 6"></div>
                    <div class="slide"><img src="/project11/img/10.jpg" alt="Item 10"></div>
                    <div class="slide"><img src="/project11/img/13.jpg" alt="Item 13"></div>
                    <div class="slide"><img src="/project11/img/14.jpg" alt="Item 14"></div>
                    <div class="slide"><img src="/project11/img/15.jpg" alt="Item 15"></div>
                    <div class="slide"><img src="/project11/img/11.jpg" alt="Item 11"></div>
                    <div class="slide"><img src="/project11/img/12.jpg" alt="Item 12"></div>
                </div>
                <div class="navigation">
                    <a href="#" class="prev" data-slider="views-slider">&#10094;</a>
                    <a href="#" class="next" data-slider="views-slider">&#10095;</a>
                </div>
            </div>
        </div>
        <div class="content-container">
            <h2>주간랭킹</h2>
            <div class="slider" id="best11-slider">
                <div class="slides">
                    <div class="slide"><img src="/project11/img/6.jpg" alt="Item 1"></div>
                    <div class="slide"><img src="/project11/img/7.jpg" alt="Item 2"></div>
                    <div class="slide"><img src="/project11/img/8.jpg" alt="Item 3"></div>
                    <div class="slide"><img src="/project11/img/9.jpg" alt="Item 4"></div>
                    <div class="slide"><img src="/project11/img/5.jpg" alt="Item 5"></div>
                    <div class="slide"><img src="/project11/img/9.jpg" alt="Item 9"></div>
                    <div class="slide"><img src="/project11/img/8.jpg" alt="Item 8"></div>
                    <div class="slide"><img src="/project11/img/7.jpg" alt="Item 7"></div>
                    <div class="slide"><img src="/project11/img/6.jpg" alt="Item 6"></div>
                    <div class="slide"><img src="/project11/img/10.jpg" alt="Item 10"></div>
                    <div class="slide"><img src="/project11/img/13.jpg" alt="Item 13"></div>
                    <div class="slide"><img src="/project11/img/14.jpg" alt="Item 14"></div>
                    <div class="slide"><img src="/project11/img/15.jpg" alt="Item 15"></div>
                    <div class="slide"><img src="/project11/img/11.jpg" alt="Item 11"></div>
                    <div class="slide"><img src="/project11/img/12.jpg" alt="Item 12"></div>
                </div>
                <div class="navigation">
                    <a href="#" class="prev" data-slider="best11-slider">&#10094;</a>
                    <a href="#" class="next" data-slider="best11-slider">&#10095;</a>
                </div>
            </div>
            
        </div>
        <div class="content-container">
            <h2>요즘뜨는레시피</h2>
            <div class="slider" id="best1-slider">
                <div class="slides">
                                        <div class="slide"><img src="/project11/img/6.jpg" alt="Item 1"></div>
                    <div class="slide"><img src="/project11/img/7.jpg" alt="Item 2"></div>
                    <div class="slide"><img src="/project11/img/8.jpg" alt="Item 3"></div>
                    <div class="slide"><img src="/project11/img/9.jpg" alt="Item 4"></div>
                    <div class="slide"><img src="/project11/img/5.jpg" alt="Item 5"></div>
                    <div class="slide"><img src="/project11/img/9.jpg" alt="Item 9"></div>
                    <div class="slide"><img src="/project11/img/8.jpg" alt="Item 8"></div>
                    <div class="slide"><img src="/project11/img/7.jpg" alt="Item 7"></div>
                    <div class="slide"><img src="/project11/img/6.jpg" alt="Item 6"></div>
                    <div class="slide"><img src="/project11/img/10.jpg" alt="Item 10"></div>
                    <div class="slide"><img src="/project11/img/13.jpg" alt="Item 13"></div>
                    <div class="slide"><img src="/project11/img/14.jpg" alt="Item 14"></div>
                    <div class="slide"><img src="/project11/img/15.jpg" alt="Item 15"></div>
                    <div class="slide"><img src="/project11/img/11.jpg" alt="Item 11"></div>
                    <div class="slide"><img src="/project11/img/12.jpg" alt="Item 12"></div>
                </div>
                <div class="navigation">
                    <a href="#" class="prev" data-slider="best1-slider">&#10094;</a>
                    <a href="#" class="next" data-slider="best1-slider">&#10095;</a>
                </div>
            </div>
        </div>
    </main>
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

    <script>
        function initSlider(sliderId) {
            const slider = document.getElementById(sliderId);
            const slides = slider.querySelector('.slides');
            const slide = slider.querySelectorAll('.slide');
            const prev = slider.querySelector('.prev');
            const next = slider.querySelector('.next');
            let index = 0;

            function showSlide(i) {
                index += i;
                if (index < 0) {
                    index = slide.length - 1;
                } else if (index >= slide.length) {
                    index = 0;
                }
                slides.style.transform = 'translateX(' + (-index * 100) + '%)';
            }

            prev.addEventListener('click', function(e) {
                e.preventDefault();
                showSlide(-1);
            });

            next.addEventListener('click', function(e) {
                e.preventDefault();
                showSlide(1);
            });
        }

        initSlider('best-slider');
        initSlider('views-slider');
        initSlider('best11-slider');
        initSlider('best1-slider');
        

        function showLoginAlert(event) {
            event.preventDefault(); // 링크의 기본 동작을 막음
            alert("로그인 후 이용할 수 있는 기능입니다");
        }
    </script>
</body>
</html>