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
JsonObject jmain = new JsonObject();
JsonArray json = new JsonArray();
BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));

String jsonn="",line=null;
while((line  = br.readLine())!=null){
jsonn+=line;	
}

br.close();

GsonBuilder builder = new GsonBuilder(); 
builder.setPrettyPrinting(); 
Gson gson = builder.create(); 
cb cmp=new cb();
//json="{name:'Rabecca fatima',address:'88/141-1 chamanganj kanpur',dob:'2001-01-02T00:00:00.000Z',time:'morning',mobile:'1234567890',email:'arib@gmail.com',city:2,country:1,dob:'2022-03-26T00:00:00.000Z',way:['yes','yes','yes'],cars:[2]}";
cmp =gson.fromJson(jsonn,cb.class);
          
Connection con = null;

String json_str = "";
try {
	Class.forName("com.mysql.jdbc.Driver");

	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf8", "root", "root");
	String sql = "select * from branch where cid='"+cmp.getCourseid()+"'";
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(sql);
	if (rs.next()) {
		do {
	JsonObject jobj = new JsonObject();
	
	jobj.addProperty("id", rs.getString(1));
	jobj.addProperty("name", rs.getString(2));
	

  json.add(jobj);

		} while (rs.next());

		jmain.addProperty("status","success");
		jmain.add("data", json);
	} else {
		jmain.addProperty("status","blank");
		jmain.addProperty("message","No record found");

	}
} catch (Exception ex) {
	System.out.println(ex.getMessage() + "1234567890");
	jmain.addProperty("status","error");
	jmain.addProperty("message",ex.getMessage()+"1234567890");

} finally{

	try {
		if (con != null) {
	con.close();
		}
	} catch (Exception ex) {
		System.out.println(ex.getMessage() + "exception");
	}

	
	out.println(jmain.toString());
	System.out.println(json.toString() + "toSring");
	

}
%>