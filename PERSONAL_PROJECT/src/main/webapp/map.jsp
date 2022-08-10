<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>위치 찾기 | Dessertree</title>

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
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">리뷰 게시판</a></li>
				<li><a href="gallery.jsp">갤러리 게시판</a></li>
				<li class="active"><a href="map.jsp">고객센터</a></li>
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
		<div id="map" style="width:500px;height:400px;"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be2f4f2afc76638214317e67501bc641&libraries=services,clusterer,drawing"></script>
		<script>
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(35.15840, 129.06201),
				level: 3
			};
	
			var map = new kakao.maps.Map(container, options);
			
			// 마커 위치
			var markerPosition  = new kakao.maps.LatLng(35.15840, 129.06201);
			// 마커 생성
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
			// 지도위에 표시
			marker.setMap(map);
			
			var iwContent = '<div style="padding:5px; width:150px">아이티윌 부산 교육센터 <br><a href="https://map.kakao.com/link/map/아이티윌 부산 교육센터,35.15840,129.06201" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/아이티윌 부산 교육센터,35.15840,129.06201" style="color:blue" target="_blank">길찾기</a></div>',
			 iwPosition = new kakao.maps.LatLng(35.15840, 129.06201);
			
			var infowindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent 
			});
			
			infowindow.open(map, marker); 
		</script>
		<br>
		<div>
			<h4>교육센터 주소</h4>
			<p>부산광역시 부산진구 부전동 112-3번지 삼한골든게이트 7층 (도로명주소 : 부산광역시 부산진구 동천로 109 삼한골든게이트 7층)[우편번호 : 47246]
			<br>
			<p>연락처</p>
			<p>대표전화 : 051-803-0909</p>
			<p>시험문의 : 051-803-0918</p>
			<p>팩스 : 051-803-0979</p>
			<br>
			
		</div>
	</div>
	<div class="jumbotron">
		<div class="container">
			<h1>이벤트! 우편번호를 입력하고 상품 받아가세요!</h1>
			<h4>매주 100분을 추첨하여 3만원 상당의 상품을 보내드립니다.</h4>
			<input type="text" class="d_form mini" id="sample6_postcode" placeholder="우편번호">
			<input type="button" class="d_btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" class="d_form large" id="sample6_address" placeholder="주소"><br>
			<input type="text" class="d_form" id="sample6_detailAddress" placeholder="상세주소">
			<input type="text" class="d_form" id="sample6_extraAddress" placeholder="참고항목">
			<a class="btn btn-primary btn-pull" href="#" role="button">제출하기</a>
	
	
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
			    function sample6_execDaumPostcode() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var addr = ''; // 주소 변수
			                var extraAddr = ''; // 참고항목 변수
			
			                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                    addr = data.roadAddress;
			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                    addr = data.jibunAddress;
			                }
			
			                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			                if(data.userSelectedType === 'R'){
			                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                        extraAddr += data.bname;
			                    }
			                    // 건물명이 있고, 공동주택일 경우 추가한다.
			                    if(data.buildingName !== '' && data.apartment === 'Y'){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                    if(extraAddr !== ''){
			                        extraAddr = ' (' + extraAddr + ')';
			                    }
			                    // 조합된 참고항목을 해당 필드에 넣는다.
			                    document.getElementById("sample6_extraAddress").value = extraAddr;
			                
			                } else {
			                    document.getElementById("sample6_extraAddress").value = '';
			                }
			
			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                document.getElementById('sample6_postcode').value = data.zonecode;
			                document.getElementById("sample6_address").value = addr;
			                // 커서를 상세주소 필드로 이동한다.
			                document.getElementById("sample6_detailAddress").focus();
			            }
			        }).open();
			    }
			</script>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>