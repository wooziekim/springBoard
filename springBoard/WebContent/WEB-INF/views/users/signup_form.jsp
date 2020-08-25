<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>/board/users/signup_form.jsp</title>
</head>
<style>
	/* 페이지 로딩 시점에 도움말과 피드백 아이콘은 일단 숨기기 */
	.help-block{
		display: none;
	}
</style>
<body>

	
	<form class="Sign_up" action="/users/signup.do" method="post">
		<table style="margin:auto; table-layout: fixed;" >
			<tr >
				<td align="left"><a href="/board/boardList.do">List</a></td>
			</tr>
			<tr>
				<td>
					<table border="1" width="400px">
						<tr>
							<td width="80" align="center">id</td>
							<td>
							<span>
							<input class="form-control" type="text" id="id" name="id"/>
								<input id="idCheck" type="button" value="중복확인">
							</span>
								<p style="color:green;" class="help-block" id="id_usable">사용 가능한 아이디 입니다.</p>
								<p style="color:red;" class="help-block" id="id_notusable">이미 사용중인 아이디 입니다.</p>
								<p style="color:red;" class="help-block" id="id_require">필수 정보입니다.</p>
								<p style="color:red;" class="help-block" id="chkId_required">중복체크가 필요합니다.</p>
								</td>
						</tr>
						<tr>
							<td width="80" align="center">pw</td>
							<td>
							<input
								type="password" autocomplete="password" id="pw" name="pw" class="form-control"
								placeholder="영,숫자 6~12자리" />
								<p style="color:red;" class="help-block" id="pwd_required">필수 정보입니다.</p>
								<p class="help-block" id="pwdChk_required">영문, 숫자 6자리~12자리 이내로 입력하세요.</p>
								
								</td>
								
						</tr>
						<tr>
							<td width="80" align="center">pw check</td>
							<td>
								<input type="password" autocomplete="password" id="pw2" name="pw" class="form-control"
								placeholder="비밀번호 확인">
								<p style="color:red;" class="help-block" id="pwd_notequal">비밀번호가 일치하지 않습니다.</p>
								
								</td>
						</tr>
						<tr>
							<td align="center">name</td>
							<td> <input
								type="text" id="name" name="name" placeholder="한글 2~4자" class="form-control">
							<p class="help-block" id="name_required">반드시 입력하세요.</p>
							<p class="help-block" id="nameChk_required">한글만 입력하세요.</p>
								</td>
								
						</tr>
						<tr>
							<td align="center">phone</td>
							<td>
							<span>
							 
						<select id="phoneCodeNameList" name="phone1" class="select_box">
							<c:forEach var="phoneCodeName" items="${phoneCodeName}">
							<option value="${phoneCodeName.codeId}">${phoneCodeName.codeName}</option>			
							</c:forEach>
						</select> 
							
							<%-- <label  for="phone1" class="sr-only2" ></label> 
							<input style="width:30px"
								type="text" id="phone1" name="phone1" class="form-control"
								placeholder="" value="${savedPhone1 }"> --%>
							<label>-</label>
							<label for="phone2" class="sr-only2"></label> 
							<input style="width:60px"
								type="text" id="phone2" name="phone2" class="form-control"
								>
							<label>-</label>
							<label for="phone3" class="sr-only2"></label> 
							<input style="width:60px"
								type="text" id="phone3" name="phone3" class="form-control"
								>
								
							</span>
							<p class="help-block" id="phone_required">반드시 입력하세요.</p>
							<p class="help-block" id="chkPhone_required">휴대폰 4자리 형식에 맞게 입력하세요.</p>
							</td>
						</tr>
						<tr>
							<td align="center">postNo</td>
							<td>
							<span>
							<input style="width:60px"
								type="text" id="addr1" name="addr1" class="form-control"
								>
							</span>
							<p class="help-block" id="postNo_required">반드시 입력하세요.</p>
							<p class="help-block" id="postNoChk_required">우편번호 6자리 형식에 맞게 입력하세요.</p>
							</td>
						</tr>
						<tr>
							<td align="center">address</td>
							<td>
							<label  for="addr2" class="sr-only2" ></label> 
							<input 
								type="text" id="addr2" name="addr2" class="form-control"
								>
							
							</td>
							
						</tr>
						<tr>
							<td align="center">company</td>
							<td>
							<label  for="company" class="sr-only2" ></label> 
							<input 
								type="text" id="company" name="company" class="form-control"
								>
							</td>
						</tr>
						

					</table> 
					
					</td>
						</tr>
							<tr>
						<td align="right">
						
						<button id="submit" class="btn btn-primary" type="submit">join</button>
						</td>
						</tr>
	</table>
					</form>
	<%-- <form class="form-signin" action="/users/signup.do" method="post">
		<input type="hidden" name="url" value="${url }" />
	</form> --%>
