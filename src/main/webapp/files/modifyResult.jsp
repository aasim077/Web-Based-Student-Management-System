<%@ page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<% 
   String rollNo =request.getParameter("rollNo");
   String sem=request.getParameter("combo");
   
   String s1=request.getParameter("subject1");
   String s2=request.getParameter("subject2");
   String s3=request.getParameter("subject3");
   String s4=request.getParameter("subject4");
   String s5=request.getParameter("subject5");
   String m1=request.getParameter("marks1");int ma1=Integer.parseInt(m1);
   String m2=request.getParameter("marks2");int ma2=Integer.parseInt(m2);
   String m3=request.getParameter("marks3");int ma3=Integer.parseInt(m3);
   String m4=request.getParameter("marks4");int ma4=Integer.parseInt(m4);
   String m5=request.getParameter("marks5");int ma5=Integer.parseInt(m5);
   float percent=(ma1+ma2+ma3+ma4+ma5)/5;
   String grade="A",status="pass",p=String.valueOf(percent);

   if(percent <35 )
	   {grade="F";status="fail";}
   else if(percent >35 && percent<=40)
	   grade="D";

   else if(percent >40 && percent<=55)
	   grade="C";

   else if(percent >55 && percent<=65)
	   grade="B";

   else if(percent >65 && percent<=75)
	   grade="B+";

   else if(percent >75 && percent<=85)
	   grade="A";

   else
	   grade="A+";
   try{
	   
	   Connection con = ConnectionProvider.getCon();
	   Statement st =con.createStatement();
	   st.executeUpdate("update result set rollNo='"+rollNo+"',sem='"+sem+"',"+"s1='"+s1+"',m1='"+m1+"',s2='"+s2+"',m2='"+m2+"',s3='"+s3+"',m3='"+m3+"',s4='"+s4+"',m4='"+m4+"',s5='"+s5+"',m5='"+m5+"',percent='"+p+"',grade='"+grade+"',status='"+status+"' where rollNo='"+rollNo+"' AND sem='"+sem+"'");
	   response.sendRedirect("adminHome.jsp");
   }
   catch(Exception e){
  out.println(e);
	   
	   
   }





%>