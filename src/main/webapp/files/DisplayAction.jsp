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
 
String jsonn="",line=null;
while((line  = br.readLine())!=null){
jsonn+=line;	
}

br.close();
JsonObject jmain = new JsonObject();
JsonArray json = new JsonArray();
GsonBuilder builder = new GsonBuilder(); 
builder.setPrettyPrinting(); 
Gson gson = builder.create(); 
person cmp=new person();
cb c=new cb();
//
//json="{'roll':'PU-002','name':'Rohan Kumar','fname':'Rajat Kumar','address':'99/121-jahangirabad,bhopla','gender':'Male','mobile':'1234567890','email':'rajat@123.com','cityid':'6','countryid':'1','courseid':'BTI','branchid':'CSE','dob':'2001-06-05T00:00:00.000Z'}";
cmp =gson.fromJson(jsonn,person.class);
c =gson.fromJson(jsonn,cb.class);


Connection con = null;


try{		  Class.forName("com.mysql.jdbc.Driver");
String sql="";
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf8","root","root");

	
	 if(cmp.getRoll() !=""){
		 System.out.println(5);

		sql = "select p.roll,name,fname,gender,dob,email,mobile,address,cid,bid from person p inner join person_cbranch c on c.roll=p.roll where c.roll='"+cmp.getRoll()+"' ";
		if( c.getCourseid()!="" ){System.out.println(4);

		sql = "select p.roll,name,fname,gender,dob,email,mobile,address,cid,bid from person p inner join person_cbranch c on c.roll=p.roll where c.roll='"+cmp.getRoll()+"' and c.cid='"+c.getCourseid()+"'  ";
		if( c.getBranchid()!=""){System.out.println(3);

		sql = "select p.roll,name,fname,gender,dob,email,mobile,address,cid,bid from person p inner join person_cbranch c on c.roll=p.roll where c.roll='"+cmp.getRoll()+"' and c.cid='"+c.getCourseid()+"' and  c.bid='"+c.getBranchid()+"'  ";
	}
	  
	}
	 }

	 else  if(cmp.getRoll() ==""){
		 System.out.println(5);

		//sql = "select p.roll,name,fname,gender,dob,email,mobile,address,cid,bid from person p inner join person_cbranch c on c.roll=p.roll where c.roll='"+cmp.getRoll()+"' ";
		if( c.getCourseid()!="" ){System.out.println(4);

		sql = "select p.roll,name,fname,gender,dob,email,mobile,address,cid,bid from person p inner join person_cbranch c on c.roll=p.roll where  c.cid='"+c.getCourseid()+"'  ";
		if( c.getBranchid()!=""){System.out.println(3);

		sql = "select p.roll,name,fname,gender,dob,email,mobile,address,cid,bid from person p inner join person_cbranch c on c.roll=p.roll where c.cid='"+c.getCourseid()+"' and  c.bid='"+c.getBranchid()+"'  ";
	}
	  
	}
		 else{
			   
			 sql = "select * from person p inner join person_cbranch c on p.roll=c.roll ";}

		
	 }

   
    
   
 
	   


System.out.println(sql);

Statement st = con.createStatement();	
		ResultSet rs = st.executeQuery(sql);
		if (rs.next()) {
			do {
		JsonObject jobj = new JsonObject();
		
		jobj.addProperty("roll", rs.getString(1));
		jobj.addProperty("name", rs.getString(2));
		jobj.addProperty("fname", rs.getString(3));
		jobj.addProperty("gender", rs.getString(4));
		jobj.addProperty("dob", rs.getString(5).toString());
		jobj.addProperty("email", rs.getString(6));
		jobj.addProperty("mobile", rs.getString(7));
		jobj.addProperty("address", rs.getString(8));

		jobj.addProperty("cid", rs.getString(9));
		jobj.addProperty("bid", rs.getString(10));


		json.add(jobj);

			} while (rs.next());

			jmain.addProperty("status","success");
			jmain.add("data", json);
		} else {
			jmain.addProperty("status","blank");
			jmain.addProperty("message","No record found");

		}
	} 
catch(Exception ex){
	
  jmain.addProperty("status","error");
  jmain.addProperty("message",ex.getMessage());
  

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
	
	

	out.println(jmain.toString());

	
	if(json!=null) 
	{//out.println("json ");
		


		}
	else{
		out.println("json empty");
	}
	
	
	
	
	
	
	
	
	
	
}






%>