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
person cmp=new person();
//
//json="{'roll':'PU-002','name':'Rohan Kumar','fname':'Rajat Kumar','address':'99/121-jahangirabad,bhopla','gender':'Male','mobile':'1234567890','email':'rajat@123.com','cityid':'6','countryid':'1','courseid':'BTI','branchid':'CSE','dob':'2001-06-05T00:00:00.000Z'}";
cmp =gson.fromJson(json,person.class);
                    //converting json string into json object
  SimpleDateFormat sdf=new SimpleDateFormat("MM-dd-yyyy HH:mm:sss");
//	  java.util.Date dt=sdf.parse(cmp.getDob().toString());
 
//Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
sdf.setTimeZone(TimeZone.getTimeZone("IST"));
String s = sdf.format(cmp.getDob());
	  //java.util.Date dt=sdf.parse(cmp.getDob().toString());
	//  System.out.println("s= "+s); 
	  java.util.Date dt=sdf.parse(s);
	   java.sql.Date ss=new java.sql.Date(dt.getTime());
	  // System.out.println("ss= "+ss); 
	   
//System.out.println(cmp.getDob()); 
JsonObject jobj= new JsonObject();

Connection con = null;


try{		  Class.forName("com.mysql.jdbc.Driver");
     
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf8","root","root");
String sql = "update  person set name=?,fname=?,gender=?,dob=?,email=?,mobile=?,address=?,city=?,country=? where roll=?";
	PreparedStatement ps = con.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
	
	//ps.setString(1,cmp.getRoll());
	ps.setString(1,cmp.getName());
	ps.setString(2,cmp.getFname()); 
	ps.setString(3,cmp.getGender());
	ps.setDate(4,ss);
	ps.setString(5,cmp.getEmail());
	ps.setString(6,cmp.getMobile());
	ps.setString(7,cmp.getAddress());
	ps.setInt(8,cmp.getCityid() );
	ps.setInt(9,cmp.getCountryid() );
	ps.setString(10,cmp.getRoll());
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
					 sql="update person_cbranch set cid=?,bid=? where roll=?";
						ps=con.prepareStatement(sql);
						
							//ps.setString(1,cmp.getRoll());
							ps.setString(1,cmp.getCourseid());
							ps.setString(2,cmp.getBranchid());
							ps.setString(3,cmp.getRoll());

							 nnn=ps.executeUpdate();
							 if(nnn>0){
								 jobj.addProperty("status","success");
									jobj.addProperty("message","Details of "+cmp.getName()+" are updated.");
							 //}
				}
		
	}else{
		jobj.addProperty("status","failed");
		jobj.addProperty("message","Details of "+cmp.getName()+" are not updated.");
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