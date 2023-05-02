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

GsonBuilder builder = new GsonBuilder();
builder.setPrettyPrinting();

Connection con = null;

String json_str = "";
try {
	Class.forName("com.mysql.jdbc.Driver");

	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf8", "root", "root");
	String sql = "select * from course";
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