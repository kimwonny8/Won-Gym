<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- ������ -->
<div>
<a href="./main.jsp">�ڷ�</a>
<h1>ȸ������ ����</h1>
</div>
<div>
���̵� : <input type="text" name="mb_id" size="20" >
<br> ��й�ȣ : <input type="password" name="mb_pw" size="30">
<br> ��й�ȣ Ȯ�� : <input type="password" name="mb_pw2" size="30">
<br> �̸� : <input type="text" name="mb_name" size="20">
<br> ������� : <input type="date" name="mb_birthday" size="20">
<br> ���� :  <label for="man">��</label>
      <input type="radio" name="mb_gender" value="��" id="man">
      <label for="woman">��</label>
      <input type="radio" name="mb_gender" value="��" id="woman"> 
<br> �̸��� : <input type="text" name="mb_email" size="30" placeholder="email@gmail.com">
<br> �޴�����ȣ : <input type="text" name="mb_phone" size="20" placeholder="010-1234-5678">

<div>
<input type="hidden" name="actionType" value="signUp">
<br><input type="submit" value="ȸ����������">
</div>
</div>
</body>
</html>