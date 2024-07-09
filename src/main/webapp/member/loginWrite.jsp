<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
 <!-- <link rel="stylesheet" href="/resources/demos/style.css"> --> 
 
 <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
 
 <script>
 
 $(function(){
	 $("#btn_submit").click(function(){
		 var userid=$.trim($("#userid").val());
		 var pass = $.trim($("#pass").val());
		
		 if(userid == ""){
			 alert("아이디를 입력하세요");
			 $("#userid").focus();
			 return false;
		 }
		 if(pass == ""){
			 alert("암호를 입력하세요");
			 $("#pass").focus();
			 return false;
		 }
		 
		 $.ajax({
			 
			 /*전송 전 세팅*/
	    		type:"POST",
	    		data:"userid="+userid+"&pass="+pass,  //json (전송) 타입
	    		url:"loginWriteSub.do",
	    		dataType:"text", // return type
	    		
	    		/*전송 후 세팅*/
	    		success:function(data){ //controller -> ok, fail
	    			if(data=="ok"){
	    				alert(userid+"님 로그인 되었습니다.");
	    				location="/myproject2/board/boardList.do";
	    				
	    			}
	    			else{
	    				alert("로그인 정보를 다시 확인해주세요");
	    			}
	    		},
	    		error:function(){ //장애발생
	    			alert("오류발생");
	    		}
		 });
		 
	 });
 });
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
<table>
	<caption>로그인</caption>
	<tr>
		<th><label form="userid">아이디</label></th>
		<td>
			<input type="text" name="userid" id="userid" placeholder="아이디입력">
			
		</td>
	</tr>
	
	<tr>
		<th><label form="pass">암호</label></th>
		<td>
			<input type="password" name="pass" id="pass">		
		</td>
	</tr>


</table>

<div class="div_button">
	<button type="submit" id="btn_submit" >로그인</button>
	<button type="reset" >취소</button>
</div>

</form>
</body>
</html>