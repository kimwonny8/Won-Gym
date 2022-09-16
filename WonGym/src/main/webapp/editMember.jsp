<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 제작중 -->
<div>
<a href="./main.jsp">뒤로</a>
<h1>회원정보 수정</h1>
</div>
<div>
아이디 : <input type="text" name="mb_id" size="20" >
<br> 비밀번호 : <input type="password" name="mb_pw" size="30">
<br> 비밀번호 확인 : <input type="password" name="mb_pw2" size="30">
<br> 이름 : <input type="text" name="mb_name" size="20">
<br> 생년월일 : <input type="date" name="mb_birthday" size="20">
<br> 성별 :  <label for="man">남</label>
      <input type="radio" name="mb_gender" value="남" id="man">
      <label for="woman">여</label>
      <input type="radio" name="mb_gender" value="여" id="woman"> 
<br> 이메일 : <input type="text" name="mb_email" size="30" placeholder="email@gmail.com">
<br> 휴대폰번호 : <input type="text" name="mb_phone" size="20" placeholder="010-1234-5678">

<div>
<input type="hidden" name="actionType" value="signUp">
<br><input type="submit" value="회원정보수정">
</div>
</div>
</body>
</html>