<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.swing.JOptionPane" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보</title>
</head>
<body>
<h1>데이터베이스 처리 부분</h1>
<%
	String driverName = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost/gym_db";
	String user = "root";
	String passwd = "root";
	
	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url, user, passwd);
	Statement stmt = con.createStatement();
	request.setCharacterEncoding("utf-8");
	
	PreparedStatement pstmt=null;
	ResultSet rs=null;
%>
<%
	String actionType = request.getParameter("actionType");
	
	String mb_id;
	String mb_pw;
	String mb_pw2;
	String mb_name;
	String mb_birthday;
	String mb_gender;
	String mb_email;
	String mb_phone;
	
	String sql;
	int result;
	String msg="";
	
	switch(actionType) {
		
		// 회원가입
		case "signUp":
			mb_id = request.getParameter("mb_id");
			mb_pw = request.getParameter("mb_pw");
			mb_pw2= request.getParameter("mb_pw2");
			mb_name= request.getParameter("mb_name");
			mb_birthday= request.getParameter("mb_birthday");
			mb_gender = request.getParameter("mb_gender");
			mb_email = request.getParameter("mb_email");
			mb_phone = request.getParameter("mb_phone");
			
			if(mb_pw.equals(mb_pw2)) {
				sql = "insert into member (mb_id, mb_pw, mb_name, mb_birthday, mb_gender, mb_email, mb_phone) values ";
				sql += "('" + mb_id + "','"+ mb_pw + "','"+ mb_name + "','" 
				+ mb_birthday+"','"+mb_gender+"','"+mb_email+"','"+mb_phone+"')";
				
				System.out.print(sql);
				result = stmt.executeUpdate(sql);
				
				if(result==1){
%>
						<script>
							alert("회원가입 완료! 로그인 후 이용해주세요");
							document.location.href='./index.jsp'
						</script>
<%  
				}
				else {
					System.out.println("레코드 추가 실패");
					msg+="레코드 추가 실패";
				}
			}
			
			else {
 %>
					<script>
						alert("비밀번호가 맞지 않습니다. 다시 입력해주세요");
						history.back();
					</script>
<%  
			}	
			
			break;
		
		// 로그인
		case "signIn":
			mb_id = request.getParameter("mb_id");
			mb_pw = request.getParameter("mb_pw");
			
			pstmt = con.prepareStatement("select mb_pw, mb_name, mb_id from member where mb_id = ?");
			pstmt.setString(1, mb_id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				if(mb_pw.equals(rs.getString("mb_pw"))){
					session.setAttribute("mb_name", rs.getString("mb_name"));
					session.setAttribute("mb_id", rs.getString("mb_id"));
					System.out.println("로그인 성공");
					response.sendRedirect("./main.jsp");
				}
				else {
					System.out.println("로그인 실패");
	%>
					<script>
						alert("비밀번호가 틀렸습니다. 다시 입력해주세요");
						document.location.href='./index.jsp'
					</script>
	<%  
				}
			}
			else {
				System.out.println("로그인 실패");
%>
				<script>
					alert("존재하지 않는 아이디입니다. 다시 입력해주세요");
					document.location.href='./index.jsp'
				</script>
<%  
			}
			
			break;
			
		// 로그아웃
		case "signOut":
			session.invalidate();
			response.sendRedirect("./index.jsp");
			break;
		
		// 회원탈퇴
		case "memberDelete":
			mb_id = request.getParameter("mb_id");
			mb_pw = request.getParameter("mb_pw");
			mb_pw2= request.getParameter("mb_pw2");
			
			
			
	}
%>
<h2><%=msg %></h2>
<br><a href="./index.jsp">홈으로 돌아가기</a>
</body>
</html>