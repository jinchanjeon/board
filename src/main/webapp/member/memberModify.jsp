<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 화면</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<script>

$(function(){
    // birth 필드를 datepicker로 설정
    $("#birth").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd'
    });
    
    // Ajax를 이용한 아이디 중복 체크
    $("#btn_idcheck").click(function(){
        var userid = $.trim($("#userid").val());
        if(userid == ""){
            alert("아이디를 입력해주세요.");
            $("#userid").focus();
            return false;
        }
        
        $.ajax({
            type: "POST",
            data: "userid=" + userid,
            url: "idcheck.do",
            dataType: "text",
            success: function(data){
                if(data == "ok"){
                    alert("사용 가능한 아이디입니다.");
                } else {
                    alert("이미 사용 중인 아이디입니다.");
                }
            },
            error: function(){
                alert("오류 발생");
            }
        });
    });
    
    
    // 기존 암호 확인 및 수정 처리
    $("#btn_submit").click(function(){
        var userid = $("#userid").val();
        var oldpass = $("#oldpass").val(); // 기존 암호 입력 필드 추가
        var pass = $("#pass").val();
        var name = $("#name").val();
        var birth = $("#birth").val();
        var phone = $("#phone").val();
        var zipcode = $("#zipcode").val();
        var address = $("#address").val();
        
        userid = $.trim(userid);
        oldpass = $.trim(oldpass); // 기존 암호 입력값 공백 제거
        pass = $.trim(pass);
        name = $.trim(name);
        
        if(userid == ""){
            alert("아이디를 입력하세요.");
            $("#userid").focus();
            return false;
        }
        if(oldpass == ""){
            alert("기존 암호를 입력하세요.");
            $("#oldpass").focus();
            return false;
        }
        if(pass == ""){
            alert("새로운 암호를 입력하세요.");
            $("#pass").focus();
            return false;
        }
        if(name == ""){
            alert("이름을 입력하세요.");
            $("#name").focus();
            return false;
        }
        
        $("#userid").val(userid);
        $("#oldpass").val(oldpass); // 기존 암호 입력값 설정
        $("#pass").val(pass);
        $("#name").val(name);
        $("#birth").val(birth);
        $("#phone").val(phone);
        $("#zipcode").val(zipcode);
        $("#address").val(address);
        
        // 기존 암호 확인 Ajax 처리
        $.ajax({
            type: "POST",
            data: {"userid": userid, "pass": oldpass},
            url: "checkPassword.do", // 기존 암호 확인하는 URL 설정
            dataType: "text",
            success: function(result){
                if(result == "ok"){
                    // 기존 암호가 맞으면 회원정보 수정 저장 처리
                    var formData = $("#frm").serialize();
        
                    $.ajax({
                        type: "POST",
                        data: formData,
                        url: "memberModifySave.do",
                        dataType: "text",
                        success: function(result){
                            if(result == "1"){
                                alert("회원정보 수정 완료");
                                location = "memberList.do"; // 수정 후 이동할 페이지 설정
                            } else {
                                alert("회원정보 수정 실패\n관리자에게 문의하세요.");
                            }
                        },
                        error: function(){
                            alert("오류 발생");
                        }
                    });
                    
                } else {
                    alert("기존 암호가 일치하지 않습니다.");
                }
            },
            error: function(){
                alert("오류 발생");
            }
        });
    });
});
</script>

<style>
body {
    font-size: 9pt;
    font-color: #333333;
    font-family: 맑은 고딕;
}

table {
    width: 600px;
    border-collapse: collapse;
}

th, td {
    border: 1px solid #ccc;
    padding: 3px;
    line-height: 2;
}

.div_button {
    width: 600px;
    text-align: center;
    margin-top: 5px;
}

caption {
    font-size: 15pt;
    font-weight: bold;
    margin-top: 10px;
    padding-bottom: 5px;
}

a {
    text-decoration: none;
}
</style>

</head>

<body>

<%@ include file="../include/topmenu.jsp" %>
<form id="frm" name="frm">
<table>
    <caption>회원정보 수정 폼</caption>
    <tr>
        <th><label for="userid">아이디</label></th>
        <td>
            <input type="text" name="userid" id="userid" value="${member.userid}" readonly>
            <!-- 수정 불가능한 아이디는 readonly 속성으로 설정 -->
            <button type="button" id="btn_idcheck">중복체크</button>
        </td>
    </tr>
    <tr>
        <th><label for="oldpass">기존 암호</label></th> <!-- 기존 암호 입력 필드 추가 -->
        <td><input type="password" name="oldpass" id="oldpass"></td>
    </tr>
    <tr>
        <th><label for="pass">새로운 암호</label></th>
        <td><input type="password" name="pass" id="pass"></td>
    </tr>
    <tr>
        <th><label for="name">이름</label></th>
        <td><input type="text" name="name" id="name"></td>
    </tr>
    <tr>
        <th><label for="gender">성별</label></th>
        <td>
            <input type="radio" name="gender" id="genderM" value="M">남
            <input type="radio" name="gender" id="genderF" value="F">여
        </td>
    </tr>
    <tr>
        <th><label for="birth">생년월일</label></th>
        <td><input type="text" name="birth" id="birth"></td>
    </tr>
    <tr>
        <th><label for="phone">연락처</label></th>
        <td><input type="text" name="phone" id="phone"></td>
    </tr>
    <tr>
        <th><label for="zipcode">우편번호</label></th>
        <td>
            <input type="text" name="zipcode" id="zipcode">
            <button type="button" id="btn_zipcode">우편번호 찾기</button>
        </td>
    </tr>
    <tr>
        <th><label for="address">주소</label></th>
        <td><input type="text" name="address" id="address"></td>
    </tr>
</table>

<div class="div_button">
    <button type="button" id="btn_submit">저장</button>
    <button type="reset">취소</button>
</div>
</form>

</body>
</html>