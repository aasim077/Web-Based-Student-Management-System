<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="header.html"%>
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
                        <div class="card-header">Branch</div>
                        <div class="card-body">
                            <form name="my-form" onsubmit="return validform()"  method="post">
                               
                                      <div class="form-group row">
                                    <label for="email_address" class="col-md-4 col-form-label text-md-right">Course </label>
                                    <div class="col-md-6">
                                        <select  class="form-control" name="cname" id="cname">
                                        
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="full_name" class="col-md-4 col-form-label text-md-right">Branch ID</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="bid" id="bid">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="email_address" class="col-md-4 col-form-label text-md-right">Branch Name</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="bname" id="bname">
                                    </div>
                                </div>

                                
                             
                                    <div class="col-md-6 offset-md-4">
                                        <button type="button" id="save" class="btn btn-primary">
                                        Save
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
    	
    	
    	$("#save").on('click',function(){
    		//alert("save clicked");
    		var obj=new Object();
    		  obj.courseid=$("#cname option:selected").val();
   		  obj.branchid=$("#bid").val();
   		 obj.bname=$("#bname").val();
   		 
   		     var str=JSON.stringify(obj);
             console.log(str);
          
    		$.ajax({url:"onlybranch.jsp",type:"POST",
    			"data":str,
    			  "processData":false,
    			  "contentType":"application/json",
			success:function(res){
		
				//alert("s"+res.message);
    				$("#result").html("Data Saved :"+res.message);
    				
    			},
    			error:function(xhr,status,errorText){
    				//alert("er"+errorText);
    				$("#result").html(errorText.message);
    				
    			}
    		
    		});
    	});
    	
    });
    </script>
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

