<%@page import="com.google.gson.Gson"%>
<%@page import="student_manage.*"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.sql.*"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.GsonBuilder"%>

<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@ page contentType="application/json" %>


<%
 InputStream is =request.getInputStream();
   

BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
 
  

String json="",line=null;
while((line  = br.readLine())!=null){
json+=line;	
}
          
br.close();
          //is.close();
GsonBuilder builder = new GsonBuilder(); 
builder.setPrettyPrinting(); 

Gson gson = builder.create(); 
course_branch cmp=new course_branch();
                     //json="{name:'aasim ahsan',address:'mandi chauraha ashoka garden house no 336', type:'Propritary', hassite: 'yes', website: 'flip'}";
 cmp =gson.fromJson(json,course_branch.class);
                    

Connection con = null;

JsonObject jobj= new JsonObject();
try{		  Class.forName("com.mysql.cj.jdbc.Driver");

	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","208001");
	//String sql = "INSERT INTO user values('"+cmp.getName()+"','"+cmp.getMobile()+"','"+cmp.getEmail()+"','"+cmp.getGender()+"','"+cmp.getUsertype()+"','"+cmp.getCity()+"')";
	Statement st =con.createStatement();
	String sql="select cname from course where cname='"+cmp.getCname()+"'";
	ResultSet rs =st.executeQuery(sql);
	if(rs.next()){
		//out.println("user with mobile no.:"+rs.getString(1)+"already exists.");
				jobj.addProperty("status","failed");

		jobj.addProperty("message","  "+rs.getString(1)+" already exist.");
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
	//Returns a string representation of the object.

	
	/*if(json!=null) 
	{//out.println("json ");
		


		}
	else{
		out.println("json empty");
	}*/
	
	
	
	
	
	
	
	
	
	
}






%>