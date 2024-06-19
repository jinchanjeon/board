<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입화면</title>

<!--
<script src="../script/jquery-1.12.4.js"></script>
<script src="../script/jquery-ui.js"></script>
 -->
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
 <!-- <link rel="stylesheet" href="/resources/demos/style.css"> --> 
 
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>

<script>
  $( function() {
    $( "#birth" ).datepicker({
      changeMonth: true,
      changeYear: true,
      dateFormat:'yy-mm-dd'
    });
    $("#btn_zipcode").click(function(){
    	var w = 500;
    	var h = 100;
    	var url ="post1.do";
    	window.open(url,'zipcode','width='+w+", height="+h);
    	
    });
    
    
    $("#btn_idcheck").click(function(){
    	
    	var userid = $.trim($("#userid").val());	//현재 창에 입력된 값
    	if(userid==""){
    		alert("아이디를 입력해주세요");
    		$("#userid").focus();
    		return false;
    	}
    	
    	//idcheck.do로 데이터 전송 - 비동기 전송 방식
    	$.ajax({
    		/*전송 전 세팅*/
    		type:"POST",
    		data:"userid="+userid,  //json (전송) 타입
    		url:"idcheck.do",
    		dataType:"text", // return type
    		
    		/*전송 후 세팅*/
    		success:function(data){ //controller -> ok, fail
    			if(data=="ok"){
    				alert("사용 가능한 아이디입니다");
    				
    			}
    			else{
    				alert("이미 사용중인 아이디입니다");
    			}
    		},
    		error:function(){ //장애발생
    			alert("오류발생");
    		}
    		
    	});
    	
    });
    
    
    $("#btn_submit").click(function(){
    	var userid=$("#userid").val();
    	var pass=$("#pass").val();
    	var name=$("#name").val();
    	
    	userid = $.trim(userid);
    	pass = $.trim(pass);
    	name = $.trim(name);
    	
    	if(userid==""){
    		alert("아이디를 입력하세요");
    		$("#userid").focus();
    		return false; //프로그램 중단
    	}
    	if(pass==""){
    		alert("비밀번호를 입력하세요");
    		$("#pass").focus();
    		return false; //프로그램 중단
    	}
    	if(name==""){
    		alert("이름을 입력하세요");
    		$("#name").focus();
    		return false; //프로그램 중단
    	}
    	
    	$("#userid").val(userid); //실제화면에서도 공백제거돼서 나오게
    	$("#pass").val(pass);
    	$("#name").val(name);
    	
    	
    	var formData= $("#frm").serialize();
    	
    	$.ajax({
    		/*전송 전 세팅*/
    		type:"POST",
    		data:formData,
    		url:"memberWriteSave.do",
    		dataType:"text", // return type
    		
    		/*전송 후 세팅*/
    		success:function(data){ //controller -> ok, fail
    			if(data=="ok"){
    				alert("저장완료");
    				location="loginWrite.do";
    			}
    			else{
    				alert("저장실패");
    			}
    		},
    		error:function(){ //장애발생
    			alert("오류발생");
    		}
    		
    	});
    	
    	
    });
  } );
  </script>

  

</head>

<style>
body{
	font-size:9pt;
	font-color:#333333;
	font-family:맑은 고딕;
}

table{
	width:600px;
	border-collapse:collapse;
	
}

th,td{
	border:1px solid #ccc;
	padding: 3px;
	line-height:2;
}

.div_button{
	width:600px;
	text-align:center;
	margin-top:5px;
	
}

caption{
	font-size:15pt;
	font-weight:bold;
	margin-top:10px;
	padding-bottom:5px;
}

a{
	text-decoration:none;
}
</style>

<body>

<%@include file="../include/topmenu.jsp" %>
<form id="frm" name="frm">
<table>
	<caption>회원가입 폼</caption>
	<tr>
		<th><label form="userid">아이디</label></th>
		<td>
			<input type="text" name="userid" id="userid" placeholder="아이디입력">
			<button type="button" id="btn_idcheck">중복체크</button>
			
		</td>
	</tr>
	
	<tr>
		<th><label form="pass">암호</label></th>
		<td>
			<input type="password" name="pass" id="pass">		
		</td>
	</tr>
	
	<tr>
		<th><label form="name">이름</label></th>
		<td>
			<input type="text" name="name" id="name">	
		</td>
	</tr>
	
	<tr>
		<th><label form="gender">성별</label></th>
		<td>
			<input type="radio" name="gender" id="genderM" value="M">남
			<input type="radio" name="gender" id="genderF" value="F">여	
		</td>
	</tr>
	
	<tr>
		<th><label form="birth">생년월일</label></th>
		<td>
			<input type="text" name="birth" id="birth">	
		</td>
	</tr>
	
	<tr>
		<th><label form="phone">연락처</label></th>
		<td>
			<input type="text" name="phone" id="phone">	(예: 010-1234-5678)
		</td>
	</tr>
	
	<tr>
		<th><label form="address">주소</label></th>
		<td>
			<input type="text" name="zipcode" id="zipcode">	
			<button type="button" id="btn_zipcode">우편번호</button> 
			<br>
			<input type="text" name="address" id="address">
		</td>
	</tr>
	

</table>

<div class="div_button">
	<button type="submit" id="btn_submit" >저장</button>
	<button type="reset" >취소</button>
</div>
</form>

</body>
</html>