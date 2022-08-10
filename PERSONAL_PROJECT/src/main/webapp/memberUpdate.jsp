<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null){
		session.setAttribute("messageType", "오류 메시지");
		session.setAttribute("messageContent", "현재 로그인이 되어있지 않습니다");
		response.sendRedirect("main.jsp");
		return;
	}
	UserDTO user = new UserDAO().getUser(userID);

%>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
	<title>회원정보수정 | Dessertree</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript">
		
		function passwordCheckFunction(){
			var userPassword1 = $('#userPassword1').val();
			var userPassword2 = $('#userPassword2').val();
			if(userPassword1 != userPassword2){
				$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
			}else {
				$('#passwordCheckMessage').html('비밀번호가 일치합니다');
			}
		}
	</script>
</head>
<body>
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
				<li><a href="map.jsp">고객센터</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
					<li><a class="active" href="memberUpdate.jsp">회원정보수정</a></li>
					<li><a href="logoutAction.jsp">로그아웃</a></li>
				</ul>
				</li>
			</ul>
				
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-3"></div>
		<div class="col-lg-6">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="./userUpdate">
					<h3 style="text-align: left;">회원정보수정</h3>
					<h5 style="text-align: left;">회원정보 중 변경된 내용이 있으면 아래에서 수정해 주세요.</h5>
					<div class="form-group">
						<input type="text" class="form-control" name="userID" id="userID" maxlength="20" value="<%= user.getUserID() %>" readonly>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword1" id="userPassword1" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호 확인" name="userPassword2" id="userPassword2"  maxlength="20" onkeyup="passwordCheckFunction();" >
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="userName" id="userName" maxlength="20" value="<%= user.getUserName() %>">
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary <% if(user.getUserGender().equals("남자")) out.print("active"); %>">
								<input type="radio" name="userGender" autocomplete="off" value="남자" <% if(user.getUserGender().equals("남자")) out.print("checked"); %>>남자
							</label>
							<label class="btn btn-primary <% if(user.getUserGender().equals("여자")) out.print("active"); %>">
								<input type="radio" name="userGender" autocomplete="off" value="여자" <% if(user.getUserGender().equals("여자")) out.print("checked"); %>>여자
							</label>
						</div>
					</div>
					<div class="form-group">
						<input type="email" class="form-control" name="userEmail" id="userEmail" maxlength="20" value="<%= user.getUserEmail() %>">
					</div>
					<h5 style="color: red;" id="passwordCheckMessage"></h5>
					<input type="submit" class="btn btn-primary form-control" value="수정완료">	
				</form>
			</div>
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="./userDelete">
					<h3 style="text-align: left;">회원탈퇴</h3>
					<h5 style="text-align: left;">회원탈퇴 완료시 계정의 모든 정보가 삭제됩니다.</h5>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" id="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword1" id="userPassword1" maxlength="20">
					</div>
					<div>
						<input type="submit" class="btn btn-primary form-control" value="회원탈퇴">
					</div>
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<%
		String messageContent = null;
		if(session.getAttribute("messageContent") != null){
			messageContent = (String) session.getAttribute("messageContent");
		}
			String messageType = null;
		if(session.getAttribute("messageType") != null){
			messageType = (String) session.getAttribute("messageType");
		}
		if(messageContent != null){
	%>
	<div class="modal fade"	id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content <% if(messageType.equals("오류 메시지")) out.println("panel-warning"); else out.println("panel-success");%>">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">
							<%= messageType %>
						</h4>
					</div>
					<div class="modal-body">
						<%= messageContent %>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#messageModal').modal("show");
	</script>
	<%	
		session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
	}
	%>
	<div class="modal fade"	id="checkModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div id="checkType" class="modal-content panel-info">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">
							확인 메시지
						</h4>
					</div>
					<div class="modal-body" id="checkMessage">
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>