<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>요투리</title>
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
		.content-container {
		    height: 300px; /* 원하는 높이값으로 조정 */
		}
		.login-button.post-button {
            background-color: rgb(234, 198, 155);
            padding: 10px 20px;
            text-decoration: none;
            color: white;
            border-radius: 5px;
            display: inline-block;
    </style>
</head>
<body>
	<header>
	    <div class="container" style="display: flex; justify-content: space-between;"> <!-- 양쪽 정렬 -->
	        <h1 style="margin: 0; color: rgb(234, 198, 155)">요투리</h1> <!-- 왼쪽 정렬 -->
	        <div> <!-- 오른쪽 정렬 -->
	            <a href="login.k" class="login-button" style="background-color: rgb(234, 198, 155)">로그인</a>
	            <a href="postForm.k" class="login-button post-button" onclick="showLoginAlert(event)">게시글 작성</a>
	        </div>
	    </div>
	    <div class="container" >
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
                    <div class="slide"><img src="http://localhost:8088/project/img/img1.jfif" alt="Item 1"></div>
                    <div class="slide"><img src="http://localhost:8088/project/img/img1.jfif" alt="Item 2"></div>
                    <div class="slide"><img src="http://localhost:8088/project/img/img1.jfif" alt="Item 3"></div>
                    <div class="slide"><img src="http://localhost:8088/project/img/img1.jfif" alt="Item 4"></div>
                    <div class="slide"><img src="http://localhost:8088/project/img/img1.jfif" alt="Item 5"></div>
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
                    <div class="slide"><img src="http://localhost:8088/project/img/img1.jfif" alt="Item 1"></div>
                    <div class="slide"><img src="http://localhost:8088/project/img/img1.jfif" alt="Item 2"></div>
                    <div class="slide"><img src="http://localhost:8088/project/img/img1.jfif" alt="Item 3"></div>
                    <div class="slide"><img src="http://localhost:8088/project/img/img1.jfif" alt="Item 4"></div>
                    <div class="slide"><img src="http://localhost:8088/project/img/img1.jfif" alt="Item 5"></div>
                </div>
                <div class="navigation">
                    <a href="#" class="prev" data-slider="views-slider">&#10094;</a>
                    <a href="#" class="next" data-slider="views-slider">&#10095;</a>
                </div>
            </div>
        </div>
        <div class="content-container">
            <h2>베스트 요리 모음</h2>
            <div class="slider" id="best11-slider">
                <div class="slides">
                    <div class="slide"><img src="http://localhost:8088/project/img/img1.jfif" alt="Item 1"></div>
                    <div class="slide"><img src="http://localhost:8088/project/img/img1.jfif" alt="Item 2"></div>
                    <div class="slide"><img src="http://localhost:8088/project/img/img1.jfif" alt="Item 3"></div>
                    <div class="slide"><img src="http://localhost:8088/project/img/img1.jfif" alt="Item 4"></div>
                    <div class="slide"><img src="http://localhost:8088/project/img/img1.jfif" alt="Item 5"></div>
                </div>
                <div class="navigation">
                    <a href="#" class="prev" data-slider="best11-slider">&#10094;</a>
                    <a href="#" class="next" data-slider="best11-slider">&#10095;</a>
                </div>
            </div>
            
        </div>
        <div class="content-container">
            <h2>베스트 요리 모음</h2>
            <div class="slider" id="best1-slider">
                <div class="slides">
                    <div class="slide"><img src="http://localhost:8088/project/img/img1.jfif" alt="Item 1"></div>
                    <div class="slide"><img src="http://localhost:8088/project/img/img1.jfif" alt="Item 2"></div>
                    <div class="slide"><img src="http://localhost:8088/project/img/img1.jfif" alt="Item 3"></div>
                    <div class="slide"><img src="http://localhost:8088/project/img/img1.jfif" alt="Item 4"></div>
                    <div class="slide"><img src="http://localhost:8088/project/img/img1.jfif" alt="Item 5"></div>
                </div>
                <div class="navigation">
                    <a href="#" class="prev" data-slider="best1-slider">&#10094;</a>
                    <a href="#" class="next" data-slider="best1-slider">&#10095;</a>
                </div>
            </div>
        </div>
    </main>
<footer class="Footer">
	<div class="contents"><div class="customerCenter"><div>
	<strong>고객센터</strong>
	<div><button><img src="https://storage.wcuisine.net/web-assets/images/ic-phone.svg" alt="phone" style="width: 18px; height: 18px;"><a href="tel:1833-8307">1833-8307</a></button><button><img src="https://storage.wcuisine.net/web-assets/icons/footer-ic_talk.svg" alt="qna" style="width: 18px; height: 18px;"><span>1:1문의하기</span></button></div><div><p>운영시간</p><p>전화문의 - 10:00 ~ 12:00, 13:00 ~ 17:00 / 주말·공휴일 휴무<br>1:1 문의 - 09:00 ~ 12:00, 13:00 ~ 17:30 / 주말·공휴일 휴무</p></div></div><div><ul><li><a href="https://www.youtube.com/channel/UCStb6xqP228XXUykrrY-_CQ" target="_blank" rel="noreferrer"><img src="https://storage.wcuisine.net/web-assets/icons/img-footer-youtube.svg" alt="youtube" style="width: 48px; height: 48px;"></a></li><li><a href="https://www.instagram.com/wtable_official" target="_blank" rel="noreferrer"><img src="https://storage.wcuisine.net/web-assets/icons/img-footer-instagram.svg" alt="instagram" style="width: 48px; height: 48px;"></a></li><li><a href="https://www.facebook.com/wtableofficial" target="_blank" rel="noreferrer"><img src="https://storage.wcuisine.net/web-assets/icons/img-footer-facebook.svg" alt="facebook" style="width: 48px; height: 48px;"></a></li><li><a href="https://story.kakao.com/ch/wifetable/" target="_blank" rel="noreferrer"><img src="https://storage.wcuisine.net/web-assets/icons/img-footer-kakaostory.svg" alt="kakaostory" style="width: 48px; height: 48px;"></a></li><li><a href="https://band.us/band/54840034/" target="_blank" rel="noreferrer"><img src="https://storage.wcuisine.net/web-assets/icons/img-footer-band.svg" alt="band" style="width: 48px; height: 48px;"></a></li></ul></div></div><div class="servicePolicy"><div><p><a href="https://wtable.co.kr/policies/terms?platform=app" target="_blank" rel="noreferrer"><span class="underline">이용약관</span></a><a href="https://wtable.co.kr/policies/privacy?platform=app" target="_blank" rel="noreferrer"><span class="underline">개인정보처리방침</span></a><a class="underline" href="/notice">공지사항</a><a class="underline" href="/faq">자주묻는질문</a></p><p>광고/제휴 문의:<a href="mailto:contact@culturehero.net">contact@culturehero.net</a></p></div></div><div class="addressWrapper"><address><p>(주)컬쳐히어로</p><div><p>상호 : (주)컬쳐히어로 </p><p>대표자 : 양준규</p><p>개인정보관리책임자 : 장호진</p><p>사업자 등록번호 : <a class="underline" href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1448135400&amp;apv_perm_no=" target="_blank" rel="noreferrer">144-81-35400</a></p></div><div><p>통신판매업 신고 : 제 2015-경기성남-1940 호 </p><p>전화 : <a href="tel:1833-8307">1833-8307</a></p><p>팩스 : 031-8017-1800 </p></div><div><p>주소 : (13487) 경기도 성남시 분당구 삼평동625 판교세븐벤처밸리1단지 제3동 1001호 </p><p>이메일 : <a href="mailto:commerce@culturehero.net">commerce@culturehero.net</a></p></div></address><div class="logo"><span></span><p>© 2024 by Culturehero. All rights are reserved.</p></div></div></div>
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