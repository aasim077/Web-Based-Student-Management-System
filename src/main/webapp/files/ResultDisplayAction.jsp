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

	/* 
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
			    */
			 sql = " select p.roll,s.s1,m.m1,s.s2,m.m2,s.s3,m.m3,s.s4,m.m4,s.s5,m.m5,p.percent,p.grade,p.status from  result p  inner join marks m  on m.roll=p.roll  inner join subjects s on m.id=s.id where p.roll='"+cmp.getRoll()+"' and s.branch=(select bname from branch where bid='"+cmp.getBranchid()+"') ";
			    //}
		/* } */
System.out.println(sql);
Statement st = con.createStatement();	
		ResultSet rs = st.executeQuery(sql);
		if (rs.next()) {
			do {
		JsonObject jobj = new JsonObject();
		jobj.addProperty("roll", rs.getString(1));
		jobj.addProperty("s1", rs.getString(2));
		jobj.addProperty("m1", rs.getFloat(3));
		jobj.addProperty("s2", rs.getString(4));
		jobj.addProperty("m2", rs.getFloat(5));
		jobj.addProperty("s3", rs.getString(6));
		jobj.addProperty("m3", rs.getFloat(7));
		jobj.addProperty("s4", rs.getString(8));
		jobj.addProperty("m4", rs.getFloat(9));
		jobj.addProperty("s5", rs.getString(10));
		jobj.addProperty("m5", rs.getFloat(11));
		jobj.addProperty("percent", rs.getFloat(12));
		jobj.addProperty("grade", rs.getString(13));
		jobj.addProperty("status", rs.getString(14));
		
		

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