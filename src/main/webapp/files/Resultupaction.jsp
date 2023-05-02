<%@page import="com.google.gson.Gson"%>
<%@page import="admin.*"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.text.Format"%>
<%@ page contentType="application/json" %>


<%
 
  // Date s= sdf.parse(d);
BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
 
String json="",line=null;
while((line  = br.readLine())!=null){
json+=line;	
}

br.close();

GsonBuilder builder = new GsonBuilder(); 
builder.setPrettyPrinting(); 
Gson gson = builder.create(); 
marks cmp=new marks();
//
//json="{'roll':'PU-002','name':'Rohan Kumar','fname':'Rajat Kumar','address':'99/121-jahangirabad,bhopla','gender':'Male','mobile':'1234567890','email':'rajat@123.com','cityid':'6','countryid':'1','courseid':'BTI','branchid':'CSE','dob':'2001-06-05T00:00:00.000Z'}";
cmp =gson.fromJson(json,marks.class);
     
JsonObject jobj= new JsonObject();

Connection con = null;


try{		  Class.forName("com.mysql.jdbc.Driver");
     
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf8","root","root");
String sql = "update marks set id=?,m1=?,m2=?,m3=?,m4=?,m5=? where roll=?";
	PreparedStatement ps = con.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
	
	
	ps.setInt(1,cmp.getId());
	ps.setFloat(2,cmp.getM1()); 
	ps.setFloat(3,cmp.getM2());
	ps.setFloat(4,cmp.getM3());
	ps.setFloat(5,cmp.getM4());
	ps.setFloat(6,cmp.getM5());
	ps.setString(7,cmp.getRoll());
	int nnn,n=ps.executeUpdate();
	ResultSet rs=ps.getGeneratedKeys();
	int pk=1;
	if(rs!=null && rs.next())
		pk=rs.getInt(1);
	
		ps.clearParameters();
	
	if(n>0 ){
		float percent=(cmp.getM1()+cmp.getM2()+cmp.getM3()+cmp.getM4()+cmp.getM5())/5;
		   String grade="A",status="pass";
		   //p=String.valueOf(percent);

		   if(percent <35 )
			   {grade="F";status="fail";}
		   else if(percent >35 && percent<=40)
		   { grade="D";status="pass";}

		   else if(percent >40 && percent<=55)
		   {  grade="C"; status="pass";}

		   else if(percent >55 && percent<=65)
		   {   grade="B";status="pass";}

		   else if(percent >65 && percent<=75)
		   {   grade="B+";status="pass";}

		   else if(percent >75 && percent<=85)
		   {   grade="A";status="pass";}

		   else
		   {   grade="A+";status="pass";}
		   System.out.println(percent+"percent");
					 sql="update result set status=?,percent=?,grade=? where  mid=? and roll=?";
						ps=con.prepareStatement(sql);
						
							
							ps.setString(1,status);
							ps.setFloat(2,percent);
							ps.setString(3,grade);
							ps.setInt(4,cmp.getMid());
							ps.setString(5,cmp.getRoll());

							 nnn=ps.executeUpdate();
							 System.out.println(nnn+" nnn");
							 if(nnn>0){
								 System.out.println(percent+"done");
								 jobj.addProperty("status","success");
									jobj.addProperty("message","Details of "+cmp.getRoll()+" are updated.");
							 //}
				}
		
	}else{
		jobj.addProperty("status","failed");
		jobj.addProperty("message","Details of "+cmp.getRoll()+" are not updated.");
	}
	}
catch(Exception ex){
	
  jobj.addProperty("status","error");
  jobj.addProperty("message",ex.getMessage());
  

}
finally {
	
	
	try{if(con!=null){
	 con.close();	
	}
	}
	catch ( Exception ex)
	{
		out.println(ex.getMessage());
	}
	
	

	out.println(jobj.toString());

	
	if(json!=null) 
	{//out.println("json ");
		


		}
	else{
		out.println("json empty");
	}
	
	
	
	
	
	
	
	
	
	
}






%>