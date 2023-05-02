<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@include file="header.html"%>
    <%@page import="java.sql.*" %>

<% 
//String pid= request.getParameter("roll");
String pid="PU-001";
System.out.println("roll="+pid);
//int id=Integer.parseInt(pid);
Connection con =null;
try{
	Class.forName("com.mysql.jdbc.Driver");

	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf8", "root", "root");
	String sql="Select * from person where pid='"+pid+"'";

//	String sql="select *from person";
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(sql);
	if(rs.next()){
		%>
<!DOCTYPE html>
<html>
<title>School of Research & Technology</title>
<body>

<center><img src="peoples.jpeg" width="100" height="100">

<div class="w3-container">
  
     <div class="w3-bar w3-black">
 <a href="AddNewStudent.jsp"class="w3-bar-item w3-button tablink " onclick="openCity(event,'London')">Add New Student</a>
      <a href="CourseBranch.jsp"class="w3-bar-item w3-button tablink " onclick="openCity(event,'London')">Add New Course</a>
      <a href="branch.jsp"class="w3-bar-item w3-button tablink " onclick="openCity(event,'London')">Add New Branch</a>
  
       <a href="AddNewResult.jsp" class="w3-bar-item w3-button tablink " onclick="openCity(event,'Paris')">Insert New Result  </a>
    
      <a href="DisplayStudents.jsp" class="w3-bar-item w3-button tablink " onclick="openCity(event,'Tokyo')">Registered Students  </a> 
       <a href="DisplayResullt.jsp" class="w3-bar-item w3-button tablink " onclick="openCity(event,'Tokyo1')">All Student Result  </a> 
        <a href="adminLogin.html" class="w3-bar-item w3-button tablink w3-red ">Logout</a>
 </div>
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
                        <div class="card-header">Add New Students</div>
                        <div class="card-body">
                            <form name="my-form" onsubmit="return validform()" method="post">
                                <div class="form-group row">
                                    <label for="full_name" class="col-md-4 col-form-label text-md-right">Course </label>
                                    <div class="col-md-6">
                                        <select  class="form-control" name="cname" id="cname">
                                        
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="email_address" class="col-md-4 col-form-label text-md-right">Branch Name</label>
                                    <div class="col-md-6">
                                     <select  class="form-control" name="bname" id="bname">
                                        
                                        </select>                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">Roll Number</label>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" name="roll" id=roll value=<%= rs.getString(1) %>>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="phone_number" class="col-md-4 col-form-label text-md-right">Name</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="name" id=name value=<%= rs.getString(1) %>>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="present_address" class="col-md-4 col-form-label text-md-right">Father's Name</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="fname" id=fname value=<%= rs.getString(1) %>>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="permanent_address" class="col-md-4 col-form-label text-md-right">Gender</label>
                                    <div class="col-md-6">
                                        <input type=radio name=gender value=Male value=Male<%=("yes".equals(rs.getString(10)) ? "checked": "") %>>Male
                                      <input type=radio name=gender value=Female value=Female<%=("yes".equals(rs.getString(10)) ? "checked": "") %>>Female
                                      <input type=radio name=gender value=Trans value=Trans<%=("yes".equals(rs.getString(10)) ? "checked": "") %>>Trans
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label for="present_address" class="col-md-4 col-form-label text-md-right">D.O.B:</label>
                                    <div class="col-md-6">
                                        <input type="date" name=date id=date class="form-control"  required>
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label for="present_address" class="col-md-4 col-form-label text-md-right">Email:</label>
                                    <div class="col-md-6">
                                        <input type= text id=email name=email  class="form-control" name="" required value=<%= rs.getString(1) %>>
                                    </div>
                                </div>
                               
                                 <div class="form-group row">
                                    <label for="present_address" class="col-md-4 col-form-label text-md-right">Mobile:</label>
                                    <div class="col-md-6">
                                        <input type= text id=mobile name=mobile  class="form-control" name="" required value=<%= rs.getString(1) %>>
                                    </div>
                                </div>
                               
                                <div class="form-group row">
                                    <label for="present_address" class="col-md-4 col-form-label text-md-right">Address:</label>
                                    <div class="col-md-6">
                                       <textarea id=address name=address  class="form-control" name="" required value=<%= rs.getString(1) %>></textarea>
                                    </div>
                                </div>
 
                                <div class="form-group row">
                                    <label for="present_address" class="col-md-4 col-form-label text-md-right">Country: </label>
                                    <div class="col-md-6">
                                     <select id=country name=country class="form-control" name="" ></select>
                                    </div>
                                </div>
                                    <div class="form-group row">
                                    <label for="present_address" class="col-md-4 col-form-label text-md-right">City: </label>
                                    <div class="col-md-6">
                                     <select name=city id=city class="form-control" name="" ></select>
                                    </div>
                                </div>
 
         
	
 
                                

                                    <div class="col-md-6 offset-md-4">
                                        <button type="button" id=save class="btn btn-primary">
                                        Save
                                        </button>
                                        <div id=result></div>
                                    </div>
                                    
                                </div>
                                
                            </form>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</main>
<%	
		
	//if completed	
	}
	
}
catch(Exception ex){
	
}
%>
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
    	
