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


String js="",line=null;
while((line  = br.readLine())!=null){
js+=line;	
}
          
br.close();
GsonBuilder builder = new GsonBuilder();
builder.setPrettyPrinting();
Gson gson = builder.create();
cityfnl cmp = gson.fromJson(js, cityfnl.class);


JsonObject jmain= new JsonObject();
JsonArray jarray = new JsonArray();

System.out.println("count id"+cmp.getCid());
Connection con = null;

String json_city = "";
try{
	Class.forName("com.mysql.jdbc.Driver");
  con =DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf8","root","root");
  String sql = "select id,cityname from city where cid="+cmp.getCid();
  Statement st =con.createStatement();
  ResultSet rs = st.executeQuery(sql);
  if(rs.next()){
	  
	  do{
		  JsonObject jobj = new JsonObject();
	       jobj.addProperty("cityid",rs.getInt(1));
	       jobj.addProperty("cityname",rs.getString(2));
	    
	       //Store into json array (jobj -- into this we add MANY PROPERTIES IN jobj)
	       jarray.add(jobj);
		  
	  }while(rs.next());
	  jmain.addProperty("status", "success");
	  jmain.add("data",jarray);	  
	  
	  
  }else{
	  jmain.addProperty("status","blank");
	  jmain.addProperty("message","No record Found");
  }
}
	catch(Exception ex){
		System.out.println(ex.getMessage()+"exception");
		jmain.addProperty("status","error");
		jmain.addProperty("message",ex.getMessage());
		
	}
finally{
	try{
		if(con != null){
			con.close();
			
		}
		
	}catch(Exception ex){
         System.out.println(ex.getMessage());
	}
	out.println(jmain.toString());
	System.out.println(jarray.toString()+"array tostring");
	System.out.println(json_city + "json_city");
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}








%>