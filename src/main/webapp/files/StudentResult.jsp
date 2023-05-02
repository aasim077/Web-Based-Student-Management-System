<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@include file="header.html"%>
<!DOCTYPE html>
<html>
<center><img src="peoples.jpeg" width="100" height="100">
</center>
        <div class="w3-container"> <div class="w3-bar w3-black">
         <%
Connection con = null;
                                    		String pid= request.getParameter("roll");
                                    		String year= request.getParameter("year"); int syear=Integer.parseInt(year);
                                    		String sem= request.getParameter("sem"); int ssem=Integer.parseInt(sem);
                                    		//String pid="PU-001";
                                    		//System.out.println("roll="+pid);

try{		  Class.forName("com.mysql.jdbc.Driver");
String sql="";
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf8","root","root");
  sql = "Select p.roll,p.name,p.fname,p.gender,p.dob,p.email,p.mobile,p.address,p.city,p.country,c.cid,c.bid,(select cname from course where cid=c.cid),(select bname from branch where bid=c.bid),(select name from country where id=p.country ),(select cityname from city where id=p.city ) from person p inner join person_cbranch c on p.roll=c.roll where p.roll='"+pid+"'";
 Statement st = con.createStatement();	
	ResultSet rs = st.executeQuery(sql);
	if (rs.next()) {
		do {
 %>
      <a href="ChangeStudent2.jsp?roll=<%=rs.getString(1) %>" class="w3-bar-item w3-button tablink " onclick="openCity(event,'London')">Modify Details</a>
  
       <a href="sem_year.jsp?roll=<%=rs.getString(1) %>" class="w3-bar-item w3-button tablink " onclick="openCity(event,'Paris')">View Result  </a> 
       <a href="StudentLogin.html" class="w3-bar-item w3-button tablink w3-red ">Logout</a>
       <div class="w3-bar-item w3-button tablink "><%@ include file="studentcheck.jsp" %></div>
       
         <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">



    <link rel="icon" href="Favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
       
 
     </div>
  <hr class="new1">
<style>
table{
  width:100%;
  table-layout: fixed;
}
th{
  padding: 20px 15px;
  text-align: left;
  font-weight: 500;
  font-size: 12px;
  color: #fff;
  text-transform: uppercase;
 border: 2px solid rgba(255,255,255,0.3);
}


/* demo styles */

@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);
body{
/*   background: -webkit-linear-gradient(left, #25c481, #25b7c4);
 */  background: linear-gradient(to right, #63b0dd, #ffffff);
   font-family: 'Roboto', sans-serif;
}

</style>
  <!--for demo wrap-->
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>institution Name: Peoples University</th>
          <th>Course Name: <%=rs.getString(13) %> </th>
          <th>Branch Name: <%=rs.getString(14) %></th>
          <th>Year: <%=year %></th>
          <th>Semester: <%=sem %></th>
          <th><center>RollNo: <%=rs.getString(1) %></center></th>
        </tr>
      </thead>
      <thead>
        <tr>
          <th>Name: <%=rs.getString(2) %></th>
          <th>Father Name: <%=rs.getString(3) %></th>
          <th>Gender: <%=rs.getString(4) %></th>
          <th><a titlt="print screen" alt="print screen" onclick="window.print();" target="_blank" style="cursor:pointer;"><center><img src="print.png"></center></a></th>
        </tr>
      </thead>
    </table>
  </div>
<style>
html {
  font-family:arial;
  font-size: 25px;
}
#res td {
  border: 2px solid #726E6D;
  padding: 15px;
  color:black;
  background:#e3fff8;
  text-align:center;
}
td {
  border: 2px solid #726E6D;
  padding: 15px;
  color:black;
  text-align:center;
}

thead,thead td{
  font-weight:bold;
  text-align:center;
  background: #1e4773;
  color:white;
}

table {
  border-collapse: collapse;
}

.footer {
  text-align:right;
  font-weight:bold;
}

tbody >tr:nth-child(odd) {
  background: #e0fffe;
}

</style>
<head>
  <hr class="new1">
</head>
<body>
  <table>
    <thead>
      <tr>
        <td colspan="2">Course</td>
        <td rowspan="2">Type</td>
        <td rowspan="2">Full Marks</td>
        <td rowspan="2">Passing Marks</td>
        <td rowspan="2">Obtained Marks</td>
        
      </tr>
      <tr>
        <!-- <td>Code </td> -->
        <td colspan="2"> Name </td>
      </tr>
    </thead>
    <tbody>
      <tr>
      <%String sql1 = "Select p.s1,p.s2,p.s3,p.s4,p.s5,m.m1,m.m2,m.m3,m.m4,m.m5,r.percent,r.grade,r.status from subjectS p inner join marks m on p.id=m.id inner join result r  on m.mid=r.mid  where r.roll='"+pid+"' and p.sem="+ssem+" and p.years="+syear+"";
      Statement s = con.createStatement();	
  	ResultSet r = st.executeQuery(sql1); 
  	if (r.next()) {
		do {
  	%>
        <!-- <td>NAS101</td> -->
        <td colspan="2"><%=r.getString(1) %> </td>
        <td>Theory</td>
        <td>100</td>
        <td> 30 </td>
        <td><%=r.getFloat(6) %></td>
      </tr>
      <tr>
        <!-- <td>NAS102</td> -->
        <td colspan="2"><%=r.getString(2) %></td>
        <td>Theory</td>
        <td>100</td>
        <td>30</td>
        <td><%=r.getFloat(7) %> </td>
      </tr>
      <tr>
       <!--  <td>NAS103</td> -->
        <td colspan="2"><%=r.getString(3) %> </td>
        <td>Theory</td>
        <td>100</td>
        <td> 30 </td>
        <td> <%=r.getFloat(8) %></td>
      </tr>
      <tr>
       <!--  <td>NEE101</td> -->
        <td colspan="2"><%=r.getString(4) %> </td>
        <td>Theory</td>
        <td>100</td>
        <td> 30 </td>
        <td> <%=r.getFloat(9) %></td>
      </tr>
      <tr>
      <!--   <td>NEC101</td> -->
        <td colspan="2"><%=r.getString(5) %></td>
        <td>Theory</td>
        <td>100</td>
        <td> 30 </td>
        <td> <%=r.getFloat(10) %> </td>
      </tr>
      
    </tbody>
    <tfoot>
      <tr>
        <td colspan="3" class="footer">Total Marks</td>
        <td>500</td>
        <td>180</td>
        <td><%
        float sum=0;
        for(int i=6;i<=10;i++){
         sum+= r.getFloat(i); 	
        
        }
        
        %><%= sum%> </td>
        
      </tr>
      <tr id=res>
        <td colspan="1" class="footer">Percentage</td>
        <td colspan="1"><%=r.getString(11) %>%</td>
        <td colspan="1" class="footer">Grade</td>
        <td colspan="1"><%=r.getString(12) %></td>
        <td colspan="1" class="footer">Status</td>
        <td colspan="1"><%=r.getString(13) %></td>
      </tr>
  </table>
  <% 
		} while (r.next());
  	}
		
		} while (rs.next());
	}
}
		catch ( Exception ex)
		{
			System.out.println(ex.getMessage());
		}
		
 
 
 %>
    <hr class="new1">
  <center><h6>Note: Institution doesn't own for the errors or omissions, if any, in this statement.
Designed & Developed by Rabecca Team</h6></center>
  <hr class="new1">
<center><h6>All Right Reserved @ Rabecca :: 2015-2020</h6></center> 
  <hr class="new1">
</body></div></html>