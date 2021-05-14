<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>로그인</title>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<script>
		function check(){
			var fm = document.frm;
			var userId = $("#userId").val();
			var userPwd = $("#userPwd").val();
			if(userId == ""){
				alert("아이디쓰쇼");
				$("#userId").focus();
				return false;
			}
			if(userPwd == ""){
				alert("비밀번호쓰쇼");
				$("#userPwd").focus();
				return false;
			}
			return true;
		}
	</script>
	<style>
		body{
			width: 100%;
			background-color:#1c1d22;
		}
		#mainContent{
			width: 60%;
			margin: 100px auto;
		}
		#frm{
			width:100%;
			margin:0;
			text-align: center;
		}
		.inP{
			width:90%;
			height:50px;
			margin:5px auto;
		}
		#loginBtn{
			width:91%;
			height:50px;
			margin: 5px auto;
			background-color:#3b3d4a;
			border-radius:15px;
			box-shadow:0 0 1px 1px white;
		}
		#loginBtn:hover{
		width:95%;
		font-size:30px;
		background-color:#3b3d4a;	
	}
		#subContent{
			width:100%;
			font-size:12px;
			text-decoration: none;
			cursor: pointer;
			margin-left: 25px;
		}
	</style>
</head>
<body>
	<div id="mainContent">
		<form method="post" id="frm" name="frm" onsubmit="return check()" action="<%=request.getContextPath()%>/loginCheck.do">
			<input type="text" name="userId" class="inP" id="userId" placeholder="이이디를 입력하세요.">
			<input type="password" name="userPwd" class="inP" id="userPwd" placeholder="비밀번호를 입력하세요.">
			<input type="submit" id="loginBtn" value="로그인">
		</form>
		<div id="subContent">
			<a href="#">아이디가 생각나지 않아요</a>
			<a href="#">비밀번호가 생각나지 않아요</a>
		</div>
	</div>
</body>
</html>