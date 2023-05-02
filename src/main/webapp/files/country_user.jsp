<%@page import="com.google.gson.Gson"%>
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
JsonObject jobj1 = new JsonObject();
JsonArray jarray = new JsonArray();

GsonBuilder builder = new GsonBuilder();
builder.setPrettyPrinting();

Connection con =null;

String json_str ="";

try{
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf8", "root", "root");
	String sql = "select * from country";
	Statement st = con.createStatement();
	ResultSet rs =st.executeQuery(sql);
	if(rs.next()){
		do{
			JsonObject jobj = new JsonObject();
	        jobj.addProperty("id", rs.getInt(1));
	        jobj.addProperty("name", rs.getString(2));
			jarray.add(jobj);
		}while(rs.next());
	jobj1.addProperty("status","success");
	jobj1.add("data", jarray);
		
		
	}
	else{
		
		jobj1.addProperty("status", "blank");
		jobj1.addProperty("message", "no record found on the database");
		
		
	}}
	catch(Exception ex){
	   System.out.println(ex.getMessage());
	   jobj1.addProperty("status","error");
	   jobj1.addProperty("message", ex.getMessage());
		 
	}
finally{

	try{
	if(con!= null){
	 con.close();
	 
	}
}catch(Exception ex){
	System.out.println(ex.getMessage());
	
}	
out.println(jobj1.toString());
System.out.println(jarray.toString() + "toSring");
//Returns a string representation of the object.

//System.out.println(json_str + "json_str");

	
}








%>