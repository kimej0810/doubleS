	//아이디 정규식 (영문자로 시작하는 6~20자 영문자 또는 숫자)
	var idReg = /^[a-z]+[a-z0-9]{5,19}$/;
	//비밀번호 정규식 (최소 8자, 최소 하나의 문자, 하나의 숫자와 하나의 특수문자가 포함)
	var pwPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
	//이름 정규식 (한글 또는 영문 사용하기(혼용X))
	var namePattern = /^[가-힣]{2,4}$/;
	//생년월일 정규식 
	var birthPattern  = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
	//이메일 정규식(알파벳+숫자@알파벳+숫자.알파벳+숫자 )
	var emailPattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	//폰번호 정규식
	var phonePattern = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/;
	
	function check(){
		var fm = document.frm;
		//아이디 정규식 확인
		if( !idReg.test( $("input[name=userId]").val())){
			$("#sp1").show();
            $("#sp1").text("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
        }else{
        	$("#sp1").hide();
        }
		
		//비밀번호 정규식 확인
		if( !pwPattern.test($("input[name=userPwd]").val())){ 
			$("#sp2").show();
            $("#sp2").text("비밀번호는 8자이상 최소 하나의 문자,숫자, 특수문자가 포함해야합니다.");
		}else{
			$("#sp2").hide();
		}
	
		//비밀번호 값 비교
		if($("input[name=userPwd]").val() != $("input[name=userPwd2]").val()){
			$("#sp3").show();
        	$("#sp3").text("비밀번호가 일치하지 않습니다.");
		}else{
			$("#sp3").hide();
		}
		
		//이름 확인
		if(!namePattern.test($("input[name=userName]").val())){
			$("#sp4").show();
        	$("#sp4").text("이름은 한글 2~4자여야합니다.");
		}else{
			$("#sp4").hide();
		}
		
		//생년월일 확인
		if(!birthPattern.test($("input[name=birthyear]").val())){
			$("#sp5").show();
        	$("#sp5").text("생년월일은 숫자로만 입력해야 하며 하이픈(-)없이 입력해야합니다.");
		}else{
			$("#sp5").hide();
		}
		//이메일 확인
		if(!emailPattern.test($("input[name=userEmail]").val())){
			$("#sp6").show();
        	$("#sp6").text("이메일 형식이 올바르지 않습니다.");
		}else{
			$("#sp6").hide();
		}
		
		//핸드폰번호 확인
		if(!phonePattern.test($("input[name=userPhone]").val())){
			$("#sp7").show();
        	$("#sp7").text("연락처가 올바르지 않습니다. ");
		}else{
			$("#sp7").hide();
		}
		fm.action ="<%=request.getContextPath()%>/userJoinAction.do";
		fm.method = "post";
		fm.submit();
	}
	