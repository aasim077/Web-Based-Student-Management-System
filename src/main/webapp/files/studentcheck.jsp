<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE HTML>
<html>
	<head>
		<title>School of Research & Technology</title>
		
		<meta name="viewport"  />
		
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
String roll="";
boolean state=false;
if(c!=null && c.length>0){
	for(int i=0;i<c.length;i++){
		String n=c[i].getName();
		if(n.equals("Roll.No")){
			roll=c[i].getValue();
			state=true;
			break;
		}
	}
}

if(!state){
	%>
	<jsp:forward page="StudentLogin.html"/>
	
	<%
}else{
	%>
	
					<header><b>welcome :<%= roll %></b></header>

					
	
	<%
}
%>
</body>
</html>