<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
    <%@page import="javax.servlet.http.Cookie"%>
    
<% /* String email=request.getParameter("email"); */
   String password=request.getParameter("password");
   String username=request.getParameter("username");
   System.out.println("123"+password+username);
   Connection con = null;
   try{
	   Class.forName("com.mysql.jdbc.Driver");

		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf8","root","root");
		String sql = "select user,password from login where  user ='"+username+"'";
		
		Statement st =con.createStatement();
		
		ResultSet rs =st.executeQuery(sql);
	
		if(rs.next()&& rs.getString(2).equals(password)){
			Cookie c= new Cookie("user",rs.getString(1));
			response.addCookie(c);
			response.sendRedirect("AddNewStudent.jsp");
			%>
			hello
			
			 <%
		}
		else{
			System.out.println(rs.getString(2));
			%>
			hello
			
			 <%
		}
			
		
   }
   catch(Exception e){
	   %>
		Invalid id or password for <%=username %>
		<br><a href=adminLogin.html>login again</a>
		<% 
	  out.println(e.getMessage()); 
   }
  %>