$("#cname").focus(function(){
    		
             console.log("sending");
    		$.ajax({
    			url:"course_user.jsp",
    			type:"Post",
    			 
            	  "processData":false,
            	  "contentType":"application/json",
            	  "success":function(res){

            		  //alert("WARNING: "+res.status);
            		  
            		  if(res.status=="success"){
                      var list="";
            		  for(var i=0;i<res.data.length;i++){
            			  list+="<option value="+res.data[i].id+">"+res.data[i].name+"</option>";
            		  }
            		
            		  $("#cname").html(list);
            		  
            		  }
            		  console.log(res.data);
            		  console.log(list);
            		  }
            			 
            		
            	  ,
            		  "error":function(txt){
            			 
            			  console.log("Error "+txt);
            		  }
    		
    		});
    	});
$("#bname").focus(function(){
	var obj=new Object();
	  obj.courseid=$("#cname option:selected").val();

    console.log("sending");
    var str=JSON.stringify(obj);
    console.log(str);
 
	$.ajax({
		url:"branch_user.jsp",
		type:"Post",
		 data:str,
   	  "processData":false,
   	  "contentType":"application/json",
   	  "success":function(res){

   		  //alert("WARNING: "+res.status);
   		  
   		  if(res.status=="success"){
             var list="";
   		  for(var i=0;i<res.data.length;i++){
   			  list+="<option value="+res.data[i].id+">"+res.data[i].name+"</option>";
   		  }
   		
   		  $("#bname").html(list);
   		  
   		  }
   		  console.log(res.data);
   		  console.log(list);
   		  }
   			 
   		
   	  ,
   		  "error":function(txt){
   			 
   			  console.log("Error "+txt);
   		  }
	
	});
});

$( "#date" ).datepicker({
	timepicker:false, 
	dateFormat: "dd-MM-yyyy hh:mm:sss",
     maxDate: 0,
     minDate: "01-01-95",
    
});
$("#mobile").blur(function(){
	var m=new Object();
	m.mobile=$("#mobile").val();
	 var strm=JSON.stringify(m);
     console.log(strm);
     console.log("sending");
	$.ajax({
		url:"mobilefnl.jsp",
		type:"Post",
		 "data":strm,
    	  "processData":false,
    	  "contentType":"application/json",
    	  "success":function(res){

    		  //alert("WARNING: "+res.status);

    		  if(res.status=="failed"){
    			  $("#mobile").css("background-color", "#ff5722");

    			  
    			  $("#mobile").html(res.message);
    			  console.log("WARNING"+res.message);
    	    	//$("#mobile").css("background-color", "#ff5722");

    		  }
    			 
    		
    	  },
    		  "error":function(txt){
    			 
    			  console.log("Error "+txt);
    		  }
		
	});
	
});

	
//});

