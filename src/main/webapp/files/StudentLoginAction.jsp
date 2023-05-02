
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.security.MessageDigest"%>

    
 
    
<% /* String email=request.getParameter("email"); */
   String password=request.getParameter("password");
//String encryptedpassword = null;  
//try   
//{  
    /* MessageDigest instance for MD5. */  
  //  MessageDigest m = MessageDigest.getInstance("MD5");  
      
    /* Add plain-text password bytes to digest using MD5 update() method. */  
    //m.update(password.getBytes());  
      
    /* Convert the hash value into bytes */   
    //byte[] bytes = m.digest();  
      
    /* The bytes array has bytes in decimal form. Converting it into hexadecimal format. */  
    /* StringBuilder s = new StringBuilder();  
    for(int i=0; i< bytes.length ;i++)  
    {  
        s.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));  
    }  
     */  
    /* Complete hashed password in hexadecimal format */  
    /* encryptedpassword = s.toString();  
}   
catch (NoSuchAlgorithmException e)   
{  
    e.printStackTrace();  
}   */

   String username=request.getParameter("username");
   System.out.println("123"+password+username);
   Connection con = null;
   try{
	   Class.forName("com.mysql.jdbc.Driver");

		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf8","root","root");
		String sql = "select username,pass,roll from student_login where  username ='"+username+"'";
		Statement st =con.createStatement();
		ResultSet rs =st.executeQuery(sql);
		if(rs.next() && rs.getString(2).equals(password)){
			Cookie c= new Cookie("Roll.No",rs.getString(3));
			response.addCookie(c);
			response.sendRedirect("studenthomepage.jsp?roll="+rs.getString(3));
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
		<br><a href=StudentLogin.html>login again</a>
		<% 
	  out.println(e.getMessage()); 
   }
  %>