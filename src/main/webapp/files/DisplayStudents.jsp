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
  
    <div class="w3-bar w3-black">
    
   <a href="AddNewStudent.jsp"class="w3-bar-item w3-button tablink " onclick="openCity(event,'London')">Add New Student</a>
      <a href="CourseBranch.jsp"class="w3-bar-item w3-button tablink " onclick="openCity(event,'London')">Add New Course</a>
      <a href="branch.jsp"class="w3-bar-item w3-button tablink " onclick="openCity(event,'London')">Add New Branch</a>
    <a href="AddNewSubject.jsp"class="w3-bar-item w3-button tablink " onclick="openCity(event,'London')">Add New Subject</a>
  
       <a href="AddNewResult.jsp" class="w3-bar-item w3-button tablink " onclick="openCity(event,'Paris')">Insert New Result  </a>
    
      <a href="DisplayStudents.jsp" class="w3-bar-item w3-button tablink " onclick="openCity(event,'Tokyo')">Registered Students  </a> 
       <a href="DisplayResullt.jsp" class="w3-bar-item w3-button tablink " onclick="openCity(event,'Tokyo1')">All Student Result  </a> 
        <a href="adminLogin.html" class="w3-bar-item w3-button tablink w3-red ">Logout</a>
        <div class="w3-bar-item w3-button tablink "> <%@ include file="usercheck.jsp" %></div>
 </div>
  
  <div id="London" class="w3-container w3-border city">
  <br>
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


<head>
<style>body {
		line-height: 1;
		background: linear-gradient(to right, #63b0dd, #ffffff);
	}
	tr,th{
	    color: #000;
	}
	</style>
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

 <div class="form-group row">
                                    <label for="full_name" class="col-md-4 col-form-label text-md-right" >Course </label>
                                    <div class="col-md-6">
                                        <select  class="form-control" name="cname" id="cname" required>
                                        
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="email_address" class="col-md-4 col-form-label text-md-right">Branch Name</label>
                                    <div class="col-md-6">
                                     <select  class="form-control" name="bname" id="bname" required>
                                        
                                        </select>                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">Roll Number</label>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" name="roll" id=roll required>
                                    </div>
                                </div>
                                 <div class="col-md-6 offset-md-4">
                                        <button type="button" id=save class="btn btn-primary">
                                        Show
                                        </button>
                                        <div id=result></div>
                                    </div>
                             

<section>
  <!--for demo wrap-->
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
         <b><th>Roll No.</th>
          <th>Name</th>
          <th>DOB</th></b>
          <th>Branch Name</th>
          <th>Course Name</th>
          <th>Gender</th>
          <th>Father Name</th>
          <th>Contact</th></b>
          <th>Email</th></b>
          <th>Address</th></b>
          <b><th>Modify</th></b>
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody id=tbl>
     
<%
Connection con = null;


try{		  Class.forName("com.mysql.jdbc.Driver");
String sql="";
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf8","root","root");
  sql = "select p.roll,name,fname,gender,dob,email,mobile,address,cid,bid from person p inner join person_cbranch c on c.roll=p.roll ";
 Statement st = con.createStatement();	
	ResultSet rs = st.executeQuery(sql);
	if (rs.next()) {
		do {
 %>
 <tr>
         <b><th><%=rs.getString(1) %></th>
          <th><%=rs.getString(2) %></th>
          <th><%=rs.getDate(5) %></th></b>
          <th><%=rs.getString(10) %></th>
          <th><%=rs.getString(9) %></th>
          <th><%=rs.getString(4) %></th>
          <th><%=rs.getString(3) %></th>
          <th><%=rs.getString(7) %></th></b>
          <th><%=rs.getString(6) %></th></b>
          <th><%=rs.getString(8) %></th></b>
          <b><th><a href='changeStudent.jsp?roll=<%=rs.getString(1) %>'>Edit</a></th></b>
        </tr>
 
 <% 
 
		} while (rs.next());
	}
}
		catch ( Exception ex)
		{
			out.println(ex.getMessage());
		}
		
 
 
 %>
      </tbody>
      
    </table>
  </div>
</section>
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



    	
$("#save").on('click',function(){
	//alert("save clicked");
	var obj=new Object();

	 obj.roll=$("#roll").val();
	 
	  obj.courseid=$("#cname option:selected").val();
	  obj.branchid=$("#bname option:selected").val();

     var str=JSON.stringify(obj);
     console.log(str);
     
  
	$.ajax(
			{url:"DisplayAction.jsp",type:"POST",
		"data":str,
		  "processData":false,
		  "contentType":"application/json",
	success:function(res){

//		alert("s"+res.message);
		
		
		
		
		 if(res.status=="success"){
             var list="";
   		  for(var i=0;i<res.data.length;i++){
   			list="<tr><b><th>"+res.data[i].roll+"</th> <th>"+res.data[i].name+"</th><th>"+res.data[i].dob+"</th></b><th>"+res.data[i].bid+"</th><th>"+res.data[i].cid+"</th><th>"+res.data[i].gender+"</th><th>"+res.data[i].fname+"</th><th>"+res.data[i].mobile+"</th></b><th>"+res.data[i].email+"</th></b><th>"+res.data[i].address+"</th></b><b><th><a href='ModifyStudentpage.jsp?roll="+res.data[i].roll+"'>Edit</a></th></b></tr>";
   		  }
   		
   		  $("#tbl").html(list);
   		  
   		  }
			//$("#result").html("Data Saved"+res);
			
		},
		error:function(xhr,status,errorText){
			//alert("er"+errorText.message);
			$("#result").html(errorText.message);
			
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