$("#email").blur(function(){
	var e=new Object();
	e.email=$("#email").val();
	 var stre=JSON.stringify(e);
     console.log(stre);
     console.log("sending");
	$.ajax({
		url:"email.jsp",
		type:"Post",
		 "data":stre,
    	  "processData":false,
    	  "contentType":"application/json",
    	    "success":function(res){
    	    	 
    		 
    		  if(res.status=="failed"){
    			  $("#email").css("background-color", "#ff5722");
    			  $("#email").html(res.message);
    			 // alert(res.message);
    			 // $("#em").html(res.message);
    			  console.log("WARNING"+res.message);
    		  }
    			 
    		
    	  },
    		  "error":function(txt){
    			  console.log("Error "+txt);
    		  }
		
	});
	
});
	
$("#country").focus(function(){
	
	var obj=new Object();
//	obj.c=$("#country option:selected").val();
	 var strm=JSON.stringify(obj);
     console.log(strm);
     console.log("sending");
	$.ajax({
		url:"country_user.jsp",
		type:"Post",
		 "data":strm,
    	  "processData":false,
    	  "contentType":"application/json",
    	  "success":function(res){

    		  //alert("WARNING: "+res.status);
    		  
    		  if(res.status=="success"){
              var list="";
    		  for(var i=0;i<res.data.length;i++){
    			  list+="<option value="+res.data[i].id+">"+res.data[i].name+"</option>";
    		  }
    		
    		  $("#country").html(list);
    		  
    		  }
    		  console.log(res.data);
    		  console.log(list);
    		  }
    			 
    		
    	  ,
    		  "error":function(txt){
    			 
    			  console.log("Error "+txt);
    		  }
	
	});
});


$("#city").focus(function(){
	
var o=new Object();	
o.cid=$("#country option:selected").val();
	
var strm=JSON.stringify(o);
     console.log("sending"+strm);
	$.ajax({
		url:"city_user.jsp",
		type:"Post",
		 "processData":false,
   	  "contentType":"application/json",
		 "data":strm,
    	  
    	  "success":function(res){

    		  //alert("WARNING: "+res.status);
    		  
    		  if(res.status=="success"){
              var list="";
    		  for(var i=0;i<res.data.length;i++){
    			  list+="<option value="+res.data[i].cityid+">"+res.data[i].cityname+"</option>";
    		  }
    		
    		  $("#city").html(list);
    		  
    		  }
    		  console.log(res.data);
    		  console.log(list);
    		  }
    			 
    		
    	  ,
    		  "error":function(txt){
    			 
    			  console.log("Error "+txt);
    		  }
	
	});
});

    	
$("#save").on('click',function(){
	alert("save clicked");
	var obj=new Object();

	 obj.roll=$("#roll").val();
	 obj.name=$("#name").val();
	 obj.fname=$("#fname").val();
	  obj.address=$("#address").val();
	  obj.gender=$("input[name=gender]:checked").val();
	 obj.mobile=$("#mobile").val();
	 obj.email=$("#email").val();
	  obj.cityid=$("#city option:selected").val();
	  obj.countryid=$("#country option:selected").val();
	  obj.courseid=$("#cname option:selected").val();
	  obj.branchid=$("#bname option:selected").val();
	/*  obj.phone=$.each($("input[id=phone]:checked"));
	obj.em=$.each($("input[id=em]:checked"));
	obj.fax=$.each($("input[id=fax]:checked")); */
	obj.dob=new Date($('#date').val()); 
	
		
   
     var str=JSON.stringify(obj);
     console.log(str);
  
	$.ajax({url:"update.jsp",type:"POST",
		"data":str,
		  "processData":false,
		  "contentType":"application/json",
	success:function(res){

		alert("s"+res.message+res.status);
			$("#result").html("Data Saved"+res);
			
		},
		error:function(xhr,status,errorText){
			alert("er"+errorText);
			$("#result").html(errorText);
			
		}
	
	});
});
    	
    });
    </script>
    <hr class="new1">
  <center><h5>Note: Any errors occur then contact Rabecca Fatima.
Designed & Developed by Rabecca Fatima</h5></center>
  <hr class="new1">
<center><h5>All Right Reserved @Rabecca Fatima :: 2022-2025</h5></center> 
  <hr class="new1">
<br>
</body>
</html>