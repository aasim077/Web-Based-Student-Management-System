<%@ page import="student_manage.connectionProvider" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<%
String course =request.getParameter("course");
String branch =request.getParameter("branch");
String rollNo =request.getParameter("rollNo");
String name =request.getParameter("name");
String fatherName =request.getParameter("fatherName");
String gender =request.getParameter("gender");
 try
 {// 

	 Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project1", "root", "208001");
	 //Connection con=connectionProvider.getCon();
	 Statement st=con.createStatement();
	 st.executeUpdate("insert into student(course,branch,rollNo,name,fatherName,gender) values('"+course+"','"+branch+"','"+rollNo+"','"+name+"','"+fatherName+"','"+gender+"')");
	 response.sendRedirect("adminHome.jsp");
 }
 catch(Exception e)
 { e.printStackTrace();
	 System.out.println("error"+e);
	
 }
%>