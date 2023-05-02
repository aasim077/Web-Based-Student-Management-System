<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="header.html"%>
    <%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<title>School of Research & Technology</title>
<body>

<center><img src="peoples.jpeg" width="100" height="100">

<div class="w3-container">
  <%
Connection con = null;
                                    		String pid= request.getParameter("roll");
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
     <div class="w3-bar w3-black">
  <a href="ChangeStudent2.jsp?roll=<%=rs.getString(1) %>" class="w3-bar-item w3-button tablink " onclick="openCity(event,'London')">Modify Details</a>
  
       <a href="StudentResult.jsp?roll=<%=rs.getString(1) %>" class="w3-bar-item w3-button tablink " onclick="openCity(event,'Paris')">View Result  </a> 
       <a href="StudentLogin.html" class="w3-bar-item w3-button tablink w3-red ">Logout</a>
        <div class="w3-bar-item w3-button tablink "><%@ include file="studentcheck.jsp" %></div>
 </div>
  
  <div id="London" class="w3-container w3-border city">
  <br>
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!doctype html>
<html lang="en">
<head>
<style>body {
		line-height: 1;
		background: linear-gradient(to right, #63b0dd, #ffffff);
	}</style>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">



    <link rel="icon" href="Favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body >
<main class="my-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Select Year & Semester</div>
                        <div class="card-body">
                            <form name="my-form" onsubmit="return validform()" action="StudentResult.jsp?roll=<%=rs.getString(1) %>"  method="post">
                               <% 
    
		} while (rs.next());
	}
}
		catch ( Exception ex)
		{
			out.println(ex.getMessage());
		}
		
 
 
 %>
                                      <div class="form-group row">
                                    <label for="email_address" class="col-md-4 col-form-label text-md-right">Year </label>
                                    <div class="col-md-6">
                                        <select  class="form-control" name="year" id="year">
                                        <option value=1>1</option>
                                        <option value=2>2</option>
                                        <option value=3>3</option>
                                        <option value=4>4</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="full_name" class="col-md-4 col-form-label text-md-right">Semester</label>
                                    <div class="col-md-6">
                                        <select   class="form-control" name="sem" id="sem">
                                        <option value=1>1</option>
                                        <option value=2>2</option>
                                        <option value=3>3</option>
                                        <option value=4>4</option>
                                        <option value=5>5</option>
                                        <option value=6>6</option>
                                        <option value=7>7</option>
                                        <option value=8>8</option>
                                        </select>
                                    </div>
                                </div>

                                                              
                             
                                    <div class="col-md-6 offset-md-4">
                                        <button type="submit" id="save" class="btn btn-primary">
                                        Show
                                        </button>
                                        <div id=result></div>
                                    </div>
                                </form>
                                </div>
                            
                        </div>
                    </div>
            </div>
        </div>
    </main>
    </div>
    


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>

  </div>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js">  
 </script> 
 <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
 <script type="text/javascript">
    $(function(){
    	

    	
    /* 	$("#save").on('click',function(){
    		alert("save clicked");
    		var obj=new Object();
    		  obj.year=$("#year option:selected").val();
    		  obj.semester=$("#sem option:selected").val();
   		 
   		     var str=JSON.stringify(obj);
             console.log(str);
          
    		$.ajax({url:"veiwres.jsp",type:"POST",
    			"data":str,
    			  "processData":false,
    			  "contentType":"application/json",
			success:function(res){
		
				alert("s"+res.message);
    				$("#result").innerhtml("Data Saved"+res.status);
    				
    			},
    			error:function(xhr,status,errorText){
    				alert("er"+errorText);
    				$("#result").html(errorText);
    				
    			}
    		
    		});
    	}); */
    	
    });
    </script>
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

