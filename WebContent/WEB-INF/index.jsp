<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>DoubleS</title>
	<meta name="description" content="A simple content slider with depth-like zoom functionality" />
	<meta name="keywords" content="blueprint, template, slider, zoom, javascript, depth, 3d, css" />
	<meta name="author" content="Codrops" />
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico">
	<!-- Feather Icons -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/feather/style.css">
	<!-- General demo styles & header -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demo.css" />
	<!-- Component styles -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/component.css" />
	<script src="${pageContext.request.contextPath}/resources/js/modernizr.custom.js"></script>
	<style>
		.products {
			margin: 0;
			padding: 2em;
			text-align: center;
		}
		.product {
			display: inline-block;
			width: 200px;
			height: 200px;
			margin: 10px;
			border-radius: 5px;
			background: #1c1d22;
		}
		.product .foodicon {
			font-size: 3em;
			line-height: 190px;
			color: #3b3d4a;
		}
	</style>
</head>
<body>
	<!-- Main container -->
	<div class="container">
		<!-- Blueprint header -->
		<header class="bp-header cf">
			<span>Sa Show <span class="bp-icon bp-icon-about" data-content="뭐가 궁금한 거요?"></span></span>
			<h1>뭐 좀 사 쇼</h1>
			<nav>
				<a href="http://tympanus.net/Blueprints/FilterableProductGrid/" class="bp-icon bp-icon-prev" data-info="previous Blueprint"><span>Previous Blueprint</span></a>
				<!--a href="" class="bp-icon bp-icon-next" data-info="next Blueprint"><span>Next Blueprint</span></a-->
				<a href="http://tympanus.net/codrops/?p=24330" class="bp-icon bp-icon-drop" data-info="back to the Codrops article"><span>back to the Codrops article</span></a>
				<a href="http://tympanus.net/codrops/category/blueprints/" class="bp-icon bp-icon-archive" data-info="Blueprints archive"><span>Go to the archive</span></a>
			</nav>
		</header>
		<!-- Grid -->
		<section class="slider">
			<!-- 로그인 중이라면 -->
			<%
				String userId = (String)session.getAttribute("user");
				if(session.getAttribute("user")!=null){
			%>
			<div class="slide slide--current" data-content="content-0">
				<div class="slide__mover">
					<div class="zoomer flex-center">
						<img class="zoomer__image" src="${pageContext.request.contextPath}/resources/images/mypage.jpg" alt="login" style="border-radius: 10px; width: 220px; height: 177px;"/> <!--21.05.05 이미지,alt,css 수정 -->
						<div class="preview">
							<img src="${pageContext.request.contextPath}/resources/images/mypage.jpg" alt="login" style="border-radius: 10px; width: 220px; height: 200px;"/><!--21.05.05 이미지,alt,css 수정 -->
							<div class="zoomer__area zoomer__area--size-2"></div>
						</div>
					</div>
				</div>
				<h2 class="slide__title"><span><%out.println(userId+" 님 뭐사쇼?"); %></span> 마이페이지</h2>
			</div>
			<%
				}else{
			%>
					<div class="slide slide--current" data-content="content-1">
					<div class="slide__mover">
						<div class="zoomer flex-center">
							<img class="zoomer__image" src="${pageContext.request.contextPath}/resources/images/main.jpg" alt="login" style="border-radius: 10px; width: 220px; height: 177px;"/> <!--21.05.05 이미지,alt,css 수정 -->
							<div class="preview">
								<img src="${pageContext.request.contextPath}/resources/images/main.jpg" alt="login" style="border-radius: 10px; width: 220px; height: 177px;"/><!--21.05.05 이미지,alt,css 수정 -->
								<div class="zoomer__area zoomer__area--size-2"></div>
							</div>
						</div>
					</div>
					<h2 class="slide__title"><span>뭐좀 사쇼</span> 접속 해볼거요</h2>
				</div>
			<%
				}
			%>
			<div class="slide" data-content="content-2">
				<div class="slide__mover">
					<div class="zoomer flex-center">
						<img class="zoomer__image" src="${pageContext.request.contextPath}/resources/images/coffee/coffee.jpg" alt="coffee photo" style="border-radius: 10px;  width: 220px; height: 177px;"/><!--21.05.05 이미지,alt,css 수정 -->
						<div class="preview">
							<img src="${pageContext.request.contextPath}/resources/images/coffee/coffee.jpg" alt="coffee photo" style="border-radius: 10px; width: 220px; height: 177px;"/><!--21.05.05 이미지,alt,css 수정 -->
							<div class="zoomer__area zoomer__area--size-4"></div>
						</div>
					</div>
				</div>
				<h2 class="slide__title"><span>뭐좀 사쇼</span> 커피 사러 갈거요</h2>
			</div>
			<div class="slide" data-content="content-3">
				<div class="slide__mover">
					<div class="zoomer flex-center">
						<img class="zoomer__image" src="${pageContext.request.contextPath}/resources/images/ade/ade.jpg" alt="ade" style="border-radius: 10px;  width: 220px; height: 177px;"/><!--21.05.05 이미지,alt,css 수정 -->
						<div class="preview">
							<img src="${pageContext.request.contextPath}/resources/images/ade/ade.jpg" alt="ade" style="border-radius: 10px; width: 220px; height: 177px;"/><!--21.05.05 이미지,alt,css 수정 -->
							<div class="zoomer__area zoomer__area--size-3"></div>
						</div>
					</div>
				</div>
				<h2 class="slide__title"><span>뭐좀 사쇼</span> 에이드 사러 갈거요</h2>
			</div>
			<div class="slide" data-content="content-4">
				<div class="slide__mover">
					<div class="zoomer flex-center">
						<img class="zoomer__image" src="${pageContext.request.contextPath}/resources/images/tea/tea.jpg" alt="tea" style="border-radius: 10px; width: 220px; height: 177px;"/><!--21.05.05 이미지,alt,css 수정 -->
						<div class="preview">
							<img src="${pageContext.request.contextPath}/resources/images/tea/tea.jpg" alt="tea" style="border-radius: 10px; width: 220px; height: 177px;"/><!--21.05.05 이미지,alt,css 수정 -->
							<div class="zoomer__area zoomer__area--size-5"></div>
						</div>
					</div>
				</div>
				<h2 class="slide__title"><span>뭐좀 사쇼</span> 차 갈거요</h2>
			</div>
			<div class="slide" data-content="content-5">
				<div class="slide__mover">
					<div class="zoomer flex-center">
						<!-- 05-05수정시작 -->
						<img class="zoomer__image" src="${pageContext.request.contextPath}/resources/images/cart.jpg" alt="cart" style="border-radius: 10px; width: 220px; height: 177px;"/>
						<div class="preview rounded">
							<img src="${pageContext.request.contextPath}/resources/images/cart.jpg" alt="cart" style="border-radius: 10px; width: 220px; height: 177px;"/>
							<!-- 05-05수정끝 -->
							<div class="zoomer__area zoomer__area--size-1"></div>
						</div>
					</div>
				</div>
				<h2 class="slide__title"><span>The Fabulous</span> Apple Watch</h2>
			</div>
			<nav class="slider__nav">
				<button class="button button--nav-prev"><i class="icon icon--arrow-left"></i><span class="text-hidden">Previous product</span></button>
				<button class="button button--zoom"><i class="icon icon--zoom"></i><span class="text-hidden">View details</span></button>
				<button class="button button--nav-next"><i class="icon icon--arrow-right"></i><span class="text-hidden">Next product</span></button>
			</nav>
		</section>
		<!-- /slider-->
		<!--줌 했을때 가는 컨텐츠-->
		<section class="content">
		<!-- 로그인시 표시 -->
		<div class="content__item" id="content-0">
				<img class="content__item-img rounded-right" src="${pageContext.request.contextPath}/resources/images/mypage.jpg" alt="login" style="border-radius: 10px; width: 220px; height: 177px;"/><!--21.05.05 이미지,alt,css 수정 -->
				<div class="content__item-inner"  style="height:80%"> <!-- css파일에서 변경안돼서 인라인 스타일시트로 수정 21.05.05 -->
				<ul class="products">
					<li class="product">
						<a href="logoutAction.do">
							<img src="${pageContext.request.contextPath}/resources/images/out.jpg" style="border-radius: 10px; width: 200px; height: 177px" class="foodicon foodicon--broccoli"><!--21.05.05 이미지,alt,css 수정 -->
						</a>
						<span>로그아웃</span>
					</li>
					<li class="product">
					<!-- 05-09 a href 변경 -->
						<a href="info.do">
							<img src="${pageContext.request.contextPath}/resources/images/info.jpg" style="border-radius: 10px; width: 200px; height: 177px" class="foodicon foodicon--broccoli"><!--21.05.05 이미지,alt,css 수정 -->
						</a>
						<span>비밀번호 변경</span>
					</li>
				</ul>
				</div>
			</div>
		<!-- 영역 종료 -->
			<div class="content__item" id="content-1">
				<img class="content__item-img rounded-right" src="${pageContext.request.contextPath}/resources/images/main.jpg" alt="login" style="border-radius: 10px; width: 220px; height: 177px;"/><!--21.05.05 이미지,alt,css 수정 -->
				<div class="content__item-inner"  style="height:80%"> <!-- css파일에서 변경안돼서 인라인 스타일시트로 수정 21.05.05 -->
				<ul class="products">
					<li class="product">
						<a href="login.do">
							<img src="${pageContext.request.contextPath}/resources/images/login1.jpg" style="border-radius: 10px; width: 200px; height: 177px" class="foodicon foodicon--broccoli"><!--21.05.05 이미지,alt,css 수정 -->
						</a>
						<span>로그인</span>
					</li>
					<li class="product">
						<a href="userJoin.do">
							<!-- 05-05 수정시작 -->
							<img src="${pageContext.request.contextPath}/resources/images/join.jpg" width="200px;" class="foodicon foodicon--broccoli" style="border-radius: 10px; height: 177px;">
							<!-- 05-05 수정끝 -->
						</a>
						<span>회원가입</span>
					</li>
				</ul>
				</div>
			</div>
			<!-- 커피 메뉴들 -->
			<form method="post" action="add.jsp">
			<div class="content__item" id="content-2">
				<img class="content__item-img rounded-right" src="${pageContext.request.contextPath}/resources/images/coffee/coffee.jpg" alt="coffee menus" />
				<div class="content__item-inner" style="height:80%"> <!-- css파일에서 변경안돼서 인라인 스타일시트로 수정 21.05.05 -->
				<span style="font-size:50px;">coffee</span> <!-- 메뉴사진 이름 수정 21.05.05 -->
					<ul class="products">
					<li class="product">
						<img src="${pageContext.request.contextPath}/resources/images/coffee/coffee.jpg" width="200px;" class="foodicon foodicon--broccoli" style="border-radius: 10px; height: 177px;">
						<span>아메리카노 <input type="checkbox" name="menu" value="아메리카노" ></span>
					</li>
					<li class="product">
						<img src="${pageContext.request.contextPath}/resources/images/coffee/late.jpg" width="200px;" class="foodicon foodicon--broccoli" style="border-radius: 10px; height: 177px;">
						<span>카페라떼 <input type="checkbox" name="menu" value="카페라떼"></span>
					</li>
					<li class="product">
						<img src="${pageContext.request.contextPath}/resources/images/coffee/cappuccino.jpg" width="200px;" class="foodicon foodicon--broccoli" style="border-radius: 10px; height: 177px;">
						<span>카푸치노 <input type="checkbox" name="menu" value="카푸치노"></span>
					</li>
					<li class="product">
						<img src="${pageContext.request.contextPath}/resources/images/coffee/mocha.jpg" width="200px;" class="foodicon foodicon--broccoli" style="border-radius: 10px; height: 177px;">
						<span>카페모카 <input type="checkbox" name="menu" value="카페모카"></span>
					</li>
					<li class="product">
						<img src="${pageContext.request.contextPath}/resources/images/coffee/caramel Macchiato.jpg" width="200px;" class="foodicon foodicon--broccoli" style="border-radius: 10px; height: 177px;">
						<span>카라멜마키아토 <input type="checkbox" name="menu" value="카라멜마키아토"></span>
					</li>
					<li class="product">
						<img src="${pageContext.request.contextPath}/resources/images/coffee/mocha Frappuccino.jpg" width="200px;" class="foodicon foodicon--broccoli" style="border-radius: 10px; height: 177px;">
						<span>모카 프라푸치노 <input type="checkbox" name="menu" value="모카 프라푸치노"></span>
					</li>
					<li class="product">
						<img src="${pageContext.request.contextPath}/resources/images/coffee/affogato.jpg" width="200px;" class="foodicon foodicon--broccoli" style="border-radius: 10px; height: 177px;">
						<span>아포카토 <input type="checkbox" name="menu" value="아포카토"></span>
					</li>
					<li class="product">
						<img src="${pageContext.request.contextPath}/resources/images/coffee/con Panna.jpg" width="200px;" class="foodicon foodicon--broccoli" style="border-radius: 10px; height: 177px;">
						<span>에스프레소 콘파냐 <input type="checkbox" name="menu" value="에스프레소 콘파냐"></span>
					</li>
				</ul>
				<button type="submit" onclick="checkFn()">추가</button>
				</div>
			</div>
			</form>
			<!-- 에이드 메뉴들 -->
			<form method="post" action="orderSystem/add.jsp">
				<div class="content__item" id="content-3">
				<img src="${pageContext.request.contextPath}/resources/images/ade/ade.jpg" alt="ade" style="border-radius: 10px; width: 220px; height: 177px;"/><!--21.05.05 이미지,alt,css 수정 -->
					<div class="content__item-inner"  style="height:80%"> <!-- css파일에서 변경안돼서 인라인 스타일시트로 수정 21.05.05 -->
						<span style="font-size:50px;">coffee</span> <!-- 메뉴사진 이름 수정 21.05.05 -->
							<ul class="products">
							<li class="product">
								<img src="${pageContext.request.contextPath}/resources/images/ade/lemonade.jpg" width="200px;" class="foodicon foodicon--broccoli" style="border-radius: 10px; height: 177px;">
								<span>레몬에이드 <input type="checkbox" name="menu" value="레몬에이드"></span>
							</li>
							<li class="product">
								<img src="${pageContext.request.contextPath}/resources/images/ade/파인애플에이드.jpg" width="200px;" class="foodicon foodicon--broccoli" style="border-radius: 10px; height: 177px;">
								<span>파인애플에이드 <input type="checkbox" name="menu" value="파인애플에이드"></span>
							</li>
							<li class="product">
								<img src="${pageContext.request.contextPath}/resources/images/ade/블루레몬에이드.jpg" width="200px;" class="foodicon foodicon--broccoli" style="border-radius: 10px; height: 177px;">
								<span>블루레몬에이드 <input type="checkbox" name="menu" value="블루레몬에이드"></span>
							</li>
							<li class="product">
								<img src="${pageContext.request.contextPath}/resources/images/ade/청포도사과에이드.jpg" width="200px;" class="foodicon foodicon--broccoli" style="border-radius: 10px; height: 177px;">
								<span>청포도사과에이드 <input type="checkbox" name="menu" value="청포도사과에이드"></span>
							</li>
							<li class="product">
								<img src="${pageContext.request.contextPath}/resources/images/ade/자몽에이드.jpg" width="200px;" class="foodicon foodicon--broccoli" style="border-radius: 10px; height: 177px;">
								<span>자몽에이드 <input type="checkbox" name="menu" value="자몽에이드"></span>
							</li>
							<li class="product">
								<img src="${pageContext.request.contextPath}/resources/images/ade/체리에이드.jpg" width="200px;" class="foodicon foodicon--broccoli" style="border-radius: 10px; height: 177px;">
								<span>체리에이드 <input type="checkbox" name="menu" value="체리에이드"></span>
							</li>
							<li class="product">
								<img src="${pageContext.request.contextPath}/resources/images/ade/오이에이드.jpg" width="200px;" class="foodicon foodicon--broccoli" style="border-radius: 10px; height: 177px;">
								<span>오이에이드 <input type="checkbox" name="menu" value="오이에이드"></span>
							</li>
							<li class="product">
								<img src="${pageContext.request.contextPath}/resources/images/ade/파워에이드.png" width="200px;" class="foodicon foodicon--broccoli" style="border-radius: 10px; height: 177px;">
								<span>파워에이드 <input type="checkbox" name="menu" value="파워에이드"></span>
							</li>
						</ul>
					</div>
				</div>
			</form>
			<div class="content__item" id="content-4">
				<img class="content__item-img rounded-right" src="${pageContext.request.contextPath}/resources/images/imac-content.jpg" alt="iMac Content" />
				<div class="content__item-inner">
					<h2>The iMac</h2>
					<h3>Engineered to the very last detail</h3>
					<p>Every new Mac comes with Photos, iMovie, GarageBand, Pages, Numbers, and Keynote. So you can be creative with your photos, videos, music, documents, spreadsheets, and presentations right from the start. You also get great apps for email, surfing the web, sending texts, and making FaceTime calls — there’s even an app for finding new apps.</p>
					<p><a href="https://www.apple.com/imac/built-in-apps/">Learn more about the iMac's features &xrarr;</a></p>
				</div>
			</div>
			<div class="content__item" id="content-5">
				<img class="content__item-img rounded-right" src="${pageContext.request.contextPath}/resources/images/apple-watch-content.png" alt="Apple Watch Content" />
				<div class="content__item-inner">
					<h2>The Apple Watch</h2>
					<h3>Entirely new ways to stay in touch</h3>
					<p>Apple Watch makes all the ways you're used to communicating more convenient. And because it sits right on your wrist, it can add a physical dimension to alerts and notifications. For example, you’ll feel a gentle tap with each incoming message. Apple Watch also lets you connect with your favorite people in fun, spontaneous ways — like sending a tap, a sketch, or even your heartbeat. </p>
					<p><a href="https://www.apple.com/watch/new-ways-to-connect/">Learn more about new ways to connect &xrarr;</a></p>
				</div>
			</div>
			<button class="button button--close"><i class="icon icon--circle-cross"></i><span class="text-hidden">Close content</span></button>
		</section>
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/classie.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/dynamics.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>