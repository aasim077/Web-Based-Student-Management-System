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
                        <div class="card-header">Add New Subject</div>
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

                                <div class="form-group row">
                                    <label for="present_address" class="col-md-4 col-form-label text-md-right">Subject 1</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="s1" id=s1>
                                    </div>
                                </div>

                             
                                <div class="form-group row">
                                    <label for="present_address" class="col-md-4 col-form-label text-md-right">Subject 2</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="s1" id=s2>
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="present_address" class="col-md-4 col-form-label text-md-right">Subject 3</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="s1" id=s3>
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="present_address" class="col-md-4 col-form-label text-md-right">Subject 4</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="s1" id=s4>
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="present_address" class="col-md-4 col-form-label text-md-right">Subject 5</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="s1" id=s5>
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
	
	var obj=new Object();

	
	  obj.semester=$("#sem option:selected").val();
	  obj.year=$("#year option:selected").val();
	  obj.cname=$("#cname option:selected").text();
	  obj.bname=$("#bname option:selected").text();
	  obj.s1=$("#s1").val();
	  obj.s2=$("#s2").val();
	  obj.s3=$("#s3").val();
	  obj.s4=$("#s4").val();
	  obj.s5=$("#s5").val();
	/*  obj.phone=$.each($("input[id=phone]:checked"));
	obj.em=$.each($("input[id=em]:checked"));
	obj.fax=$.each($("input[id=fax]:checked")); */
	 
	
		
    
   
     var str=JSON.stringify(obj);
     console.log(str);
  
	$.ajax({url:"AddNewSubjectAction.jsp",type:"POST",
		"data":str,
		  "processData":false,
		  "contentType":"application/json",
	success:function(res){

		//alert("s"+res.message);
			$("#result").html("Data Saved :"+res.message);
			
		},
		error:function(xhr,status,errorText){
			alert("er"+errorText);
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