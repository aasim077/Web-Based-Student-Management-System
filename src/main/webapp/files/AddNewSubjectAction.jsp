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
cb cmp=new cb();
//
//json="{'roll':'PU-002','name':'Rohan Kumar','fname':'Rajat Kumar','address':'99/121-jahangirabad,bhopla','gender':'Male','mobile':'1234567890','email':'rajat@123.com','cityid':'6','countryid':'1','courseid':'BTI','branchid':'CSE','dob':'2001-06-05T00:00:00.000Z'}";
cmp =gson.fromJson(json,cb.class);
       
JsonObject jobj= new JsonObject();

Connection con = null;


try{		  Class.forName("com.mysql.jdbc.Driver");
     
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf8","root","root");
String sql = "INSERT INTO subjects(course,branch,sem,years,s1,s2,s3,s4,s5) values(?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps = con.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
	
	ps.setString(1,cmp.getCname());
	ps.setString(2,cmp.getBname());
	ps.setInt(3,cmp.getSemester()); 
	ps.setInt(4,cmp.getYear());
	ps.setString(5,cmp.getS1());
	ps.setString(6,cmp.getS2());
	ps.setString(7,cmp.getS3());
	ps.setString(8,cmp.getS4());
	ps.setString(9,cmp.getS5());
	int nnn,n=ps.executeUpdate();
	/* ResultSet rs=ps.getGeneratedKeys();
	int pk=1,nnn=0;
	if(rs!=null && rs.next()) */
		//pk=rs.getInt(1);
	
		//ps.clearParameters();
	
	if(n>0 ){
		 /* sql="insert into person_ccity values(?,?,?)";
			ps=con.prepareStatement(sql);
			
				ps.setString(1,cmp.getRoll());
				ps.setInt(2,cmp.getCityid());
				ps.setInt(3,cmp.getCountryid());
				int nn=ps.executeUpdate();
				if(nn>0){ */
					
								 jobj.addProperty("status","success");
									jobj.addProperty("message","Subjects are saved.");
							 //}
				}
		
	else{
		jobj.addProperty("status","failed");
		jobj.addProperty("message","Subjects are not saved.");
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