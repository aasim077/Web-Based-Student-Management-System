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
<div class="w3-container">
  
     <div class="w3-bar w3-black">
     <a href="ChangeStudent2.jsp?roll=<%=rs.getString(1) %>" class="w3-bar-item w3-button tablink " onclick="openCity(event,'London')">Modify Details</a>
  
       <a href="sem_year.jsp?roll=<%=rs.getString(1) %>" class="w3-bar-item w3-button tablink " onclick="openCity(event,'Paris')">View Result  </a> 
       <a href="StudentLogin.html" class="w3-bar-item w3-button tablink w3-red ">Logout</a>
       <div class="w3-bar-item w3-button tablink "><%@ include file="studentcheck.jsp" %></div>
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
<main class="my-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Modify Details</div>
                        <div class="card-body">
                            <form name="my-form" onsubmit="return validform()" method="post">
                                 <div class="form-group row">
                                    <label for="full_name" class="col-md-4 col-form-label text-md-right">Course </label>
                                    <div class="col-md-6">
                                     <label name="cname" id="cname" value=<%=rs.getString(13)%>><%=rs.getString(11)%></label>
     
                                      
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="email_address" class="col-md-4 col-form-label text-md-right">Branch Name</label>
                                    <div class="col-md-6">
                                    <label name="bname" id="bname" value=<%=rs.getString(14)%>><%=rs.getString(12)%></label>
                                                                      </div>
                                </div> 
                           <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">Roll Number</label>
                                    <div class="col-md-6">
                                       <label name="roll" id=roll value=<%= rs.getString(1) %>><%= rs.getString(1) %></label> </div>
                                </div>

                                <div class="form-group row">
                                    <label for="phone_number" class="col-md-4 col-form-label text-md-right">Name</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="name" id=name value=<%= rs.getString(2) %>>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="present_address" class="col-md-4 col-form-label text-md-right">Father's Name</label>
                                    <div class="col-md-6">
                                        <input type="text"  class="form-control" name="fname" id=fname value=<%= rs.getString(3) %>>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="permanent_address" class="col-md-4 col-form-label text-md-right">Gender</label>
                                    <div class="col-md-6">
                                        <input type=radio name=gender  value=Male <%=("Male".equals(rs.getString(4)) ? "checked": "") %>>Male
                                      <input type=radio name=gender  value=Female <%=("Female".equals(rs.getString(4)) ? "checked": "") %>>Female
                                      <input type=radio name=gender  value=Trans <%=("Trans".equals(rs.getString(4)) ? "checked": "") %>>Trans
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label for="present_address" class="col-md-4 col-form-label text-md-right">D.O.B:</label>
                                    <div class="col-md-6">
                                        <input type="date" name=date id=date class="form-control"  required value=<%= rs.getString(5) %>>
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label for="present_address" class="col-md-4 col-form-label text-md-right">Email:</label>
                                    <div class="col-md-6">
                                        <input type= text id=email name=email  class="form-control" name="" required value=<%= rs.getString(6) %>>
                                    </div>
                                </div>
                               
                                 <div class="form-group row">
                                    <label for="present_address" class="col-md-4 col-form-label text-md-right">Mobile:</label>
                                    <div class="col-md-6">
                                        <input type= text id=mobile name=mobile  class="form-control" name="" required value=<%= rs.getString(7) %>>
                                    </div>
                                </div>
                               
                                <div class="form-group row">
                                    <label for="present_address" class="col-md-4 col-form-label text-md-right">Address:</label>
                                    <div class="col-md-6">
                                       <textarea id=address name=address  class="form-control" name="" required ><%= rs.getString(8)%></textarea>
                                    </div>
                                </div>
 
                                <div class="form-group row">
                                    <label for="present_address" class="col-md-4 col-form-label text-md-right">Country: </label>
                                    <div class="col-md-6">
                                     <select id=country name=country class="form-control" name="" >
                                     <option value=<%=rs.getString(10)%>><%=rs.getString(15)%></option>
                                     </select>
                                    </div>
                                </div>
                                    <div class="form-group row">
                                    <label for="present_address" class="col-md-4 col-form-label text-md-right">City: </label>
                                    <div class="col-md-6">
                                     <select name=city id=city class="form-control" name="" >
                                     <option value=<%=rs.getString(9)%> ><%=rs.getString(16)%></option>
                                     </select>
                                    </div>
                                </div>
 
         
	
                            

                                    <div class="col-md-6 offset-md-4">
                                        <button type="button" id=save class="btn btn-primary">
                                        Update
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
            			  list+="<option value="+res.data[i].id+" >"+res.data[i].name+"</option>";
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

	 obj.roll=$("#roll").text();
	 obj.name=$("#name").val();
	 obj.fname=$("#fname").val();
	  obj.address=$("#address").val();
	  obj.gender=$("input[name=gender]:checked").val();
	 obj.mobile=$("#mobile").val();
	 obj.email=$("#email").val();
	  obj.cityid=$("#city option:selected").val();
	  obj.countryid=$("#country option:selected").val();
	  obj.courseid=$("#cname").text();
	  obj.branchid=$("#bname").text();
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

		alert("s"+res.message);
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
    <% 
    
		} while (rs.next());
	}
}
		catch ( Exception ex)
		{
			out.println(ex.getMessage());
		}
		
 
 
 %>
    
    <hr class="new1">
  <center><h5>Note: Any errors occur then contact Rabecca Fatima.
Designed & Developed by Rabecca Fatima</h5></center>
  <hr class="new1">
<center><h5>All Right Reserved @Rabecca Fatima :: 2022-2025</h5></center> 
  <hr class="new1">
<br>
</body>
</html>