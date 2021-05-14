<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>로그인</title>
	<script>
		$(document).ready(function(){
			$("#loginBtn").click(function(){
				var userId = $("#userId").val();
				var userPw = $("#userPw").val();
				if(userId == ""){
					alert("아이디쓰쇼");
					$("#userId").focus();
					return;
				}
				if(userPw == ""){
					alert("비밀번호쓰쇼");
					$("#userPw").focus();
					return;
				}
				document.frm.action="${path}/loginCheck.do"
				document.frm.submit();
			});
		});
	</script>
	<style>
		body{
			width: 100%;
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
		input[type=submit]{
			width:91%;
			height:50px;
			margin: 5px auto;
			background-color:#228B22;
			border-radius:15px;
			box-shadow:0 0 1px 1px #4AB34A;
		}
		input[type=submit]:hover{
		width:95%;
		font-size:30px;
		background-color:#68D168;	
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
		<form method="post" id="frm">
			<input type="text" name="userId" class="inP" id="userId" placeholder="이이디를 입력하세요.">
			<input type="password" name="userPwd" class="inP" id="uesrPw" placeholder="비밀번호를 입력하세요.">
			<input type="submit" id="loginBtn" value="로그인">
		</form>
		<div id="subContent">
			<a href="#">아이디가 생각나지 않아요</a>
			<a href="#">비밀번호가 생각나지 않아요</a>
		</div>
	</div>
</body>
</html>