<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>당신의 디저트 | Dessertree</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
	
	%>
	
	<nav class="navbar navbar-default">
		<div class="navber-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">Dessertree</a>			
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">리뷰 게시판</a></li>
				<li><a href="gallery.jsp">갤러리 게시판</a></li>
				<li><a href="map.jsp">고객센터</a></li>
			</ul>
			<%
				if(userID == null){
			%>
					
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<%
				} else {
			%>		

			<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="memberUpdate.jsp">회원정보수정</a></li>
					<li><a href="logoutAction.jsp">로그아웃</a></li>
				</ul>
			</li>
		</ul>
			<%
				}
			
			%>					
		</div>
	</nav>
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>당신의 디저트, 디저트리입니다.</h1>
				<p>나만의 나무에 디저트를 하나씩 채워보세요!</p>
				<a class="btn btn-primary btn-pull" href="#" role="button">자세히 알아보기</a>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row"> 
			<div class="col-md-4"> 
				<h2>리뷰 게시판</h2>
				<p>3명의 회원과 11개의 새 글이 당신을 기다리고 있습니다.<br>여러 회원들과 맛집을 공유해보세요! </p>
				<p><a class="btn btn-secondary" href="bbs.jsp" role="button">View details »</a></p>
			</div> 
			<div class="col-md-4"> 
				<h2>디저트리</h2> 
				<p>리뷰를 찜만 해두실건가요? <br> 당신의 나무에 디저트들을 하나씩 채워 나무를 풍성하게 만들어보세요!</p> 
				<p><a class="btn btn-secondary" href="#" role="button">View details »</a></p> 
			</div> 
			<div class="col-md-4"> 
				<h2>온라인 주문</h2> <p>유명한 디저트 매장이 멀리 있어서 아쉬웠죠? 걱정마세요~ 디저트리가 배송해드릴게요. 오후 3시 주문까지 당일배송!</p> 
				<p><a class="btn btn-secondary" href="#" role="button">View details »</a></p> 
			</div> 
		</div>
	</div>
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/1.jpg">
				</div>
				<div class="item">
					<img src="images/2.jpg">
				</div>
				<div class="item">
					<img src="images/3.jpg">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>