<script>
//아이디를 사용할수 있는지 여부 
var isIdUsable=false;
//아이디를 입력 했는지 여부 
var isIdInput=false;

//비밀번호를 확인란과 같게 입력 했는지 여부 
var isPwdEqual=false;
//비밀번호를 입력했는지 여부 
var isPwdInput=false;

//이메일을 형식에 맞게 입력했는지 여부 
var isPhoneMatch=false;
//이메일을 입력했는지 여부
var isPhoneInput=false;

//아이디 입력란에 한번이라도 입력한 적이 있는지 여부
var isIdDirty=false;
//비밀 번호 입력란에 한번이라도 입력한 적이 있는지 여부
var isPwdDirty=false;
//아이디 입력란에 한번이라도 입력한 적이 있는지 여부
var isNameDirty=false;
//비밀 번호 입력란에 한번이라도 입력한 적이 있는지 여부
var isPostNoDirty=false;
//아이디 입력란에 한번이라도 입력한 적이 있는지 여부
var isPhoneNoDirty=false;
// 비밀번호 정규식
var rightPw = false;
// 아이디 정규식
var rightId = false;
var rightPhoneNo = false;
// 이름 정규식
var rightName = false;
// 포스트넘버 정규식
var rightPostNo = false;


function chkPostNo()
{
	var postNo=$j("#addr1").val();
	var num=postNo.search(/(\d{3}-\d{3}|\d{6})/);
	
	if(num){
		return false;
	}else{
		return true;
	}
};


