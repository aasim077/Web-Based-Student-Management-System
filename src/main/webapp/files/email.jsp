<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="admin.*"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.sql.*"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@ page contentType="application/json"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
InputStream is =request.getInputStream();


BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
String json="",line=null;
while((line  = br.readLine())!=null){
json+=line;	
}
br.close();
GsonBuilder builder = new GsonBuilder(); 
builder.setPrettyPrinting(); 

Gson gson = builder.create(); 
emailfnl cmp = new emailfnl();
 
cmp =gson.fromJson(json,emailfnl.class);

Connection con = null;
JsonObject jobj= new JsonObject();

try{		  Class.forName("com.mysql.cj.jdbc.Driver");

con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf8","root","root");
Statement st =con.createStatement();
String sql="select email from person where email='"+cmp.getEmail()+"'";
ResultSet rs =st.executeQuery(sql);
if(rs.next()){
			jobj.addProperty("status","failed");
            jobj.addProperty("message","User with email  "+rs.getString(1)+" already exist.");
}else{
	jobj.addProperty("status","success");
	//jobj.addProperty("message","Details of "+cmp.getName()+" are not saved.");
}
}
catch(Exception ex){
//out.println("error");
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


}






%>