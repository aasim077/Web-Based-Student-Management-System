<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@ page import="Project.*"  %>

<%String course = request.getParameter("course");
String branch = request.getParameter("branch");
String rollNo= request.getParameter("rollNo");
String name = request.getParameter("name");
String fatherName = request.getParameter("fatherName");
String gender = request.getParameter("gender");

String dob = request.getParameter("dob");

String contact= request.getParameter("contact");

try{
	   Class.forName("com.mysql.jdbc.Driver");
	      Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/project1","root","root");
       System.out.println("connected");
	      // Connection con = ConnectionProvider.getCon();
	Statement st =con.createStatement();
	st.executeUpdate("update student set coursecode=(select coursecode from course where coursename='"+course+"'),"+"rollNo='"+rollNo+"',name='"+name+"',fatherName='"+fatherName+"',gender='"+gender+"',"+"branchcode=(select branchcode from branch where branchname='"+branch+"'),dob='"+dob+"',contact='"+contact+"' where rollNo='"+rollNo+"'"  );
	response.sendRedirect("adminHome.jsp");
	
}
catch(Exception e){
	   System.out.print(e);

}
%>