function chkName()
{
	
 var name = $j("#name").val();
 var name_RegEx = /^[가-힣]{2,4}$/;
 var spe = name.search(/[^A-Za-z0-9_\`\~\!\@\#\$\%\^\&\*\(\)\-\=\+\\\{\}\[\]\'\"\;\:\<\,\>\.\?\/\s]/gm);

 if(!name_RegEx.test(name)){
	 	return false;
}else if(name.search(/\s/) != -1){
	return false;
}else if(spe >=1){
	 return false;
}else {
	
	return true;				 
}
 
}

var autoHypenPostNo = function(str){
    var str = str.replace(/[^0-9]/g, '');
     var tmp = '';
     if( str.length < 4){
         return str;
     }else if(str.length > 3){
    	 tmp += str.substr(0, 3);
         tmp += '-';
         tmp += str.substr(3);
         return tmp;
     }
     else if(str.length == 6){
         tmp += str.substr(0, 3);
         tmp += '-';
         tmp += str.substr(3);
         return tmp;
     }else{
 
     return str;
}
};

var postNo1 = document.getElementById('addr1');

postNo1.onkeyup = function(){
 console.log(this.value);
 this.value = autoHypenPostNo( this.value ) ;  
}


function chkPhoneNumber(){
	var phone2=$j("#phone2").val();
	var phone3=$j("#phone3").val();
	var phone_RegExp =   /^[0-9]+$/;;
	var space = phone2.search(/\s/);
	var space2 = phone3.search(/\s/);
	if(phone2.length != 4 || phone3.length != 4){
		return false;
	}
	else if(!phone_RegExp.test(phone2) || !phone_RegExp.test(phone3)){
 		console.log(phone_RegExp.test(phone2))
		  return false;
	} 
		else if(space != -1 || space2 != -1)
	
		 {	return false;
	}
	else{
			 
			return true; 
		 }


	
}

//비밀번호 정규식
function chkPw(){
	var pw = $j("#pw").val();
	//var pw2 = $j("#pw2").val();
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var spe = pw.search(/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi);
	
	if(pw.length < 6 || pw.length > 13 ){
			return false;
		 }else if(pw.search(/\s/) != -1){
			return false;

		 }else if(spe != -1 ){
			 return false;

		 }else {
			return true;				 
		}
};


	
$j("#id").on("propertychange change keyup paste input",function(){
	isIdUsable=false;
	rightId=false;
	isIdDirty=true;
	$j("#chkId_required").show();
	$j("#id_require").hide();
	$j("#id_usable").hide();
	
});
	//폰넘버를 입력할때 실행할 함수 등록
	$j("#phone2, #phone3").on("input", function(){
		
		isPhoneNoDirty=true;
		var phone2=$j("#phone2").val();
		var phone3=$j("#phone3").val();
		rightPhoneNo = chkPhoneNumber();
		if(phone2.length == 4 && phone3.length == 4){// 4자리 형식에 맞게 입력 했다면
			isPhoneMatch=true;
		}else{//형식에 맞지 않게 입력했다면 
			isPhoneMatch=false;
		}
		
		if(phone2.length == 0 || phone3.length == 0){ //폰넘버를 입력하지 않았다면
			isPhoneInput=false;
		}else{//이메일을 입력 했다면 
			isPhoneInput=true;
		}
		// 폰넘버 에러 여부 
		var isError=!rightPhoneNo && isPhoneInput && !isPhoneMatch ;
		// 폰넘버 상태 바꾸기 
		setState("#phone2", isError);
		
	});
	
	
	
	//비밀번호를 입력할때 실행할 함수 등록
	$j("#pw, #pw2").on("input", function(){

		//상태값을 바꿔준다. 
		isPwdDirty=true;
		rightPw = chkPw();
		
		//입력한 비밀번호를 읽어온다.
		var pw=$j("#pw").val();
		var pw2=$j("#pw2").val();
		
		if(pw != pw2){//두 비밀번호를 동일하게 입력하지 않았다면
			isPwdEqual=false;
		}else{
			isPwdEqual=true;
		};
		//isPwdEqual = pwd != pwd2 ? false : true;
		if(pw.length == 0){
			isPwdInput=false;

		}else{
			isPwdInput=true;

			
		}
		//비밀번호 에러 여부 
		var isError=!rightPw || !isPwdEqual || !isPwdInput;
		//비밀번호 상태 바꾸기 
		setState("#pw", isError);
	});
	
	//비밀번호를 입력할때 실행할 함수 등록
	$j("#name").on("input", function(){

		//상태값을 바꿔준다. 
		isNameDirty=true;
		rightName = chkName();
		
		//입력한 비밀번호를 읽어온다.
		var name=$j("#name").val();
		
		
		//isPwdEqual = pwd != pwd2 ? false : true;
		if(name.length == 0){
			isNameInput=false;
		}else{
			isNameInput=true;
		}
		//비밀번호 에러 여부 
		var isError=!rightName || !isNameInput;
		//비밀번호 상태 바꾸기 
		setState("#name", isError);
	});
	
	$j("#submit").on("click", function(){
		
		
		if($j("#id").val()==""){
			alert("아이디를 입력해주세요.");
			return false;
		}
		if($j("#pw").val()==""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		if($j("#pw2").val()==""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		if($j("#phone2").val()==""){
			alert("휴대폰번호를 입력해주세요.");
			return false;
		}
		if($j("#phone3").val()==""){
			alert("휴대폰번호를 입력해주세요.");
			return false;
		}
		if($j("#name").val()==""){
			alert("이름을 입력해주세요.");
			return false;
		}
		
		if($j("#pw2").val() != $j("#pw2").val()){
			alert("비밀번호가 일치하지않습니다.");
			return false;
		}
		if(!isIdUsable && !rightId){
			alert("아이디 중복체크를 해주세요.");
			return false;
		}
		
	});
	
	
	
	
	//비밀번호를 입력할때 실행할 함수 등록
	$j("#addr1").on("input", function(){

		//상태값을 바꿔준다. 
		isPostNoDirty=true;
		rightPostNo = chkPostNo();
		
		//입력한 비밀번호를 읽어온다.
		var name=$j("#addr1").val();
		
		
		//isPwdEqual = pwd != pwd2 ? false : true;
		if(addr1.length == 0){
			isPostNoInput=false;
		}else{
			isPostNoInput=true;
		}
		//비밀번호 에러 여부 
		var isError=!rightPostNo || !isPostNoInput;
		//비밀번호 상태 바꾸기 
		setState("#addr1", isError);
	});
	
	//아이디를 입력할때 실행할 함수 등록 
	$j("#idCheck").on("click", function(){	
		isIdDirty=true;
		//1. 입력한 아이디를 읽어온다.
		var inputId=$j("#id").val();
		
		//2. 서버에 보내서 사용가능 여부를 응답 받는다.
		$j.ajax({
			url:"/users/checkid.do",
			method:"GET",
			data:{inputId:inputId},
			success:function(responseData){
				if(responseData.isExist){//이미 존재하는 아이디라면 
					isIdUsable=false;
					isIdInput=true;
				}else{
					isIdUsable=true;
					isIdInput=true;
					rightId=true;				
				}
				//아이디 에러 여부 
				var isError=!isIdUsable || !isIdInput;
				//아이디 상태 바꾸기 
				setState("#id", isError );
			}
		});
		
		
		//아이디를 입력했는지 검증
		if(inputId.length == 0){//만일 입력하지 않았다면 
			isIdInput=false;
			
		}else{
			isIdInput=true;
			
		}
		//아이디 에러 여부 
		var isError= !isIdUsable || !isIdInput ;
		//아이디 상태 바꾸기 
		setState("#id", isError );
	});
	
	//입력란의 상태를 바꾸는 함수 
	function setState(sel, isError){
		//일단 UI 를 초기 상태로 바꿔준다.
		$j(sel)
		.parent()
		.find(".help-block")
		.hide();
		
		
		
		//에러가 있다면 에러 메세지 띄우기
		if(isPwdInput && !isPwdEqual && isPwdDirty){
			$j("#pwd_notequal").show();

		}else{
			$j("#pwd_notequal").hide();


		}
		if(!isPwdInput && isPwdDirty){
			$j("#pwd_notmatch").show();
		}else{
			$j("#pwd_notmatch").hide();
		}
		
		
		if( isPwdDirty
				&&
				!rightPw)
		{
			$j("#pwdChk_required").show();
			
		}else{
			$j("#pwdChk_required").hide();
			
		}
		
		if(  isPhoneNoDirty
		&&				!rightPhoneNo)
		{
			$j("#chkPhone_required").show();
		}else{
			$j("#chkPhone_required").hide();
		}	
		
		if(  isNameDirty
				&&
				!rightName)
		{
			$j("#nameChk_required").show();
		}else{
			$j("#nameChk_required").hide();
		}	
		
		if(  isPostNoDirty
				
		&&			!rightPostNo)
		{
			$j("#postNoChk_required").show();
		}else{
			$j("#postNoChk_required").hide();
		}	
		
		//에러가 있다면 에러 메세지 띄우기
		
		if(!isIdUsable && isIdDirty){
			$j("#id_notusable").show();
		}
		if(!isIdInput && isIdDirty){
			$j("#id_require").show();
		}
		if(isIdUsable && isIdInput){
			$j("#id_usable").show();
			$j("#chkId_required").hide();
		}else{
			$j("#id_require").hide();
			
		}
		
		if(!isIdUsable && isIdInput){
			$j("#id_notusable").show();
		}
		else{
			$j("#id_notusable").hide();
		}
		
		
		
		if(!isIdInput){
			$j("#id_required").hide();
		
		}else{
			$j("#id_required").show();
			
		};
		
			
	};	
	
	
</script>
</body>
</html>






