<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE HTML>
<html>
	<head>
		<title>School of Research & Technology</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		
	<style>b {
    font-size: large;
}
strong, b {
    color: #fff;
    font-weight: bold;
}</style>
	</head>
	
	<body>
<%
Cookie c[]= request.getCookies();
String user="";
boolean state=false;
if(c!=null && c.length>0){
	for(int i=0;i<c.length;i++){
		String n=c[i].getName();
		if(n.equals("user")){
			user=c[i].getValue();
			state=true;
			break;
		}
	}
}

if(!state){
	%>
	<jsp:forward page="adminLogin.html"/>
	
	<%
}else{
	%>
	
					<header><b>welcome :<%= user %></b></header>

					
	
	<%
}
%>
</body>
</html>