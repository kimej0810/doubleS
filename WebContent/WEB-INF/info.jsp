<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="service.*" %>
    <% UserVO uv = (UserVO)request.getAttribute("uv"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>My Info</title>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<script>
		function check(){
			var fm = document.frm;
			const userPwd = $("#userPwd").val();
			const userPwd2 = $("#userPwd2").val();
			if(userPwd==""){
				alert("비밀번호 입력");
				$("#userPwd").focus();
				return false;
			}
			if(userPwd!=userPwd2){
				alert("비밀번호가 다릅니다");
				$("#userPwd2").val("");
				$("#userPwd2").focus();
				return false;
			}
			return true;
		}
	</script>
	<style>
		body{
			width:100%;
			background-color: #1c1d22;
		}
		.content{
			width:40%;
			height:500px;
			margin:0 auto;
			padding:30px;
			background-color:white;
			border-radius: 10px;
			font-size:20px;
			
		}
		 form{
		 	width:100%;
		 }
		.idRe, .pwdRe, .emailRe, .btn{
			width:60%;
			margin:10px auto;
			align-items: center;
		}
		.idRe input{
			width:90%;
			height:40px;
			margin:10px 0 0 5%;
			font-size:30px;
			border:0px solid black;
		}
		.pwdRe input{
			width: 90%;
			height:40px;
			margin:10px 0 0 5%;
			font-size:30px;
			border-radius:5px;
		}
		.emailRe input{
			width: 90%;
			height:40px;
			margin:10px 0 0 5%;
			font-size:30px;
			border-radius:5px;
			border:0px solid black;
		}
		input[type=submit], input[type=button]{
			width:92%;
			height:50px;
			margin:7px 0 5px 5%;
			font-size:25px;
			border-radius:5px;
			background-color:#FFFAFA;
			box-shadow:1px 1px 1px 3px black;
		}
		input[type=button]:hover{
			cursor:pointer;
		}
		input[type=submit]:hover{
			cursor:pointer;
		}
	</style>
	</head>
<body>
	<div class="content">
		<form name="frm" method="post" action="<%=request.getContextPath()%>/infoAction.do" onsubmit="return check()">
			<div class="idRe">
				<label>아이디</label><br>
				<input type="text" value="<%=uv.getUserId()%>" name="userId" readonly>
			</div>
			<div class="pwdRe">
				<label>신규 비밀번호</label><br>
				<input type="password" maxlength="20" name="userPwd" id="userPwd"><br>
				<label>비밀번호 재입력</label><br>
				<input type="password" maxlength="20" name="userPwd2" id="userPwd2">
			</div>
			<div class="emailRe">
				<label>이메일</label><br>
				<input type="text" value="<%=uv.getUserEmail()%>" name="userEmail" readonly>
			</div>
			<div class="btn">
				<input type="submit" value="변경하기">
				<a href="<%=request.getContextPath()%>/home.do"><input type="button" value="취소"></a>
			</div>			
		</form>
	</div>

</body>
</html>