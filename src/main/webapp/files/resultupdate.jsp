<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
    <%@include file="header.html"%>
<!DOCTYPE html>
<html>
<head><style type="text/css">
td {
    padding: 15px;
    text-align: left;
    vertical-align: middle;
    font-weight: 300;
    font-size: 12px;
    color: #150501;
    border-bottom: solid 1px rgb(33 1 1 / 93%);
}


</style></head>
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
                        <div class="card-header">Update Result</div>
                        <div class="card-body">
                            <form name="my-form" onsubmit="return validform()"  method="post">
                                <div class="form-group row">
                                <%
Connection con = null;
                                    		String pid= request.getParameter("roll");
                                    		//String pid="PU-001";
                                    		System.out.println("roll="+pid);

try{		  Class.forName("com.mysql.jdbc.Driver");
String sql="";
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf8","root","root");
  sql = "Select s.course,s.branch,s.sem,s.years,s.s1,s.s2,s.s3,s.s4,s.s5,m.m1,m.m2,m.m3,m.m4,m.m5,m.id,m.mid from subjects s inner join marks m on s.id=m.id where roll='"+pid+"'";
 Statement st = con.createStatement();	
	ResultSet rs = st.executeQuery(sql);
	if (rs.next()) {
		do {
 %>
                                    <label for="full_name" class="col-md-4 col-form-label text-md-right">Roll Number</label>
                                    <div class="col-md-6">
                                        <input type="text"class="form-control" name="roll" id=roll value=<%=pid %>>
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label for="full_name" class="col-md-4 col-form-label text-md-right">Course</label>
                                    <div class="col-md-6">
                                        <select class="form-control" name="cname" id=cname>
                                        <option ><%=rs.getString(1)%></option>
                                        </select>
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label for="full_name" class="col-md-4 col-form-label text-md-right">Branch</label>
                                    <div class="col-md-6">
                                        <select class="form-control" name="bname" id=bname>
                                        <option value=<%=rs.getString(2)%>><%=rs.getString(2)%></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="full_name" class="col-md-4 col-form-label text-md-right">Semester</label>
                                    <div class="col-md-6">
                                        <select class="form-control" name="semester" id=semester>
                                        <option value="1" <%=(rs.getInt(3)==1 ? "selected": "") %>>1</option>
                                        <option value=2 <%=(rs.getInt(3)==2 ? "selected": "") %>>2</option>
                                        <option value=3 <%=(rs.getInt(3)==3 ? "selected": "") %>>3</option>
                                        <option value=4 <%=(rs.getInt(3)==4 ? "selected": "") %>>4</option>
                                        <option value=5 <%=(rs.getInt(3)==5 ? "selected": "") %>>5</option>
                                        <option value=6 <%=(rs.getInt(3)==6 ? "selected": "") %>>6</option>
                                        <option value=7 <%=(rs.getInt(3)==7 ? "selected": "") %>>7</option>
                                        <option value=8 <%=(rs.getInt(3)==8 ? "selected": "") %>>8</option>
                                        </select>
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label for="full_name" class="col-md-4 col-form-label text-md-right">Year</label>
                                    <div class="col-md-6">
                                        <select type="text"class="form-control" name="year" id=year>
                                         <option value="1" <%=(rs.getInt(3)==1 ? "selected": "") %>> 1</option>
                                        <option value=2 <%=(rs.getInt(3)==2 ? "selected": "") %>>2</option>
                                        <option value=3 <%=(rs.getInt(3)==3 ? "selected": "") %>>3</option>
                                        <option value=4 <%=(rs.getInt(3)==4 ? "selected": "") %>>4</option>
                                        </select>
                                    </div>
                                </div>
                                
                                  
                                
                <button id=submar type=button class="btn btn-primary">Show Subjects</button>
                  <div  id=new>
                  <div class='form-group row'><label for='user_name' class='col-md-4 col-form-label text-md-right'><b>Subject</b></label><label for='user_name' class='col-md-4 col-form-label text-md-right'><b>Marks</b></label></div>
               <div class='form-group row'><label for='email_address' class='col-md-4 col-form-label text-md-right' id=s1><%=rs.getString(5)%></label><div class='col-md-6'><input type='text'  class='form-control' name='marks1' id=m1 value=<%=rs.getFloat(10)%>></div></div>
                 <div class='form-group row'><label for='user_name' class='col-md-4 col-form-label text-md-right' id=s2><%=rs.getString(6)%></label><div class='col-md-6'><input type='text'  class='form-control' name='marks1' id=m2 value=<%=rs.getFloat(11)%>></div></div>
                 <div class='form-group row'><label for='user_name' class='col-md-4 col-form-label text-md-right' id=s3><%=rs.getString(7)%></label><div class='col-md-6'><input type='text'  class='form-control' name='marks1' id=m3 value=<%=rs.getFloat(12)%>></div></div>
                 <div class='form-group row'><label for='user_name' class='col-md-4 col-form-label text-md-right' id=s4><%=rs.getString(8)%></label><div class='col-md-6'><input type='text'  class='form-control' name='marks1' id=m4 value=<%=rs.getFloat(13)%>></div></div>
                 <div class='form-group row'><label for='user_name' class='col-md-4 col-form-label text-md-right' id=s5><%=rs.getString(9)%></label><div class='col-md-6'><input type='text'  class='form-control' name='marks1'id=m5 value=<%=rs.getFloat(14)%>><input type=hidden id=hid value=<%=rs.getInt(15)%>><input type=hidden id=mid value=<%=rs.getInt(16)%>></div></div>
                                       
                                         
                                    </div>
                <button type="button" id=save class="btn btn-primary">
                                       Update
                                        </button>
                                        <div id=result></div>
                <div class="col-md-6 offset-md-4">
                                        
                                    </div>
<!--                 <div class="form-group row">
                <table id=tbl >
                <tr ><td><label for="email_address" class="col-md-4 col-form-label text-md-right">Subject   </label></td><td>    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="marks1">
                                    </div></td></tr>
                </table></div> -->
<!--                                 <div class="form-group row">
                                 <label for="user_name" class="col-md-4 col-form-label text-md-right"> <input type="text"  class="form-control" name="subject1"> </label> 
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="marks1">
                                    </div>
                                </div>

                                <div class="form-group row">
                                   <label for="phone_number" class="col-md-4 col-form-label text-md-right"> <input type="text"  class="form-control" name="subject2"></label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="marks2">
                                    </div>
                                </div>

                                <div class="form-group row">
                                   <label for="present_address" class="col-md-4 col-form-label text-md-right"> <input type="text"  class="form-control" name="subject3"></label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="marks3">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="permanent_address" class="col-md-4 col-form-label text-md-right"> <input type="text"  class="form-control" name="subject4"></label> 
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="marks4">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="permanent_address" class="col-md-4 col-form-label text-md-right"> <input type="text"  class="form-control" name="subject5"></label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="marks5">
                                    </div>
                                </div>                                 
                                  <div class="form-group row">
                                    <label for="permanent_address" class="col-md-4 col-form-label text-md-right">Engg. Physics Lab</label>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" name="s7">
                                    </div>
                                </div> -->
                                 
                                    
                                </div>
                            </form>
                        </div>
                    </div>
            </div>
        </div>
        <br>
    </div>

</main>
<% 
    
		} while (rs.next());
	}
}
		catch ( Exception ex)
		{
			out.println(ex.getMessage());
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



$("#roll").blur(function(){
	var e=new Object();
	e.roll=$("#roll").val();
	 var stre=JSON.stringify(e);
     console.log(stre);
     console.log("sending");
	$.ajax({
		url:"roll.jsp",
		type:"Post",
		 "data":stre,
    	  "processData":false,
    	  "contentType":"application/json",
    	    "success":function(res){
    	    	 
    		 //alert(res.message);
    		  if(res.status=="success"){
    			  /* $("#roll").css("background-color", "#ff5722");
    			  $("#roll").html(res.message);
    			 // alert(res.message);
    			 // $("#em").html(res.message); */
    			  console.log(res.status);
    		  }
    		  else if(res.status=="fail"){
    			  alert("This roll no doesnt exist");
     			 // $("#em").html(res.message); 
    		  }
    			 
    		
    	  },
    		  "error":function(txt){
    			  console.log("Error "+txt);
    		  }
		
	});
	
});
	
$("#submar").on('click',function(){
	var obj=new Object();
	  obj.cname=$("#cname option:selected").text();
      obj.bname=$("#bname option:selected").text();
      obj.year=$("#year option:selected").val();
      obj.semester=$("#semester option:selected").val();
    console.log("sending");
    var str=JSON.stringify(obj);
    console.log(str);
 //alert("happeing")
 
 
 datagot(str);
});
	 function datagot(str)
	 {
		 $.ajax({
		url:"subject.jsp",
		type:"Post",
		 data:str,
   	  "processData":false,
   	  "contentType":"application/json",
   	  "success":function(res){

   		  //alert("WARNING: "+res.status);
   		  
   		  if(res.status=="success"){
             var list="",tbl="";
			  tbl+="<tr ><td>"+res.data[0].s1+"  </td>  <td>  </td></tr> <tr ><td>"+res.data[0].s2+"  </td>  <td>  </td></tr> <tr ><td>"+res.data[0].s3+" </td>  <td>  </td></tr>  <tr ><td>"+res.data[0].s4+"  </td>  <td>  </td></tr>  <tr ><td>"+res.data[0].s5+"  </td>  <td>  </td></tr>   ";
                 //$("#tbl").html(tbl);
                                 list+="<div class='form-group row'><label for='user_name' class='col-md-4 col-form-label text-md-right'><b>Subject</b></label><label for='user_name' class='col-md-4 col-form-label text-md-right'><b>Marks</b></label></div>";
                 list+="<div class='form-group row'><label for='email_address' class='col-md-4 col-form-label text-md-right' id=s1>"+ res.data[0].s1 +"</label><div class='col-md-6'><input type='text'  class='form-control' name='marks1' id=m1></div></div>";
                 list+="<div class='form-group row'><label for='user_name' class='col-md-4 col-form-label text-md-right' id=s2>"+ res.data[0].s2 +"</label><div class='col-md-6'><input type='text'  class='form-control' name='marks1' id=m2></div></div>";
                 list+="<div class='form-group row'><label for='user_name' class='col-md-4 col-form-label text-md-right' id=s3>"+ res.data[0].s3 +"</label><div class='col-md-6'><input type='text'  class='form-control' name='marks1' id=m3></div></div>";
                 list+="<div class='form-group row'><label for='user_name' class='col-md-4 col-form-label text-md-right' id=s4>"+ res.data[0].s4 +"</label><div class='col-md-6'><input type='text'  class='form-control' name='marks1' id=m4></div></div>";
                 list+="<div class='form-group row'><label for='user_name' class='col-md-4 col-form-label text-md-right' id=s5>"+ res.data[0].s5 +"</label><div class='col-md-6'><input type='text'  class='form-control' name='marks1'id=m5><input type=hidden id=hid value="+res.data[0].id+"></div></div>";

                 
                 
                 
                 /*    			list+="<input type='text'  class='form-control' name='subject1' value='s'+i> </label><div class='col-md-6'><input type='text'  class='form-control' name='marks1'></div></div>";
 */   			 // event.preventDefault();
 console.log(res.data);
	  console.log(tbl);
                 $("#new").html(list);  /* setTimeout(function(){ $("#new").show(); }, 30000); */
   		
   		 
   		  
   		  }
   		 
   		  }
   			 
   		
   	  ,
   		  "error":function(txt){
   			 
   			  console.log("Error "+txt);
   		  }
	
	});


}  	
    	/*                   
    	                   
 */
$("#save").on('click',function(){
	var obj=new Object();

	 obj.roll=$("#roll").val();
	 obj.id=$("#hid").val();
	 obj.m1=$("#m1").val();
	 obj.m2=$("#m2").val();
	 obj.m3=$("#m3").val();
	 obj.m4=$("#m4").val();
	 obj.m5=$("#m5").val();
	  obj.mid=	$("#mid").val();
    
     var str=JSON.stringify(obj);
     console.log(str);
  
	$.ajax({url:"Resultupaction.jsp",type:"POST",
		"data":str,
		  "processData":false,
		  "contentType":"application/json",
	success:function(res){
		
		//alert("s"+res.message+res.status);
			$("#result").html("Data Saved"+res.message);
			
		},
		error:function(xhr,status,errorText){
			//alert("er"+errorText);
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